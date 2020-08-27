/*
 *    Copyright (c) 2018-2025, Sommer 20200212 All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * Neither the name of the laputapdm.com developer nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 * Author: Sommer (sommer_jiang@163.com)
 */

package com.laputa.pdm.admin.service.impl;

import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.laputa.pdm.admin.mapper.SysRouteConfMapper;
import com.laputa.pdm.admin.service.SysRouteConfService;
import com.laputa.pdm.admin.api.entity.SysRouteConf;
import com.laputa.pdm.common.core.constant.CacheConstants;
import com.laputa.pdm.common.core.constant.CommonConstants;
import com.laputa.pdm.common.gateway.support.DynamicRouteInitEvent;
import com.laputa.pdm.common.gateway.vo.RouteDefinitionVo;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.event.RefreshRoutesEvent;
import org.springframework.cloud.gateway.filter.FilterDefinition;
import org.springframework.cloud.gateway.handler.predicate.PredicateDefinition;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import reactor.core.publisher.Mono;

import java.net.URI;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author sommer
 * @date 2018年11月06日10:27:55
 * <p>
 * 动态路由处理类
 */
@Slf4j
@AllArgsConstructor
@Service("sysRouteConfService")
public class SysRouteConfServiceImpl extends ServiceImpl<SysRouteConfMapper, SysRouteConf> implements SysRouteConfService {
    private final RedisTemplate redisTemplate;
    private final ApplicationEventPublisher applicationEventPublisher;


    /**
     * 获取全部路由
     * <p>
     * RedisRouteDefinitionWriter.java
     * PropertiesRouteDefinitionLocator.java
     *
     * @return
     */
    @Override
    public List<SysRouteConf> routes() {
        return baseMapper.selectList(Wrappers.emptyWrapper());
    }

    /**
     * 更新路由信息
     *
     * @param routes 路由信息
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Mono<Void> updateRoutes(JSONArray routes) {
        // 清空Redis 缓存
        Boolean result = redisTemplate.delete(CacheConstants.ROUTE_KEY);
        log.info("清空网关路由 {} ", result);

        // 遍历修改的routes，保存到Redis
        List<RouteDefinitionVo> routeDefinitionVoList = new ArrayList<>();

        try {
            routes.forEach(value -> {
                log.info("更新路由 ->{}", value);
                RouteDefinitionVo vo = new RouteDefinitionVo();
                Map<String, Object> map = (Map) value;

                Object id = map.get("routeId");
                if (id != null) {
                    vo.setId(String.valueOf(id));
                }

                Object routeName = map.get("routeName");
                if (routeName != null) {
                    vo.setRouteName(String.valueOf(routeName));
                }

                Object predicates = map.get("predicates");
                if (predicates != null) {
                    JSONArray predicatesArray = (JSONArray) predicates;
                    List<PredicateDefinition> predicateDefinitionList =
                            predicatesArray.toList(PredicateDefinition.class);
                    vo.setPredicates(predicateDefinitionList);
                }

                Object filters = map.get("filters");
                if (filters != null) {
                    JSONArray filtersArray = (JSONArray) filters;
                    List<FilterDefinition> filterDefinitionList
                            = filtersArray.toList(FilterDefinition.class);
                    vo.setFilters(filterDefinitionList);
                }

                Object uri = map.get("uri");
                if (uri != null) {
                    vo.setUri(URI.create(String.valueOf(uri)));
                }

                Object order = map.get("order");
                if (order != null) {
                    vo.setOrder(Integer.parseInt(String.valueOf(order)));
                }
                redisTemplate.setHashValueSerializer(new Jackson2JsonRedisSerializer<>(RouteDefinitionVo.class));
                redisTemplate.opsForHash().put(CacheConstants.ROUTE_KEY, vo.getId(), vo);
                routeDefinitionVoList.add(vo);
            });

            // 逻辑删除全部
            SysRouteConf condition = new SysRouteConf();
            condition.setDelFlag(CommonConstants.STATUS_NORMAL);
            this.remove(new UpdateWrapper<>(condition));

            //插入生效路由
            List<SysRouteConf> routeConfList = routeDefinitionVoList.stream().map(vo -> {
                SysRouteConf routeConf = new SysRouteConf();
                routeConf.setRouteId(vo.getId());
                routeConf.setRouteName(vo.getRouteName());
                routeConf.setFilters(JSONUtil.toJsonStr(vo.getFilters()));
                routeConf.setPredicates(JSONUtil.toJsonStr(vo.getPredicates()));
                routeConf.setOrder(vo.getOrder());
                routeConf.setUri(vo.getUri().toString());
                return routeConf;
            }).collect(Collectors.toList());
            this.saveBatch(routeConfList);
            log.debug("更新网关路由结束 ");

            this.applicationEventPublisher.publishEvent(new RefreshRoutesEvent(this));
            redisTemplate.convertAndSend(CacheConstants.ROUTE_JVM_RELOAD_TOPIC, "UPMS路由信息,网关缓存更新");
        } catch (Exception e) {
            log.error("路由配置解析失败", e);
            // 回滚路由，重新加载即可
            this.applicationEventPublisher.publishEvent(new DynamicRouteInitEvent(this));
            // 抛出异常
            throw new RuntimeException(e);
        }
        return Mono.empty();
    }

    /**
     * 更新路由信息
     *
     * @param sysRouteConf 路由信息
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Mono<SysRouteConf> add(SysRouteConf sysRouteConf) {

        // 遍历修改的routes，保存到Redis
//        List<RouteDefinitionVo> routeDefinitionVoList = new ArrayList<>();

        try {
            this.save(sysRouteConf);

            RouteDefinitionVo vo1 = new RouteDefinitionVo();
            Integer id = sysRouteConf.getId();
            if (id != null) {
                vo1.setId(String.valueOf(id));
            }

            String routeName = sysRouteConf.getRouteName();
            if (routeName != null) {
                vo1.setRouteName(routeName);
            }
            String filters = sysRouteConf.getFilters();
            if (filters != null) {
                List<FilterDefinition> filterDefinitionList
                        = JSON.parseArray(filters,FilterDefinition.class);
                vo1.setFilters(filterDefinitionList);
            }

            String predicates = sysRouteConf.getPredicates();
            if (predicates != null) {

                List<PredicateDefinition> predicateDefinitionList =
                        JSON.parseArray(predicates,PredicateDefinition.class);
                vo1.setPredicates(predicateDefinitionList);
            }

            String uri = sysRouteConf.getUri();
            if (!StringUtils.isEmpty(uri)) {
                vo1.setUri(URI.create(uri));
            }

            Integer order =  sysRouteConf.getOrder();
            if (order != null) {
                vo1.setOrder(order);
            }

            redisTemplate.setHashValueSerializer(new Jackson2JsonRedisSerializer<>(RouteDefinitionVo.class));
            redisTemplate.opsForHash().put(CacheConstants.ROUTE_KEY, vo1.getId(), vo1);

            log.debug("添加网关路由结束 ");

            this.applicationEventPublisher.publishEvent(new RefreshRoutesEvent(this));
            redisTemplate.convertAndSend(CacheConstants.ROUTE_JVM_RELOAD_TOPIC, "UPMS路由信息,网关缓存更新");
        } catch (Exception e) {
            log.error("路由配置解析失败", e);
            // 回滚路由，重新加载即可
            this.applicationEventPublisher.publishEvent(new DynamicRouteInitEvent(this));
            // 抛出异常
            throw new RuntimeException(e);
        }
        return Mono.empty();
    }

    /**
     * 更新路由信息
     *
     * @param sysRouteConf 路由信息
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Mono<SysRouteConf> updateRoute(SysRouteConf sysRouteConf) {
        // 清空Redis 缓存
//        Boolean result = redisTemplate.delete(CacheConstants.ROUTE_KEY);
//        log.info("清空网关路由 {} ", result);

        // 遍历修改的routes，保存到Redis
//        List<RouteDefinitionVo> routeDefinitionVoList = new ArrayList<>();

        try {
            this.updateById(sysRouteConf);
//            RouteDefinitionVo vo1 = new RouteDefinitionVo();
//            vo1.setRouteName(sysRouteConf.getRouteName());
//
//            redisTemplate.setHashValueSerializer(new Jackson2JsonRedisSerializer<>(RouteDefinitionVo.class));
//            redisTemplate.opsForHash().put(CacheConstants.ROUTE_KEY, vo1.getId(), vo1);
//            routeDefinitionVoList.add(vo1);


            // 逻辑删除全部
//            SysRouteConf condition = new SysRouteConf();
//            condition.setDelFlag(CommonConstants.STATUS_NORMAL);
//            this.remove(new UpdateWrapper<>(condition));
//
//            //插入生效路由
//            List<SysRouteConf> routeConfList = routeDefinitionVoList.stream().map(vo -> {
//                SysRouteConf routeConf = new SysRouteConf();
//                routeConf.setRouteId(vo.getId());
//                routeConf.setRouteName(vo.getRouteName());
//                routeConf.setFilters(JSONUtil.toJsonStr(vo.getFilters()));
//                routeConf.setPredicates(JSONUtil.toJsonStr(vo.getPredicates()));
//                routeConf.setOrder(vo.getOrder());
//                routeConf.setUri(vo.getUri().toString());
//                return routeConf;
//            }).collect(Collectors.toList());
//            this.saveBatch(routeConfList);
            log.debug("更新网关路由结束 ");

            this.applicationEventPublisher.publishEvent(new RefreshRoutesEvent(this));
            redisTemplate.convertAndSend(CacheConstants.ROUTE_JVM_RELOAD_TOPIC, "UPMS路由信息,网关缓存更新");
        } catch (Exception e) {
            log.error("路由配置解析失败", e);
            // 回滚路由，重新加载即可
            this.applicationEventPublisher.publishEvent(new DynamicRouteInitEvent(this));
            // 抛出异常
            throw new RuntimeException(e);
        }
        return Mono.empty();
    }

}

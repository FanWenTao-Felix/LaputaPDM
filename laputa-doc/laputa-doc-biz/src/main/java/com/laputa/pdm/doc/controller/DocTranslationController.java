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

package com.laputa.pdm.doc.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.laputa.pdm.common.core.util.R;
import com.laputa.pdm.common.log.annotation.SysLog;
import com.laputa.pdm.doc.entity.DocTranslation;
import com.laputa.pdm.doc.service.DocTranslationService;
import org.springframework.security.access.prepost.PreAuthorize;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;


/**
 * 文档翻译
 *
 * @author sommer
 * @date 2020-02-25 15:16:04
 */
@RestController
@AllArgsConstructor
@RequestMapping("/doctranslation" )
@Api(value = "doctranslation", tags = "文档翻译管理")
public class DocTranslationController {

    private final  DocTranslationService docTranslationService;

    /**
     * 分页查询
     * @param page 分页对象
     * @param docTranslation 文档翻译
     * @return
     */
    @ApiOperation(value = "分页查询", notes = "分页查询")
    @GetMapping("/page" )
    public R getDocTranslationPage(Page page, DocTranslation docTranslation) {
        return R.ok(docTranslationService.page(page, Wrappers.query(docTranslation)));
    }


    /**
     * 通过id查询文档翻译
     * @param module id
     * @return R
     */
    @ApiOperation(value = "通过id查询", notes = "通过id查询")
    @GetMapping("/{module}" )
    public R getById(@PathVariable("module" ) String module) {
        return R.ok(docTranslationService.getById(module));
    }

    /**
     * 新增文档翻译
     * @param docTranslation 文档翻译
     * @return R
     */
    @ApiOperation(value = "新增文档翻译", notes = "新增文档翻译")
    @SysLog("新增文档翻译" )
    @PostMapping
    @PreAuthorize("@pms.hasPermission('doc_doctranslation_add')" )
    public R save(@RequestBody DocTranslation docTranslation) {
        return R.ok(docTranslationService.save(docTranslation));
    }

    /**
     * 修改文档翻译
     * @param docTranslation 文档翻译
     * @return R
     */
    @ApiOperation(value = "修改文档翻译", notes = "修改文档翻译")
    @SysLog("修改文档翻译" )
    @PutMapping
    @PreAuthorize("@pms.hasPermission('doc_doctranslation_edit')" )
    public R updateById(@RequestBody DocTranslation docTranslation) {
        return R.ok(docTranslationService.updateById(docTranslation));
    }

    /**
     * 通过id删除文档翻译
     * @param module id
     * @return R
     */
    @ApiOperation(value = "通过id删除文档翻译", notes = "通过id删除文档翻译")
    @SysLog("通过id删除文档翻译" )
    @DeleteMapping("/{module}" )
    @PreAuthorize("@pms.hasPermission('doc_doctranslation_del')" )
    public R removeById(@PathVariable String module) {
        return R.ok(docTranslationService.removeById(module));
    }

}

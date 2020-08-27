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
import com.laputa.pdm.doc.entity.DocLanguage;
import com.laputa.pdm.doc.service.DocLanguageService;
import org.springframework.security.access.prepost.PreAuthorize;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;


/**
 * 文档多语言
 *
 * @author sommer
 * @date 2020-02-25 15:16:50
 */
@RestController
@AllArgsConstructor
@RequestMapping("/doc-language" )
@Api(value = "doclanguage", tags = "文档多语言管理")
public class DocLanguageController {

    private final  DocLanguageService docLanguageService;

    /**
     * 分页查询
     * @param page 分页对象
     * @param docLanguage 文档多语言
     * @return
     */
    @ApiOperation(value = "分页查询", notes = "分页查询")
    @GetMapping("/page" )
    public R getDocLanguagePage(Page page, DocLanguage docLanguage) {
        return R.ok(docLanguageService.page(page, Wrappers.query(docLanguage)));
    }


    /**
     * 通过id查询文档多语言
     * @param id id
     * @return R
     */
    @ApiOperation(value = "通过id查询", notes = "通过id查询")
    @GetMapping("/{id}" )
    public R getById(@PathVariable("id" ) String id) {
        return R.ok(docLanguageService.getById(id));
    }

    /**
     * 新增文档多语言
     * @param docLanguage 文档多语言
     * @return R
     */
    @ApiOperation(value = "新增文档多语言", notes = "新增文档多语言")
    @SysLog("新增文档多语言" )
    @PostMapping
    @PreAuthorize("@pms.hasPermission('doc_doclanguage_add')" )
    public R save(@RequestBody DocLanguage docLanguage) {
        return R.ok(docLanguageService.save(docLanguage));
    }

    /**
     * 修改文档多语言
     * @param docLanguage 文档多语言
     * @return R
     */
    @ApiOperation(value = "修改文档多语言", notes = "修改文档多语言")
    @SysLog("修改文档多语言" )
    @PutMapping
    @PreAuthorize("@pms.hasPermission('doc_doclanguage_edit')" )
    public R updateById(@RequestBody DocLanguage docLanguage) {
        return R.ok(docLanguageService.updateById(docLanguage));
    }

    /**
     * 通过id删除文档多语言
     * @param id id
     * @return R
     */
    @ApiOperation(value = "通过id删除文档多语言", notes = "通过id删除文档多语言")
    @SysLog("通过id删除文档多语言" )
    @DeleteMapping("/{id}" )
    @PreAuthorize("@pms.hasPermission('doc_doclanguage_del')" )
    public R removeById(@PathVariable String id) {
        return R.ok(docLanguageService.removeById(id));
    }

}

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
import com.laputa.pdm.doc.entity.DocMimeType;
import com.laputa.pdm.doc.service.DocMimeTypeService;
import org.springframework.security.access.prepost.PreAuthorize;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;


/**
 * 文档MIME类型
 *
 * @author sommer
 * @date 2020-02-25 15:16:47
 */
@RestController
@AllArgsConstructor
@RequestMapping("/doc-mimetype" )
@Api(value = "doc-mimetype", tags = "文档MIME类型管理")
public class DocMimeTypeController {

    private final  DocMimeTypeService docMimeTypeService;

    /**
     * 分页查询
     * @param page 分页对象
     * @param docMimeType 文档MIME类型
     * @return
     */
    @ApiOperation(value = "分页查询", notes = "分页查询")
    @GetMapping("/page" )
    public R getDocMimeTypePage(Page page, DocMimeType docMimeType) {
        return R.ok(docMimeTypeService.page(page, Wrappers.query(docMimeType)));
    }


    /**
     * 通过id查询文档MIME类型
     * @param id id
     * @return R
     */
    @ApiOperation(value = "通过id查询", notes = "通过id查询")
    @GetMapping("/{id}" )
    public R getById(@PathVariable("id" ) Long id) {
        return R.ok(docMimeTypeService.getById(id));
    }

    /**
     * 新增文档MIME类型
     * @param docMimeType 文档MIME类型
     * @return R
     */
    @ApiOperation(value = "新增文档MIME类型", notes = "新增文档MIME类型")
    @SysLog("新增文档MIME类型" )
    @PostMapping
    @PreAuthorize("@pms.hasPermission('doc_docmimetype_add')" )
    public R save(@RequestBody DocMimeType docMimeType) {
        return R.ok(docMimeTypeService.save(docMimeType));
    }

    /**
     * 修改文档MIME类型
     * @param docMimeType 文档MIME类型
     * @return R
     */
    @ApiOperation(value = "修改文档MIME类型", notes = "修改文档MIME类型")
    @SysLog("修改文档MIME类型" )
    @PutMapping
    @PreAuthorize("@pms.hasPermission('doc_docmimetype_edit')" )
    public R updateById(@RequestBody DocMimeType docMimeType) {
        return R.ok(docMimeTypeService.updateById(docMimeType));
    }

    /**
     * 通过id删除文档MIME类型
     * @param id id
     * @return R
     */
    @ApiOperation(value = "通过id删除文档MIME类型", notes = "通过id删除文档MIME类型")
    @SysLog("通过id删除文档MIME类型" )
    @DeleteMapping("/{id}" )
    @PreAuthorize("@pms.hasPermission('doc_docmimetype_del')" )
    public R removeById(@PathVariable Long id) {
        return R.ok(docMimeTypeService.removeById(id));
    }

}

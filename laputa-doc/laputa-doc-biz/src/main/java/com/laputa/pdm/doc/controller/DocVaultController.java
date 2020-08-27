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
import com.laputa.pdm.common.security.annotation.Inner;
import com.laputa.pdm.doc.entity.DocVault;
import com.laputa.pdm.doc.service.DocVaultService;
import org.springframework.security.access.prepost.PreAuthorize;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;


/**
 * 文件仓管理表
 *
 * @author sommer
 * @date 2020-02-25 15:15:42
 */
@RestController
@AllArgsConstructor
@RequestMapping("/doc-file" )
@Api(value = "doc-file", tags = "文件管理")
public class DocVaultController {

    private final  DocVaultService docVaultService;


    /**
     * 分页查询
     *
     * @param page    分页对象
     * @param sysFile 文件管理
     * @return
     */
    @ApiOperation(value = "分页查询", notes = "分页查询")
    @GetMapping("/page")
    public R getDocVaultPage(Page page, DocVault sysFile) {
        return R.ok(docVaultService.page(page, Wrappers.query(sysFile)));
    }


    /**
     * 通过id删除文件管理
     *
     * @param id id
     * @return R
     */
    @ApiOperation(value = "通过id删除文件管理", notes = "通过id删除文件管理")
    @SysLog("删除文件管理")
    @DeleteMapping("/{id}")
    @PreAuthorize("@pms.hasPermission('sys_file_del')")
    public R removeById(@PathVariable Long id) {
        return R.ok(docVaultService.deleteFile(id));
    }

    /**
     * 上传文件
     * 文件名采用uuid,避免原始文件名中带"-"符号导致下载的时候解析出现异常
     *
     * @param file 资源
     * @return R(/ admin / bucketName / filename)
     */
    @PostMapping("/upload")
    public R upload(@RequestParam("file") MultipartFile file) {
        return docVaultService.uploadFile(file);
    }

    /**
     * 获取文件
     *
     * @param bucket   桶名称
     * @param fileName 文件空间/名称
     * @param response
     * @return
     */
    @Inner(false)
    @GetMapping("/{bucket}/{fileName}")
    public void file(@PathVariable String bucket, @PathVariable String fileName, HttpServletResponse response) {
        docVaultService.getFile(bucket, fileName, response);
    }

}

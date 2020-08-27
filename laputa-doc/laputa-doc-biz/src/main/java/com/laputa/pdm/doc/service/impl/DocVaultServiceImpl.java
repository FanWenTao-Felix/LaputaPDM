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
package com.laputa.pdm.doc.service.impl;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.laputa.pdm.common.core.constant.CommonConstants;
import com.laputa.pdm.common.core.util.R;
import com.laputa.pdm.common.minio.service.MinioTemplate;
import com.laputa.pdm.common.security.util.SecurityUtils;
import com.laputa.pdm.doc.entity.DocVault;
import com.laputa.pdm.doc.mapper.DocVaultMapper;
import com.laputa.pdm.doc.service.DocVaultService;
import lombok.SneakyThrows;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

/**
 * 文件仓管理表
 *
 * @author sommer
 * @date 2020-02-25 15:15:42
 */
@Service
public class DocVaultServiceImpl extends ServiceImpl<DocVaultMapper, DocVault> implements DocVaultService {

    private  final MinioTemplate minioTemplate;

    public DocVaultServiceImpl(MinioTemplate minioTemplate) {
        this.minioTemplate = minioTemplate;
    }


    /**
     * 上传文件
     *
     * @param file
     * @return
     */
    @Override
    public R uploadFile(MultipartFile file) {
        String fileName = IdUtil.simpleUUID() + StrUtil.DOT + FileUtil.extName(file.getOriginalFilename());
        Map<String, String> resultMap = new HashMap<>(4);
        resultMap.put("bucketName", CommonConstants.BUCKET_NAME);
        resultMap.put("fileName", fileName);
        resultMap.put("original",file.getOriginalFilename());
        resultMap.put("url", String.format("/doc/doc-vault/%s/%s", CommonConstants.BUCKET_NAME, fileName));

        try {
            minioTemplate.putObject(CommonConstants.BUCKET_NAME, fileName, file.getInputStream());
            //文件管理数据记录,收集管理追踪文件
            fileLog(file, fileName);
        } catch (Exception e) {
            log.error("上传失败", e);
            return R.failed(e.getLocalizedMessage());
        }
        return R.ok(resultMap);
    }

    /**
     * 读取文件
     *
     * @param bucket
     * @param fileName
     * @param response
     */
    @Override
    public void getFile(String bucket, String fileName, HttpServletResponse response) {
        try (InputStream inputStream = minioTemplate.getObject(bucket, fileName)) {
            response.setContentType("application/octet-stream; charset=UTF-8");
            IoUtil.copy(inputStream, response.getOutputStream());
        } catch (Exception e) {
            log.error("文件读取异常", e);
        }
    }


    /**
     * 删除文件
     *
     * @param id
     * @return
     */
    @Override
    @SneakyThrows
    @Transactional(rollbackFor = Exception.class)
    public Boolean deleteFile(Long id) {
        DocVault file = this.getById(id);
        minioTemplate.removeObject(CommonConstants.BUCKET_NAME, file.getFileName());
        return this.removeById(id);
    }

    /**
     * 文件管理数据记录,收集管理追踪文件
     *
     * @param file     上传文件格式
     * @param fileName 文件名
     */
    private void fileLog(MultipartFile file, String fileName) {
        DocVault vault = new DocVault();
        //原文件名
        String original = file.getOriginalFilename();
        vault.setFileName(fileName);
        vault.setOriginal(original);
        vault.setFileSize(file.getSize());
        vault.setType(FileUtil.extName(original));
        vault.setBucketName(CommonConstants.BUCKET_NAME);
        vault.setCreateUser(SecurityUtils.getUser().getUsername());
        this.save(vault);
    }

}

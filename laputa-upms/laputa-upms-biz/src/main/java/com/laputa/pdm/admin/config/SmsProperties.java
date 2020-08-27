package com.laputa.pdm.admin.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * @Author: sommer
 * @Time: 2018-10-22 18:34
 * @Feature: 短信服务实体类
 */
@Configuration
public class SmsProperties {

    @Value("${laputa.sms.accessKeyId}")
    private String accessKeyId;

    @Value("${laputa.sms.accessKeySecret}")
    private String accessKeySecret;

    @Value("${laputa.sms.signName}")
    private String signName;

    @Value("${laputa.sms.verifyCodeTemplate}")
    private String verifyCodeTemplate;

    public String getAccessKeyId() {
        return accessKeyId;
    }

    public void setAccessKeyId(String accessKeyId) {
        this.accessKeyId = accessKeyId;
    }

    public String getAccessKeySecret() {
        return accessKeySecret;
    }

    public void setAccessKeySecret(String accessKeySecret) {
        this.accessKeySecret = accessKeySecret;
    }

    public String getSignName() {
        return signName;
    }

    public void setSignName(String signName) {
        this.signName = signName;
    }

    public String getVerifyCodeTemplate() {
        return verifyCodeTemplate;
    }

    public void setVerifyCodeTemplate(String verifyCodeTemplate) {
        this.verifyCodeTemplate = verifyCodeTemplate;
    }
}

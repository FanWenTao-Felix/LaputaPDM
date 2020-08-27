package com.laputa.pdm.admin.service.impl;

import com.laputa.pdm.admin.service.SysUserService;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;

import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

import static org.junit.jupiter.api.Assertions.*;

@RunWith(SpringRunner.class)
@SpringBootTest
//@AutoConfigureMybatis
class SysUserServiceImplTest {

    @Resource
    SysUserService userService;

    @Test
    void getUsersWithRolePage() {
        userService.getUsersWithRolePage(null,null);
    }

    @Test
    void selectUserVoById() {
    }
}

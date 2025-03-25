package com.yupi.project.service;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UserInterfaceInfoServiceTest {

    @Resource
    UserInterfaceInfoService userInterfaceInfoService;

    @Test
    void validUserInterfaceInfo() {
    }

    @Test
    void invokeCount() {
        userInterfaceInfoService.invokeCount(1,1);
    }
}
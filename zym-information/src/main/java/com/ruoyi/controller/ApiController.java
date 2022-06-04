package com.ruoyi.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.service.ZymSysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: ZouYangMing
 * @deprecated API接口
 */
@RestController
@RequestMapping("/apis")
public class ApiController  extends BaseController {

    /**
     * API密钥
     */
    private static String keys = "Zym.2327972001";

    @Autowired
    private ZymSysUserService zymSysUserService;

    @GetMapping("/getUser")
    public AjaxResult getAdminUser(String key){
        if(key.equals(keys)){
            return success(zymSysUserService.zymSelectUserList());
        }else{
            return error("API密钥错误");
        }
    }

}

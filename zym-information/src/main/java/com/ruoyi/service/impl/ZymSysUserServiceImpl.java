package com.ruoyi.service.impl;

import com.ruoyi.domain.ZymSysUser;
import com.ruoyi.mapper.ZymSysUserMapper;
import com.ruoyi.service.ZymSysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ZymSysUserServiceImpl implements ZymSysUserService {

    @Autowired
    private ZymSysUserMapper zymSysUserMapper;

    /**
     * 查询用户列表
     */
    @Override
    public List<ZymSysUser> zymSelectUserList() {
        return zymSysUserMapper.zymSelectUserList();
    }
}

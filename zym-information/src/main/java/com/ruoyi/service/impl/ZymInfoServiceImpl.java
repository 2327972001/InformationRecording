package com.ruoyi.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.mapper.ZymInfoMapper;
import com.ruoyi.domain.ZymInfo;
import com.ruoyi.service.IZymInfoService;
import com.ruoyi.common.core.text.Convert;

/**
 * 信息记录管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-06-02
 */
@Service
public class ZymInfoServiceImpl implements IZymInfoService 
{
    @Autowired
    private ZymInfoMapper zymInfoMapper;

    /**
     * 查询信息记录管理
     * 
     * @param id 信息记录管理主键
     * @return 信息记录管理
     */
    @Override
    public ZymInfo selectZymInfoById(Integer id)
    {
        return zymInfoMapper.selectZymInfoById(id);
    }

    /**
     * 查询信息记录管理列表
     * 
     * @param zymInfo 信息记录管理
     * @return 信息记录管理
     */
    @Override
    public List<ZymInfo> selectZymInfoList(ZymInfo zymInfo)
    {
        return zymInfoMapper.selectZymInfoList(zymInfo);
    }

    /**
     * 新增信息记录管理
     * 
     * @param zymInfo 信息记录管理
     * @return 结果
     */
    @Override
    public int insertZymInfo(ZymInfo zymInfo)
    {
        return zymInfoMapper.insertZymInfo(zymInfo);
    }

    /**
     * 修改信息记录管理
     * 
     * @param zymInfo 信息记录管理
     * @return 结果
     */
    @Override
    public int updateZymInfo(ZymInfo zymInfo)
    {
        return zymInfoMapper.updateZymInfo(zymInfo);
    }

    /**
     * 批量删除信息记录管理
     * 
     * @param ids 需要删除的信息记录管理主键
     * @return 结果
     */
    @Override
    public int deleteZymInfoByIds(String ids)
    {
        return zymInfoMapper.deleteZymInfoByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除信息记录管理信息
     * 
     * @param id 信息记录管理主键
     * @return 结果
     */
    @Override
    public int deleteZymInfoById(Integer id)
    {
        return zymInfoMapper.deleteZymInfoById(id);
    }
}

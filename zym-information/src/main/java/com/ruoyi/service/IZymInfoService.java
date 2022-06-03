package com.ruoyi.service;

import java.util.List;
import com.ruoyi.domain.ZymInfo;

/**
 * 信息记录管理Service接口
 * 
 * @author ruoyi
 * @date 2022-06-02
 */
public interface IZymInfoService 
{
    /**
     * 查询信息记录管理
     * 
     * @param id 信息记录管理主键
     * @return 信息记录管理
     */
    public ZymInfo selectZymInfoById(Integer id);

    /**
     * 查询信息记录管理列表
     * 
     * @param zymInfo 信息记录管理
     * @return 信息记录管理集合
     */
    public List<ZymInfo> selectZymInfoList(ZymInfo zymInfo);

    /**
     * 新增信息记录管理
     * 
     * @param zymInfo 信息记录管理
     * @return 结果
     */
    public int insertZymInfo(ZymInfo zymInfo);

    /**
     * 修改信息记录管理
     * 
     * @param zymInfo 信息记录管理
     * @return 结果
     */
    public int updateZymInfo(ZymInfo zymInfo);

    /**
     * 批量删除信息记录管理
     * 
     * @param ids 需要删除的信息记录管理主键集合
     * @return 结果
     */
    public int deleteZymInfoByIds(String ids);

    /**
     * 删除信息记录管理信息
     * 
     * @param id 信息记录管理主键
     * @return 结果
     */
    public int deleteZymInfoById(Integer id);
}

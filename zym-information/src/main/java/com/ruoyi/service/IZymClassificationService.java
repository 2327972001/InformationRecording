package com.ruoyi.service;

import java.util.List;
import com.ruoyi.domain.ZymClassification;

/**
 * 分类列表Service接口
 * 
 * @author ruoyi
 * @date 2022-06-02
 */
public interface IZymClassificationService 
{
    /**
     * 查询分类列表
     * 
     * @param id 分类列表主键
     * @return 分类列表
     */
    public ZymClassification selectZymClassificationById(Integer id);

    /**
     * 查询分类列表列表
     * 
     * @param zymClassification 分类列表
     * @return 分类列表集合
     */
    public List<ZymClassification> selectZymClassificationList(ZymClassification zymClassification);

    /**
     * 新增分类列表
     * 
     * @param zymClassification 分类列表
     * @return 结果
     */
    public int insertZymClassification(ZymClassification zymClassification);

    /**
     * 修改分类列表
     * 
     * @param zymClassification 分类列表
     * @return 结果
     */
    public int updateZymClassification(ZymClassification zymClassification);

    /**
     * 批量删除分类列表
     * 
     * @param ids 需要删除的分类列表主键集合
     * @return 结果
     */
    public int deleteZymClassificationByIds(String ids);

    /**
     * 删除分类列表信息
     * 
     * @param id 分类列表主键
     * @return 结果
     */
    public int deleteZymClassificationById(Integer id);
}

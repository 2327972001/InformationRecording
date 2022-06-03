package com.ruoyi.mapper;

import java.util.List;
import com.ruoyi.domain.ZymClassification;

/**
 * 分类列表Mapper接口
 * 
 * @author ruoyi
 * @date 2022-06-02
 */
public interface ZymClassificationMapper 
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
     * 删除分类列表
     * 
     * @param id 分类列表主键
     * @return 结果
     */
    public int deleteZymClassificationById(Integer id);

    /**
     * 批量删除分类列表
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteZymClassificationByIds(String[] ids);
}

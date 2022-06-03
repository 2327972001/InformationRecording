package com.ruoyi.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.mapper.ZymClassificationMapper;
import com.ruoyi.domain.ZymClassification;
import com.ruoyi.service.IZymClassificationService;
import com.ruoyi.common.core.text.Convert;

/**
 * 分类列表Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-06-02
 */
@Service
public class ZymClassificationServiceImpl implements IZymClassificationService 
{
    @Autowired
    private ZymClassificationMapper zymClassificationMapper;

    /**
     * 查询分类列表
     * 
     * @param id 分类列表主键
     * @return 分类列表
     */
    @Override
    public ZymClassification selectZymClassificationById(Integer id)
    {
        return zymClassificationMapper.selectZymClassificationById(id);
    }

    /**
     * 查询分类列表列表
     * 
     * @param zymClassification 分类列表
     * @return 分类列表
     */
    @Override
    public List<ZymClassification> selectZymClassificationList(ZymClassification zymClassification)
    {
        return zymClassificationMapper.selectZymClassificationList(zymClassification);
    }

    /**
     * 新增分类列表
     * 
     * @param zymClassification 分类列表
     * @return 结果
     */
    @Override
    public int insertZymClassification(ZymClassification zymClassification)
    {
        return zymClassificationMapper.insertZymClassification(zymClassification);
    }

    /**
     * 修改分类列表
     * 
     * @param zymClassification 分类列表
     * @return 结果
     */
    @Override
    public int updateZymClassification(ZymClassification zymClassification)
    {
        return zymClassificationMapper.updateZymClassification(zymClassification);
    }

    /**
     * 批量删除分类列表
     * 
     * @param ids 需要删除的分类列表主键
     * @return 结果
     */
    @Override
    public int deleteZymClassificationByIds(String ids)
    {
        return zymClassificationMapper.deleteZymClassificationByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除分类列表信息
     * 
     * @param id 分类列表主键
     * @return 结果
     */
    @Override
    public int deleteZymClassificationById(Integer id)
    {
        return zymClassificationMapper.deleteZymClassificationById(id);
    }
}

package com.ruoyi.service;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.domain.ZymProduct;

/**
 * 产品列表Service接口
 * 
 * @author ruoyi
 * @date 2022-06-02
 */
public interface IZymProductService 
{
    /**
     * 查询产品列表
     * 
     * @param id 产品列表主键
     * @return 产品列表
     */
    public ZymProduct selectZymProductById(Integer id);

    /**
     * 查询产品列表列表
     * 
     * @param zymProduct 产品列表
     * @return 产品列表集合
     */
    public List<ZymProduct> selectZymProductList(ZymProduct zymProduct);

    /**
     * 新增产品列表
     * 
     * @param zymProduct 产品列表
     * @return 结果
     */
    public int insertZymProduct(ZymProduct zymProduct);

    /**
     * 修改产品列表
     * 
     * @param zymProduct 产品列表
     * @return 结果
     */
    public int updateZymProduct(ZymProduct zymProduct);

    /**
     * 批量删除产品列表
     * 
     * @param ids 需要删除的产品列表主键集合
     * @return 结果
     */
    public int deleteZymProductByIds(String ids);

    /**
     * 删除产品列表信息
     * 
     * @param id 产品列表主键
     * @return 结果
     */
    public int deleteZymProductById(Integer id);

    /**
     * 导入产品数据
     *
     * @param zymProductList 产品数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @return 结果
     */
    public String importProduct(List<ZymProduct> zymProductList, Boolean isUpdateSupport);
}

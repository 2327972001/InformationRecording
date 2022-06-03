package com.ruoyi.mapper;

import java.util.List;
import com.ruoyi.domain.ZymProduct;

/**
 * 产品列表Mapper接口
 * 
 * @author ruoyi
 * @date 2022-06-02
 */
public interface ZymProductMapper 
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
     * 删除产品列表
     * 
     * @param id 产品列表主键
     * @return 结果
     */
    public int deleteZymProductById(Integer id);

    /**
     * 批量删除产品列表
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteZymProductByIds(String[] ids);
}

package com.ruoyi.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanValidators;
import com.ruoyi.common.utils.security.Md5Utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.mapper.ZymProductMapper;
import com.ruoyi.domain.ZymProduct;
import com.ruoyi.service.IZymProductService;
import com.ruoyi.common.core.text.Convert;

import javax.validation.Validator;

/**
 * 产品列表Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-06-02
 */
@Service
public class ZymProductServiceImpl implements IZymProductService
{
    private static final Logger log = LoggerFactory.getLogger(ZymProductServiceImpl.class);

    @Autowired
    private ZymProductMapper zymProductMapper;

    @Autowired
    protected Validator validator;

    /**
     * 查询产品列表
     * 
     * @param id 产品列表主键
     * @return 产品列表
     */
    @Override
    public ZymProduct selectZymProductById(Integer id)
    {
        return zymProductMapper.selectZymProductById(id);
    }

    /**
     * 查询产品列表列表
     * 
     * @param zymProduct 产品列表
     * @return 产品列表
     */
    @Override
    public List<ZymProduct> selectZymProductList(ZymProduct zymProduct)
    {
        return zymProductMapper.selectZymProductList(zymProduct);
    }

    /**
     * 新增产品列表
     * 
     * @param zymProduct 产品列表
     * @return 结果
     */
    @Override
    public int insertZymProduct(ZymProduct zymProduct)
    {
        return zymProductMapper.insertZymProduct(zymProduct);
    }

    /**
     * 修改产品列表
     * 
     * @param zymProduct 产品列表
     * @return 结果
     */
    @Override
    public int updateZymProduct(ZymProduct zymProduct)
    {
        return zymProductMapper.updateZymProduct(zymProduct);
    }

    /**
     * 批量删除产品列表
     * 
     * @param ids 需要删除的产品列表主键
     * @return 结果
     */
    @Override
    public int deleteZymProductByIds(String ids)
    {
        return zymProductMapper.deleteZymProductByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除产品列表信息
     * 
     * @param id 产品列表主键
     * @return 结果
     */
    @Override
    public int deleteZymProductById(Integer id)
    {
        return zymProductMapper.deleteZymProductById(id);
    }

    /**
     * 导入产品数据
     *
     * @param zymProductList 产品数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @return 结果
     */
    @Override
    public String importProduct(List<ZymProduct> zymProductList, Boolean isUpdateSupport) {
        if (StringUtils.isNull(zymProductList) || zymProductList.size() == 0)
        {
            throw new ServiceException("导入产品数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (ZymProduct product : zymProductList)
        {
            try
            {
                // 验证是否存在这条数据
                ZymProduct zymProduct = new ZymProduct();
                zymProduct.setElasticip(product.getElasticip());
                List<ZymProduct> p = zymProductMapper.selectZymProductList(zymProduct);
                if (p.size()==0)
                {
                    BeanValidators.validateWithException(validator, product);
                    this.insertZymProduct(product);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、产品 " + product.getElasticip() + " 导入成功");
                }
                else if (isUpdateSupport)
                {
                    BeanValidators.validateWithException(validator, product);
                    this.updateZymProduct(product);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、产品 " + product.getElasticip() + " 更新成功");
                }
                else
                {
                    failureNum++;
                    failureMsg.append("<br/>" + failureNum + "、产品 " + product.getElasticip() + " 已存在");
                }
            }
            catch (Exception e)
            {
                failureNum++;
                String msg = "<br/>" + failureNum + "、产品 " + product.getElasticip() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
                log.error(msg, e);
            }
        }
        if (failureNum > 0)
        {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw new ServiceException(failureMsg.toString());
        }
        else
        {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }
}

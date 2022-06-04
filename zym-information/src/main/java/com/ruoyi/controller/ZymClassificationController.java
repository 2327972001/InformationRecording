package com.ruoyi.controller;

import java.util.List;

import com.ruoyi.domain.ZymProduct;
import com.ruoyi.mapper.ZymClassificationMapper;
import com.ruoyi.service.IZymProductService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.domain.ZymClassification;
import com.ruoyi.service.IZymClassificationService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 分类列表Controller
 * 
 * @author ruoyi
 * @date 2022-06-02
 */
@Controller
@RequestMapping("/classification/manager")
public class ZymClassificationController extends BaseController
{
    private String prefix = "classification/manager";

    @Autowired
    private IZymClassificationService zymClassificationService;

    @Autowired
    private IZymProductService zymProductService;

    @RequiresPermissions("classification:manager:view")
    @GetMapping()
    public String manager()
    {
        return prefix + "/manager";
    }

    /**
     * 查询分类列表列表
     */
    @RequiresPermissions("classification:manager:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ZymClassification zymClassification)
    {
        startPage();
        List<ZymClassification> list = zymClassificationService.selectZymClassificationList(zymClassification);
        for (ZymClassification classification : list) {
            ZymProduct zymProduct = new ZymProduct();
            zymProduct.setCid(classification.getId());
            classification.setNumber(zymProductService.selectZymProductList(zymProduct).size());
            //把数量存入数据库
            ZymClassification zymClassification1 = new ZymClassification();
            zymClassification1.setId(classification.getId());
            zymClassification1.setNumber(zymProductService.selectZymProductList(zymProduct).size());
            zymClassificationService.updateZymClassification(zymClassification1);
            Integer number = zymProductService.selectZymProductList(zymProduct).size();
            //获取未使用的产品数量
            zymProduct.setUid(0);
            classification.setE_number(zymProductService.selectZymProductList(zymProduct).size());
            //获取已使用的产品数量
            number = number - zymProductService.selectZymProductList(zymProduct).size();
            classification.setS_number(number);
        }
        return getDataTable(list);
    }

    /**
     * 导出分类列表列表
     */
    @RequiresPermissions("classification:manager:export")
    @Log(title = "分类列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ZymClassification zymClassification)
    {
        List<ZymClassification> list = zymClassificationService.selectZymClassificationList(zymClassification);
        ExcelUtil<ZymClassification> util = new ExcelUtil<ZymClassification>(ZymClassification.class);
        return util.exportExcel(list, "分类列表数据");
    }

    /**
     * 新增分类列表
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存分类列表
     */
    @RequiresPermissions("classification:manager:add")
    @Log(title = "分类列表", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ZymClassification zymClassification)
    {
        List<ZymClassification> classificationsList = zymClassificationService.selectZymClassificationList(new ZymClassification());
        for (ZymClassification classification : classificationsList) {
            if (classification.getName().equals(zymClassification.getName())) {
                return error("该项目类别已存在");
            }
        }
        //获取产品列表
        /*
        ZymClassification zymClassification1 = new ZymClassification();
        zymClassification1.setName(zymClassification.getName());
        List<ZymProduct> productsList = zymProductService.selectZymProductList(new ZymProduct());
        for (ZymProduct product : productsList) {
            product.setCid(zymClassificationService.selectZymClassificationList(zymClassification1).get(0).getId());
            product.setCategory(zymClassification.getName());
            //初始化数据
            product.setUid(0);
            product.setUsername(null);
            product.setStatus("0");
            product.setEndtime(null);
            product.setStarttime(null);
            zymProductService.insertZymProduct(product);
        }*/
        return toAjax(zymClassificationService.insertZymClassification(zymClassification));
    }

    /**
     * 修改分类列表
     */
    @RequiresPermissions("classification:manager:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        ZymClassification zymClassification = zymClassificationService.selectZymClassificationById(id);
        mmap.put("zymClassification", zymClassification);
        return prefix + "/edit";
    }

    /**
     * 修改保存分类列表
     */
    @RequiresPermissions("classification:manager:edit")
    @Log(title = "分类列表", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ZymClassification zymClassification)
    {
        List<ZymClassification> classificationsList = zymClassificationService.selectZymClassificationList(new ZymClassification());
        for (ZymClassification classification : classificationsList) {
            if (classification.getName().equals(zymClassification.getName())) {
                return error("该项目类别已存在");
            }
        }
        return toAjax(zymClassificationService.updateZymClassification(zymClassification));
    }

    /**
     * 删除分类列表
     */
    @RequiresPermissions("classification:manager:remove")
    @Log(title = "分类列表", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        String[] idsList = ids.split(",");
        for (String s : idsList) {
            if(zymClassificationService.selectZymClassificationById(Integer.parseInt(s)).getNumber()>0){
                return error("该分类正在使用，不能删除");
            }
        }
        return toAjax(zymClassificationService.deleteZymClassificationByIds(ids));
    }
}

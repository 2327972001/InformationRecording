package com.ruoyi.controller;

import java.util.List;

import com.ruoyi.domain.ZymClassification;
import com.ruoyi.domain.ZymProduct;
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
import com.ruoyi.domain.ZymInfo;
import com.ruoyi.service.IZymInfoService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 信息记录管理Controller
 * 
 * @author ruoyi
 * @date 2022-06-02
 */
@Controller
@RequestMapping("/information/manager")
public class ZymInfoController extends BaseController
{
    private String prefix = "information/manager";

    @Autowired
    private IZymInfoService zymInfoService;

    @Autowired
    private IZymProductService zymProductService;

    @RequiresPermissions("information:manager:view")
    @GetMapping()
    public String manager()
    {
        return prefix + "/manager";
    }

    /**
     * 查询信息记录管理列表
     */
    @RequiresPermissions("information:manager:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ZymInfo zymInfo)
    {
        startPage();
        List<ZymInfo> list = zymInfoService.selectZymInfoList(zymInfo);
        for (ZymInfo info : list) {
            ZymProduct zymProduct = new ZymProduct();
            zymProduct.setUid(info.getId());
            info.setNumber(zymProductService.selectZymProductList(zymProduct).size());
            //把数量存入数据库
            ZymInfo zymInfo1 = new ZymInfo();
            zymInfo1.setId(info.getId());
            zymInfo1.setNumber(zymProductService.selectZymProductList(zymProduct).size());
            zymInfoService.updateZymInfo(zymInfo1);
        }
        return getDataTable(list);
    }

    /**
     * 导出信息记录管理列表
     */
    @RequiresPermissions("information:manager:export")
    @Log(title = "信息记录管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ZymInfo zymInfo)
    {
        List<ZymInfo> list = zymInfoService.selectZymInfoList(zymInfo);
        ExcelUtil<ZymInfo> util = new ExcelUtil<ZymInfo>(ZymInfo.class);
        return util.exportExcel(list, "信息记录管理数据");
    }

    /**
     * 新增信息记录管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存信息记录管理
     */
    @RequiresPermissions("information:manager:add")
    @Log(title = "信息记录管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ZymInfo zymInfo)
    {
        return toAjax(zymInfoService.insertZymInfo(zymInfo));
    }

    /**
     * 修改信息记录管理
     */
    @RequiresPermissions("information:manager:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        ZymInfo zymInfo = zymInfoService.selectZymInfoById(id);
        mmap.put("zymInfo", zymInfo);
        return prefix + "/edit";
    }

    /**
     * 修改保存信息记录管理
     */
    @RequiresPermissions("information:manager:edit")
    @Log(title = "信息记录管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ZymInfo zymInfo)
    {
        return toAjax(zymInfoService.updateZymInfo(zymInfo));
    }

    /**
     * 删除信息记录管理
     */
    @RequiresPermissions("information:manager:remove")
    @Log(title = "信息记录管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        String[] idsList = ids.split(",");
        for (String s : idsList) {
            ZymProduct zymProduct = new ZymProduct();
            zymProduct.setUid(Integer.parseInt(s));
            if(zymProductService.selectZymProductList(zymProduct).size()>0){
                return error("该信息记录已经被产品使用，不能删除");
            }
        }
        return toAjax(zymInfoService.deleteZymInfoByIds(ids));
    }

    /**
     * 修改信息记录管理
     */
    @RequiresPermissions("information:manager:productlist")
    @GetMapping("/productlist/{id}")
    public String productlist(@PathVariable("id") Integer id, ModelMap mmap)
    {
        mmap.addAttribute("userid", id);
        return prefix + "/productlist";
    }

    /**
     * 实名信息
     */
    @RequiresPermissions("information:manager:view")
    @GetMapping("/idcard/{id}")
    public String idcard(@PathVariable("id") Integer id,ModelMap mmap){
        mmap.addAttribute("idcardinfo",zymInfoService.selectZymInfoById(id));
        return prefix + "/idcard";
    }

}

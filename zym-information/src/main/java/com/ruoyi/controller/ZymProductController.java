package com.ruoyi.controller;

import java.util.*;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.domain.ZymClassification;
import com.ruoyi.domain.ZymProductExce;
import com.ruoyi.service.IZymClassificationService;
import com.ruoyi.service.IZymInfoService;
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
import com.ruoyi.domain.ZymProduct;
import com.ruoyi.service.IZymProductService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 产品列表Controller
 * 
 * @author ruoyi
 * @date 2022-06-02
 */
@Controller
@RequestMapping("/product/manager")
public class ZymProductController extends BaseController
{
    private String prefix = "product/manager";

    @Autowired
    private IZymProductService zymProductService;

    @Autowired
    private IZymClassificationService zymClassificationService;

    @Autowired
    private IZymInfoService zymInfoService;

    @RequiresPermissions("product:manager:view")
    @GetMapping()
    public String manager()
    {
        return prefix + "/manager";
    }

    /**
     * 查询产品列表列表
     */
    @RequiresPermissions("product:manager:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ZymProduct zymProduct)
    {
        startPage();
        List<ZymProduct> list = zymProductService.selectZymProductList(zymProduct);
        for (ZymProduct product : list) {
            if(product.getUid()==0){
                product.setFree("0");
                zymProductService.updateZymProduct(product);
            }else{
                product.setFree("1");
                zymProductService.updateZymProduct(product);
            }
        }
        return getDataTable(list);
    }

    /**
     * 查询指定用户的产品列表列表
     */
    @RequiresPermissions("product:manager:list")
    @PostMapping("/nolist")
    @ResponseBody
    public TableDataInfo nolist(ZymProduct zymProduct)
    {
        startPage();
        zymProduct.setUid(0);
        zymProduct.setStatus("0");
        List<ZymProduct> list = zymProductService.selectZymProductList(zymProduct);
        return getDataTable(list);
    }

    /**
     * 查询指定用户的产品列表列表
     */
    @RequiresPermissions("product:manager:list")
    @PostMapping("/list/{id}")
    @ResponseBody
    public TableDataInfo listid(@PathVariable("id") Integer id, ZymProduct zymProduct)
    {
        startPage();
        zymProduct.setUid(id);
        List<ZymProduct> list = zymProductService.selectZymProductList(zymProduct);
        return getDataTable(list);
    }

    /**
     * 导出产品列表
     */
    @RequiresPermissions("product:manager:export")
    @Log(title = "产品列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ZymProduct zymProduct)
    {
        List<ZymProduct> list = zymProductService.selectZymProductList(zymProduct);
        ExcelUtil<ZymProduct> util = new ExcelUtil<ZymProduct>(ZymProduct.class);
        return util.exportExcel(list, "产品列表数据");
    }

    /**
     * 导出客户内的产品列表
     */
    @RequiresPermissions("product:manager:export")
    @Log(title = "产品列表", businessType = BusinessType.EXPORT)
    @PostMapping("/p_export")
    @ResponseBody
    public AjaxResult p_export(Integer uid, ZymProduct zymProduct)
    {
        zymProduct.setUid(uid);
        List<ZymProduct> list = zymProductService.selectZymProductList(zymProduct);
        ExcelUtil<ZymProduct> util = new ExcelUtil<ZymProduct>(ZymProduct.class);
        return util.exportExcel(list, "产品列表数据");
    }

    /**
     * 导入产品数据
     */
    @Log(title = "产品列表", businessType = BusinessType.IMPORT)
    @RequiresPermissions("system:manager:import")
    @PostMapping("/importData")
    @ResponseBody
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception
    {
        ExcelUtil<ZymProduct> util = new ExcelUtil<ZymProduct>(ZymProduct.class);
        List<ZymProduct> zymProductList = util.importExcel(file.getInputStream());
        String message = zymProductService.importProduct(zymProductList, updateSupport);
        return AjaxResult.success(message);
    }

    /**
     * 导出产品模板
     */
    @RequiresPermissions("system:manager:view")
    @GetMapping("/importTemplate")
    @ResponseBody
    public AjaxResult importTemplate()
    {
        ExcelUtil<ZymProductExce> util = new ExcelUtil<ZymProductExce>(ZymProductExce.class);
        return util.importTemplateExcel("产品数据");
    }

    /**
     * 新增产品列表
     */
    @GetMapping("/add")
    public String add(ModelMap mmp)
    {
        mmp.addAttribute("ClassificationList",zymClassificationService.selectZymClassificationList(new ZymClassification()));
        return prefix + "/add";
    }

    /**
     * 新增保存产品列表
     */
    @RequiresPermissions("product:manager:add")
    @Log(title = "产品列表", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ZymProduct zymProduct)
    {
        List<ZymProduct> zymProductList = zymProductService.selectZymProductList(new ZymProduct());
        for (ZymProduct product : zymProductList) {
            if(zymProduct.getElasticip().equals(product.getElasticip()) && zymProduct.getCid().equals(product.getCid())){
                return error("弹性IP:"+product.getElasticip()+"在"+product.getCategory()+"类别中已存在");
            }
        }
        zymProduct.setCategory(zymClassificationService.selectZymClassificationById(zymProduct.getCid()).getName());
        return toAjax(zymProductService.insertZymProduct(zymProduct));
    }

    /**
     * 用户关联产品
     */
    @RequiresPermissions("product:manager:add")
    @PostMapping("/adduserid")
    @ResponseBody
    public AjaxResult adduserid(Integer uid, String ids)
    {
        String[] idsList = ids.split(",");
        for (String s : idsList) {
            ZymProduct zymProduct = new ZymProduct();
            zymProduct.setId(Integer.parseInt(s));
            zymProduct.setUid(uid);
            zymProductService.updateZymProduct(zymProduct);
        }
        return toAjax(true);
    }

    /**
     * 修改产品列表
     */
    @RequiresPermissions("product:manager:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        ZymProduct zymProduct = zymProductService.selectZymProductById(id);
        mmap.put("zymProduct", zymProduct);
        mmap.addAttribute("ClassificationList",zymClassificationService.selectZymClassificationList(new ZymClassification()));
        return prefix + "/edit";
    }

    /**
     * 客户内的修改产品列表
     */
    @RequiresPermissions("product:manager:edit")
    @GetMapping("/p_edit/{id}")
    public String p_edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        ZymProduct zymProduct = zymProductService.selectZymProductById(id);
        mmap.put("zymProduct", zymProduct);
        mmap.addAttribute("ClassificationList",zymClassificationService.selectZymClassificationList(new ZymClassification()));
        return prefix + "/p_edit";
    }

    /**
     * 修改保存产品列表
     */
    @RequiresPermissions("product:manager:edit")
    @Log(title = "产品列表", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ZymProduct zymProduct)
    {
        zymProduct.setCategory(zymClassificationService.selectZymClassificationById(zymProduct.getCid()).getName());
        return toAjax(zymProductService.updateZymProduct(zymProduct));
    }

    /**
     * 删除产品列表
     */
    @RequiresPermissions("product:manager:remove")
    @Log(title = "产品列表", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        String[] idsList = ids.split(",");
        for (String s : idsList) {
            if(zymProductService.selectZymProductById(Integer.parseInt(s)).getUid() != 0){
                return error("该产品正在使用，不能删除");
            }
        }
        return toAjax(zymProductService.deleteZymProductByIds(ids));
    }

    /**
     * 移除产品
     */
    @RequiresPermissions("product:manager:detach")
    @GetMapping( "/detach")
    @ResponseBody
    public AjaxResult detach(String ids)
    {
        String[] idsList = ids.split(",");
        for (String s : idsList) {
            ZymProduct zymProduct = zymProductService.selectZymProductById(Integer.parseInt(s));
            zymProductService.deleteZymProductById(Integer.parseInt(s));
            zymProduct.setUid(0);
            zymProduct.setStarttime(null);
            zymProduct.setEndtime(null);
            zymProduct.setFree("0");
            zymProduct.setStatus("0");
            zymProduct.setUsername(null);
            zymProductService.insertZymProduct(zymProduct);
        }
        return toAjax(true);
    }

    @RequiresPermissions("product:manager:view")
    @GetMapping("/parent")
    public String parent(ModelMap mmap)
    {
        mmap.addAttribute("ClassificationList",zymClassificationService.selectZymClassificationList(new ZymClassification()));
        return prefix + "/parent";
    }

    @RequiresPermissions("product:manager:oneswitch")
    @GetMapping("/oneswitch")
    public String oneswitch()
    {
        return prefix + "/oneswitch";
    }

    /**
     * 一键切换
     * @param ids
     * @param region
     * @return
     */
    @RequiresPermissions("product:manager:oneswitch")
    @PostMapping("/oneswitch")
    @ResponseBody
    public AjaxResult oneswitch(String ids,String region)
    {
        String[] idsList = ids.split(",");

        //检测项目类别是否一致
        for(String s : idsList){
            ZymProduct zymProducts = new ZymProduct();
            zymProducts.setUid(0);
            zymProducts.setCategory(zymProductService.selectZymProductById(Integer.parseInt(s)).getCategory());
            List<ZymProduct> zymProductList = zymProductService.selectZymProductList(zymProducts);
            if(zymProductList.size() == 0) {
                return error("请检查" + zymProductService.selectZymProductById(Integer.parseInt(s)).getCategory() + "类别的未使用产品数量是否足够");
            }
        }
        //检测是否指定地区
        Integer uid = zymProductService.selectZymProductById(Integer.parseInt(idsList[0])).getUid();
        ZymProduct zymProducts = new ZymProduct();
        zymProducts.setUid(0);
        if(region.length() != 0){
            zymProducts.setRegion(region);
        }
        List<ZymProduct> zymProductList = zymProductService.selectZymProductList(zymProducts);
        if(region.length() != 0) {
            if (zymProductList.size() == 0) {
                return error("请检查" + region + "地区的未使用产品数量是否足够");
            }
        }
        for (String s : idsList) {
            //移除指定id的产品
            ZymProduct zymProduct = new ZymProduct();
            zymProduct.setId(Integer.parseInt(s));
            zymProduct.setUid(0);
            zymProductService.updateZymProduct(zymProduct);
            for (int i = 0; i < zymProductList.size(); i++) {
                if(zymProductList.get(i).getId() == Integer.parseInt(s)){
                    zymProductList.remove(i);
                }
            }
        }
        //打乱List<>顺序
        Collections.shuffle(zymProductList);
        int number = 0;
        for (int i = 0; i < idsList.length; i++) {
            if(region.length() != 0){
                if(region.equals(zymProductList.get(i).getRegion())){
                    ZymProduct zymProduct = new ZymProduct();
                    zymProduct.setId(zymProductList.get(i).getId());
                    zymProduct.setUid(uid);
                    zymProductService.updateZymProduct(zymProduct);
                    number++;
                }
            }else{
                ZymProduct zymProduct = new ZymProduct();
                zymProduct.setId(zymProductList.get(i).getId());
                zymProduct.setUid(uid);
                zymProductService.updateZymProduct(zymProduct);
            }
        }
        if(region.length() != 0){
            if(number!=idsList.length){
                return error("本次切换了"+number+"条IP，请检查"+region+"地区的未使用产品数量是否足够,请刷新列表");
            }
        }
        return toAjax(true);
    }

    /**
     * 一键增加时间
     */
    @RequiresPermissions("product:manager:edit")
    @GetMapping("/addtime")
    @ResponseBody
    public AjaxResult addtime(Integer[] ids,Integer time)
    {
        for (Integer id : ids) {
            ZymProduct zymProduct = new ZymProduct();
            zymProduct.setId(id);
            Date date = new Date();
            if(zymProductService.selectZymProductById(id).getStarttime()==null){
                zymProduct.setStarttime(date);
            }
            if(time==1){
                if(zymProductService.selectZymProductById(id).getEndtime() == null){
                    //当前时间加30天
                    zymProduct.setEndtime(DateUtils.addDays(date,30));
                }else{
                    //如果当前时间大于到期时间
                    if (date.getTime() > zymProductService.selectZymProductById(id).getEndtime().getTime()) {
                        //结束时间加30天
                        zymProduct.setEndtime(DateUtils.addDays(date,30));
                    }else{
                        //到前时间加30天
                        zymProduct.setEndtime(DateUtils.addDays(zymProductService.selectZymProductById(id).getEndtime(),30));
                    }
                }
            }
            if(time==2){
                if(zymProductService.selectZymProductById(id).getEndtime() == null){
                    //当前时间加60天
                    zymProduct.setEndtime(DateUtils.addDays(date,60));
                }else{
                    //如果当前时间大于到期时间
                    if (date.getTime() > zymProductService.selectZymProductById(id).getEndtime().getTime()) {
                        //结束时间加30天
                        zymProduct.setEndtime(DateUtils.addDays(date,60));
                    }else{
                        //到前时间加30天
                        zymProduct.setEndtime(DateUtils.addDays(zymProductService.selectZymProductById(id).getEndtime(),60));
                    }
                }
            }
            if(time==3){
                if(zymProductService.selectZymProductById(id).getEndtime() == null){
                    error("日期为空，减少时间失败");
                }else{
                    //时间减30天
                    zymProduct.setEndtime(DateUtils.addDays(zymProductService.selectZymProductById(id).getEndtime(),-30));
                }
            }
            zymProductService.updateZymProduct(zymProduct);
        }
        return success();
    }

    @RequiresPermissions("product:manager:add")
    @GetMapping("/adduserpwd")
    public String adduserpwd()
    {
        return prefix + "/adduserpwd";
    }

    @RequiresPermissions("product:manager:add")
    @PostMapping("/adduserpwd")
    @ResponseBody
    public AjaxResult adduserpwd(Integer[] ids,String username)
    {
        String[] user = username.split("/");
        if(user.length!=2){
            return error("用户名或密码不能为空");
        }
        for (Integer id : ids) {
            ZymProduct zymProduct = new ZymProduct();
            zymProduct.setId(id);
            zymProduct.setUsername(username);
            zymProductService.updateZymProduct(zymProduct);
        }
        return success();
    }
}

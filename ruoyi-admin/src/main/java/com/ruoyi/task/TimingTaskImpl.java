package com.ruoyi.task;

import com.ruoyi.domain.ZymProduct;
import com.ruoyi.service.IZymProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

/**
 * @author ZouYangMing
 * @deprecated 定时任务
 */
@Component("timingTask")
public class TimingTaskImpl {

    @Autowired
    private IZymProductService zymProductService;

    public void start() {
        List<ZymProduct> zymProductList = zymProductService.selectZymProductList(new ZymProduct());
        for (ZymProduct zymProduct : zymProductList) {
            Date now = new Date();
            //到期检测
            if (now.getTime() > zymProduct.getEndtime().getTime()) {
                ZymProduct zymProduct1 = new ZymProduct();
                zymProduct1.setId(zymProduct.getId());
                zymProduct1.setStatus("1");
                zymProductService.updateZymProduct(zymProduct1);
            }else{
                ZymProduct zymProduct1 = new ZymProduct();
                zymProduct1.setId(zymProduct.getId());
                zymProduct1.setStatus("0");
                zymProductService.updateZymProduct(zymProduct1);
            }
        }
    }

}

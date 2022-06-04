package com.ruoyi.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 产品列表Exce导出对象 zym_product
 * 
 * @author ZouYangMing
 * @date 2022-06-02
 */
public class ZymProductExce extends BaseEntity
{
    /** 弹性IP */
    @Excel(name = "弹性IP")
    private String elasticip;

    /** 备注 */
    @Excel(name = "备注")
    private String note;

    /** 带宽 */
    @Excel(name = "带宽")
    private String bandwidth;

    /** 地区 */
    @Excel(name = "地区")
    private String region;

    /** 项目类别 */
    @Excel(name = "项目类别")
    private String category;

    /** 端口HTTP */
    @Excel(name = "端口HTTP")
    private String httpport;

    /** sk5端口 */
    @Excel(name = "SK5端口")
    private String skport;

    /** 端口L2TP */
    @Excel(name = "端口L2TP")
    private String ltpport;

    public String getHttpport() {
        return httpport;
    }

    public void setHttpport(String httpport) {
        this.httpport = httpport;
    }

    public String getSkport() {
        return skport;
    }

    public void setSkport(String skport) {
        this.skport = skport;
    }

    public String getLtpport() {
        return ltpport;
    }

    public void setLtpport(String ltpport) {
        this.ltpport = ltpport;
    }

    public String getElasticip() {
        return elasticip;
    }

    public void setElasticip(String elasticip) {
        this.elasticip = elasticip;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getBandwidth() {
        return bandwidth;
    }

    public void setBandwidth(String bandwidth) {
        this.bandwidth = bandwidth;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}

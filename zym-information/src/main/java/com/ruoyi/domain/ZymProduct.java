package com.ruoyi.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 产品列表对象 zym_product
 * 
 * @author ruoyi
 * @date 2022-06-02
 */
public class ZymProduct extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 商品id */
    private Integer id;

    /** 项目类别id */
    private Integer cid;

    /** 用户id */
    private Integer uid;

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

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 项目类别 */
    @Excel(name = "项目类别")
    private String category;

    /** 账号 */
    @Excel(name = "账号")
    private String username;

    /** 开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date starttime;

    /** 到期时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "到期时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endtime;

    /** 空闲状态 */
    private String free;

    /** 端口HTTP */
    @Excel(name = "端口HTTP")
    private String httpport;

    /** sk5端口 */
    @Excel(name = "SK5端口")
    private String skport;

    /** 端口L2TP */
    @Excel(name = "端口L2TP")
    private String ltpport;

    public void setId(Integer id)
    {
        this.id = id;
    }

    public Integer getId()
    {
        return id;
    }
    public void setCid(Integer cid)
    {
        this.cid = cid;
    }

    public Integer getCid()
    {
        return cid;
    }
    public void setUid(Integer uid)
    {
        this.uid = uid;
    }

    public Integer getUid()
    {
        return uid;
    }
    public void setElasticip(String elasticip)
    {
        this.elasticip = elasticip;
    }

    public String getElasticip()
    {
        return elasticip;
    }
    public void setNote(String note)
    {
        this.note = note;
    }

    public String getNote()
    {
        return note;
    }
    public void setBandwidth(String bandwidth)
    {
        this.bandwidth = bandwidth;
    }

    public String getBandwidth()
    {
        return bandwidth;
    }
    public void setRegion(String region)
    {
        this.region = region;
    }

    public String getRegion()
    {
        return region;
    }
    public void setCategory(String category)
    {
        this.category = category;
    }

    public String getCategory()
    {
        return category;
    }
    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getUsername()
    {
        return username;
    }
    public void setStarttime(Date starttime)
    {
        this.starttime = starttime;
    }

    public Date getStarttime()
    {
        return starttime;
    }
    public void setEndtime(Date endtime)
    {
        this.endtime = endtime;
    }

    public Date getEndtime()
    {
        return endtime;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }
    public void setFree(String free)
    {
        this.free = free;
    }

    public String getFree()
    {
        return free;
    }

    public void setHttpport(String httpport)
    {
        this.httpport = httpport;
    }

    public String getHttpport()
    {
        return httpport;
    }
    public void setSkport(String skport)
    {
        this.skport = skport;
    }

    public String getSkport()
    {
        return skport;
    }
    public void setLtpport(String ltpport)
    {
        this.ltpport = ltpport;
    }

    public String getLtpport()
    {
        return ltpport;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("cid", getCid())
                .append("uid", getUid())
                .append("elasticip", getElasticip())
                .append("note", getNote())
                .append("bandwidth", getBandwidth())
                .append("region", getRegion())
                .append("category", getCategory())
                .append("username", getUsername())
                .append("starttime", getStarttime())
                .append("endtime", getEndtime())
                .append("status", getStatus())
                .append("free", getFree())
                .append("httpport", getHttpport())
                .append("skport", getSkport())
                .append("ltpport", getLtpport())
                .toString();
    }
}

package com.ruoyi.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 信息记录管理对象 zym_info
 *
 * @author ruoyi
 * @date 2022-06-03
 */
public class ZymInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 信息id */
    private Integer id;

    /** 客户信息 */
    @Excel(name = "客户信息")
    private String userinfo;

    /** 备注 */
    @Excel(name = "备注")
    private String note;

    /** 微信 */
    @Excel(name = "微信")
    private String wechat;

    /** QQ */
    @Excel(name = "QQ")
    private String qq;

    /** 数量 */
    @Excel(name = "数量")
    private Integer number;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 性别 */
    @Excel(name = "性别")
    private String sex;

    /** 手机号 */
    @Excel(name = "手机号")
    private String phone;

    /** 身份证号 */
    @Excel(name = "身份证号")
    private String idcard;

    /** 身份证正面 */
    private String idisimg;

    /** 身份证反面 */
    private String idbackimg;

    public void setId(Integer id)
    {
        this.id = id;
    }

    public Integer getId()
    {
        return id;
    }
    public void setUserinfo(String userinfo)
    {
        this.userinfo = userinfo;
    }

    public String getUserinfo()
    {
        return userinfo;
    }
    public void setNote(String note)
    {
        this.note = note;
    }

    public String getNote()
    {
        return note;
    }
    public void setWechat(String wechat)
    {
        this.wechat = wechat;
    }

    public String getWechat()
    {
        return wechat;
    }
    public void setQq(String qq)
    {
        this.qq = qq;
    }

    public String getQq()
    {
        return qq;
    }
    public void setNumber(Integer number)
    {
        this.number = number;
    }

    public Integer getNumber()
    {
        return number;
    }
    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }
    public void setSex(String sex)
    {
        this.sex = sex;
    }

    public String getSex()
    {
        return sex;
    }
    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public String getPhone()
    {
        return phone;
    }
    public void setIdcard(String idcard)
    {
        this.idcard = idcard;
    }

    public String getIdcard()
    {
        return idcard;
    }
    public void setIdisimg(String idisimg)
    {
        this.idisimg = idisimg;
    }

    public String getIdisimg()
    {
        return idisimg;
    }
    public void setIdbackimg(String idbackimg)
    {
        this.idbackimg = idbackimg;
    }

    public String getIdbackimg()
    {
        return idbackimg;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("userinfo", getUserinfo())
                .append("note", getNote())
                .append("wechat", getWechat())
                .append("qq", getQq())
                .append("number", getNumber())
                .append("name", getName())
                .append("sex", getSex())
                .append("phone", getPhone())
                .append("idcard", getIdcard())
                .append("idisimg", getIdisimg())
                .append("idbackimg", getIdbackimg())
                .toString();
    }
}

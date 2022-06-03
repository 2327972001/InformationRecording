package com.ruoyi.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 分类列表对象 zym_classification
 * 
 * @author ruoyi
 * @date 2022-06-02
 */
public class ZymClassification extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 分类id */
    private Integer id;

    /** 项目类别 */
    @Excel(name = "项目类别")
    private String name;

    /** 备注 */
    @Excel(name = "备注")
    private String note;

    /** 数量 */
    @Excel(name = "数量")
    private Integer number;

    /** 已使用数量 */
    private Integer s_number;

    /** 未使用数量 */
    private Integer e_number;

    public Integer getS_number() {
        return s_number;
    }

    public void setS_number(Integer s_number) {
        this.s_number = s_number;
    }

    public Integer getE_number() {
        return e_number;
    }

    public void setE_number(Integer e_number) {
        this.e_number = e_number;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public Integer getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setNote(String note) 
    {
        this.note = note;
    }

    public String getNote() 
    {
        return note;
    }
    public void setNumber(Integer number) 
    {
        this.number = number;
    }

    public Integer getNumber() 
    {
        return number;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("note", getNote())
            .append("number", getNumber())
            .toString();
    }
}

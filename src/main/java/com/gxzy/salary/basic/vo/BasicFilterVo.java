package com.gxzy.salary.basic.vo;

import java.math.BigDecimal;

/**
 *  @author: chenkaidi
 *  @Date: 2019/8/17 10:26
 *  @Description:查询通用过滤器
 */
public class BasicFilterVo {
    private String name; // 姓名 当前登陆
    private String group; // 班组
    private String machineno; // 机台号
    private Long mid; // 机台号id
    private String brand; // 牌号
    private Object extend; //特殊条件扩展字段
    private String createTime; // 创建时间
    private String sTime; // 起始时间
    private String eTime; // 终止时间
    private BigDecimal amount; // 输入的产量
    private String monthTime; // 月份时间 当月第一天
    private Long itemId; // 积分模块ItemID
    private Integer status; // 当前order 确认审批状态



    public BasicFilterVo(){}
    public BasicFilterVo(String name) {
        this.name = name;
    }
    public BasicFilterVo(String name, String createTime) {
        this.name = name;
        this.createTime = createTime;
    }

    public BasicFilterVo(String name, String group, Long mid, String brand, String createTime) {
        this.name = name;
        this.group = group;
        this.mid = mid;
        // 对brand进行特殊处理
        this.brand =  convBrand(brand);
        this.createTime = createTime;
    }

    public BasicFilterVo(String name, String group, String machineno, Long mid, String brand, Object extend, String createTime, String sTime, String eTime, BigDecimal amount, String monthTime, Long itemId, Integer status) {
        this.name = name;
        this.group = group;
        this.machineno = machineno;
        this.mid = mid;
        this.brand = brand;
        this.extend = extend;
        this.createTime = createTime;
        this.sTime = sTime;
        this.eTime = eTime;
        this.amount = amount;
        this.monthTime = monthTime;
        this.itemId = itemId;
        this.status = status;
    }

    @Override
    public String toString() {
        return "BasicFilterVo{" +
                "name='" + name + '\'' +
                ", group='" + group + '\'' +
                ", machineno='" + machineno + '\'' +
                ", mid=" + mid +
                ", brand='" + brand + '\'' +
                ", extend=" + extend +
                ", createTime='" + createTime + '\'' +
                ", sTime='" + sTime + '\'' +
                ", eTime='" + eTime + '\'' +
                ", amount=" + amount +
                ", monthTime='" + monthTime + '\'' +
                ", itemId=" + itemId +
                ", status=" + status +
                '}';
    }

    public String getMonthTime() {
        return monthTime;
    }

    public void setMonthTime(String monthTime) {
        this.monthTime = monthTime;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getMachineno() {
        return machineno;
    }

    public void setMachineno(String machineno) {
        this.machineno = machineno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public Long getMid() {
        return mid;
    }

    public void setMid(Long mid) {
        this.mid = mid;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = convBrand(brand);
    }

    // brand转换，特殊处理  e.g.真龙（珍品）1801 -> 真龙（珍品）
    private String convBrand(String brand) {
        String res = null;
        if(null == brand )
        {
            return null;
        }
        int endIndex = brand.indexOf('）'); // 中文右括号
        if(-1 != endIndex)
        {
            res = brand.substring(0,endIndex+1);
        }
        return res;
    }

    public Object getExtend() {
        return extend;
    }

    public void setExtend(Object extend) {
        this.extend = extend;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getsTime() {
        return sTime;
    }

    public void setsTime(String sTime) {
        this.sTime = sTime;
    }

    public String geteTime() {
        return eTime;
    }

    public void seteTime(String eTime) {
        this.eTime = eTime;
    }

    public Long getItemId() {
        return itemId;
    }

    public void setItemId(Long itemId) {
        this.itemId = itemId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}

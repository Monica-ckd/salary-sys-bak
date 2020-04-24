package com.gxzy.salary.basic.entity;

import java.math.BigDecimal;

/**
 *  @author: chenkaidi
 *  @Date: 2019/8/16 16:16
 *  @Description: 员工产量信息 [机台，牌号，最终总产量,定额]
 */
public class EmpOutputInfo {
    private Long mid;
    private String brand;
    private BigDecimal totalAmt;
    private BigDecimal regAmt;

    public EmpOutputInfo(Long mid, String brand, BigDecimal totalAmt, BigDecimal regAmt) {
        this.mid = mid;
        this.brand = brand;
        this.totalAmt = totalAmt;
        this.regAmt = regAmt;
    }

    @Override
    public String toString() {
        return "EmpOutputInfo{" +
                "mid=" + mid +
                ", brand='" + brand + '\'' +
                ", totalAmt=" + totalAmt +
                ", regAmt=" + regAmt +
                '}';
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
        this.brand = brand;
    }

    public BigDecimal getTotalAmt() {
        return totalAmt;
    }

    public void setTotalAmt(BigDecimal totalAmt) {
        this.totalAmt = totalAmt;
    }

    public BigDecimal getRegAmt() {
        return regAmt;
    }

    public void setRegAmt(BigDecimal regAmt) {
        this.regAmt = regAmt;
    }
}

package com.gxzy.salary.basic.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * <p>
 * 员工日工资汇总
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-30
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("emp_day_amtsalary")
public class EmpDayAmtsalary extends Model<EmpDayAmtsalary> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 姓名
     */
    private String name;

    /**
     * 班组
     */
    private String group;

    /**
     * 机台号id
     */
    private Long mid;

    /**
     * 机台号
     */
    private String machineno;

    /**
     * 牌号
     */
    private String brand;

    /**
     * 实际产量（万支）
     */
    private BigDecimal totalAmt;

    /**
     * 班组产量（万支）
     */
    private BigDecimal groupAmt;

    /**
     * 产量薪资
     */
    private BigDecimal amtSalary;

    /**
     * 创建时间
     */
    private String createTime;

    /**
     * 更新人
     */
    private String lastUpdateBy;

    /**
     * 更新时间
     */
    private String lastUpdateTime;

    /**
     * 是否删除  -1：已删除  0：正常
     */
    private Integer delFlag;

    /**
     * 备注
     */
    private String comment;

    public EmpDayAmtsalary(){}

    public EmpDayAmtsalary(String name, String group, Long mid, String brand, BigDecimal totalAmt, String createTime) {
        this.name = name;
        this.group = group;
        this.mid = mid;
        this.brand = brand;
        this.totalAmt = totalAmt;
        this.createTime = createTime;
    }

    public static final String ID = "id";

    public static final String NAME = "name";

    public static final String GROUP = "group";

    public static final String MID = "mid";
    public static final String MACHINENO = "machineno";

    public static final String BRAND = "brand";

    public static final String TOTAL_AMT = "total_amt";
    public static final String GROUP_AMT = "group_amt";

    public static final String AMT_SALARY = "amt_salary";

    public static final String CREATE_TIME = "create_time";

    public static final String LAST_UPDATE_BY = "last_update_by";

    public static final String LAST_UPDATE_TIME = "last_update_time";

    public static final String DEL_FLAG = "del_flag";

    public static final String COMMENT = "comment";

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}

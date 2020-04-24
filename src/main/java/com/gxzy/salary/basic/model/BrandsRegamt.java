package com.gxzy.salary.basic.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 牌号定额管理
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@Data
@Accessors(chain = true)
@TableName("brands_regamt")
public class BrandsRegamt{

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 牌号
     */
    private String brand;

    /**
     * 机台号id
     */
    private Long mid;

    /**
     * 机台号id
     */
    @TableField(exist = false)
    private String machineno;

    /**
     * 牌号类型 一般取牌号名称/常规硬盒机
     */
    private String bType;


    /**
     * 定额产量
     */
    private BigDecimal regAmt;

    /**
     * 类别标志 0：卷包 1：成型
     */
    private Integer category;


    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新人
     */
    private String lastUpdateBy;

    /**
     * 更新时间
     */
    private Date lastUpdateTime;

    /**
     * 是否删除  -1：已删除  0：正常
     */
    private Integer delFlag;

    /**
     * 备注
     */
    private String comment;


    public static final String ID = "id";

    public static final String BRAND = "brand";

    public static final String MID = "mid";

    public static final String B_TYPE = "b_type";

    public static final String REG_AMT = "reg_amt";

    public static final String CATEGORY = "category";

    public static final String CREATE_TIME = "create_time";

    public static final String LAST_UPDATE_BY = "last_update_by";

    public static final String LAST_UPDATE_TIME = "last_update_time";

    public static final String DEL_FLAG = "del_flag";

    public static final String COMMENT = "comment";



}

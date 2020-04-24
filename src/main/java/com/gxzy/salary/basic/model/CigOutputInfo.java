package com.gxzy.salary.basic.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**
 * <p>
 * 日产量汇总
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@Data
@Accessors(chain = true)
@TableName("cig_output_info")
public class CigOutputInfo  {

    private static final long serialVersionUID = 1L;

    /**
     * 机台号
     */
    @TableId(value = "ID", type = IdType.AUTO)
    private Long id;

    /**
     * 班组id
     */
    @TableField(exist = false)
    private Long gid;

    /**
     * 班组
     */
    @TableField("GROUP")
    private String group;
    /**
     * 机台号
     */
    @TableField("machineno")
    private String machineno;


    /**
     * 牌号
     */
    @TableField("BRAND")
    private String brand;

    /**
     * 实际产量（万支）
     */
    private BigDecimal prdAmt;

    /**
     * 增补产量（万支）
     */
    private BigDecimal incAmt;

    /**
     * 增补原因
     */
    private String reason;

    /**
     * 总产量
     */
    private BigDecimal total;

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


    public static final String ID = "ID";

    public static final String GID = "GID";

    public static final String GROUP = "GROUP";

    public static final String MACHINENO = "MACHINENO";

    public static final String BRAND = "BRAND";

    public static final String PRD_AMT = "prd_amt";

    public static final String INC_AMT = "inc_amt";

    public static final String REASON = "reason";

    public static final String TOTAL = "total";

    public static final String CREATE_TIME = "create_time";

    public static final String LAST_UPDATE_BY = "last_update_by";

    public static final String LAST_UPDATE_TIME = "last_update_time";

    public static final String DEL_FLAG = "del_flag";

    public static final String COMMENT = "comment";


    public CigOutputInfo() {
    }
}

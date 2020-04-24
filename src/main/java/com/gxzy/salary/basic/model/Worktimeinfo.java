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
 * 月工作时间信息
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@Data
@Accessors(chain = true)
@TableName("worktimeinfo")
public class Worktimeinfo{

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 班组
     */
    private String group;

    /**
     * 工作天数
     */
    @TableField("workDays")
    private BigDecimal workDays;

    /**
     * 点值
     */
    @TableField("pointVal")
    private BigDecimal pointVal;

    /**
     * 月份 默认取月份第一天
     */
    private String monthDate;

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


    public static final String ID = "id";

    public static final String GROUP = "group";

    public static final String WORKDAYS = "workDays";

    public static final String POINTVAL = "pointVal";

    public static final String MONTH_DATE = "month_date";

    public static final String CREATE_TIME = "create_time";

    public static final String LAST_UPDATE_BY = "last_update_by";

    public static final String LAST_UPDATE_TIME = "last_update_time";

    public static final String DEL_FLAG = "del_flag";

    public static final String COMMENT = "comment";


}

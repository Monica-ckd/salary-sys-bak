package com.gxzy.salary.basic.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * 异常出勤统计表
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-26
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("duty_except")
public class DutyExcept extends Model<DutyExcept> {

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
     * 缺勤请假类型id
     */
    private Long absId;

    /**
     * 缺勤请假类型
     */
    @TableField(exist = false)
    private String absDesc;

    /**
     * 请假开始时间
     */
    @TableField("sTime")
    private String sTime;

    /**
     * 请假结束时间
     */
    @TableField("eTime")
    private String eTime;

    /**
     * 创建时间
     */
    private String createTime;

    /**
     * 创建人
     */
        private String createBy;
    /**
     * 是否确认  0：待确认 1：已经确认
     */
    private Integer checkState;

    /**
     * 是否异常  -1：已删除  0：正常 1异常
     */
    private Integer abnmalState;

    /**
     * 父异常订单ID，一级为0
     */
    private Long parentId;

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

    /**
     * 当前流程状态
     */
    private Integer status;

    /**
     * 当前流程状态描述
     * 待员工确认=100,已确认，完成 =101,提起异常，待管理审批=102，管理审批通过，完成=103,管理审批驳回，待员工确认=104'
     */
    private String describe;

    public static final String ID = "id";

    public static final String NAME = "name";

    public static final String GROUP = "group";

    public static final String ABS_ID = "abs_id";

    public static final String STIME = "sTime";

    public static final String ETIME = "eTime";

    public static final String CREATE_TIME = "create_time";

    public static final String CREATE_BY = "create_by";

    public static final String CHECK_STATE = "check_state";

    public static final String ABNMAL_STATE = "abnmal_state";

    public static final String PARENT_ID = "parent_id";

    public static final String LAST_UPDATE_BY = "last_update_by";

    public static final String LAST_UPDATE_TIME = "last_update_time";

    public static final String DEL_FLAG = "del_flag";

    public static final String COMMENT = "comment";

    public static final String STATUS = "status";

    public static final String DESCRIBE = "describe";

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}

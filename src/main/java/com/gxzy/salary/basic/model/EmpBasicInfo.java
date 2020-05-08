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
 * 员工基本信息表
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@Data
@Accessors(chain = true)
@TableName("emp_basic_info")
public class EmpBasicInfo {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 姓名
     */
    private String name;

    /**
     * 员工工号信息
     */
    @TableField(exist = false)
    private String eno;

    /**
     * '奖金系数  协议制根据年限0.45-0.65'
     */
    @TableField(exist = false)
    private BigDecimal bounsRatio;

    /**
     * 个人岗位信息id
     */
    private Long pid;

    /**
     * 基本岗位信息bpid
     */
    @TableField(exist = false)
    private Long bpid;
    /**
     * 岗位信息
     */
    @TableField(exist = false)
    private String position;
    /**
     * 工作模式id
     */
    private Long wid;
    /**
     * 工作模式id
     */
    @TableField(exist = false)
    private String mode;

    /**
     * 班组id
     */
    private String group;

    /**
     * 班组名称
     */
    @TableField(exist = false)
    private String groupName;

    /**
     * 机台号id 可以多个,隔开
     */
    private String mid;

    /**
     * 是否删除  -1：已删除  0：正常
     */
    private Integer delFlag;

    /**
     * 备注
     */
    private String comment;

    /**
     * 创建时间
     */
    private String createTime;


    public static final String ID = "id";

    public static final String NAME = "name";
    public static final String ENO = "eno";
    public static final String BOUNSRATIO = "bounsRatio";

    public static final String PID = "pid";

    public static final String BPID = "bpid";

    public static final String WID = "wid";

    public static final String GROUP = "group";

    public static final String MID = "mid";

    public static final String CREATE_TIME = "create_time";

    public static final String LAST_UPDATE_BY = "last_update_by";

    public static final String LAST_UPDATE_TIME = "last_update_time";

    public static final String DEL_FLAG = "del_flag";

    public static final String COMMENT = "comment";
}

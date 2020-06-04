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
 * 员工岗位信息表
 * </p>
 *
 * @author chenkaidi
 * @since 2019-09-10
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("post_change_info")
public class PostChangeInfo extends Model<PostChangeInfo> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 班组
     */
    private String group;

    /**
     * 姓名
     */
    private String name;

    /**
     * 机台号 可以多个,隔开
     */
    private String machineno;

    /**
     * 工作模式：两班 三班 四班三运转
     */
    private Long wid;

    /**
     * 工作模式：两班 三班 四班三运转
     */
    @TableField(exist=false)
    private String mode;

    /**
     * 岗位名称id
     */
    private Long bpid;

    /**
     * 岗位名称id
     */
    @TableField(exist=false)
    private String position;

    /**
     * 顶岗开始时间
     */
    private String sTime;

    /**
     * 顶岗结束时间
     */
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
     * 是否确认  0：否 1：已确认
     */
    private Integer checkState;

    /**
     * 是否异常  -1：异常  0：正常
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
     * 当前流程状态
     */
    private Integer status;

    /**
     * 当前流程状态描述
     * 待员工确认=100,已确认，完成 =101,提起异常，待管理审批=102，管理审批通过，完成=103,管理审批驳回，待员工确认=104'
     */
    private String describe;

    /**
     * 备注
     */
    private String comment;


    public static final String ID = "id";

    public static final String GROUP = "group";

    public static final String NAME = "name";

    public static final String MACHINENO = "machineno";

    public static final String WID = "wid";
    public static final String MODE = "mode";

    public static final String BPID = "bpid";
    public static final String POSITION = "position";

    public static final String S_TIME = "s_time";

    public static final String E_TIME = "e_time";

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

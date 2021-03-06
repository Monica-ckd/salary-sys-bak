package com.gxzy.salary.points.model;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.math.BigDecimal;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 积分记录表
 * </p>
 *
 * @author chenkaidi
 * @since 2020-05-08
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("point_record")
public class PointRecord extends Model<PointRecord> {

    private static final long serialVersionUID = 1L;

    /**
     * 序号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 用户ID
     */
    private String eno;

    /**
     * 用户姓名
     */
    private String name;

    /**
     * 项目模块ID
     */
    private Long itemId;

    /**
     * 项目模块名称
     */
    @TableField(exist=false)
    private String itemName;

    /**
     * 项目模块名称
     */
    @TableField(exist=false)
    private String itemExtend;

    /**
     * 政治面貌
     */
    @TableField(exist=false)
    private String political;

    /**
     * 分值
     */
    private BigDecimal score;

    /**
     * 级别 公司，厂级，车间级...
     */
    private String level;

    /**
     * 等级 一级、二级...
     */
    private String grade;

    /**
     * 描述信息
     */
    private String desc;

    /**
     * 备注
     */
    private String comment;

    /**
     * 扩展1
     */
    private String extend;

    /**
     * 扩展2
     */
    private String field;

    /**
     * 状态  0：正常   1：禁用
     */
    private Integer status;

    /**
     * 创建人
     */
    private String createBy;

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


    public static final String ID = "id";

    public static final String ENO = "eno";

    public static final String NAME = "NAME";

    public static final String ITEM_ID = "item_id";

    public static final String SCORE = "score";

    public static final String LEVEL = "level";

    public static final String GRADE = "grade";

    public static final String DESC = "desc";

    public static final String COMMENT = "comment";

    public static final String EXTEND = "extend";

    public static final String FIELD = "field";

    public static final String STATUS = "status";

    public static final String CREATE_BY = "create_by";

    public static final String CREATE_TIME = "create_time";

    public static final String LAST_UPDATE_BY = "last_update_by";

    public static final String LAST_UPDATE_TIME = "last_update_time";

    public static final String DEL_FLAG = "del_flag";

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "PointRecord{" +
                "id=" + id +
                ", eno=" + eno +
                ", name='" + name + '\'' +
                ", itemId=" + itemId +
                ", itemName='" + itemName + '\'' +
                ", score=" + score +
                ", level='" + level + '\'' +
                ", grade='" + grade + '\'' +
                ", desc='" + desc + '\'' +
                ", comment='" + comment + '\'' +
                ", extend='" + extend + '\'' +
                ", field='" + field + '\'' +
                ", status=" + status +
                ", createBy='" + createBy + '\'' +
                ", createTime=" + createTime +
                ", lastUpdateBy='" + lastUpdateBy + '\'' +
                ", lastUpdateTime=" + lastUpdateTime +
                ", delFlag=" + delFlag +
                '}';
    }
}

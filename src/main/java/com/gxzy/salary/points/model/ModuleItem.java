package com.gxzy.salary.points.model;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 积分项目表
 * </p>
 *
 * @author chenkaidi
 * @since 2020-05-08
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("module_item")
public class ModuleItem extends Model<ModuleItem> {

    private static final long serialVersionUID = 1L;

    /**
     * 序号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 父模块ID
     */
    private Long parentId;

    /**
     * 名称
     */
    private String item;

    /**
     * 描述信息
     */
    private String desc;

    /**
     * 备注
     */
    private String comment;

    /**
     * 扩展
     */
    private String extend;

    /**
     * 扩展
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

    public static final String PARENT_ID = "parent_id";

    public static final String ITEM = "item";

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
        return "ModuleItem{" +
                "id=" + id +
                ", parentId=" + parentId +
                ", item='" + item + '\'' +
                ", desc='" + desc + '\'' +
                ", comment='" + comment + '\'' +
                ", extend='" + extend + '\'' +
                ", field='" + field + '\'' +
                ", status=" + status +
                ", createBy='" + createBy + '\'' +
                ", createTime='" + createTime + '\'' +
                ", lastUpdateBy='" + lastUpdateBy + '\'' +
                ", lastUpdateTime='" + lastUpdateTime + '\'' +
                ", delFlag=" + delFlag +
                '}';
    }
}

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
import java.time.LocalDateTime;

/**
 * <p>
 * 员工岗位信息表
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("basic_position")
public class BasicPosition extends Model<BasicPosition> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 岗位名称
     */
    private String position;

    /**
     * 岗位类型:0操作 1维修 2 班组管理 3车间管理
     */
    private Integer postType;

    /**
     * 岗位薪点
     */
    private BigDecimal salaryPoint;

    /**
     * 岗位比例
     */
    private BigDecimal salaryRate;
    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 更新人
     */
    private String lastUpdateBy;

    /**
     * 更新时间
     */
    private LocalDateTime lastUpdateTime;

    /**
     * 是否删除  -1：已删除  0：正常
     */
    private Integer delFlag;

    /**
     * 备注
     */
    private String comment;


    public static final String ID = "id";

    public static final String POSITION = "position";

    public static final String POST_TYPE = "post_type";

    public static final String SALARY_POINT = "salary_point";

    public static final String SALARY_RATE = "salary_rate";

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

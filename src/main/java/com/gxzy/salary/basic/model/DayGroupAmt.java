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
 * 日班总产量数据
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-30
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("day_group_amt")
public class DayGroupAmt extends Model<DayGroupAmt> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 班组
     */
    private String group;

    /**
     * 生产机台个数
     */
    private Integer machines;

    /**
     * 实际产量（万支）
     */
    private BigDecimal groupAmt;

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
    private LocalDateTime lastUpdateTime;

    /**
     * 是否删除  -1：已删除  0：正常
     */
    private Integer delFlag;

    /**
     * 备注
     */
    private String comment;

    public DayGroupAmt()
    {

    }
    public DayGroupAmt(String group, Integer machines, BigDecimal groupAmt, String createTime) {
        this.group = group;
        this.machines = machines;
        this.groupAmt = groupAmt;
        this.createTime = createTime;
    }

    public static final String ID = "id";

    public static final String GROUP = "group";

    public static final String MACHINES = "machines";

    public static final String TOTAL_AMT = "total_amt";

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

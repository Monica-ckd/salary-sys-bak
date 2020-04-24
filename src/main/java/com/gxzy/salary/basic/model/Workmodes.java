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
 * 工作模式表
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@Data
@Accessors(chain = true)
@TableName("workmodes")
public class Workmodes{

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 上班模式
     */
    private String mode;

    /**
     * 上班时长
     */
    @TableField("workTime")
    private BigDecimal workTime;


    public static final String ID = "id";

    public static final String MODE = "mode";

    public static final String WORKTIME = "workTime";


}

package com.gxzy.salary.basic.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * <p>
 * 机台号管理
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@Data
@Accessors(chain = true)
@TableName("machines")
public class Machines{

    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 机台号
     */
    @TableField("machineno")
    private String machineno;

    /**
     * 描述
     */
    private String desc;

    /**
     * 备注
     */
    private String comment;


    public static final String ID = "id";

    public static final String MACHINENO = "MACHINENO";

    public static final String DESC = "desc";

    public static final String COMMENT = "comment";


}

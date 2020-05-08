package com.gxzy.salary.basic.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 班组管理
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@Data
@Accessors(chain = true)
@TableName("groups")
public class Groups{

    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 班组名称
     */
    private String group;

    @TableField(exist = false)
    private String groupName;
    /**
     * 备注
     */
    private String comment;


    public static final String ID = "id";

    public static final String GROUP = "group";

    public static final String COMMENT = "comment";



}

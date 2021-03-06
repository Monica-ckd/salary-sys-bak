package com.gxzy.salary.points.model;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.time.LocalDate;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 员工信息表
 * </p>
 *
 * @author chenkaidi
 * @since 2020-05-21
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("person_info")
public class PersonInfo extends Model<PersonInfo> {

    private static final long serialVersionUID = 1L;

    /**
     * 序号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 工号
     */
    private String eno;

    /**
     * 姓名
     */
    private String name;

    /**
     * 姓别 男or女
     */
    private String gender;

    /**
     * 出生日期
     */
    private LocalDate birth;

    /**
     * 政治面貌
     */
    private String political;

    /**
     * 入党（团）时间
     */
    private LocalDate joinTime;

    /**
     * 进厂时间
     */
    private LocalDate entryTime;

    /**
     * 备注
     */
    private String remark;

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


    public static final String ID = "id";

    public static final String ENO = "eno";

    public static final String NAME = "name";

    public static final String GENDER = "gender";

    public static final String BIRTH = "birth";

    public static final String POLITICAL = "political";

    public static final String JOIN_TIME = "join_time";

    public static final String ENTRY_TIME = "entry_time";

    public static final String REMARK = "remark";

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

}

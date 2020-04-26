package com.gxzy.salary.book.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
/**
 * <p>
 * 会议室预约信息
 * </p>
 *
 * @author chenkaidi
 * @since 2020-01-16
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("reserve_info")
public class ReserveInfo extends Model<ReserveInfo> {

    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 会议主题
     */
    private String topic;

    /**
     * 会议日期
     */
    private String dateNo;
    /**
     * 会议日期 前端使用
     */
    private String date;

    /**
     * 开始时间
     */
    private String startTime;

    /**
     * 结束时间
     */
    private String endTime;

    /**
     * 参会人
     */
    private String presentEmp;

    /**
     * 预约人
     */
    private String createUser;

    /**
     * 预约人电话
     */
    private String telephone;

    /**
     * 会议室编号
     */
    private Long roomId;

    /**
     * 会议室名称
     */
    private String roomName;

    /**
     * 创建时间
     */
    private String createTime;

    /**
     * 备注
     */
    private String remark;

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

    public static final String TOPIC = "topic";

    public static final String DATE= "date";
    public static final String DATE_NO = "date_no";

    public static final String START_TIME = "start_time";

    public static final String END_TIME = "end_time";

    public static final String PRESENT_EMP = "present_emp";

    public static final String CREATE_USER = "create_user";

    public static final String TELEPHONE = "telephone";

    public static final String ROOM_ID = "room_id";

    public static final String CREATE_TIME = "create_time";

    public static final String REMARK = "remark";

    public static final String LAST_UPDATE_BY = "last_update_by";

    public static final String LAST_UPDATE_TIME = "last_update_time";

    public static final String DEL_FLAG = "del_flag";

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "ReserveInfo{" +
                "id=" + id +
                ", topic='" + topic + '\'' +
                ", dateNo='" + dateNo + '\'' +
                ", date='" + date + '\'' +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", presentEmp='" + presentEmp + '\'' +
                ", createUser='" + createUser + '\'' +
                ", telephone='" + telephone + '\'' +
                ", roomId=" + roomId +
                ", roomName='" + roomName + '\'' +
                ", createTime='" + createTime + '\'' +
                ", remark='" + remark + '\'' +
                ", lastUpdateBy='" + lastUpdateBy + '\'' +
                ", lastUpdateTime='" + lastUpdateTime + '\'' +
                ", delFlag=" + delFlag +
                '}';
    }
}

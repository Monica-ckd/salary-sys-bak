package com.gxzy.salary.book.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * <p>
 * 会议室预约时间信息
 * </p>
 *
 * @author chenkaidi
 * @since 2020-01-29
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("room_use_infos")
public class RoomUseInfos extends Model<RoomUseInfos> {

    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 会议室编号
     */
    private Long roomId;

    /**
     * 会议日期
     */
    private LocalDate dateNo;

    /**
     * 预约时间数据
     */
    private String timeField;


    public static final String ID = "id";

    public static final String ROOM_ID = "room_id";

    public static final String DATE_NO = "date_no";

    public static final String TIME_FIELD = "time_field";

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}

package com.gxzy.salary.book.service.vo;
/**
 *  @author: chenkaidi
 *  @Date: 2020/3/10 18:47
 *  @Description: 预定通用查询过滤器
 */
public class ReserveFilterVo {

    private long id; // 预定记录id
    private long roomId; // 会议室ID
    private String dateNo; // 预约日期
    private String startDate; // 起始日期
    private String endDate; // 终止日期
    private String queryDate; // 当前查询日期 （用来计算当前周起始、终止日期）
    private String startTime; // 起始时间
    private String endTime; // 终止时间
    private String createTime; // 创建时间
    private String createUser; // 创建用户
    public ReserveFilterVo(){}

    public ReserveFilterVo(long id, String createTime) {
        this.id = id;
        this.createTime = createTime;
    }

    public ReserveFilterVo(Long roomId, String startTime, String endTime) {
        this.roomId = roomId;
        this.startDate = startTime;
        this.endDate = endTime;
    }

    public ReserveFilterVo(long roomId, String dateNo, String startTime, String endTime) {
        this.roomId = roomId;
        this.dateNo = dateNo;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    @Override
    public String toString() {
        return "ReserveFilterVo{" +
                "id=" + id +
                ", roomId=" + roomId +
                ", dateNo='" + dateNo + '\'' +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", queryDate='" + queryDate + '\'' +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", createTime='" + createTime + '\'' +
                ", createUser='" + createUser + '\'' +
                '}';
    }

    public String getQueryDate() {
        return queryDate;
    }

    public void setQueryDate(String queryDate) {
        this.queryDate = queryDate;
    }

    public ReserveFilterVo(String createUser) {
        this.createUser = createUser;
    }

    public long getRoomId() {
        return roomId;
    }

    public void setRoomId(long roomId) {
        this.roomId = roomId;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getDateNo() {
        return dateNo;
    }

    public void setDateNo(String dateNo) {
        this.dateNo = dateNo;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }
}

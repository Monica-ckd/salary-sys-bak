package com.gxzy.salary.points.model;

import java.util.HashMap;
import java.util.HashSet;

/**
 * 积分项目数据按照（姓名，item）汇总实体类
 */
public class PointSummaryEntity {
    private String eno;
    private String name;
    // 总分
    private int summary;
    //[itemName,score]
    private HashMap<String,Integer> scoreMap;

    public String getEno() {
        return eno;
    }

    public String getName() {
        return name;
    }

    public int getSummary() {
        return summary;
    }

    public HashMap<String, Integer> getScoreMap() {
        return scoreMap;
    }

    public void setEno(String eno) {
        this.eno = eno;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSummary(int summary) {
        this.summary = summary;
    }

    public void setScoreMap(HashMap<String, Integer> scoreMap) {
        this.scoreMap = scoreMap;
    }

    @Override
    public String toString() {
        return "PointSummaryEntity{" +
                "eno='" + eno + '\'' +
                ", name='" + name + '\'' +
                ", summary=" + summary +
                ", scoreMap=" + scoreMap +
                '}';
    }
}

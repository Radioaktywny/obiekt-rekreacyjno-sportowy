package com.ors.model;

/**
 * Created by Marcin on 13.12.2016.
 */
public class ReportObj {

    private Integer dayInfo;

    private Integer monthInfo;

    private Integer yearInfo;

    public ReportObj(Integer dayInfo, Integer monthInfo, Integer yearInfo) {
        this.dayInfo = dayInfo;
        this.monthInfo = monthInfo;
        this.yearInfo = yearInfo;
    }

    public Integer getDayInfo() {
        return dayInfo;
    }

    public Integer getMonthInfo() {
        return monthInfo;
    }

    public Integer getYearInfo() {
        return yearInfo;
    }
}

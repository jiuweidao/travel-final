package com.travel.pojo;

import java.io.Serializable;
import java.util.Date;

public class Spot implements Serializable {
    /**
     * spot.Id
     * @ibatorgenerated 2018-04-30 22:37:42
     */
    private Integer id;

    /**
     * spot.Spot (游玩地)
     * @ibatorgenerated 2018-04-30 22:37:42
     */
    private String spot;

    /**
     * spot.Schedule (游玩方式)
     * @ibatorgenerated 2018-04-30 22:37:42
     */
    private String schedule;

    /**
     * spot.Creatby (创建人)
     * @ibatorgenerated 2018-04-30 22:37:42
     */
    private Integer creatby;

    /**
     * spot.CreatTime (创建时间)
     * @ibatorgenerated 2018-04-30 22:37:42
     */
    private Date creattime;

    /**
     * spot.Flag
     * @ibatorgenerated 2018-04-30 22:37:42
     */
    private String flag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSpot() {
        return spot;
    }

    public void setSpot(String spot) {
        this.spot = spot;
    }

    public String getSchedule() {
        return schedule;
    }

    public void setSchedule(String schedule) {
        this.schedule = schedule;
    }

    public Integer getCreatby() {
        return creatby;
    }

    public void setCreatby(Integer creatby) {
        this.creatby = creatby;
    }

    public Date getCreattime() {
        return creattime;
    }

    public void setCreattime(Date creattime) {
        this.creattime = creattime;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }
}
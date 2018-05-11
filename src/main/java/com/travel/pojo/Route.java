package com.travel.pojo;

import java.io.Serializable;
import java.util.Date;

public class Route implements Serializable {
    /**
     * route.Id
     * @ibatorgenerated 2018-04-30 22:37:42
     */
    private Integer id;

    /**
     * route.Duration (出发地)
     * @ibatorgenerated 2018-04-30 22:37:42
     */
    private String duration;

    /**
     * route.Departure (目的地)
     * @ibatorgenerated 2018-04-30 22:37:42
     */
    private String departure;

    /**
     * route.Transportation (交通方式)
     * @ibatorgenerated 2018-04-30 22:37:42
     */
    private String transportation;

    /**
     * route.Creatby (创建人)
     * @ibatorgenerated 2018-04-30 22:37:42
     */
    private Date creatby;

    /**
     * route.CreatTime (创建时间)
     * @ibatorgenerated 2018-04-30 22:37:42
     */
    private Date creattime;

    /**
     * route.Flag
     * @ibatorgenerated 2018-04-30 22:37:42
     */
    private String flag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getDeparture() {
        return departure;
    }

    public void setDeparture(String departure) {
        this.departure = departure;
    }

    public String getTransportation() {
        return transportation;
    }

    public void setTransportation(String transportation) {
        this.transportation = transportation;
    }

    public Date getCreatby() {
        return creatby;
    }

    public void setCreatby(Date creatby) {
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
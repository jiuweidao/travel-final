package com.travel.pojo;

import java.io.Serializable;
import java.util.Date;

public class Strategies implements Serializable {
    /**
     * strategies.Id
     * @ibatorgenerated 2018-05-17 16:38:51
     */
    private Integer id;

    /**
     * strategies.Site (旅游地)
     * @ibatorgenerated 2018-05-17 16:38:51
     */
    private String site;

    /**
     * strategies.Duration (游玩时长)
     * @ibatorgenerated 2018-05-17 16:38:51
     */
    private String duration;

    /**
     * strategies.Content (内容包含1时间（1-3天）2目的地3.交通方式4游玩方式,以自定义tag隔开)
     * @ibatorgenerated 2018-05-17 16:38:51
     */
    private String content;

    /**
     * strategies.Creatby (创建人)
     * @ibatorgenerated 2018-05-17 16:38:51
     */
    private Integer creatby;

    /**
     * strategies.CreatTime (创建时间)
     * @ibatorgenerated 2018-05-17 16:38:51
     */
    private Date creattime;

    /**
     * strategies.Flag
     * @ibatorgenerated 2018-05-17 16:38:51
     */
    private String flag;

    /**
     * strategies.PicPath
     * @ibatorgenerated 2018-05-17 16:38:51
     */
    private String picpath;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    public String getPicpath() {
        return picpath;
    }

    public void setPicpath(String picpath) {
        this.picpath = picpath;
    }
}
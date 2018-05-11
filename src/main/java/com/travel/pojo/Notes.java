package com.travel.pojo;

import java.io.Serializable;
import java.util.Date;

public class Notes implements Serializable {
    /**
     * notes.Id
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    private Integer id;

    /**
     * notes.PlanId (标题)
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    private String planid;

    /**
     * notes.PresentSite (当前地点)
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    private String presentsite;

    /**
     * notes.PresentTime (当前时间)
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    private Integer presenttime;

    /**
     * notes.Title (标题)
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    private Integer title;

    /**
     * notes.Content (内容)
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    private Integer content;

    /**
     * notes.Creatby (创建人)
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    private Date creatby;

    /**
     * notes.CreatTime (创建时间)
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    private Date creattime;

    /**
     * notes.Flag
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    private String flag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPlanid() {
        return planid;
    }

    public void setPlanid(String planid) {
        this.planid = planid;
    }

    public String getPresentsite() {
        return presentsite;
    }

    public void setPresentsite(String presentsite) {
        this.presentsite = presentsite;
    }

    public Integer getPresenttime() {
        return presenttime;
    }

    public void setPresenttime(Integer presenttime) {
        this.presenttime = presenttime;
    }

    public Integer getTitle() {
        return title;
    }

    public void setTitle(Integer title) {
        this.title = title;
    }

    public Integer getContent() {
        return content;
    }

    public void setContent(Integer content) {
        this.content = content;
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
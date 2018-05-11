package com.travel.pojo;

import java.io.Serializable;
import java.util.Date;

public class Planmembers implements Serializable {
    /**
     * planmembers.Id
     * @ibatorgenerated 2017-07-05 13:41:32
     */
    private Integer id;

    /**
     * planmembers.PlanId
     * @ibatorgenerated 2017-07-05 13:41:32
     */
    private Integer planid;

    /**
     * planmembers.UserId
     * @ibatorgenerated 2017-07-05 13:41:32
     */
    private Integer userid;

    /**
     * planmembers.JoinTime (加入时间)
     * @ibatorgenerated 2017-07-05 13:41:32
     */
    private Date jointime;

    /**
     * planmembers.Score (旅游平均分)
     * @ibatorgenerated 2017-07-05 13:41:32
     */
    private Integer score;

    /**
     * planmembers.Flag
     * @ibatorgenerated 2017-07-05 13:41:32
     */
    private String flag;

    /**
     * planmembers.IsCreater
     * @ibatorgenerated 2017-07-05 13:41:32
     */
    private Byte iscreater;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPlanid() {
        return planid;
    }

    public void setPlanid(Integer planid) {
        this.planid = planid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Date getJointime() {
        return jointime;
    }

    public void setJointime(Date jointime) {
        this.jointime = jointime;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public Byte getIscreater() {
        return iscreater;
    }

    public void setIscreater(Byte iscreater) {
        this.iscreater = iscreater;
    }
}
package com.travel.pojo;

import java.io.Serializable;
import java.util.Date;

public class Planmembers implements Serializable {
    /**
     * planmembers.Id
     * @ibatorgenerated 2018-05-17 20:00:55
     */
    private Integer id;

    /**
     * planmembers.PlanId
     * @ibatorgenerated 2018-05-17 20:00:55
     */
    private Integer planid;

    /**
     * planmembers.UserId
     * @ibatorgenerated 2018-05-17 20:00:55
     */
    private Integer userid;

    /**
     * planmembers.UserName
     * @ibatorgenerated 2018-05-17 20:00:55
     */
    private String username;

    /**
     * planmembers.UserType (是否审核通过，0等待审核，1通过，2未通过,3创建人)
     * @ibatorgenerated 2018-05-17 20:00:55
     */
    private Integer usertype;

    /**
     * planmembers.JoinTime (加入时间)
     * @ibatorgenerated 2018-05-17 20:00:55
     */
    private Date jointime;

    /**
     * planmembers.Score (旅游平均分)
     * @ibatorgenerated 2018-05-17 20:00:55
     */
    private Integer score;

    /**
     * planmembers.IsCreater (申请创建人)
     * @ibatorgenerated 2018-05-17 20:00:55
     */
    private Byte iscreater;

    /**
     * planmembers.Flag
     * @ibatorgenerated 2018-05-17 20:00:55
     */
    private String flag;

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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getUsertype() {
        return usertype;
    }

    public void setUsertype(Integer usertype) {
        this.usertype = usertype;
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

    public Byte getIscreater() {
        return iscreater;
    }

    public void setIscreater(Byte iscreater) {
        this.iscreater = iscreater;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }
}
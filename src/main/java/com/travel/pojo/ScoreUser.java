package com.travel.pojo;

import java.io.Serializable;
import java.util.Date;

public class ScoreUser implements Serializable {
    /**
     * score_user.Id
     * @ibatorgenerated 2018-05-28 09:57:49
     */
    private Integer id;

    /**
     * score_user.UserId
     * @ibatorgenerated 2018-05-28 09:57:49
     */
    private Integer userid;

    /**
     * score_user.Type
     * @ibatorgenerated 2018-05-28 09:57:49
     */
    private Integer type;

    /**
     * score_user.Score
     * @ibatorgenerated 2018-05-28 09:57:49
     */
    private Integer score;

    /**
     * score_user.CreatTime (创建时间)
     * @ibatorgenerated 2018-05-28 09:57:49
     */
    private Date creattime;

    /**
     * score_user.Flag
     * @ibatorgenerated 2018-05-28 09:57:49
     */
    private String flag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
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
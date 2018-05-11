package com.travel.pojo;

import java.io.Serializable;
import java.util.Date;

public class Users implements Serializable {
    /**
     * users.Id
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    private Integer id;

    /**
     * users.UserName
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    private String username;

    /**
     * users.Name
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    private String name;

    /**
     * users.Email
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    private String email;

    /**
     * users.Telemoble
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    private String telemoble;

    /**
     * users.UserType
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    private String usertype;

    /**
     * users.Password
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    private String password;

    /**
     * users.RegTime
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    private Date regtime;

    /**
     * users.LastLoginTime
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    private Date lastlogintime;

    /**
     * users.Score (旅游平均分)
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    private Integer score;

    /**
     * users.CreatTime (创建时间)
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    private Date creattime;

    /**
     * users.Flag
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    private String flag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelemoble() {
        return telemoble;
    }

    public void setTelemoble(String telemoble) {
        this.telemoble = telemoble;
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getRegtime() {
        return regtime;
    }

    public void setRegtime(Date regtime) {
        this.regtime = regtime;
    }

    public Date getLastlogintime() {
        return lastlogintime;
    }

    public void setLastlogintime(Date lastlogintime) {
        this.lastlogintime = lastlogintime;
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
package com.travel.pojo;

import java.io.Serializable;
import java.util.Date;

public class Contacts implements Serializable {
    /**
     * contacts.Id
     * @ibatorgenerated 2018-05-26 09:56:46
     */
    private Integer id;

    /**
     * contacts.UserId
     * @ibatorgenerated 2018-05-26 09:56:46
     */
    private Integer userid;

    /**
     * contacts.contact1
     * @ibatorgenerated 2018-05-26 09:56:46
     */
    private String contact1;

    /**
     * contacts.contact2
     * @ibatorgenerated 2018-05-26 09:56:46
     */
    private String contact2;

    /**
     * contacts.CreatTime (创建时间)
     * @ibatorgenerated 2018-05-26 09:56:46
     */
    private Date creattime;

    /**
     * contacts.Flag
     * @ibatorgenerated 2018-05-26 09:56:46
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

    public String getContact1() {
        return contact1;
    }

    public void setContact1(String contact1) {
        this.contact1 = contact1;
    }

    public String getContact2() {
        return contact2;
    }

    public void setContact2(String contact2) {
        this.contact2 = contact2;
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
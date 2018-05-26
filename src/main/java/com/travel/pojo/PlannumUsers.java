package com.travel.pojo;

import java.io.Serializable;
import java.util.Date;

public class PlannumUsers implements Serializable {
    /**
     * plannum_users.Id
     * @ibatorgenerated 2018-05-24 16:51:31
     */
    private Integer id;

    /**
     * plannum_users.Uid
     * @ibatorgenerated 2018-05-24 16:51:31
     */
    private Integer uid;

    /**
     * plannum_users.TypeFNum
     * @ibatorgenerated 2018-05-24 16:51:31
     */
    private Integer typefnum;

    /**
     * plannum_users.Type0Num
     * @ibatorgenerated 2018-05-24 16:51:31
     */
    private Integer type0num;

    /**
     * plannum_users.Type1Num
     * @ibatorgenerated 2018-05-24 16:51:31
     */
    private Integer type1num;

    /**
     * plannum_users.Type2Num
     * @ibatorgenerated 2018-05-24 16:51:31
     */
    private Integer type2num;

    /**
     * plannum_users.CreatbyName
     * @ibatorgenerated 2018-05-24 16:51:31
     */
    private String creatbyname;

    /**
     * plannum_users.CreatTime (创建时间)
     * @ibatorgenerated 2018-05-24 16:51:31
     */
    private Date creattime;

    /**
     * plannum_users.Flag
     * @ibatorgenerated 2018-05-24 16:51:31
     */
    private String flag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getTypefnum() {
        return typefnum;
    }

    public void setTypefnum(Integer typefnum) {
        this.typefnum = typefnum;
    }

    public Integer getType0num() {
        return type0num;
    }

    public void setType0num(Integer type0num) {
        this.type0num = type0num;
    }

    public Integer getType1num() {
        return type1num;
    }

    public void setType1num(Integer type1num) {
        this.type1num = type1num;
    }

    public Integer getType2num() {
        return type2num;
    }

    public void setType2num(Integer type2num) {
        this.type2num = type2num;
    }

    public String getCreatbyname() {
        return creatbyname;
    }

    public void setCreatbyname(String creatbyname) {
        this.creatbyname = creatbyname;
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
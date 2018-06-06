package com.travel.pojo;

import java.io.Serializable;
import java.util.Date;

public class Reports implements Serializable {
    /**
     * reports.Id
     * @ibatorgenerated 2018-05-29 17:16:40
     */
    private Integer id;

    /**
     * reports.UserId
     * @ibatorgenerated 2018-05-29 17:16:40
     */
    private Integer userid;

    /**
     * reports.Content
     * @ibatorgenerated 2018-05-29 17:16:40
     */
    private String content;

    /**
     * reports.Creatby
     * @ibatorgenerated 2018-05-29 17:16:40
     */
    private Integer creatby;

    /**
     * reports.CreatTime (创建时间)
     * @ibatorgenerated 2018-05-29 17:16:40
     */
    private Date creattime;

    /**
     * reports.Flag
     * @ibatorgenerated 2018-05-29 17:16:40
     */
    private String flag;

    private String username;
    
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
}
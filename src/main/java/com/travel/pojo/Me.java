package com.travel.pojo;

import java.io.Serializable;
import java.util.Date;

public class Me implements Serializable {
    /**
     * users.Id
     * @ibatorgenerated 2018-05-23 11:12:26
     */
    private Integer id;

    /**
     * users.UserName
     * @ibatorgenerated 2018-05-23 11:12:26
     */
    private String username;

    /**
     * users.Name
     * @ibatorgenerated 2018-05-23 11:12:26
     */
    private String name;

    /**
     * users.UserType (U 未审核用户，V实名用户)
     * @ibatorgenerated 2018-05-23 11:12:26
     */
    private String usertype;
    
    /**
     * users.IsOnTravel (是否在出游中)
     * @ibatorgenerated 2018-05-30 11:55:10
     */
    private Integer isontravel;
    
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

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public Integer getIsontravel() {
		return isontravel;
	}

	public void setIsontravel(Integer isontravel) {
		this.isontravel = isontravel;
	}
}
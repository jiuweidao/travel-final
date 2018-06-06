package com.travel.pojo;

import java.io.Serializable;
import java.util.Date;

public class Users implements Serializable {
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
     * users.Email
     * @ibatorgenerated 2018-05-23 11:12:26
     */
    private String email;

    /**
     * users.Telemoble
     * @ibatorgenerated 2018-05-23 11:12:26
     */
    private String telemoble;

    /**
     * users.UserType (U 未审核用户，V实名用户)
     * @ibatorgenerated 2018-05-23 11:12:26
     */
    private String usertype;

    /**
     * users.Password
     * @ibatorgenerated 2018-05-23 11:12:26
     */
    private String password;

    /**
     * users.IdName
     * @ibatorgenerated 2018-05-23 11:12:26
     */
    private String idname;

    /**
     * users.Sex
     * @ibatorgenerated 2018-05-23 11:12:26
     */
    private String sex;

    /**
     * users.IdNum
     * @ibatorgenerated 2018-05-23 11:12:26
     */
    private String idnum;

    /**
     * users.Birth
     * @ibatorgenerated 2018-05-23 11:12:26
     */
    private String birth;

    /**
     * users.Nationlity
     * @ibatorgenerated 2018-05-23 11:12:26
     */
    private String nationlity;

    /**
     * users.Address
     * @ibatorgenerated 2018-05-23 11:12:26
     */
    private String address;

    /**
     * users.RegTime
     * @ibatorgenerated 2018-05-23 11:12:26
     */
    private Date regtime;

    /**
     * users.LastLoginTime
     * @ibatorgenerated 2018-05-23 11:12:26
     */
    private Date lastlogintime;

    /**
     * users.Score (旅游平均分)
     * @ibatorgenerated 2018-05-23 11:12:26
     */
    private Integer score;

    /**
     * users.CreatTime (创建时间)
     * @ibatorgenerated 2018-05-23 11:12:26
     */
    private Date creattime;

    /**
     * users.Flag
     * @ibatorgenerated 2018-05-23 11:12:26
     */
    private String flag;

    /**
     * users.IconPath
     * @ibatorgenerated 2018-05-23 11:12:26
     */
    private String iconpath;

    /**
     * users.IdcardPath
     * @ibatorgenerated 2018-05-23 11:12:26
     */
    private String idcardpath;

    /**
     * users.Ip
     * @ibatorgenerated 2018-05-23 11:12:26
     */
    private String ip;
    
    /**
     * users.sign (个性签名)
     * @ibatorgenerated 2018-05-25 16:12:55
     */
    private String sign;
    
    
    //自定义属性
    /**
     * plannum_users.Type0Num
     * @ibatorgenerated 2018-05-23 16:05:49
     */
    private Integer type0num;

    /**
     * plannum_users.Type1Num
     * @ibatorgenerated 2018-05-23 16:05:49
     */
    private Integer type1num;

    /**
     * plannum_users.Type2Num
     * @ibatorgenerated 2018-05-23 16:05:49
     */
    private Integer type2num;

    private Integer typefnum;
    
    private double successRate;
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

    public String getIdname() {
        return idname;
    }

    public void setIdname(String idname) {
        this.idname = idname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getIdnum() {
        return idnum;
    }

    public void setIdnum(String idnum) {
        this.idnum = idnum;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getNationlity() {
        return nationlity;
    }

    public void setNationlity(String nationlity) {
        this.nationlity = nationlity;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public String getIconpath() {
        return iconpath;
    }

    public void setIconpath(String iconpath) {
        this.iconpath = iconpath;
    }

    public String getIdcardpath() {
        return idcardpath;
    }

    public void setIdcardpath(String idcardpath) {
        this.idcardpath = idcardpath;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
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

	public double getSuccessRate() {
		return successRate;
	}

	public void setSuccessRate(double successRate) {
		this.successRate = successRate;
	}

	public Integer getTypefnum() {
		return typefnum;
	}

	public void setTypefnum(Integer typefnum) {
		this.typefnum = typefnum;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
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

	public Integer getIsontravel() {
		return isontravel;
	}

	public void setIsontravel(Integer isontravel) {
		this.isontravel = isontravel;
	}
}
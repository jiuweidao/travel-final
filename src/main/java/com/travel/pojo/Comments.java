package com.travel.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class Comments implements Serializable, Comparable<Comments> {
	/**
	 * comments.Id
	 * 
	 * @ibatorgenerated 2018-05-05 19:04:36
	 */
	private Integer id;

	/**
	 * comments.PlanId
	 * 
	 * @ibatorgenerated 2018-05-05 19:04:36
	 */
	private Integer planid;

	/**
	 * comments.NoteId
	 * 
	 * @ibatorgenerated 2018-05-05 19:04:36
	 */
	private Integer noteid;

	/**
	 * comments.Type (0,1,2 0评论plan，1评论游记，2，回复)
	 * 
	 * @ibatorgenerated 2018-05-05 19:04:36
	 */
	private Integer type;

	/**
	 * comments.Content
	 * 
	 * @ibatorgenerated 2018-05-05 19:04:36
	 */
	private String content;

	/**
	 * comments.Trageid (回复人)
	 * 
	 * @ibatorgenerated 2018-05-05 19:04:36
	 */
	private Integer trageid;

	/**
	 * comments.Creatby
	 * 
	 * @ibatorgenerated 2018-05-05 19:04:36
	 */
	private Integer creatby;

	/**
	 * comments.CreatbyName
	 * 
	 * @ibatorgenerated 2018-05-05 19:04:36
	 */
	private String creatbyname;

	/**
	 * comments.CreatTime (创建时间)
	 * 
	 * @ibatorgenerated 2018-05-05 19:04:36
	 */
	private Date creattime;

	/**
	 * comments.Flag
	 * 
	 * @ibatorgenerated 2018-05-05 19:04:36
	 */
	private String flag;

	/**
	 * comments.lstNote 回复评论
	 * 
	 * @ibatorgenerated 2018-05-07 19:04:36
	 */
	private List<Comments> lstNote = new LinkedList<>();

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

	public Integer getNoteid() {
		return noteid;
	}

	public void setNoteid(Integer noteid) {
		this.noteid = noteid;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getTrageid() {
		return trageid;
	}

	public void setTrageid(Integer trageid) {
		this.trageid = trageid;
	}

	public Integer getCreatby() {
		return creatby;
	}

	public void setCreatby(Integer creatby) {
		this.creatby = creatby;
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

	@Override
	public int compareTo(Comments o) {
		// TODO Auto-generated method stub
		return this.getCreattime().compareTo(o.getCreattime());
	}

	public List<Comments> getLstNote() {
		return lstNote;
	}

	public void setLstNote(List<Comments> lstNote) {
		this.lstNote = lstNote;
	}

	public void addComment(Comments comments) {
		this.lstNote.add(comments);
	}
}
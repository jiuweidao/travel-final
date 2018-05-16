package com.travel.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Plans implements Serializable {
	/**
	 * plans.Id
	 * 
	 * @ibatorgenerated 2017-07-05 18:44:31
	 */
	private Integer id;

	/**
	 * plans.Title (标题)
	 * 
	 * @ibatorgenerated 2017-07-05 18:44:31
	 */
	private String title;

	/**
	 * plans.Tag (标签a,b,c最多3个)
	 * 
	 * @ibatorgenerated 2017-07-05 18:44:31
	 */
	private String tag;

	/**
	 * plans.Type (待定如穷游)
	 * 
	 * @ibatorgenerated 2017-07-05 18:44:31
	 */
	private Integer type;

	/**
	 * plans.BudgetTop (最高预算)
	 * 
	 * @ibatorgenerated 2017-07-05 18:44:31
	 */
	private Integer budgettop;

	/**
	 * plans.BudgetBottom (最低预算)
	 * 
	 * @ibatorgenerated 2017-07-05 18:44:31
	 */
	private Integer budgetbottom;

	/**
	 * plans.DeparturePlace (出发地点)
	 * 
	 * @ibatorgenerated 2017-07-05 18:44:31
	 */
	private String departureplace;

	/**
	 * plans.Destination (目的地a,b,c)
	 * 
	 * @ibatorgenerated 2017-07-05 18:44:31
	 */
	private String destination;

	/**
	 * plans.DepartureTime (出发时间)
	 * 
	 * @ibatorgenerated 2017-07-05 18:44:31
	 */
	private Date departuretime;

	/**
	 * plans.EndTime (结束时间)
	 * 
	 * @ibatorgenerated 2017-07-05 18:44:31
	 */
	private Date endtime;

	/**
	 * plans.ExpectNum (预期团队人数)
	 * 
	 * @ibatorgenerated 2017-07-05 18:44:31
	 */
	private Integer expectnum;

	/**
	 * plans.PresentNum (当前人数)
	 * 
	 * @ibatorgenerated 2017-07-05 18:44:31
	 */
	private Integer presentnum;

	/**
	 * plans.Detail (详细说明)
	 * 
	 * @ibatorgenerated 2017-07-05 18:44:31
	 */
	private String detail;

	/**
	 * plans.Creatby (创建人)
	 * 
	 * @ibatorgenerated 2017-07-05 18:44:31
	 */
	private Integer creatby;

	/**
	 * plans.CreatTime (创建时间)
	 * 
	 * @ibatorgenerated 2017-07-05 18:44:31
	 */
	private Date creattime;

	/**
	 * plans.score (出游感受评分)
	 * 
	 * @ibatorgenerated 2017-07-05 18:44:31
	 */
	private double score;

	/**
	 * plans.CommentCount (评论数)
	 * 
	 * @ibatorgenerated 2017-07-05 18:44:31
	 */
	private Integer commentcount;

	/**
	 * plans.NoteCount (游记数)
	 * 
	 * @ibatorgenerated 2017-07-05 18:44:31
	 */
	private Integer notecount;

	/**
	 * plans.Flag
	 * 
	 * @ibatorgenerated 2017-07-05 18:44:31
	 */
	private String flag;
	
    /**
     * plans.PicPath (图片路径)
     * @ibatorgenerated 2018-05-14 21:59:47
     */
    private String picpath;

	private Boolean ismember;

	private String strdeparturetime;

	private String strendtime;

	List<Comments> lstAllComments;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getBudgettop() {
		return budgettop;
	}

	public void setBudgettop(Integer budgettop) {
		this.budgettop = budgettop;
	}

	public Integer getBudgetbottom() {
		return budgetbottom;
	}

	public void setBudgetbottom(Integer budgetbottom) {
		this.budgetbottom = budgetbottom;
	}

	public String getDepartureplace() {
		return departureplace;
	}

	public void setDepartureplace(String departureplace) {
		this.departureplace = departureplace;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public Date getDeparturetime() {
		return departuretime;
	}

	public void setDeparturetime(Date departuretime) {
		this.departuretime = departuretime;
	}

	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	public Integer getExpectnum() {
		return expectnum;
	}

	public void setExpectnum(Integer expectnum) {
		this.expectnum = expectnum;
	}

	public Integer getPresentnum() {
		return presentnum;
	}

	public void setPresentnum(Integer presentnum) {
		this.presentnum = presentnum;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
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

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public Integer getCommentcount() {
		return commentcount;
	}

	public void setCommentcount(Integer commentcount) {
		this.commentcount = commentcount;
	}

	public Integer getNotecount() {
		return notecount;
	}

	public void setNotecount(Integer notecount) {
		this.notecount = notecount;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	
    public String getPicpath() {
        return picpath;
    }

    public void setPicpath(String picpath) {
        this.picpath = picpath;
    }
    
	public Boolean getIsmember() {
		return ismember;
	}

	public void setIsmember(Boolean ismember) {
		this.ismember = ismember;
	}

	public String getStrdeparturetime() {
		return strdeparturetime;
	}

	public void setStrdeparturetime(String strdeparturetime) {
		this.strdeparturetime = strdeparturetime;
	}

	public String getStrendtime() {
		return strendtime;
	}

	public void setStrendtime(String strendtime) {
		this.strendtime = strendtime;
	}

	public List<Comments> getLstAllComments() {
		return lstAllComments;
	}

	public void setLstAllComments(List<Comments> lstAllComments) {
		this.lstAllComments = lstAllComments;
	}

}
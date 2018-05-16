package com.travel.pojo;

import java.io.Serializable;

public class CommentsSolrSearch implements Serializable {
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

}
package com.travel.service;

import com.travel.pojo.Comments;

/**
 * 
 * 
 * @author
 * @since 2017
 */
public interface CommentsService {

	int insert(Comments comments);

	int getPlanCount(int planId);
	
	/**
	 * 删除一个note
	 * @param id
	 * @return
	 */
	int deleteNote(int id);
	
	/**
	 * 删除一条Comment 以及所有的note
	 * @param id
	 * @return
	 */
	int deleteComment(int id);
	/*
	 * List<Plans> selectAllPlansByUid(String uid);
	 * 
	 * Plans selectPlansById(int id);
	 * 
	 * int update(Plans plans);
	 * 
	 * int delete(int id);
	 */
}

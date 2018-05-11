package com.travel.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.travel.dao.CommentsMapper;
import com.travel.pojo.Comments;

/**
 * 
 * 
 * @author
 * @since 2017
 */
@Service
public class CommentsServiceImpl implements CommentsService {

	@Resource
	private CommentsMapper commentsMapper;

	@Override
	public int insert(Comments comments) {

		return commentsMapper.insertSelective(comments);

	}

	/*
	 * @Override public List<Plans> selectAllPlansByUid(String uid) { return
	 * plansMapper.selectAllPlansByUid(uid); }
	 * 
	 * @Override public Plans selectPlansById(int id) {
	 * 
	 * return plansMapper.selectByPrimaryKey(id); }
	 * 
	 * @Override public int update(Plans plans) {
	 * 
	 * return plansMapper.updateByPrimaryKeySelective(plans); }
	 * 
	 * @Override public int delete(int id) {
	 * 
	 * return plansMapper.deleteByPrimaryKey(id); }
	 */

}

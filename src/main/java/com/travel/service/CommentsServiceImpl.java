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

	@Override
	public int getPlanCount(int planId) {
		// TODO Auto-generated method stub
		return commentsMapper.getPlanCount(planId);
	}

	@Override
	public int deleteNote(int id) {
		// TODO Auto-generated method stub
		return commentsMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int deleteComment(int id) {
		// TODO Auto-generated method stub
		return commentsMapper.deleteComment(id);
	}

}

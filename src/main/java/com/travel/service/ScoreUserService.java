package com.travel.service;

import com.travel.pojo.ScoreUser;


/**
 * 
 * 
 * @author 
 * @since  2017
 */
public interface ScoreUserService {
	

	
	int insert(ScoreUser scoreUser);
	
	public int addScore(int uid,int score,int type); 
	
	Integer selectTotalByUid(int uid);
}

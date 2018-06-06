package com.travel.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.travel.dao.ContactsMapper;
import com.travel.dao.ScoreUserMapper;
import com.travel.dao.UsersMapper;
import com.travel.pojo.Contacts;
import com.travel.pojo.PlannumUsers;
import com.travel.pojo.ScoreUser;
import com.travel.pojo.Users;


/**
 * 
 * 
 * @author
 * @since  2017
 */
@Service
public class ScoreUserServiceImpl implements ScoreUserService{
	

	@Resource
	private ScoreUserMapper scoreUserMapper;
	@Override
	public int insert(ScoreUser scoreUser) {
		return scoreUserMapper.insert(scoreUser);
	}
	@Override
	public int addScore(int uid, int score, int type) {
		ScoreUser scoreUser = new ScoreUser();
		scoreUser.setUserid(uid);
		scoreUser.setScore(score);
		scoreUser.setType(type);
		scoreUser.setCreattime(new Date());
		scoreUser.setFlag("M");
		return scoreUserMapper.insert(scoreUser);
	}
	@Override
	public Integer selectTotalByUid(int uid) {
		// TODO Auto-generated method stub
		return scoreUserMapper.selectTotalByUid(uid);
	}

	


}

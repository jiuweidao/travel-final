package com.travel.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.travel.dao.UsersMapper;
import com.travel.pojo.Users;


/**
 * 
 * 
 * @author
 * @since  2017
 */
@Service
public class UserServiceImpl implements UserService{
	
	@Resource
	private UsersMapper usersMapper;

	public Users selectByPrimaryKey(Integer id) {
		
		return usersMapper.selectByPrimaryKey(id);
	}

	public Users selectByAll(String key) {
		Users  users =	usersMapper.selectByAll(key);
		return users;
	}


	public Integer selectByTelemoble(String key) {
		return usersMapper.selectByTelemoble(key);
	}

	public Integer selectByEmail(String key) {
		return usersMapper.selectByEmail(key);
	}
	
	
	public Integer selectByUserName(String key) {
		return usersMapper.selectByEmail(key);
	}
	
	
	public int insert(Users users) {
		Users filledusers = fillUser(users);
		return usersMapper.insertSelective(users);
	}
	
	
	
	
	public Users fillUser(Users users){
		
		users.setPassword(DecriptUtil.MD5(users.getPassword()));
		users.setFlag("M");
		users.setUsertype("U");
		users.setCreattime(new Date());
		users.setRegtime(new Date());
		users.setScore(0);
		
		return users;
	}

	@Override
	public int updateUser(Users users) {
		// TODO Auto-generated method stub
		return usersMapper.updateByPrimaryKeySelective(users);
	}
	


}

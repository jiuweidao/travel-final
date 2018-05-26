package com.travel.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.travel.pojo.Users;


/**
 * 
 * 
 * @author 
 * @since  2017
 */
public interface UserService {
	
	Users selectByPrimaryKey(Integer id);
	
	Users selectByAll(String key);
	
	Integer selectByTelemoble(String key);
	
	Integer selectByEmail(String key);
	
	Integer selectByUserName(String key);
	
	int insert(Users record);
	
	int updateUser(Users users);
	
}

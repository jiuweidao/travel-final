package com.travel.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.travel.pojo.PlannumUsers;
import com.travel.pojo.Users;


/**
 * 
 * 
 * @author 
 * @since  2017
 */
public interface PlannumUserService {
	
	List<PlannumUsers> selectUserTop(int topNUm);
	
	PlannumUsers selectByUid(int uid);
	
	int update(PlannumUsers plannumUsers);
	
	int insert(PlannumUsers plannumUsers);
	
}

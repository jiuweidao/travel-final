package com.travel.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.travel.pojo.Plans;
import com.travel.pojo.Users;


/**
 * 
 * 
 * @author 
 * @since  2017
 */
public interface PlansService {
	
	
	int insert(Plans plans,String username);
	
	List<Plans> selectAllPlansByUid(String uid);
	
	Plans selectPlansById(int id);
	
	int update(Plans plans);
	
	int delete(int id);
	
	int selectCount(int uid ,int type);
}

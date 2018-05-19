package com.travel.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.travel.pojo.Planmembers;
import com.travel.pojo.Plans;
import com.travel.pojo.Users;


/**
 * 
 * 
 * @author 
 * @since  2017
 */
public interface PlanmembersService {
	
	
	int insert(Planmembers planmembers);
	
	int update(Planmembers planmembers);
	
	 int selectIdByUidAndPid(String uid,String pid);
	 
	 int selectCountByPid (String pid);
	 
	 List<Integer>	selectIdByUid(String uid);
	 
	 List<Planmembers> selectUserIdByPid(String pid);
	 
	 int deleteByPid(String pid);
}

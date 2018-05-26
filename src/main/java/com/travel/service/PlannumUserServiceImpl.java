package com.travel.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.travel.dao.PlannumUsersMapper;
import com.travel.dao.UsersMapper;
import com.travel.pojo.PlannumUsers;
import com.travel.pojo.Users;


/**
 * 
 * 
 * @author
 * @since  2017
 */
@Service
public class PlannumUserServiceImpl implements PlannumUserService{
	
	@Resource
	private PlannumUsersMapper plannumUsersMapper;

	@Override
	public List<PlannumUsers> selectUserTop(int topNum) {
		return plannumUsersMapper.selectUserTop(topNum);
	}

	@Override
	public int update(PlannumUsers plannumUsers) {
		// TODO Auto-generated method stub
		return plannumUsersMapper.updateByPrimaryKeySelective(plannumUsers);
	}

	@Override
	public int insert(PlannumUsers plannumUsers) {
		// TODO Auto-generated method stub
		return plannumUsersMapper.insertSelective(plannumUsers);
	}

	@Override
	public PlannumUsers selectByUid(int uid) {
		// TODO Auto-generated method stub
		return plannumUsersMapper.selectByUid(uid);
	}

	


}

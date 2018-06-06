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
import com.travel.dao.UsersMapper;
import com.travel.pojo.Contacts;
import com.travel.pojo.PlannumUsers;
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
	@Resource
	private ContactsMapper contactsMapper;
	@Resource
	private PlannumUserService plannumUserService;

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
		
		if (usersMapper.insertSelective(filledusers)<=0) {
			return 0;
		}
		
		PlannumUsers plannumUsers = new  PlannumUsers();
		plannumUsers.setCreattime(users.getCreattime());
		plannumUsers.setFlag("M");
		plannumUsers.setType0num(0);
		plannumUsers.setType1num(0);
		plannumUsers.setType2num(0);
		plannumUsers.setTypefnum(0);
		plannumUsers.setUid(users.getId());
		if (plannumUserService.insert(plannumUsers)<=0) {
			return 0;
		}
		
		Contacts contacts = new Contacts();
		contacts.setUserid(users.getId());
		contacts.setCreattime(new Date());
		contacts.setFlag("M");
		contactsMapper.insertSelective(contacts);
		return 1;
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

	@Override
	public int updateIsOntravelByPid(int isontravel, int planid) {
		// TODO Auto-generated method stub
		return updateIsOntravelByPid(isontravel, planid);
	}

	


}

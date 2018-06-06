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
public class ContactsServiceImpl implements ContactsService{
	
	@Resource
	private ContactsMapper contactsMapper;
	

	@Override
	public int insert(Contacts contacts) {
		// TODO Auto-generated method stub
		return contactsMapper.insertSelective(contacts);
	}

	@Override
	public int updateUserByUid(Contacts contacts) {
		// TODO Auto-generated method stub
		return contactsMapper.updateByUidSelective(contacts);
	}

	@Override
	public Contacts selectByUid(Integer id) {
		// TODO Auto-generated method stub
		return contactsMapper.selectByUid(id);
	}




	


}

package com.travel.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.travel.pojo.Contacts;
import com.travel.pojo.Users;


/**
 * 
 * 
 * @author 
 * @since  2017
 */
public interface ContactsService {
	
	
	int insert(Contacts contacts) ;
	
	int updateUserByUid(Contacts contacts);
	
}

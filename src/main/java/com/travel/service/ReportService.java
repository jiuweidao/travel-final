package com.travel.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.travel.pojo.Plans;
import com.travel.pojo.Reports;
import com.travel.pojo.Strategies;
import com.travel.pojo.Users;


/**
 * 
 * 
 * @author 
 * @since  2017
 */
public interface ReportService {
	
	
	int insert(Reports reports);
	
	int update(Reports reports);
	
	int delete(int id);
	
	 List<Reports> selectByPage(int id, int page,int pageNum);
	 
	 int selectCount(int id);
	 
	 Reports selectById(int id);
}

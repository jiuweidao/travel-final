package com.travel.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.travel.pojo.Planmembers;


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
	 
	 int updateByPidUid(Planmembers planmembers);
	 
	 int updateByPid(int isontravel,int  planid); 
	 
	 int deleteUnOnTravel(int planid);
	 
	 int deleteById(int id);
	 
	 List<Integer>  selectUidByPid(int  planid);
	 
	 Planmembers selectById(int id);
}

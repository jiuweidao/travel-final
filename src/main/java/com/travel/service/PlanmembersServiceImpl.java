package com.travel.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.travel.dao.PlanmembersMapper;
import com.travel.pojo.Planmembers;


/**
 * 
 * 
 * @author
 * @since  2017
 */
@Service
public class PlanmembersServiceImpl implements PlanmembersService{
	
	

	@Resource
	private PlanmembersMapper planmembersMapper;

	@Override
	public int insert(Planmembers planmembers) {
		// TODO Auto-generated method stub
		return planmembersMapper.insertSelective(planmembers);
	}

	@Override
	public int update(Planmembers planmembers) {
		// TODO Auto-generated method stub
		return planmembersMapper.updateByPrimaryKeySelective(planmembers);
	}

	@Override
	public int selectIdByUidAndPid(String uid, String pid) {
		// TODO Auto-generated method stub
		try {
			return planmembersMapper.selectIdByUidAndPid(uid, pid);
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public int selectCountByPid(String pid) {
		// TODO Auto-generated method stub
		return planmembersMapper.selectCountByPid(pid);
	}

	@Override
	public List<Integer> selectIdByUid(String uid) {
		
		return planmembersMapper.selectIdByUid(uid);
	}

	@Override
	public int deleteByPid(String pid) {
		return planmembersMapper.deleteByPid(pid);
	}

	@Override
	public List<Planmembers> selectUserIdByPid(String pid) {
		// TODO Auto-generated method stub
		return planmembersMapper.selectUserIdByPid(pid);
	}
	


}

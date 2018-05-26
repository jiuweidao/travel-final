package com.travel.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.travel.dao.PlanmembersMapper;
import com.travel.dao.PlannumUsersMapper;
import com.travel.dao.PlansMapper;
import com.travel.pojo.Planmembers;
import com.travel.pojo.PlannumUsers;
import com.travel.pojo.Plans;
import com.travel.pojo.Users;

/**
 * 
 * 
 * @author
 * @since 2017
 */
@Service
public class PlansServiceImpl implements PlansService {

	@Resource
	private PlansMapper plansMapper;

	@Resource
	private PlanmembersMapper planmembersMapper;
	
	@Resource
	private PlannumUsersMapper plannumUsersMapper;
	
	@Override
	public int insert(Plans plans,String username) {

		if (plansMapper.insertSelective(plans) <= 0) {
			return 0;
		}
		
		Planmembers planmembers = new Planmembers();
		planmembers.setPlanid(plans.getId());
		planmembers.setUserid(plans.getCreatby());
		planmembers.setIscreater((byte) 1);
		planmembers.setJointime(plans.getCreattime());
		planmembers.setUsername(username);
		planmembers.setUsertype(3);
		planmembers.setFlag("M");
		if(planmembersMapper.insertSelective(planmembers)<=0) {
			return 0;
		}

		PlannumUsers plannumUsers = new PlannumUsers();
		plannumUsers.setUid(plans.getCreatby());
		int num = selectCount(plans.getCreatby(),0);
		plannumUsers.setType0num(num);
		num = selectCount(plans.getCreatby(), 1);
		plannumUsers.setType1num(num);
		num = selectCount(plans.getCreatby(), 2);
		plannumUsers.setType2num(num);
		num = selectCount(plans.getCreatby(), 3);
		plannumUsers.setTypefnum(num);
		if(plannumUsersMapper.updateByUidSelective(plannumUsers)<=0) {
			return 0;
		}
		
		return 1;
		
	}

	@Override
	public List<Plans> selectAllPlansByUid(String uid) {
		return plansMapper.selectAllPlansByUid(uid);
	}

	@Override
	public Plans selectPlansById(int id) {

		return plansMapper.selectByPrimaryKey(id);
	}

	@Override
	public int update(Plans plans) {

		return plansMapper.updateByPrimaryKeySelective(plans);
	}

	@Override
	public int delete(int id) {

		Plans plans =new Plans();
		plans.setId(id);
		plans.setType(3);
		if(plansMapper.updateByPrimaryKeySelective(plans)<=0) {
			return 0;
		}
		
		return 1;
	}

	@Override
	public int selectCount(int uid, int type) {
		return plansMapper.selectCount(uid, type);
	}

}

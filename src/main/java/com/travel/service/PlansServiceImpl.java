package com.travel.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.travel.dao.PlanmembersMapper;
import com.travel.dao.PlansMapper;
import com.travel.pojo.Planmembers;
import com.travel.pojo.Plans;

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

	@Override
	public int insert(Plans plans) {

		if (plansMapper.insertSelective(plans) > 0) {
			Planmembers planmembers = new Planmembers();
			planmembers.setPlanid(plans.getId());
			planmembers.setUserid(plans.getCreatby());
			planmembers.setIscreater((byte) 1);
			planmembers.setJointime(plans.getCreattime());
			planmembers.setFlag("M");
			return planmembersMapper.insertSelective(planmembers);
		}
		return 0;

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

		return plansMapper.deleteByPrimaryKey(id);
	}

}

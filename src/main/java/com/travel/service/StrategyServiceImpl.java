package com.travel.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.travel.dao.PlanmembersMapper;
import com.travel.dao.PlansMapper;
import com.travel.dao.StrategiesMapper;
import com.travel.pojo.Planmembers;
import com.travel.pojo.Plans;
import com.travel.pojo.Strategies;

/**
 * 
 * 
 * @author
 * @since 2017
 */
@Service
public class StrategyServiceImpl implements StrategyService {

	@Resource
	private StrategiesMapper strategiesMapper;

	@Override
	public int insert(Strategies strategies) {

		return strategiesMapper.insertSelective(strategies);
		

	}



	@Override
	public int update(Plans plans) {

		return 0;
	}

	@Override
	public int delete(int id) {

		return 0;
	}

}

package com.travel.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.travel.dao.PlanmembersMapper;
import com.travel.dao.PlansMapper;
import com.travel.dao.ReportsMapper;
import com.travel.dao.StrategiesMapper;
import com.travel.pojo.Planmembers;
import com.travel.pojo.Plans;
import com.travel.pojo.Reports;
import com.travel.pojo.Strategies;

/**
 * 
 * 
 * @author
 * @since 2017
 */
@Service
public class ReportServiceImpl implements ReportService {

	@Resource
	private ReportsMapper reportsMapper;

	@Override
	public int insert(Reports reports) {

		return reportsMapper.insertSelective(reports);
		

	}



	@Override
	public int update(Reports reports) {

		return reportsMapper.updateByPrimaryKeySelective(reports);
	}

	@Override
	public int delete(int id) {

		return 0;
	}



	@Override
	public List<Reports> selectByPage(int id,int page, int pageNum) {
		// TODO Auto-generated method stub
		return reportsMapper.selectByPage(id ,page, pageNum);
	}



	@Override
	public int selectCount(int id) {
		// TODO Auto-generated method stub
		return reportsMapper.selectCount(id);
	}



	@Override
	public Reports selectById(int id) {
		// TODO Auto-generated method stub
		return reportsMapper.selectByPrimaryKey(id);
	}

}

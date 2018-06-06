package com.travel.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.support.json.JSONUtils;
import com.travel.pojo.Me;
import com.travel.pojo.Plans;
import com.travel.pojo.ReportPage;
import com.travel.pojo.Reports;
import com.travel.pojo.Strategies;
import com.travel.pojo.Users;
import com.travel.service.PlanmembersService;
import com.travel.service.PlansService;
import com.travel.service.ReportService;
import com.travel.service.ScoreUserService;
import com.travel.service.StrategyService;
import com.travel.service.UserService;
import com.travel.solr.PlansSolr;
import com.travel.solr.StrategySolr;

/**
 * Controller
 * 
 * @author firepig
 * @since 2017
 */

@Controller
public class ReportController {
	@Resource
	private StrategyService strategyService;
	@Resource
	private UserController userController;
	@Resource
	private ScoreUserService scoreUserService;
	@Resource
	private UserService userService;
	@Resource
	private ReportService reportService;
	private StrategySolr strategySolr = new StrategySolr();
	protected Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping("/myReport")
	public String myReport(HttpServletRequest request) throws Exception {

		String pageString =request.getParameter("page");
		int  page=0;
		if (pageString!=null) {
			page= Integer.parseInt(pageString);
		}
		
		Me me = userController.getMe(request);
		if (me != null) {
			request.setAttribute("me", me);
		}
		List<Reports> lstReports=reportService.selectByPage(me.getId(),page, 20);
		int count = reportService.selectCount(me.getId());
		for (Reports reports : lstReports) {
			Users users = userService.selectByPrimaryKey(reports.getUserid());
			reports.setUsername(users.getName());
		}
		ReportPage reportPage= new ReportPage();
		reportPage.setPage(page);
		reportPage.setLstReports(lstReports);
		reportPage.setCount(count);
		request.setAttribute("reportPage", reportPage);
		return "myreports";
	}
	
	@RequestMapping("/createReport")
	public String createReport(HttpServletRequest request) throws Exception {

		String id = request.getParameter("id");
		Users users = userService.selectByPrimaryKey(Integer.parseInt(id));
		
		Me me = userController.getMe(request);
		if (me != null) {
			request.setAttribute("me", me);
		}
		request.setAttribute("id", id);
		request.setAttribute("name", users.getName());
		return "createreport";
	}
	
	@RequestMapping("/addReport")
	@ResponseBody
	public String add(HttpServletRequest request) throws Exception {

		HashMap<String, String> result = new HashMap<String, String>();
		Me me = userController.getMe(request);
		
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		Reports reports = new Reports();
		reports.setUserid(Integer.parseInt(id));
		reports.setContent(content);
		reports.setCreatby(me.getId());
		reports.setCreattime(new Date());
		reports.setFlag("M");
		
		if(reportService.insert(reports)<=0){
			result.put("success", "1");
			return JSONObject.fromObject(result).toString();
		}
		
		result.put("success", "1");
		return JSONObject.fromObject(result).toString();
	}

	
	
	
	@RequestMapping("/modifyReport")
	public String modifyReport(HttpServletRequest request) throws Exception {

		String id = request.getParameter("id");
		
		Me me = userController.getMe(request);
		if (me != null) {
			request.setAttribute("me", me);
		}
		
		Reports reports = reportService.selectById(Integer.parseInt(id));
		Users users = userService.selectByPrimaryKey(reports.getUserid());
		reports.setUsername(users.getName());
		
		request.setAttribute("reports", reports);
		return "modifyreport";
	}
	
	@RequestMapping("/doModifyReport")
	@ResponseBody
	public String doModifyReport(HttpServletRequest request) throws Exception {

		HashMap<String, String> result = new HashMap<String, String>();
		Me me = userController.getMe(request);
		
		String id = request.getParameter("id");
		String uid = request.getParameter("uid");
		String content = request.getParameter("content");
		Reports reports = new Reports();
		reports.setId(Integer.parseInt(id));
		reports.setUserid(Integer.parseInt(uid));
		reports.setContent(content);
		
		if(reportService.update(reports)<=0){
			result.put("success", "1");
			return JSONObject.fromObject(result).toString();
		}
		
		result.put("success", "1");
		return JSONObject.fromObject(result).toString();
	}
}

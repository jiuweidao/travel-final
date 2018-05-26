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

import com.travel.pojo.Me;
import com.travel.pojo.Plans;
import com.travel.pojo.Strategies;
import com.travel.pojo.Users;
import com.travel.service.PlanmembersService;
import com.travel.service.PlansService;
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
public class StrategieController {
	@Resource
	private StrategyService strategyService;
	@Resource
	private UserController userController;
	
	private StrategySolr strategySolr = new StrategySolr();
	protected Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping("/createStrategy")
	public String createStrategy(HttpServletRequest request) throws Exception {

		Me me = userController.getMe(request);
		if (me != null) {
			request.setAttribute("me", me);
		}
		
		return "createStrategy";
	}
	
	@RequestMapping("/addStrategy")
	@ResponseBody
	public String add(HttpServletRequest request) throws Exception {

		HashMap<String, String> result = new HashMap<String, String>();
		Strategies strategies=fillStrategies(request,null);
		
		if(strategyService.insert(strategies)>0){
			strategySolr.insert(strategies);
		}
		result.put("success", "1");
		return JSONObject.fromObject(result).toString();
	}

	public Strategies fillStrategies(HttpServletRequest request,Strategies strategies) {
		
		Users users = (Users) request.getSession().getAttribute("user");

		String site = request.getParameter("site");
		String duration = request.getParameter("duration");
		String picpath = request.getParameter("picpath");
		String content = request.getParameter("content");

		if (strategies == null) {
			strategies = new Strategies();
			strategies.setFlag("P");
			strategies.setCreattime(new Date());
			strategies.setCreatby(users.getId());
		} 
		
		strategies.setSite(site);
		strategies.setDuration(duration);
		strategies.setContent(content);
		strategies.setPicpath(picpath);

		return strategies;
	}
}

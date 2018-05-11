package com.travel.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.pojo.Plans;
import com.travel.pojo.Users;
import com.travel.service.PlanmembersService;
import com.travel.service.PlansService;
import com.travel.service.UserService;
import com.travel.solr.PlansSolr;

/**
 * Controller
 * 
 * @author firepig
 * @since 2017
 */

@Controller
public class StrategieController {
	@Resource
	private UserService userService;
	@Resource
	private PlansService plansService;
	@Resource
	private PlanmembersService planmembersService;

	private PlansSolr plansSolr = new PlansSolr();
	protected Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping("/addStrategie")
	// 目录http://localhost:8080/shiroTset/index
	public String allPlans(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		Users users = (Users) request.getSession().getAttribute("user");

		List<Plans> lstPlans = plansSolr.selectAll(null);

		if (users != null) {
			String userName = users.getName();
			if (userName == null) {
				userName = users.getUsername();
			}
			request.setAttribute("username", userName);

		}
		return "createStrategy";
	}

}

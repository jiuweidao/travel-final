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
import com.travel.pojo.ScoreUser;
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
public class ScoreController {
	@Resource
	private StrategyService strategyService;
	@Resource
	private UserController userController;

	
	private StrategySolr strategySolr = new StrategySolr();
	protected Logger logger = LoggerFactory.getLogger(getClass());

}

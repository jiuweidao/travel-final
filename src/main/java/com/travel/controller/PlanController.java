package com.travel.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.httpclient.util.DateUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.travel.pojo.AllPlanmembers;
import com.travel.pojo.Comments;
import com.travel.pojo.PlanPage;
import com.travel.pojo.Planmembers;
import com.travel.pojo.Plans;
import com.travel.pojo.Users;
import com.travel.service.PlanmembersService;
import com.travel.service.PlansService;
import com.travel.service.UserService;
import com.travel.solr.CommentsSolr;
import com.travel.solr.PlansSolr;

/**
 * Controller
 * 
 * @author firepig
 * @since 2017
 */

@Controller
public class PlanController {
	@Resource
	private UserService userService;
	@Resource
	private PlansService plansService;
	@Resource
	private PlanmembersService planmembersService;
	@Resource
	private UserController userController;
	
	private PlansSolr plansSolr = new PlansSolr();
	private CommentsSolr commentsSolr = new CommentsSolr();
	protected Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping("/allPlans")
	public String allPlans(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		//加载用户信息
		Users users = userController.getUsers(request);
		if (users != null) {
			request.setAttribute("username", users.getName());
		}
		
		
		String type = request.getParameter("type");
		String page = request.getParameter("page");
		
		//加载plan
		PlanPage planPage = plansSolr.searchPlan(0,type,Integer.parseInt(page));
		planPage.setType(type);
		request.setAttribute("planPage", planPage);
		return "allplans";
	}

	@RequestMapping("/myplans")
	public String myplans(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		String type = request.getParameter("type");
		String page = request.getParameter("page");
		
		//加载用户信息
		Users users = userController.getUsers(request);
		if (users != null) {
			request.setAttribute("username", users.getName());
		}
		
		//加载plan
		PlanPage planPage = plansSolr.searchPlan(users.getId(),type,Integer.parseInt(page));
		planPage.setType(type);
		request.setAttribute("planPage", planPage);
		return "myplans";
	}
	
	@RequestMapping("/myapplans")
	public String myapplans(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		Users users = userController.getUsers(request);
		if (users != null) {
			request.setAttribute("username", users.getName());
		}
		
		List<Plans> lstPlans = new LinkedList<Plans>();
		List<Integer> lstplansid = planmembersService.selectIdByUid(users
				.getId().toString());
		for (Integer id : lstplansid) {
			lstPlans.addAll(plansSolr.searchById(id.toString()));
		}
		request.setAttribute("lstPlans", lstPlans);
		return "myapplans";
	}

	@RequestMapping("/createPlan")
	public String createPlan(HttpServletRequest request,
			HttpServletResponse response, Model model) {

		Users users = userController.getUsers(request);
		if (users != null) {
			request.setAttribute("username", users.getName());
		}

		return "createplan";
	}

	/*
	 * 添加邀约
	 */

	@RequestMapping(value = "/addPlan")
	@ResponseBody
	public String registerByM(HttpServletResponse response,
			HttpServletRequest request) throws Exception {

		HashMap<String, String> result = new HashMap<String, String>();
		Plans plans = fillPlan(request, null);
		
		Users users = userController.getUsers(request);
		
		if (plansService.insert(plans,users.getName()) > 0) {
			plansSolr.insert(plans);
		}
		result.put("success", "1");

		return JSONObject.fromObject(result).toString();

	}

	@RequestMapping(value = "/deletePlan")
	@ResponseBody
	public String deletePlan(HttpServletResponse response,
			HttpServletRequest request) throws Exception {

		HashMap<String, String> result = new HashMap<String, String>();

		String pid = request.getParameter("id");
		plansService.delete(Integer.parseInt(pid));
		planmembersService.deleteByPid(pid);
		plansSolr.deleteById(pid);

		result.put("success", "1");

		return "redirect:myplans";

	}

	@RequestMapping(value = "/leave")
	public String leave(HttpServletResponse response, HttpServletRequest request)
			throws Exception {

		HashMap<String, String> result = new HashMap<String, String>();

		String id = request.getParameter("id");
		Plans plans = plansSolr.searchById(id).get(0);
		plans.setType(1);
		plansService.update(plans);
		plansSolr.insert(plans);

		result.put("success", "1");

		return "redirect:myplans";

	}

	@RequestMapping("/plandetail")
	public String showMymessage(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		//加载参数
		String pid = request.getParameter("id");
		
		//获取用户信息和plan
		Users users = userController.getUsers(request);

		Plans plans = plansSolr.searchById(pid).get(0);
		if (users != null) {
			request.setAttribute("username", users.getName());
			request.setAttribute("uid", users.getId());
			int id =planmembersService.selectIdByUidAndPid(users.getId().toString(), plans.getId().toString())  ;
			if (id> 0) {
				plans.setIsmember(true);
			}
		}

		//获取邀约评论
		List<Comments> lstAllComments = commentsSolr.searchCommentByPlanId(pid,1);
		for (Comments comment : lstAllComments) {
			List<Comments> lstAllNotes = commentsSolr.searchNoteByPlanId(pid,comment.getId());
			comment.addComment(lstAllNotes);
		}

		//获取邀约成员
		AllPlanmembers allPlanmembers = new AllPlanmembers();
		List<Planmembers> lstPlanmembers = planmembersService.selectUserIdByPid(pid);// new LinkedList<>();
	
		for (Planmembers planmembers : lstPlanmembers) {
			switch (planmembers.getUsertype()) {
			case 3:
				allPlanmembers.setCreater(planmembers);
				break;
			case 0:
				allPlanmembers.addWaitVerifiedPlanmembers(planmembers);
				break;
			case 1:
				allPlanmembers.addVerifiedPlanmembers(planmembers);
				break;
			case 2:
				allPlanmembers.addUnVerifiedPlanmembers(planmembers);
				break;
			default:
				break;
			}
		}
		
		//加载数据
		request.setAttribute("lstComments", lstAllComments);
		request.setAttribute("allPlanmembers", allPlanmembers);
		request.setAttribute("plans", plans);

		return "plandetail";
	}


	@RequestMapping("/myappplans")
	// 目录http://localhost:8080/shiroTset/index
	public String myappplans(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		//加载用户信息
		Users users = userController.getUsers(request);
		if (users != null) {
			request.setAttribute("username", users.getName());
		}
		
		//加载plan
		List<Plans> lstPlans = new LinkedList<Plans>();
		List<Integer> lstplansid = planmembersService.selectIdByUid(users.getId().toString());
		
		for (Integer id : lstplansid) {
			lstPlans.addAll(plansSolr.searchById(id.toString()));
		}
		
		request.setAttribute("lstPlans", lstPlans);
		return "myappplans";
	}

	@RequestMapping(value = "/appPlan")
	@ResponseBody
	public String appPlan(HttpServletResponse response,
			HttpServletRequest request) throws Exception {

		Users users = userController.getUsers(request);
		
		String planId = request.getParameter("id");

		HashMap<String, String> result = new HashMap<String, String>();

		if (planmembersService.selectIdByUidAndPid(users.getId().toString(),planId.toString()) < 0) {
			Planmembers planmembers = new Planmembers();
			planmembers.setPlanid(Integer.parseInt(planId));
			planmembers.setUserid(users.getId());
			planmembers.setJointime(new Date());
			planmembers.setIscreater((byte) 0);
			planmembers.setUsername(users.getName());
			planmembers.setUsertype(0);
			planmembers.setFlag("M");
			planmembersService.insert(planmembers);

			result.put("success", "1");
		} else {
			result.put("planmembers", "1");
		}

		return JSONObject.fromObject(result).toString();

	}

	@RequestMapping(value = "/cancelPlan")
	@ResponseBody
	public String cancelPlan(HttpServletResponse response,
			HttpServletRequest request) throws Exception {

		Users users = (Users) request.getSession().getAttribute("user");
		String planId = request.getParameter("id");

		HashMap<String, String> result = new HashMap<String, String>();

		Plans plans = plansService.selectPlansById(Integer.parseInt(planId));

		if (planmembersService.selectIdByUidAndPid(users.getId().toString(),
				planId.toString()) < 0) {
			Planmembers planmembers = new Planmembers();
			planmembers.setPlanid(Integer.parseInt(planId));
			planmembers.setUserid(users.getId());
			planmembersService.insert(planmembers);
			plans.setPresentnum(planmembersService.selectCountByPid(planId));
			plansService.update(plans);
			result.put("success", "1");
		} else {
			result.put("planmembers", "1");
		}

		return "redirect:myapplans";

	}

	@RequestMapping("/modifyPlan")
	public String modifyPlan(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		Users users = (Users) request.getSession().getAttribute("user");
		if (users != null) {
			String userName = users.getName();
			if (userName == null || "".equals(userName)) {
				userName = users.getUsername();
			}
			request.setAttribute("username", userName);
			request.setAttribute("uid", users.getId());
		}

		String id = request.getParameter("id");
		Plans plans = plansSolr.searchById(id).get(0);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 小写的mm表示的是分钟
		plans.setStrdeparturetime(sdf.format(plans.getDeparturetime()));
		plans.setStrendtime(sdf.format(plans.getEndtime()));
		request.setAttribute("plans", plans);
		return "modifyplan";
	}

	@RequestMapping(value = "/modify")
	@ResponseBody
	public String modify(HttpServletResponse response,
			HttpServletRequest request) throws Exception {

		HashMap<String, String> result = new HashMap<String, String>();
		String pid = request.getParameter("id");
		Plans plans = plansService.selectPlansById(Integer.parseInt(pid));
		plans = fillPlan(request, plans);
		if (plansService.update(plans) > 0) {
			plansSolr.insert(plans);
		}
		result.put("success", "1");

		return JSONObject.fromObject(result).toString();

	}


	
	private Plans fillPlan(HttpServletRequest request, Plans plans)
			throws ParseException {

		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		Users users = (Users) session.getAttribute("user");

		String title = request.getParameter("title");
		String tag = request.getParameter("tag");
		String departuretime = request.getParameter("departuretime");
		String departureplace = request.getParameter("departureplace");
		String destination = request.getParameter("destination");
		String expectnum = request.getParameter("expectnum");
		String content = request.getParameter("content");
		String endtime = request.getParameter("endtime");
		String budgetbottom = request.getParameter("budgetbottom");
		String budgettop = request.getParameter("budgettop");
		String picpath = request.getParameter("picpath");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 小写的mm表示的是分钟
		Date dateDeparturetime = sdf.parse(departuretime);
		Date dateEndtime = sdf.parse(endtime);

		if (plans == null) {
			plans = new Plans();
			plans.setCommentcount(0);
			plans.setNotecount(0);
			plans.setPresentnum(0);
			plans.setScore(0);
			plans.setFlag("P");
			plans.setCreattime(new Date());
			plans.setCreatby(users.getId());
			plans.setType(0);// 0等待，1出发，2结束
		} else {
			int presentnum = planmembersService.selectCountByPid(plans.getId()
					.toString());
			plans.setNotecount(0);
			plans.setPresentnum(presentnum);
			plans.setScore(0);
		}
		plans.setTitle(title);
		plans.setTag(tag);
		plans.setDeparturetime(dateDeparturetime);
		plans.setDepartureplace(departureplace);
		plans.setDestination(destination);
		plans.setExpectnum(Integer.parseInt(expectnum));
		plans.setDetail(content);
		plans.setPicpath(picpath);
		plans.setEndtime(dateEndtime);
		plans.setBudgetbottom(Integer.parseInt(budgetbottom));
		plans.setBudgettop(Integer.parseInt(budgettop));

		return plans;
	}

}

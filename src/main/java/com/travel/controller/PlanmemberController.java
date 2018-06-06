package com.travel.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.travel.pojo.Comments;
import com.travel.pojo.Me;
import com.travel.pojo.Planmembers;
import com.travel.pojo.Plans;
import com.travel.pojo.Users;
import com.travel.service.CommentsService;
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
public class PlanmemberController {

	@Resource
	private PlanmembersService planmembersService;
	@Resource
	private UserService userService;
	@Resource
	private PlansService plansService;
	protected Logger logger = LoggerFactory.getLogger(getClass());


	@RequestMapping("/verifyMember")
	@ResponseBody
	public String verifyMember(HttpServletRequest request) throws Exception {

		HashMap<String, String> result = new HashMap<String, String>();
		
		String pid = request.getParameter("pid");
		String uid = request.getParameter("uid");
		String type = request.getParameter("type");
	
		Plans plans =plansService.selectPlansById(Integer.parseInt(pid));
		Users users = userService.selectByPrimaryKey(Integer.parseInt(uid));
		
		
		if ("1".equals(type)) {
			
			if (users.getIsontravel()==1) {
				result.put("success", "-1");
				result.put("isOntravel", "-1");
				return JSONObject.fromObject(result).toString();
			}
			if (plans.getType()==1) {
				Planmembers planmembers = new Planmembers();
				planmembers.setPlanid(Integer.parseInt(pid));
				planmembers.setUserid(Integer.parseInt(uid));
				planmembers.setUsertype(Integer.parseInt(type));
				planmembers.setIsontravel(1);
				if (planmembersService.updateByPidUid(planmembers)<=0) {
					result.put("success", "-1");
					return JSONObject.fromObject(result).toString();
				}
				
				users.setId(Integer.parseInt(uid));
				users.setIsontravel(1);
				userService.updateUser(users);
				
				result.put("success", "1");
				return JSONObject.fromObject(result).toString();
			}
			
			if (plans.getType()==0) {
				Planmembers planmembers = new Planmembers();
				planmembers.setPlanid(Integer.parseInt(pid));
				planmembers.setUserid(Integer.parseInt(uid));
				planmembers.setUsertype(Integer.parseInt(type));
				if (planmembersService.updateByPidUid(planmembers)>0) {
					result.put("success", "1");
					result.put("isontravel",users.getIsontravel()+"");
				}else {
					result.put("success", "-1");
				}
				return JSONObject.fromObject(result).toString();
			}
		}
		
		
		if ("0".equals(type) ) {
			if (plans.getType()==1) {
				Planmembers planmembers = new Planmembers();
				planmembers.setPlanid(Integer.parseInt(pid));
				planmembers.setUserid(Integer.parseInt(uid));
				planmembers.setUsertype(Integer.parseInt(type));
				planmembers.setIsontravel(0);
				if (planmembersService.updateByPidUid(planmembers)<=0) {
					result.put("success", "-1");
					return JSONObject.fromObject(result).toString();
				}
				
				users.setId(Integer.parseInt(uid));
				users.setIsontravel(0);
				userService.updateUser(users);
				result.put("success", "1");
				result.put("isontravel",users.getIsontravel()+"");
				return JSONObject.fromObject(result).toString();
			}
			
			if (plans.getType()==0) {
				Planmembers planmembers = new Planmembers();
				planmembers.setPlanid(Integer.parseInt(pid));
				planmembers.setUserid(Integer.parseInt(uid));
				planmembers.setUsertype(Integer.parseInt(type));
				planmembers.setIsontravel(0);
				if (planmembersService.updateByPidUid(planmembers)<=0) {
					result.put("success", "-1");
					return JSONObject.fromObject(result).toString();
				}
				
				result.put("success", "1");
				result.put("isontravel",users.getIsontravel()+"");
				return JSONObject.fromObject(result).toString();
			}
		}
		
		result.put("success", "-1");
		return JSONObject.fromObject(result).toString();
	}
	

	@RequestMapping("/quitPlan")
	@ResponseBody
	public String quitPlan(HttpServletRequest request) throws Exception {

		String id = request.getParameter("id");
	
		HashMap<String, String> result = new HashMap<String, String>();

		Planmembers planmembers = planmembersService.selectById(Integer.parseInt(id));
		if(planmembers.getIsontravel()==1){
			Users users = new Users(); 
			users.setId(planmembers.getUserid());
			users.setIsontravel(0);
			userService.updateUser(users);
			
		}
		if (planmembersService.deleteById(Integer.parseInt(id))>0) {
			result.put("success", "1");
		}else {
			result.put("success", "-1");
		}
		return JSONObject.fromObject(result).toString();
	}
	

}

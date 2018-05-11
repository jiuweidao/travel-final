package com.travel.controller;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.support.json.JSONUtils;
import com.travel.pojo.Plans;
import com.travel.pojo.Users;
import com.travel.service.CheckEmailValidityUtil;
import com.travel.service.DecriptUtil;
import com.travel.service.UserService;
import com.travel.solr.PlansSolr;

/**
 * Controller
 * 
 * @author firepig
 * @since 2017
 */

@Controller
public class UserController {
	@Resource
	private UserService userService;
	/* private UsersSolr springSolr=new UsersSolr(); */
	private PlansSolr plansSolr = new PlansSolr();
	protected Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping("/index")
	// 目录http://localhost:8080/shiroTset/index
	public String getIndex(HttpServletRequest request,
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
		request.setAttribute("lstPlans", lstPlans);
		return "index";
	}

	@RequestMapping("/login")
	public ModelAndView doLogin(HttpServletRequest request,
			HttpServletResponse response, Model model) {

		ModelAndView mav = new ModelAndView("login");
		return mav;
	}

	@RequestMapping("/register")
	public ModelAndView register(HttpServletRequest request,
			HttpServletResponse response, Model model) {

		ModelAndView mav = new ModelAndView("register");
		return mav;
	}

	@RequestMapping("/myMessage")
	public ModelAndView showMymessage(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		Users users = (Users) request.getSession().getAttribute("user");
		if (users != null) {
			String userName = users.getName();
			if (userName == null || "".equals(userName)) {
				userName = users.getUsername();
			}
			request.setAttribute("username", userName);

		}
		request.setAttribute("users", users);
		ModelAndView mav = new ModelAndView("mymessage");
		return mav;
	}

	/*
	 * 密码验证登录，如若未登录转跳登录界面
	 */
	@RequestMapping(value = "/checkLogin", method = RequestMethod.POST)
	@ResponseBody
	public String checkLogin(HttpServletRequest request,
			HttpServletResponse response) throws NoSuchAlgorithmException,
			UnsupportedEncodingException {

		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		String nologin = request.getParameter("nologin");

		Map<String, String> result = new HashMap<String, String>();
		try {
			UsernamePasswordToken token = new UsernamePasswordToken(mobile,
					DecriptUtil.MD5(password));
			Subject currentUser = SecurityUtils.getSubject();

			if (!currentUser.isAuthenticated()) {
				// 使用shiro来验证 以下两句 提交用户名/密码进行认证过
				token.setRememberMe(true);

				currentUser.login(token);// 验证角色和权限
				Users loginer = userService.selectByAll(mobile);
				Session session = currentUser.getSession();
				session.setAttribute("user", loginer);
				result.put("msg", "true");
				if (nologin.equals("true")) {
					session.setTimeout(14 * 24 * 60 * 60);
				}
			} else {
				result.put("msg", "true");
			}
		} catch (Exception ex) {
			System.out.println(ex);
			result.put("msg", "false");
		}

		return JSONObject.fromObject(result).toString();
	}

	/*
	 * 手机号注册
	 */

	@RequestMapping(value = "/registerByM")
	@ResponseBody
	public String registerByM(HttpServletResponse response,
			HttpServletRequest request) throws Exception {

		String userName = request.getParameter("username");
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password")/* .trim(); */;
		HashMap<String, String> result = new HashMap<String, String>();

		if (userService.selectByTelemoble(mobile) != null) {
			result.put("mobile", "1");
		}
		if (userService.selectByUserName(userName) != null) {
			result.put("userName", "1");
		}

		if (result.size() == 0) {
			Users newUser = new Users();
			newUser.setUsername(userName);
			newUser.setName(userName);
			newUser.setTelemoble(mobile);
			newUser.setPassword(password);
			if (userService.insert(newUser) > 0) {
				/* springSolr.insert(newUser); */
				result.put("success", "1");
			} else {
				result.put("success", "0");
			}
		}

		return JSONObject.fromObject(result).toString();

	}

	@RequestMapping(value = "/modifyMyssage")
	@ResponseBody
	public String modifyMyssage(HttpServletResponse response,
			HttpServletRequest request, String type) throws Exception {

		/*
		 * ModelAndView mav = new ModelAndView("index"); Subject currentUser =
		 * SecurityUtils.getSubject(); Session session =
		 * currentUser.getSession();
		 */

		Users users = (Users) request.getSession().getAttribute("user");
		HashMap<String, String> result = new HashMap<String, String>();
		if ("m".equals(type)) {
			String name = request.getParameter("name");
			String telemoble = request.getParameter("telemoble");
			String email = request.getParameter("email")/* .trim(); */;

			if (name != null && !"".equals(name)) {
				users.setName(name);
			}
			if (telemoble != null && !"".equals(telemoble)
					&& !telemoble.equals(users.getTelemoble())) {
				if (userService.selectByTelemoble(telemoble) == null) {
					users.setTelemoble(telemoble);
				} else {
					result.put("telemoble", "1");
				}
			}

			if (email != null && !"".equals(email)
					&& !email.equals(users.getEmail())) {
				if (userService.selectByEmail(email) == null) {
					if (CheckEmailValidityUtil.isEmailValid(email)) {
						users.setEmail(email);
					} else {
						result.put("email", "f");
					}
				} else {
					result.put("email", "1");
				}
			}
			if (email == null) {
				users.setEmail(email);
			}
			if (result.size() == 0) {

				if (userService.updateUser(users) > 0) {
					/* springSolr.insert(newUser); */
					result.put("success", "1");
				}
			}
		}

		if ("p".equals(type)) {
			String originalPassword = request.getParameter("original_password");
			String password = request.getParameter("password");
			password = DecriptUtil.MD5(password);
			if (DecriptUtil.MD5(originalPassword).equals(users.getPassword())) {

				users.setPassword(DecriptUtil.MD5(password));
				userService.updateUser(users);
				result.put("success", "1");
			} else {
				result.put("password", "f");
			}
		}

		return JSONObject.fromObject(result).toString();

	}

	/**
	 * 
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	@ResponseBody
	public String logout() {

		Map<String, Object> result = new HashMap<String, Object>();
		Subject currentUser = SecurityUtils.getSubject();

		currentUser.logout();
		result.put("success", true);

		return JSONUtils.toJSONString(result);
	}

}
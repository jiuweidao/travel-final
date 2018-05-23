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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.support.json.JSONUtils;
import com.travel.pojo.Plans;
import com.travel.pojo.Users;
import com.travel.service.CheckEmailValidityUtil;
import com.travel.service.DecriptUtil;
import com.travel.service.UserService;
import com.travel.solr.PlansSolr;
import com.travel.utils.FileUtils;
import com.travel.utils.IdCardCode;
import com.travel.utils.RestTest;
import com.travel.utils.StringUtils;

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

		Users users = getUsers(request);
		if (users != null) {
			request.setAttribute("username", users.getName());
		}
		
		List<Plans> lstPlans = plansSolr.selectAll(null);
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
		Users users = getUsers(request);
		if (users != null) {
			request.setAttribute("username", users.getName());
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
			UsernamePasswordToken token = new UsernamePasswordToken(mobile,DecriptUtil.MD5(password));
			Subject currentUser = SecurityUtils.getSubject();
			Users loginer1 = userService.selectByAll(mobile);
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
	 * 密码验证登录，如若未登录转跳登录界面
	 */
	@RequestMapping(value = "/checkCodeLogin", method = RequestMethod.POST)
	@ResponseBody
	public String checkCodeLogin(HttpServletRequest request) throws NoSuchAlgorithmException,
			UnsupportedEncodingException {

		String mobile = request.getParameter("mobile");
		String code = request.getParameter("code");
		String nologin = request.getParameter("nologin");
		String orCode = (String) request.getSession().getAttribute("code");
		
		Map<String, String> result = new HashMap<String, String>();
		
		if (StringUtils.isNull(code)&&StringUtils.isNull(orCode)&&!code.equals(orCode)) {
			result.put("code", "-1");
			return JSONObject.fromObject(result).toString();
		}
		Users loginer = userService.selectByAll(mobile);
		try {
			UsernamePasswordToken token = new UsernamePasswordToken(mobile,loginer.getPassword());
			Subject currentUser = SecurityUtils.getSubject();
			Users loginer1 = userService.selectByAll(mobile);
			if (!currentUser.isAuthenticated()) {
				// 使用shiro来验证 以下两句 提交用户名/密码进行认证过
				token.setRememberMe(true);

				currentUser.login(token);// 验证角色和权限
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
		result.put("success", "1");
		
		return JSONObject.fromObject(result).toString();
	}
	
	/*
	 * 手机号注册
	 */
	@RequestMapping(value = "/registerByM")
	@ResponseBody
	public String registerByM(HttpServletResponse response,
			HttpServletRequest request) throws Exception {

		String userName = request.getParameter("username").trim();;
		String mobile = request.getParameter("mobile").trim();;
		String password = request.getParameter("password").trim();;
		String code = request.getParameter("code").trim();;
		String orCode = (String) request.getSession().getAttribute("code");
		HashMap<String, String> result = new HashMap<String, String>();
		
		if (StringUtils.isNull(code)&&StringUtils.isNull(orCode)&&!code.equals(orCode)) {
			result.put("code", "1");
			return JSONObject.fromObject(result).toString();
		}
		if (userService.selectByTelemoble(mobile) != null) {
			result.put("mobile", "1");
			return JSONObject.fromObject(result).toString();
		}
		if (userService.selectByUserName(userName) != null) {
			result.put("userName", "1");
			return JSONObject.fromObject(result).toString();
		}

		Users newUser = new Users();
		newUser.setUsername(userName);
		newUser.setName(userName);
		newUser.setTelemoble(mobile);
		newUser.setPassword(password);
		if (userService.insert(newUser) > 0) {
			result.put("success", "1");
		} else {
			result.put("success", "0");
		}

		return JSONObject.fromObject(result).toString();

	}

	@RequestMapping(value = "/modifyMyssage")
	@ResponseBody
	public String modifyMyssage(HttpServletResponse response,
			HttpServletRequest request, String type) throws Exception {

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

			if (email != null && !"".equals(email)&& !email.equals(users.getEmail())) {
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
		result.put("success", "true");

		return JSONUtils.toJSONString(result);
	}

	
	/**
	 * 获取验证码
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getCode")
	@ResponseBody
	public String getCode(HttpServletRequest request) throws Exception {

		String mobile = request.getParameter("mobile");
		HashMap<String, String> result = new HashMap<String, String>();
		String code = StringUtils.getStringRandom(6);
		JSONObject jsonCode = JSONObject.fromObject(RestTest.testSendSms(code,mobile,"travel"));
//		JSONObject jsonCode = JSONObject.fromObject("{\"code\":\"000000\"}");
		if(jsonCode.get("code").equals("000000")){
			request.getSession().setAttribute("code", code);
			result.put("success", "1");
		}else {
			result.put("success", "-1");
		}
		return JSONObject.fromObject(result).toString();

	}
	
	public Users getUsers(HttpServletRequest request) {
		Users users = (Users) request.getSession().getAttribute("user");
		if (users != null) {
			if ( users.getName() == null) {
				users.setName( users.getUsername());
			}
		}
		return users;
	}
	

	@RequestMapping(value = "/doCertification", method = RequestMethod.POST)
	@ResponseBody
	public String doCertification(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request) {

		Users users = (Users) request.getSession().getAttribute("user");
		Map<String, Object> result = new HashMap<String, Object>();
		String path=FileUtils.uploadPicture(file,request);
		result.put("path", path);
		String IdCardData=IdCardCode.getIdCarMessage("D:/apache-tomcat-7.0.77/webapps/mytravel"+path);
		
		if(IdCardData.equals("-1")){
			result.put("success", "-1");
			return JSONUtils.toJSONString(result);
		}
		
		JSONObject jsonIdCardData = JSONObject.fromObject(IdCardData);
		String verificationResult =IdCardCode.verificateIdCard(jsonIdCardData.getString("num"), jsonIdCardData.getString("name"));
		
		if(verificationResult.equals("-1")){
			result.put("success", "-1");
			return JSONUtils.toJSONString(result);
		}
		JSONObject jsonVerificationResult = JSONObject.fromObject(verificationResult);
		if (!jsonVerificationResult.getJSONObject("data").getString("code").equals("1000")||
				(jsonVerificationResult.getJSONObject("idCardInfo").getString("area").equals(jsonIdCardData.getString("address"))&&
						jsonVerificationResult.getJSONObject("idCardInfo").getString("birthday").equals(jsonIdCardData.getString("birth"))&&
						jsonVerificationResult.getJSONObject("idCardInfo").getString("sex").equals(jsonIdCardData.getString("sex")))) {
			result.put("success", "-1");
			return JSONUtils.toJSONString(result);
		}
		
		users.setIdname(jsonIdCardData.getString("name"));
		users.setIdnum(jsonIdCardData.getString("num"));
		users.setSex(jsonIdCardData.getString("sex"));
		users.setBirth(jsonIdCardData.getString("birth"));
		users.setAddress(jsonIdCardData.getString("address"));
		users.setNationlity(jsonIdCardData.getString("nationality"));
		users.setUsertype("V");
		users.setIconpath(path);
		userService.updateUser(users);
		result.put("success", "true");
		return JSONUtils.toJSONString(result);
	}
}

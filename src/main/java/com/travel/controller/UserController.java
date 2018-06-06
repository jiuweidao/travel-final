package com.travel.controller;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
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
import com.travel.pojo.Contacts;
import com.travel.pojo.Me;
import com.travel.pojo.PlannumUsers;
import com.travel.pojo.Plans;
import com.travel.pojo.ScoreUser;
import com.travel.pojo.Users;
import com.travel.service.CheckEmailValidityUtil;
import com.travel.service.ContactsService;
import com.travel.service.DecriptUtil;
import com.travel.service.PlannumUserService;
import com.travel.service.ScoreUserService;
import com.travel.service.UserService;
import com.travel.solr.PlansSolr;
import com.travel.utils.Calculator;
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
	@Resource
	private PlannumUserService plannumUserService;
	@Resource
	private ContactsService contactsService;
	@Resource
	private ScoreUserService scoreUserService;
	private PlansSolr plansSolr = new PlansSolr();
	protected Logger logger = LoggerFactory.getLogger(getClass());

	// 目录http://localhost:8080/shiroTset/index
	@RequestMapping("/index")
	public String getIndex(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		Me me = getMe(request);
		if (me != null) {
			request.setAttribute("me", me);
		}
		
		List<Plans> lstPlans = plansSolr.selectForIndex();
		List<PlannumUsers> lstPlannumUser = plannumUserService.selectUserTop(3);
		List<Users> lstTopUsers= new LinkedList<>();
		  
		for (PlannumUsers plannumUsers : lstPlannumUser) {
			Users u =  userService.selectByPrimaryKey(plannumUsers.getUid());
			u.setType0num(plannumUsers.getType0num());
			u.setType1num(plannumUsers.getType1num());
			u.setType2num(plannumUsers.getType2num());
			u.setTypefnum(plannumUsers.getTypefnum());
			double rate =Calculator.divisionTo4(
					(plannumUsers.getType1num()+plannumUsers.getType2num())*100,
					plannumUsers.getType0num()+plannumUsers.getType1num()+plannumUsers.getType2num()+plannumUsers.getTypefnum());
			u.setSuccessRate(rate);
			lstTopUsers.add(u);
		}
		
		//处理plan的内容不要太长
		for (Plans p : lstPlans) {
			if (p.getDetail().length()>40) {
				p.setDetail(p.getDetail().substring(0, 40)+"......");
			}
		}
		request.setAttribute("lstPlans", lstPlans);
		request.setAttribute("lstTopUsers", lstTopUsers);
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
		Me me = getMe(request);
		if (me != null) {
			request.setAttribute("me", me);
		}
		Users users = userService.selectByPrimaryKey(me.getId());
		Contacts contacts = contactsService.selectByUid(me.getId());
		users.setContact1(contacts.getContact1());
		users.setContact2(contacts.getContact2());
		request.setAttribute("users", users);
		ModelAndView mav = new ModelAndView("mymessage");
		return mav;
	}
	
	@RequestMapping("/userMessage")
	public ModelAndView showUsermessage(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		String id = request.getParameter("id");
		
		//加载我的信息
		Me me = getMe(request);
		if (me != null) {
			request.setAttribute("me", me);
		}
		
		//加载用户积分
		Integer total = scoreUserService.selectTotalByUid(Integer.parseInt(id));
		Users users = userService.selectByPrimaryKey(Integer.parseInt(id));
		if (total==null) {
			total=0;
		}
		users.setScore(total);
		userService.updateUser(users);
		//加载查看用户个人信息
		
		PlannumUsers plannumUsers = plannumUserService.selectByUid(users.getId());
		
		users.setType0num(plannumUsers.getType0num());
		users.setType1num(plannumUsers.getType1num());
		users.setType2num(plannumUsers.getType2num());
		users.setTypefnum(plannumUsers.getTypefnum());
		double rate =Calculator.divisionTo4(
				(plannumUsers.getType1num()+plannumUsers.getType2num())*100,
				plannumUsers.getType0num()+plannumUsers.getType1num()+plannumUsers.getType2num()+plannumUsers.getTypefnum());
		users.setSuccessRate(rate);
		
		//加载用户邀约情况
		List<Plans> lstPlans0 = plansSolr.searchPlanLst(users.getId(), "0", 1, 6);
		List<Plans> lstPlans1 = plansSolr.searchPlanLst(users.getId(), "1", 1, 6);
		List<Plans> lstPlans2 = plansSolr.searchPlanLst(users.getId(), "2", 1, 6);
		
		request.setAttribute("users", users);
		request.setAttribute("lstPlans0", lstPlans0);
		request.setAttribute("lstPlans1", lstPlans1);
		request.setAttribute("lstPlans2", lstPlans2);
		ModelAndView mav = new ModelAndView("usermessage");
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
		if(getAuthrity(mobile, password, nologin)){
			result.put("success", "1");
		}else{
			result.put("success", "-1");
		}

		return JSONObject.fromObject(result).toString();
	}
	
	/*
	 * 验证码登录，如若未登录转跳登录界面
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
		
		if(getAuthrity(mobile, loginer.getPassword(), nologin)){
			result.put("success", "1");
		}else{
			result.put("success", "-1");
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
		newUser.setIsontravel(0);
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
			HttpServletRequest request) throws Exception {

		Me me = getMe(request);
		if (me != null) {
			request.setAttribute("me", me);
		}
		String type=request.getParameter("type");
		Users users = new Users();
		users.setId(me.getId());
		HashMap<String, String> result = new HashMap<String, String>();
		if ("m".equals(type)) {
			String name = request.getParameter("name");
			String telemoble = request.getParameter("telemoble");
			String email = request.getParameter("email");
			String sign = request.getParameter("sign");
			
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
			users.setEmail(email);
			users.setSign(sign);
			
			if (userService.updateUser(users) > 0) {
				result.put("success", "1");
				return JSONObject.fromObject(result).toString();
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
			return JSONObject.fromObject(result).toString();
		}
		
		if ("c".equals(type)) {
			String contact1 = request.getParameter("contact1");
			String contact2 = request.getParameter("contact2");
			Contacts contacts = new Contacts();
			contacts.setUserid(me.getId());
			contacts.setContact1(contact1);
			contacts.setContact2(contact2);
			contacts.setCreattime(new Date());
			if (contactsService.updateUserByUid(contacts)>0) {
				result.put("success", "1");
			}else {
				result.put("success", "-1");
			}
			return JSONObject.fromObject(result).toString();
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
	
	

	@RequestMapping(value = "/doCertification", method = RequestMethod.POST)
	@ResponseBody
	public String doCertification(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request) {

		Me me = getMe(request);
		Users users=userService.selectByPrimaryKey(me.getId());
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
		users.setIdcardpath(path);
		userService.updateUser(users);
		if (userService.updateUser(users)<=0) {
			result.put("success", "-1");
			return JSONUtils.toJSONString(result);
		}
		
		ScoreUser scoreUser = new ScoreUser();
		scoreUser.setUserid(me.getId());
		scoreUser.setScore(10);
		scoreUser.setType(1);
		scoreUser.setCreattime(new Date());
		scoreUser.setFlag("M");
		if (scoreUserService.insert(scoreUser)<=0) {
			result.put("success", "-1");
			return JSONUtils.toJSONString(result);
		}
		
		result.put("success", "true");
		return JSONUtils.toJSONString(result);
	}
	
	@RequestMapping(value = "/uploadUserIcon", method = RequestMethod.POST)
	@ResponseBody
	public String uploadUserIcon(
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request) {

		Map<String, String> result = new HashMap<String, String>();
		Me me = getMe(request);
		Users users = new Users();
		String path=FileUtils.uploadPicture(file,request);
		users.setId(me.getId());
		users.setIconpath(path);
		userService.updateUser(users);
		result.put("success", "true");
		result.put("path", path);
		return JSONObject.fromObject(result).toString();
	}
	
	public Me getMe(HttpServletRequest request) {
		Me me = (Me) request.getSession().getAttribute("me");
		if (me != null) {
			if ( me.getName() == null) {
				me.setName( me.getUsername());
			}
		}
		return me;
	}
	public boolean getAuthrity(String mobile,String password,String nologin) {
		try {
			UsernamePasswordToken token = new UsernamePasswordToken(mobile,DecriptUtil.MD5(password));
			Subject currentUser = SecurityUtils.getSubject();
			if (!currentUser.isAuthenticated()) {
				// 使用shiro来验证 以下两句 提交用户名/密码进行认证过
				token.setRememberMe(true);

				currentUser.login(token);// 验证角色和权限
				Users loginer = userService.selectByAll(mobile);
				Session session = currentUser.getSession();
				Me me= new Me();
				me.setId(loginer.getId());
				me.setName(loginer.getName());
				me.setUsername(loginer.getUsername());
				me.setUsertype(loginer.getUsertype());
				me.setIsontravel(loginer.getIsontravel());
				session.setAttribute("me", me);
				if (nologin.equals("true")) {
					session.setTimeout(14 * 24 * 60 * 60);
				}
			} 
		} catch (Exception ex) {
			System.out.println(ex);
			return false;
		}
		
		return true;
	}
	
}

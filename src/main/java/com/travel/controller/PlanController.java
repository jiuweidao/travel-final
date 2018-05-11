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

import com.travel.pojo.Comments;
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

	private PlansSolr plansSolr = new PlansSolr();
	private CommentsSolr commentsSolr = new CommentsSolr();
	protected Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping("/allPlans")
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
		request.setAttribute("lstPlans", lstPlans);
		return "allplans";
	}

	@RequestMapping("/myapplans")
	// 目录http://localhost:8080/shiroTset/index
	public String myapplans(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		Users users = (Users) request.getSession().getAttribute("user");
		List<Plans> lstPlans = new LinkedList<Plans>();
		List<Integer> lstplansid = planmembersService.selectIdByUid(users
				.getId().toString());
		for (Integer id : lstplansid) {
			lstPlans.addAll(plansSolr.searchById(id.toString()));
		}
		if (users != null) {
			String userName = users.getName();
			if (userName == null) {
				userName = users.getUsername();
			}
			request.setAttribute("username", userName);

		}
		request.setAttribute("lstPlans", lstPlans);
		return "myapplans";
	}

	@RequestMapping("/createPlan")
	// 目录http://localhost:8080/shiroTset/index
	public String createPlan(HttpServletRequest request,
			HttpServletResponse response, Model model) {

		/*
		 * Subject currentUser = SecurityUtils.getSubject(); Session session =
		 * currentUser.getSession(); Users users=(Users)
		 * session.getAttribute("user");
		 */
		Users users = (Users) request.getSession().getAttribute("user");
		if (users != null) {
			String userName = users.getName();
			if (userName == null) {
				userName = users.getUsername();
			}
			request.setAttribute("username", userName);
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

		if (plansService.insert(plans) > 0) {
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

		List<Comments> lstComments = new LinkedList<>();

		Users users = (Users) request.getSession().getAttribute("user");

		String id = request.getParameter("id");
		Plans plans = plansSolr.searchById(id).get(0);
		if (users != null) {
			String userName = users.getName();
			if (userName == null || "".equals(userName)) {
				userName = users.getUsername();
			}
			request.setAttribute("username", userName);
			request.setAttribute("uid", users.getId());
			if (planmembersService.selectIdByUidAndPid(
					users.getId().toString(), plans.getId().toString()) > 0) {
				plans.setIsmember(true);
			}
		}

		List<Comments> lstAllComments = commentsSolr.searchByPlanId(id);
		for (Comments comment : lstAllComments) {
			if (comment.getType() == 0) {
				lstComments.add(comment);
			}
		}

		for (Comments comment : lstComments) {
			for (Comments note : lstAllComments) {
				if (note.getType() == 1 && comment.getId() == note.getNoteid())
					comment.addComment(note);
			}
		}
		request.setAttribute("lstComments", lstComments);

		// Collections.sort(lstComments);
		request.setAttribute("plans", plans);

		return "plandetail1";
	}

	@RequestMapping("/myplans")
	// 目录http://localhost:8080/shiroTset/index
	public String myplans(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		Users users = (Users) request.getSession().getAttribute("user");

		List<Plans> lstPlans = plansSolr.selectAll(users.getId().toString());
		if (users != null) {
			String userName = users.getName();
			if (userName == null) {
				userName = users.getUsername();
			}
			request.setAttribute("username", userName);

		}
		request.setAttribute("lstPlans", lstPlans);
		return "myplans";
	}

	@RequestMapping("/myappplans")
	// 目录http://localhost:8080/shiroTset/index
	public String myappplans(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		Users users = (Users) request.getSession().getAttribute("user");
		List<Plans> lstPlans = new LinkedList<Plans>();
		List<Integer> lstplansid = planmembersService.selectIdByUid(users
				.getId().toString());
		for (Integer id : lstplansid) {
			lstPlans.addAll(plansSolr.searchById(id.toString()));
		}
		if (users != null) {
			String userName = users.getName();
			if (userName == null) {
				userName = users.getUsername();
			}
			request.setAttribute("username", userName);

		}
		request.setAttribute("lstPlans", lstPlans);
		return "myappplans";
	}

	@RequestMapping(value = "/appPlan")
	@ResponseBody
	public String appPlan(HttpServletResponse response,
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
			planmembers.setJointime(new Date());
			planmembers.setIscreater((byte) 0);
			planmembersService.insert(planmembers);
			plans.setPresentnum(planmembersService.selectCountByPid(planId));
			plansService.update(plans);
			result.put("success", "1");
		} else {
			result.put("planmembers", "1");
		}

		return "redirect:myappplans";

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

	@ResponseBody
	@RequestMapping(value = "/uploadImg.html", method = RequestMethod.POST)
	public String uploadPicture(
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request) {

		Map<String, String> result = new HashMap<String, String>();
		File targetFile = null;
		String msg = "";// 返回存储路径
		int code = 1;
		String fileName = file.getOriginalFilename();// 获取文件名加后缀
		if (fileName != null && fileName != "") {
			String returnUrl = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath() + "/upload/imgs/";// 存储路径
			String path = request.getSession().getServletContext()
					.getRealPath("upload/imgs"); // 文件存储位置
			String fileF = fileName.substring(fileName.lastIndexOf("."),
					fileName.length());// 文件后缀
			fileName = new Date().getTime() + "_" + new Random().nextInt(1000)
					+ fileF;// 新的文件名

			// 先判断文件是否存在
			String fileAdd = DateUtil.formatDate(new Date(), "yyyyMMdd");
			File file1 = new File(path + "/" + fileAdd);
			// 如果文件夹不存在则创建
			if (!file1.exists() && !file1.isDirectory()) {
				file1.mkdirs();
			}
			targetFile = new File(file1, fileName);
			// targetFile = new File(path, fileName);
			try {
				file.transferTo(targetFile);
				// msg=returnUrl+fileName;
				msg = returnUrl + fileAdd + "/" + fileName;
				code = 0;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		result.put(code + "", msg);
		// return JSON.toJSONString(ResponseResult.result(code, msg));
		return JSONObject.fromObject(result).toString();
	}

	@RequestMapping("springUpload")
	public String springUpload(HttpServletRequest request)
			throws IllegalStateException, IOException {
		long startTime = System.currentTimeMillis();
		// 将当前上下文初始化给 CommonsMutipartResolver （多部分解析器）
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());

		MultipartHttpServletRequest multiRequest1 = (MultipartHttpServletRequest) request;
		// 获取multiRequest 中所有的文件名
		Iterator iter1 = multiRequest1.getFileNames();
		// 检查form中是否有enctype="multipart/form-data"
		if (multipartResolver.isMultipart(request)) {
			// 将request变成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// 获取multiRequest 中所有的文件名
			Iterator iter = multiRequest.getFileNames();

			while (iter.hasNext()) {
				// 一次遍历所有文件
				MultipartFile file = multiRequest.getFile(iter.next()
						.toString());
				if (file != null) {
					String path = "E:/springUpload"
							+ file.getOriginalFilename();
					// 上传
					file.transferTo(new File(path));
				}

			}

		}
		long endTime = System.currentTimeMillis();
		System.out.println("方法三的运行时间：" + String.valueOf(endTime - startTime)
				+ "ms");
		return "/success";
	}

	/*
	 * @RequestMapping(value="/Plan") public String
	 * registerByM(HttpServletResponse response,HttpServletRequest request)
	 * throws Exception{
	 * 
	 * HashMap<String, String> result = new HashMap<String, String>() ; Plans
	 * plans = fillPlan(request);
	 * 
	 * if (plansService.insert(plans)>0) { plansSolr.insert(plans); }
	 * result.put("success","1");
	 * 
	 * 
	 * return JSONObject.fromObject(result).toString();
	 * 
	 * }
	 */
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
			plans.setCommentcount(0);
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
		plans.setEndtime(dateEndtime);
		plans.setBudgetbottom(Integer.parseInt(budgetbottom));
		plans.setBudgettop(Integer.parseInt(budgettop));

		return plans;
	}

}

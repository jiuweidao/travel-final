package com.travel.controller;

import java.util.Date;
import java.util.HashMap;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.travel.pojo.Comments;
import com.travel.pojo.Users;
import com.travel.service.CommentsService;
import com.travel.service.PlanmembersService;
import com.travel.service.UserService;
import com.travel.solr.CommentsSolr;

/**
 * Controller
 * 
 * @author firepig
 * @since 2017
 */

@Controller
public class CommentController {
	@Resource
	private UserService userService;
	@Resource
	private CommentsService commentsService;
	@Resource
	private PlanmembersService planmembersService;

	private CommentsSolr commentsSolr = new CommentsSolr();
	protected Logger logger = LoggerFactory.getLogger(getClass());

	/*
	 * 添加评论
	 */
	@RequestMapping(value = "/addComment")
	@ResponseBody
	public String registerByM(HttpServletResponse response,
			HttpServletRequest request) throws Exception {

		HashMap<String, String> result = new HashMap<String, String>();

		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		Users users = (Users) session.getAttribute("user");

		String strPlanId = request.getParameter("planid");
		String commentId = request.getParameter("commentId");
		String content = request.getParameter("comment");
		String commentCreateby = request.getParameter("commentCreateby");
		String type = request.getParameter("type");

		int intPlanId = Integer.parseInt(strPlanId);
		Comments comment = new Comments();
		comment.setPlanid(intPlanId);
		comment.setNoteid(Integer.parseInt(commentId));
		comment.setType(Integer.parseInt(type));
		comment.setContent(content);
		comment.setTrageid(Integer.parseInt(commentCreateby));
		comment.setCreatby(users.getId());
		comment.setCreatbyname(users.getName());
		comment.setCreattime(new Date());
		comment.setFlag("M");

		if (commentsService.insert(comment) > 0) {
			commentsSolr.insert(comment);
		}
		result.put("success", "1");
		result.put("id", comment.getId().toString());

		return JSONObject.fromObject(result).toString();

	}

}

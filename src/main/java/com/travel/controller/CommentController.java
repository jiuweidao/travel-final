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
public class CommentController {
	@Resource
	private UserService userService;
	@Resource
	private CommentsService commentsService;
	@Resource
	private PlanmembersService planmembersService;
	@Resource
	private PlansService plansService;

	private CommentsSolr commentsSolr = new CommentsSolr();
	private PlansSolr plansSolr = new PlansSolr();
	protected Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 分页获取Comment
	 * 一次10条Comment,100note
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getcomments")
	@ResponseBody
	public String getComments(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		String id = request.getParameter("id");
		String page = request.getParameter("page");
		List<Comments> lstAllComments = commentsSolr.searchCommentByPlanId(id,
				Integer.parseInt(page));
		for (Comments comment : lstAllComments) {
			List<Comments> lstAllNotes = commentsSolr.searchNoteByPlanId(id,comment.getId());
			comment.addComment(lstAllNotes);
		}

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("lstComments",lstAllComments);
		return JSONObject.fromObject(result).toString();
	}
	
	/*
	 * 添加评论
	 */
	@RequestMapping(value = "/addComment")
	@ResponseBody
	public String addComment(HttpServletResponse response,
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

		Plans plans = plansService.selectPlansById(intPlanId);
		int commentCount = commentsService.getPlanCount(intPlanId);
		plans.setCommentcount(commentCount);
		plansService.update(plans);
		plansSolr.insert(plans);

		result.put("success", "1");
		result.put("id", comment.getId().toString());

		return JSONObject.fromObject(result).toString();

	}

	/*
	 * 添加评论
	 */
	@RequestMapping(value = "/deleteComment")
	@ResponseBody
	public String deleteComment(HttpServletResponse response,
			HttpServletRequest request) throws Exception {

		HashMap<String, String> result = new HashMap<String, String>();

		String noteId = request.getParameter("noteId");
		String commentId = request.getParameter("commentId");

		if (noteId.equals("0")) {
			commentsService.deleteComment(Integer.parseInt(commentId));
			commentsSolr.deleteComment(commentId);
		}else {
			commentsService.deleteNote(Integer.parseInt(noteId));
			commentsSolr.deleteById(noteId);
		}

		result.put("success", "1");

		return JSONObject.fromObject(result).toString();

	}

}

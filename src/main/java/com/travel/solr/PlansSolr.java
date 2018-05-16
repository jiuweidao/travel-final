package com.travel.solr;

import java.io.IOException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;

import com.travel.pojo.Plans;

public class PlansSolr {
	private String serverUrl = "http://localhost:8080/solr/core_plans";

	/**
	 * 
	 * 向solr中增加纪录
	 * 
	 * @throws IOException
	 * @throws SolrServerException
	 */
	public void insert(Plans plans) throws SolrServerException, IOException {
		HttpSolrClient client = new HttpSolrClient(serverUrl);
		SolrInputDocument doc = new SolrInputDocument();

		doc.addField("id", plans.getId());
		doc.addField("title", plans.getTitle());
		doc.addField("tag", plans.getTag());

		doc.addField("type", plans.getType());
		doc.addField("budgettop", plans.getBudgettop());
		doc.addField("budgetbottom", plans.getBudgetbottom());

		doc.addField("departureplace", plans.getDepartureplace());
		doc.addField("destination", plans.getDestination());
		doc.addField("departuretime", plans.getDeparturetime());

		doc.addField("endtime", plans.getEndtime());
		doc.addField("expectnum", plans.getExpectnum());
		doc.addField("presentnum", plans.getPresentnum());

		doc.addField("detail", plans.getDetail());
		doc.addField("creatby", plans.getCreatby());
		doc.addField("creattime", plans.getCreattime());

		doc.addField("score", plans.getScore());
		doc.addField("CommentCount", plans.getCommentcount());
		doc.addField("NoteCount", plans.getNotecount());
		doc.addField("picpath", plans.getPicpath());

		client.add(doc);
		client.commit();

	}

	/**
	 * 
	 * 修改数据
	 * 
	 * @throws IOException
	 * @throws SolrServerException
	 */

	/*
	 * public void update(Users user) throws SolrServerException, IOException {
	 * 
	 * HttpSolrClient client = new HttpSolrClient(serverUrl); SolrInputDocument
	 * doc = new SolrInputDocument();
	 * 
	 * doc.addField("id", user.getId()); doc.addField("name", user.getName());
	 * doc.addField("usertype", user.getUsertype()); doc.addField("regtime",
	 * user.getRegtime()); doc.addField("lastlogintime",
	 * user.getLastlogintime());
	 * 
	 * client.add(doc); client.commit(); }
	 */

	/**
	 * 查找所有的uer信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Plans> selectAll(String createby) throws Exception {

		List<Plans> lstPlans = new LinkedList<Plans>();

		HttpSolrClient client = new HttpSolrClient(serverUrl);

		// 创建查询对象
		SolrQuery query = new SolrQuery();
		if (createby == null || "".equals(createby)) {
			query.set("q", "*:*");// q 查询字符串，如果查询所有*:*
		} else {
			query.setQuery("creatby:" + createby);
		}

		// 执行搜索、搜索结果
		QueryResponse queryResponse = client.query(query);
		SolrDocumentList results = queryResponse.getResults();
		Map<String, Map<String, List<String>>> highlighting = queryResponse
				.getHighlighting();

		for (SolrDocument solrDocument : results) {
			Plans plans = new Plans();
			plans.setId(Integer.parseInt((String) solrDocument.get("id")));
			plans.setTitle((String) solrDocument.get("title"));
			plans.setTag((String) solrDocument.get("tag"));

			plans.setType((int) solrDocument.get("type"));
			plans.setBudgettop((int) solrDocument.get("budgettop"));
			plans.setBudgetbottom((int) solrDocument.get("budgetbottom"));

			plans.setDepartureplace((String) solrDocument.get("departureplace"));
			plans.setDestination((String) solrDocument.get("destination"));
			plans.setDeparturetime((Date) solrDocument.get("departuretime"));

			plans.setEndtime((Date) solrDocument.get("endtime"));
			plans.setExpectnum((int) solrDocument.get("expectnum"));
			plans.setPresentnum((int) solrDocument.get("presentnum"));

			plans.setDetail((String) solrDocument.get("detail"));
			plans.setCreatby(Integer.parseInt((String) solrDocument
					.get("creatby")));
			plans.setCreattime((Date) solrDocument.get("creattime"));

			plans.setScore((double) solrDocument.get("score"));
			plans.setCommentcount((int) solrDocument.get("CommentCount"));
			plans.setNotecount((int) solrDocument.get("NoteCount"));
			plans.setPicpath((String) solrDocument.get("picpath"));

			lstPlans.add(plans);
		}

		return lstPlans;
	}

	/*
	    *//**
	 * 用姓名查找
	 * 
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public List<Plans> searchById(String id) throws Exception {

		List<Plans> lstPlans = new LinkedList<Plans>();
		HttpSolrClient client = new HttpSolrClient(serverUrl);

		// 创建查询对象
		SolrQuery query = new SolrQuery();
		query.setQuery("id:" + id);

		// 执行搜索、搜索结果
		QueryResponse queryResponse = client.query(query);
		SolrDocumentList results = queryResponse.getResults();
		Map<String, Map<String, List<String>>> highlighting = queryResponse
				.getHighlighting();

		for (SolrDocument solrDocument : results) {
			Plans plans = new Plans();
			plans.setId(Integer.parseInt((String) solrDocument.get("id")));
			plans.setTitle((String) solrDocument.get("title"));
			plans.setTag((String) solrDocument.get("tag"));

			plans.setType((int) solrDocument.get("type"));
			plans.setBudgettop((int) solrDocument.get("budgettop"));
			plans.setBudgetbottom((int) solrDocument.get("budgetbottom"));

			plans.setDepartureplace((String) solrDocument.get("departureplace"));
			plans.setDestination((String) solrDocument.get("destination"));
			plans.setDeparturetime((Date) solrDocument.get("departuretime"));

			plans.setEndtime((Date) solrDocument.get("endtime"));
			plans.setExpectnum((int) solrDocument.get("expectnum"));
			plans.setPresentnum((int) solrDocument.get("presentnum"));

			plans.setDetail((String) solrDocument.get("detail"));
			plans.setCreatby(Integer.parseInt((String) solrDocument
					.get("creatby")));
			plans.setCreattime((Date) solrDocument.get("creattime"));

			plans.setScore((double) solrDocument.get("score"));
			plans.setCommentcount((int) solrDocument.get("CommentCount"));
			plans.setNotecount((int) solrDocument.get("NoteCount"));
			plans.setPicpath((String) solrDocument.get("picpath"));
			
			lstPlans.add(plans);
		}

		return lstPlans;
	}

	/**
	 * 查找byId
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	/*
	 * public List<Users> searchById(int id)throws Exception{
	 * 
	 * List<Users> lstUsers = new ArrayList<Users>();
	 * 
	 * HttpSolrClient client = new HttpSolrClient(serverUrl);
	 * 
	 * //创建查询对象 SolrQuery query = new SolrQuery(); query.setQuery("id:"+id);
	 * 
	 * //执行搜索、搜索结果 QueryResponse queryResponse = client.query(query);
	 * SolrDocumentList results = queryResponse.getResults(); Map<String,
	 * Map<String, List<String>>> highlighting =
	 * queryResponse.getHighlighting();
	 * 
	 * for (SolrDocument solrDocument : results) { Users user=new
	 * Users(solrDocument.get("id"), solrDocument.get("name"),
	 * solrDocument.get("usertype"), solrDocument.get("regtime"),
	 * solrDocument.get("lastlogintime")); lstUsers.add(user); }
	 * 
	 * return lstUsers; }
	 *//**
	 * 删除所有索引
	 * 
	 * @param id
	 */
	/*
	 * private void deleteAll() { HttpSolrServer solrServer=new
	 * HttpSolrServer(serverUrl);
	 * 
	 * try { solrServer.deleteByQuery("*:*"); solrServer.commit(); } catch
	 * (Exception e) { e.printStackTrace(); } }
	 *//**
	 * 
	 * @param id
	 */
	public void deleteById(String id) {
		HttpSolrServer solrServer = new HttpSolrServer(serverUrl);

		try {
			solrServer.deleteById(id);
			solrServer.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

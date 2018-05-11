package com.travel.solr;

import java.io.IOException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrQuery.ORDER;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;

import com.travel.pojo.Comments;

public class CommentsSolr {
	private String serverUrl = "http://localhost:8080/solr/core_comments";

	/**
	 * 
	 * 向solr中增加纪录
	 * 
	 * @throws IOException
	 * @throws SolrServerException
	 */
	public void insert(Comments comments) throws SolrServerException,
			IOException {

		HttpSolrClient client = new HttpSolrClient(serverUrl);
		SolrInputDocument doc = new SolrInputDocument();

		doc.addField("id", comments.getId());
		doc.addField("planid", comments.getPlanid());
		doc.addField("noteid", comments.getNoteid());

		doc.addField("type", comments.getType());
		doc.addField("content", comments.getContent());
		doc.addField("trageid", comments.getTrageid());

		doc.addField("creatby", comments.getCreatby());
		doc.addField("creatbyname", comments.getCreatbyname());
		doc.addField("creattime", comments.getCreattime());

		client.add(doc);
		client.commit();

	}

	/*
	 * 用planid查找
	 * 
	 * @param name
	 * 
	 * @return
	 * 
	 * @throws Exception
	 */
	public List<Comments> searchByPlanId(String id) throws Exception {

		List<Comments> lstComments = new LinkedList<Comments>();
		HttpSolrClient client = new HttpSolrClient(serverUrl);

		// 创建查询对象
		SolrQuery query = new SolrQuery();
		query.setQuery("planid:" + id);
		query.setSort("creattime", ORDER.desc);
		query.setRows(120);

		// 执行搜索、搜索结果
		QueryResponse queryResponse = client.query(query);
		SolrDocumentList results = queryResponse.getResults();
		Map<String, Map<String, List<String>>> highlighting = queryResponse
				.getHighlighting();

		for (SolrDocument solrDocument : results) {
			Comments comment = new Comments();
			comment.setId(Integer.parseInt((String) solrDocument.get("id")));
			comment.setPlanid(Integer.parseInt((String) solrDocument
					.get("planid")));
			comment.setNoteid(Integer.parseInt((String) solrDocument
					.get("noteid")));

			comment.setType((int) solrDocument.get("type"));
			comment.setContent((String) solrDocument.get("content"));

			comment.setCreatby(Integer.parseInt((String) solrDocument
					.get("creatby")));
			comment.setCreatbyname((String) solrDocument.get("creatbyname"));
			comment.setCreattime((Date) solrDocument.get("creattime"));

			lstComments.add(comment);
		}

		return lstComments;
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

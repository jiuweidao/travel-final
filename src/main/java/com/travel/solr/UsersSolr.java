package com.travel.solr;

import java.io.IOException;

import java.util.ArrayList;
import java.util.List;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.junit.Test;

import com.travel.pojo.Users;


public class UsersSolr {
	 private String serverUrl = "http://localhost:8080/solr/core_insert";
	    /**
	     * 
	     * 向solr中增加纪录
	     * @throws IOException 
	     * @throws SolrServerException 
	     */
	 public void insert(Users user)throws SolrServerException, IOException{
		 HttpSolrClient client = new  HttpSolrClient(serverUrl);
		 SolrInputDocument doc = new SolrInputDocument();
		        
		 doc.addField("id", user.getId());
		 doc.addField("name", user.getName());
		 doc.addField("email",user.getEmail());
		 doc.addField("telemobil", user.getTelemoble());
		 
		 client.add(doc);
		 client.commit();
	 }
	 
	
}

package com.travel.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class ReportPage implements Serializable {
	
	private String id;
	
	private List<Reports> lstReports;
	
	private int count;
	
	private int page;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public List<Reports> getLstReports() {
		return lstReports;
	}

	public void setLstReports(List<Reports> lstReports) {
		this.lstReports = lstReports;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}
}
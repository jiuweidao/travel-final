package com.travel.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class PlanPage implements Serializable {
	
	private String id;
	
	private List<Plans> lstPlans;
	
	private int count;
	
	private String type;
	
	public PlanPage() {
		this.lstPlans = new LinkedList<>();
	}
	public List<Plans> getLstPlans() {
		return lstPlans;
	}


	public void setLstPlans(List<Plans> lstPlans) {
		this.lstPlans = lstPlans;
	}

	public void addPlans(Plans plans ) {
		this.lstPlans.add(plans);
	}
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
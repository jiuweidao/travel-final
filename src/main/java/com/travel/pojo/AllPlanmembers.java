package com.travel.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class AllPlanmembers implements Serializable {
	
	private Planmembers creater;
	
	private List<Planmembers> verifiedPlanmembers;
	
	private List<Planmembers> unVerifiedPlanmembers;
	
	private List<Planmembers> waitVerifiedPlanmembers;
	
	
	public AllPlanmembers() {
		this.verifiedPlanmembers = new LinkedList<>();
		this.unVerifiedPlanmembers = new LinkedList<>();
		this.waitVerifiedPlanmembers =new LinkedList<>();
	}

	public Planmembers getCreater() {
		return creater;
	}
	
	public void setCreater(Planmembers creater) {
		this.creater = creater;
	}
	
	
	public List<Planmembers> getVerifiedPlanmembers() {
		return verifiedPlanmembers;
	}
	
	public void setVerifiedPlanmembers(List<Planmembers> verifiedPlanmembers) {
		this.verifiedPlanmembers = verifiedPlanmembers;
	}
	
	public void addVerifiedPlanmembers(Planmembers planmembers) {
		this.verifiedPlanmembers.add(planmembers);
	}
	
	
	public List<Planmembers> getUnVerifiedPlanmembers() {
		return unVerifiedPlanmembers;
	}
	
	public void setUnVerifiedPlanmembers(List<Planmembers> unVerifiedPlanmembers) {
		this.unVerifiedPlanmembers = unVerifiedPlanmembers;
	}
	
	public void addUnVerifiedPlanmembers(Planmembers planmembers) {
		this.unVerifiedPlanmembers.add(planmembers);
	}
	
	
	public List<Planmembers> getWaitVerifiedPlanmembers() {
		return waitVerifiedPlanmembers;
	}
	
	public void setWaitVerifiedPlanmembers(List<Planmembers> waitVerifiedPlanmembers) {
		this.waitVerifiedPlanmembers = waitVerifiedPlanmembers;
	}
	public void addWaitVerifiedPlanmembers(Planmembers planmembers) {
		this.waitVerifiedPlanmembers.add(planmembers);
	}
  
}
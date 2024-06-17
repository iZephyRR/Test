package com.mart.model;

import java.io.Serializable;

public class CouponBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String code;
	private int dis_percent;
	private String endDate;
	private int adminId;
	
	
	public CouponBean() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public int getDis_percent() {
		return dis_percent;
	}
	public void setDis_percent(int dis_percent) {
		this.dis_percent = dis_percent;
	}
	
	
	
}

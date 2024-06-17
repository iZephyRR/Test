package com.mart.model;

import java.io.Serializable;
import java.util.Date;


public class ProductBean implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private Double unit_price;
	private Integer stock_qty;
	private String image;
	private String description;
	private Date date;
	private int adminId;
	private Integer pro_cate_id;
	private String pro_cate;
	
	public ProductBean() {
		super();
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getStock_qty() {
		return stock_qty;
	}
	public void setStock_qty(Integer stock_qty) {
		this.stock_qty = stock_qty;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Integer getPro_cate_id() {
		return pro_cate_id;
	}

	public void setPro_cate_id(Integer pro_cate_id) {
		this.pro_cate_id = pro_cate_id;
	}

	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}

	public Double getUnit_price() {
		return unit_price;
	}

	public void setUnit_price(Double unit_price) {
		this.unit_price = unit_price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPro_cate() {
		return pro_cate;
	}

	public void setPro_cate(String pro_cate) {
		this.pro_cate = pro_cate;
	}
	
	
}

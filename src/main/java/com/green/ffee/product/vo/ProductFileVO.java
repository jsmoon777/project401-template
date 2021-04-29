package com.green.ffee.product.vo;

import java.sql.Date;

public class ProductFileVO {
	private int file_no;
	private int product_id;
	private String org_file_name;
	private String stored_file_name;
	private int file_size;
	private Date regdate;
	private String del_gb;
	
	//추가될 사항
	private String product_name;
	private String product_price;
	private int cnt;
	
	public ProductFileVO() {
		
	}

	public ProductFileVO(int file_no, int product_id, String org_file_name, String stored_file_name, int file_size,
			Date regdate, String del_gb, String product_name, String product_price, int cnt) {
		super();
		this.file_no = file_no;
		this.product_id = product_id;
		this.org_file_name = org_file_name;
		this.stored_file_name = stored_file_name;
		this.file_size = file_size;
		this.regdate = regdate;
		this.del_gb = del_gb;
		this.product_name = product_name;
		this.product_price = product_price;
		this.cnt = cnt;
	}

	public int getFile_no() {
		return file_no;
	}

	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getOrg_file_name() {
		return org_file_name;
	}

	public void setOrg_file_name(String org_file_name) {
		this.org_file_name = org_file_name;
	}

	public String getStored_file_name() {
		return stored_file_name;
	}

	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}

	public int getFile_size() {
		return file_size;
	}

	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getDel_gb() {
		return del_gb;
	}

	public void setDel_gb(String del_gb) {
		this.del_gb = del_gb;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_price() {
		return product_price;
	}

	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "ProductFileVO [file_no=" + file_no + ", product_id=" + product_id + ", org_file_name=" + org_file_name
				+ ", stored_file_name=" + stored_file_name + ", file_size=" + file_size + ", regdate=" + regdate
				+ ", del_gb=" + del_gb + ", product_name=" + product_name + ", product_price=" + product_price
				+ ", cnt=" + cnt + "]";
	}
	
}

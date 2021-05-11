package com.green.ffee.product.vo;

public class ProductVO {
	private int product_id;
	private String product_name;
	private int product_price;
	private String product_desc;
	private String product_url;

	
	//원가
	private int product_price2;
	private String product_tag;
	
	
	public ProductVO() {
		
	}


	public ProductVO(int product_id, String product_name, int product_price, String product_desc, String product_url,
			int product_price2, String product_tag) {
		super();
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_desc = product_desc;
		this.product_url = product_url;
		this.product_price2 = product_price2;
		this.product_tag = product_tag;
	}


	public int getProduct_id() {
		return product_id;
	}


	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}


	public String getProduct_name() {
		return product_name;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}


	public int getProduct_price() {
		return product_price;
	}


	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}


	public String getProduct_desc() {
		return product_desc;
	}


	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}


	public String getProduct_url() {
		return product_url;
	}


	public void setProduct_url(String product_url) {
		this.product_url = product_url;
	}


	public int getProduct_price2() {
		return product_price2;
	}


	public void setProduct_price2(int product_price2) {
		this.product_price2 = product_price2;
	}


	public String getProduct_tag() {
		return product_tag;
	}


	public void setProduct_tag(String product_tag) {
		this.product_tag = product_tag;
	}


	@Override
	public String toString() {
		return "ProductVO [product_id=" + product_id + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_desc=" + product_desc + ", product_url=" + product_url
				+ ", product_price2=" + product_price2 + ", product_tag=" + product_tag + "]";
	}

	
}

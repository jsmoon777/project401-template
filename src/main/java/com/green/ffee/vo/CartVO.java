package com.green.ffee.vo;

public class CartVO {
	private int 		cartId; 
	private String    	userId;
	private int    		productId ;
	private int    		amount;
	
	//상품목록
	private String   	userName;
	private String  	productName; 
	private int  		productPrice;
	
	//돈
	private int 		money;
	private int 		allSum;
      
	//수량
	private int 		count;
	
	//사진 이랑 썸네일 사진 
	private String stored_file_name;
	private String cnt;
	
	
	public CartVO() {
		
	}


	public CartVO(int cartId, String userId, int productId, int amount, String userName, String productName,
			int productPrice, int money, int allSum, int count, String stored_file_name, String cnt) {
		super();
		this.cartId = cartId;
		this.userId = userId;
		this.productId = productId;
		this.amount = amount;
		this.userName = userName;
		this.productName = productName;
		this.productPrice = productPrice;
		this.money = money;
		this.allSum = allSum;
		this.count = count;
		this.stored_file_name = stored_file_name;
		this.cnt = cnt;
	}


	public int getCartId() {
		return cartId;
	}


	public void setCartId(int cartId) {
		this.cartId = cartId;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public int getProductId() {
		return productId;
	}


	public void setProductId(int productId) {
		this.productId = productId;
	}


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public int getProductPrice() {
		return productPrice;
	}


	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}


	public int getMoney() {
		return money;
	}


	public void setMoney(int money) {
		this.money = money;
	}


	public int getAllSum() {
		return allSum;
	}


	public void setAllSum(int allSum) {
		this.allSum = allSum;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public String getStored_file_name() {
		return stored_file_name;
	}


	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}


	public String getCnt() {
		return cnt;
	}


	public void setCnt(String cnt) {
		this.cnt = cnt;
	}


	@Override
	public String toString() {
		return "CartVO [cartId=" + cartId + ", userId=" + userId + ", productId=" + productId + ", amount=" + amount
				+ ", userName=" + userName + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", money=" + money + ", allSum=" + allSum + ", count=" + count + ", stored_file_name="
				+ stored_file_name + ", cnt=" + cnt + "]";
	}

	

	

	
	
	
}

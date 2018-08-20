package com.haitao.entity;

public class ShoppingCart {
	private Integer shoppingCartID;
	private String customerName;
	private String storeName;
	private String productName;
	private String productId;
	private Integer productNum;
	private String productPrice;
	private String buyPrice;
	private String discount;
	
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(String buyPrice) {
		this.buyPrice = buyPrice;
	}
	public Integer getShoppingCartID() {
		return shoppingCartID;
	}
	public void setShoppingCartID(Integer shoppingCartID) {
		this.shoppingCartID = shoppingCartID;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getProductNum() {
		return productNum;
	}
	public void setProductNum(Integer productNum) {
		this.productNum = productNum;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public ShoppingCart(Integer shoppingCartID, String customerName,
			String storeName, String productName, String productId,
			Integer productNum, String productPrice, String buyPrice,
			String discount) {
		super();
		this.shoppingCartID = shoppingCartID;
		this.customerName = customerName;
		this.storeName = storeName;
		this.productName = productName;
		this.productId = productId;
		this.productNum = productNum;
		this.productPrice = productPrice;
		this.buyPrice = buyPrice;
		this.discount = discount;
	}
	public ShoppingCart() {
	}
	
}

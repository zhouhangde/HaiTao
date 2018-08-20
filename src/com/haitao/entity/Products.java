package com.haitao.entity;

public class Products {
	private Integer productId;
	private Integer categoryId;
	private Integer storeId;
	private String productName;
	private String price;
	private String productPrice;
	private Integer productNum;
	private String productDescription;
	private String productImage;
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public Integer getStoreId() {
		return storeId;
	}
	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public Integer getProductNum() {
		return productNum;
	}
	public void setProductNum(Integer productNum) {
		this.productNum = productNum;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	public Products(Integer productId, Integer categoryId, Integer storeId,
			String productName, String price, String productPrice,
			Integer productNum, String productDescription, String productImage) {
		this.productId = productId;
		this.categoryId = categoryId;
		this.storeId = storeId;
		this.productName = productName;
		this.price = price;
		this.productPrice = productPrice;
		this.productNum = productNum;
		this.productDescription = productDescription;
		this.productImage = productImage;
	}
	public Products() {
	}

}

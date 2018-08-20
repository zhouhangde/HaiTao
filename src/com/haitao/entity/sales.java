package com.haitao.entity;

public class sales {
	private Integer saleId;
	private String cousometName;
	private Integer productId;
	private String	productName;
	private String  productPrice;
	private String	buyPrice;
	private String  discount;
	private String  saleCount;
	private String	saleTime;
	
	
	
	public Integer getSaleId() {
		return saleId;
	}

	public void setSaleId(Integer saleId) {
		this.saleId = saleId;
	}

	public String getCousometName() {
		return cousometName;
	}

	public void setCousometName(String cousometName) {
		this.cousometName = cousometName;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}

	public String getBuyPrice() {
		return buyPrice;
	}

	public void setBuyPrice(String buyPrice) {
		this.buyPrice = buyPrice;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public String getSaleCount() {
		return saleCount;
	}

	public void setSaleCount(String saleCount) {
		this.saleCount = saleCount;
	}

	public String getSaleTime() {
		return saleTime;
	}

	public void setSaleTime(String saleTime) {
		this.saleTime = saleTime;
	}

	public sales() {
	}

	public sales(Integer saleId, String cousometName, Integer productId,
			String productName, String productPrice, String buyPrice,
			String discount, String saleCount, String saleTime) {
		this.saleId = saleId;
		this.cousometName = cousometName;
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.buyPrice = buyPrice;
		this.discount = discount;
		this.saleCount = saleCount;
		this.saleTime = saleTime;
	}
	
	
}

package com.haitao.entity;

public class Customer {
	private Integer customerId;
	private Integer roleId;
	private String customerName;
	private String customerPwd;
	private String Name;
	private String customerSex;
	private String customerPhone;
	private String customerAddress;
	private String customerMail;
	private Integer customerScore;
	private String customerRank;
	private String customerMoney;
	public Integer getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerPwd() {
		return customerPwd;
	}
	public void setCustomerPwd(String customerPwd) {
		this.customerPwd = customerPwd;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getCustomerSex() {
		return customerSex;
	}
	public void setCustomerSex(String customerSex) {
		this.customerSex = customerSex;
	}
	public String getCustomerPhone() {
		return customerPhone;
	}
	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}
	public String getCustomerAddress() {
		return customerAddress;
	}
	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}
	public String getCustomerMail() {
		return customerMail;
	}
	public void setCustomerMail(String customerMail) {
		this.customerMail = customerMail;
	}
	public Integer getCustomerScore() {
		return customerScore;
	}
	public void setCustomerScore(Integer customerScore) {
		this.customerScore = customerScore;
	}
	public String getCustomerRank() {
		return customerRank;
	}
	public void setCustomerRank(String customerRank) {
		this.customerRank = customerRank;
	}
	public String getCustomerMoney() {
		return customerMoney;
	}
	public void setCustomerMoney(String customerMoney) {
		this.customerMoney = customerMoney;
	}
	public Customer(Integer customerId, Integer roleId, String customerName,
			String customerPwd, String name, String customerSex,
			String customerPhone, String customerAddress, String customerMail,
			Integer customerScore, String customerRank, String customerMoney) {
		this.customerId = customerId;
		this.roleId = roleId;
		this.customerName = customerName;
		this.customerPwd = customerPwd;
		Name = name;
		this.customerSex = customerSex;
		this.customerPhone = customerPhone;
		this.customerAddress = customerAddress;
		this.customerMail = customerMail;
		this.customerScore = customerScore;
		this.customerRank = customerRank;
		this.customerMoney = customerMoney;
	}
	public Customer() {
	}
	public Customer(String customerName, String customerPwd, String name,
			String customerSex, String customerPhone, String customerAddress,
			String customerMail) {
		this.customerName = customerName;
		this.customerPwd = customerPwd;
		Name = name;
		this.customerSex = customerSex;
		this.customerPhone = customerPhone;
		this.customerAddress = customerAddress;
		this.customerMail = customerMail;
	}
	
}

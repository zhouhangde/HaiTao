package com.haitao.entity;

public class ManagerLogin {
	private Integer adminId;
	private Integer roleId;
	private String adminName;
	private String adminPwd;
	private Roles rol;
	
	
	public ManagerLogin() {
	}
	public ManagerLogin(Integer adminId, Integer roleId, String adminName,
			String adminPwd) {
		this.adminId = adminId;
		this.roleId = roleId;
		this.adminName = adminName;
		this.adminPwd = adminPwd;
	}
	public Integer getAdminId() {
		return adminId;
	}
	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminPwd() {
		return adminPwd;
	}
	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}
	public Roles getRol() {
		return rol;
	}
	public void setRol(Roles rol) {
		this.rol = rol;
	}
	
	
	

}

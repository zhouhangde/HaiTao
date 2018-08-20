package com.haitao.service;

import java.util.List;

import com.haitao.dao.ManagerLoginDao;
import com.haitao.entity.ManagerLogin;





public class ManagerLoginService {
	
	
	public int SelectAllManager(String adminName,String adminPwd){
		int i =0;
		ManagerLoginDao	dao = new ManagerLoginDao();
	    List<ManagerLogin> list =dao.SelectAllManager();
		for(ManagerLogin m:list){
			if(adminName.equals(m.getAdminName()) && adminPwd.equals(m.getAdminPwd())){
				 i =1;
				
			}
		}
		return i;
	}

}

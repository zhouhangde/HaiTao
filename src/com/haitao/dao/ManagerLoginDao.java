package com.haitao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.haitao.entity.ManagerLogin;

public class ManagerLoginDao extends DBManager {
	private Connection con =null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	
	public List<ManagerLogin> SelectAllManager(){
		List<ManagerLogin> list = new ArrayList<ManagerLogin>();
		String sql = "select admin_name,admin_pwd from admin where role_id=1";
		try {
			con = DBManager.getconnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				ManagerLogin manager =  new ManagerLogin();
				manager.setAdminName(rs.getString(1));
				manager.setAdminPwd(rs.getString(2));
				list.add(manager);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				super.CloseAll(rs, ps, con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}

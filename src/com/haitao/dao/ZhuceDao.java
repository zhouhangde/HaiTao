package com.haitao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.haitao.entity.Customer;


public class ZhuceDao extends DBManager{
	private Connection con=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	// ²éÑ¯
	public List<Customer> selectCustomer(){
		List<Customer> list=new ArrayList<Customer>();
		con=super.getconnection();
		try {
			ps=con.prepareStatement("select customer_name,customer_pwd,name,customer_sex,customer_phone,customer_address,customer_mail from customer");
			rs=ps.executeQuery();
			while(rs.next()){
				list.add(new Customer(rs.getString(1), rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try{
				super.CloseAll(rs, ps, con);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return list;
	}
	//×¢²áÌí¼Ó 
	public Integer CustomerZhuce(String customerName,String customerPwd,String Name,String customerSex,String customerPhone,String customerAddress,String customerMail){
		Integer i=0;
		con=super.getconnection();
		try {
			ps=con.prepareStatement("insert customer(customer_name,customer_pwd,name,customer_sex,customer_phone,customer_address,customer_mail) values(?,?,?,?,?,?,?)");
			ps.setString(1, customerName);
			ps.setString(2, customerPwd);
			ps.setString(3, Name);
			ps.setString(4, customerSex);
			ps.setString(5, customerPhone);
			ps.setString(6, customerAddress);
			ps.setString(7, customerMail);
			i=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try{
				super.CloseAll(rs, ps, con);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return i;
	}
}

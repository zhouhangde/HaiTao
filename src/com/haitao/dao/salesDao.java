package com.haitao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.haitao.entity.CustomerLogin;
import com.haitao.entity.sales;

public class salesDao extends DBManager{
	private Connection con =null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	public List<sales> SelectAll(String customerName){
		List<sales> list = new ArrayList<sales>();
		String sql = "select * from sales where customer_name=?";
		try {
			con = DBManager.getconnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, customerName);
			rs = ps.executeQuery();
			while(rs.next()){
				sales sales =  new sales();
				sales.setSaleId(rs.getInt(1));
				sales.setProductName(rs.getString(3));
				sales.setProductPrice(rs.getString(4));
				sales.setBuyPrice(rs.getString(5));
				sales.setSaleCount(rs.getString(7));
				sales.setSaleTime(rs.getString(8));
				list.add(sales);
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
	
	public int add(String customerName,String productName,String productPrice,String buyPrice,String discount,String saleCount,String saleTime,String productId){
		int i=0;
		String sql = "insert sales (customer_name,product_name,product_price,buy_price,discount,sale_count,sale_time,product_id) values (?,?,?,?,?,?,?,?)";
		try {
			con = DBManager.getconnection();
			ps = con.prepareStatement(sql);
			ps.setString(2, productName);
			ps.setString(3, productPrice);
			ps.setString(4, buyPrice);
			ps.setString(5, discount);
			ps.setString(6, saleCount);
			ps.setString(7, saleTime);
			ps.setString(1, customerName);
			ps.setString(8, productId);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				super.CloseAll(rs, ps, con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return i;
	}
}

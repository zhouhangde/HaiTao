package com.haitao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.haitao.entity.ShoppingCart;

public class ShoppingCartDao extends DBManager{
	private Connection con =null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	//通过客户姓名选择相应购物车内容
	public List<ShoppingCart> SelectShoppingCart(String customerName){
		List<ShoppingCart> list = new ArrayList<ShoppingCart>();
		String sql = "select * from shoppingCart where customer_name=?";
		try {
			con = super.getconnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, customerName);
			rs = ps.executeQuery();
			while(rs.next()){
				ShoppingCart shop =  new ShoppingCart();
				shop.setShoppingCartID(rs.getInt(1));
				shop.setProductName(rs.getString(4));
				shop.setProductNum(rs.getInt(5));
				shop.setProductPrice(rs.getString(6));
				shop.setBuyPrice(rs.getString(7));
				shop.setDiscount(rs.getString(8));
				shop.setProductId(rs.getString(9));
				list.add(shop);
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
	//购物车删除
	public Integer DeleteShoppingCart(Integer shoppingCartId){
		Integer i=0;
		con=super.getconnection();
		try {
			ps=con.prepareStatement("DELETE FROM shoppingcart WHERE shoppingCart_id=?");
			ps.setInt(1, shoppingCartId);
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
	//购物车商品数量添加
	public Integer updateShoppingCartCount(Integer productNum,Integer shoppingCartId){
		Integer i=0;
		con=super.getconnection();
		try {
			ps=con.prepareStatement("update shoppingcart set product_num=? where shoppingCart_id=?");
			ps.setInt(1, productNum);
			ps.setInt(2, shoppingCartId);
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
	//添加至购物车
	public Integer addShoppingCartCount(String customerName,String productName,Integer productNum,String productPrice,String buyPrice,String discount){
		Integer i=0;
		con=super.getconnection();
		try {
			ps=con.prepareStatement("insert shoppingcart(customer_name,product_name,product_num,product_price,buy_price,discount) values(?,?,?,?,?,?)");
			ps.setString(1, customerName);
			ps.setString(2, productName);
			ps.setInt(3, productNum);
			ps.setString(4, productPrice);
			ps.setString(5, buyPrice);
			ps.setString(6, discount);
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
	
	public ShoppingCart SelectShopping(Integer ShoppingCartID){
		List<ShoppingCart> list = new ArrayList<ShoppingCart>();
		String sql = "select * from shoppingCart where shoppingCart_id=?";
		ShoppingCart shop =  new ShoppingCart();
		try {
			con = super.getconnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, ShoppingCartID);
			rs = ps.executeQuery();
			while(rs.next()){
				shop.setShoppingCartID(rs.getInt(1));
				shop.setProductName(rs.getString(4));
				shop.setProductNum(rs.getInt(5));
				shop.setProductPrice(rs.getString(6));
				shop.setBuyPrice(rs.getString(7));
				shop.setDiscount(rs.getString(8));
				shop.setProductId(rs.getString(9));
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
		return shop;
	}
}

package com.haitao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.haitao.entity.Products;

public class ProductSearchDao extends DBManager{
	private Connection con=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	// 商品条件查询
	public List<Products> selectProducts(String value){
		List<Products> list = new ArrayList<Products>();
		try{
			/*super即为DBManager*/
			con=super.getconnection();
			ps=con.prepareStatement("select  * from products where product_name like ?");
			/*1表示第一个占位符？*/
			ps.setString(1, "%"+value+"%");
			rs=ps.executeQuery();
			while(rs.next()){
				Products products=new Products();
				products.setProductId(rs.getInt(1));
				products.setProductName(rs.getString(4));
				products.setPrice((rs.getString(5)));
				products.setProductPrice(rs.getString(6));
				products.setProductNum(rs.getInt(7));
				products.setProductDescription(rs.getString(8));
				products.setProductImage(rs.getString(9));
				list.add(products);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				super.CloseAll(rs, ps, con);
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return list;
	}
	public int updateProducts(String productId,Integer productNum){
		int i=0;
		try{
			con=super.getconnection();
			ps=con.prepareStatement("update products set product_num=? where product_id =?");
			ps.setInt(1,productNum);
			ps.setString(2,productId);
			i=ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				super.CloseAll(rs, ps, con);
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return i;
	}
	public Products selectProduct(String productId){
		Products products=new Products();
		try{
			con=super.getconnection();
			ps=con.prepareStatement("select  * from products where product_id=?");
			ps.setString(1, productId);
			rs=ps.executeQuery();
			while(rs.next()){
				products.setProductId(rs.getInt(1));
				products.setProductName(rs.getString(4));
				products.setPrice((rs.getString(5)));
				products.setProductPrice(rs.getString(6));
				products.setProductNum(rs.getInt(7));
				products.setProductDescription(rs.getString(8));
				products.setProductImage(rs.getString(9));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				super.CloseAll(rs, ps, con);
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return products;
	}
}
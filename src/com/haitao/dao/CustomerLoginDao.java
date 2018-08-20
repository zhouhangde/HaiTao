package com.haitao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.haitao.entity.CustomerLogin;


public class CustomerLoginDao extends DBManager {
	/*创建数据库连接对象*/
	private Connection con =null;
	/*PreparedStatement 对数据库进行增删改查*/
	private PreparedStatement ps = null;
	/*包含符合SQL语句中条件的所有结果集*/
	private ResultSet rs = null;
	
	public List<CustomerLogin> SelectAllCustomer(){
		List<CustomerLogin> list = new ArrayList<CustomerLogin>();
		String sql = "select * from customer where role_id=2";
		try {
			con = DBManager.getconnection();
			/*它是Statement接口的子接口；PreparedStatement批处理，也叫预编译声明，防止SQL攻击；*/
			ps = con.prepareStatement(sql);
			/*java环境自带的执行查询，返回的ResultSet 集合*/
			rs = ps.executeQuery();
			/*rs.next()表示的集合表中的第一个对象，是游标向下移动一行的意思，返回为true或false，*/
			while(rs.next()){
				CustomerLogin customer =  new CustomerLogin();
				/*getString表示以String 的形式获取此 ResultSet 对象的当前行中指定列的值*/
				customer.setCustomerName(rs.getString(3));
				customer.setCustomerPwd(rs.getString(4));
				list.add(customer);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			/*finally块里的代码一定会被执行，关闭connection对象*/
			try {
				super.CloseAll(rs, ps, con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	public CustomerLogin SelectAllCustomers(String customer_name){
		CustomerLogin customer =  new CustomerLogin();
		String sql = "select * from customer where role_id=2 and customer_name=?";
		try {
			con = DBManager.getconnection();
			ps = con.prepareStatement(sql);
			ps.setString(1,customer_name);
			/*executeQuery产生单个结果集的语句*/
			rs = ps.executeQuery();
			while(rs.next()){
				
				customer.setCustomerName(rs.getString(3));
				customer.setCustomerPwd(rs.getString(4));
				customer.setName(rs.getString(5));
				customer.setCustomerMail(rs.getString(9));
				customer.setCustomerPhone(rs.getString(7));
				customer.setCustomerAddress(rs.getString(8));
				customer.setCustomerMoney(rs.getString(12));
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
		return customer;
	}
	
	public boolean updateCustomer(CustomerLogin customer){
		String sql = "UPDATE customer SET customer_pwd=?,NAME=?,customer_mail=?,customer_phone=?,customer_address=? WHERE customer_name=?";
		boolean flag = false;
		try {
			con =DBManager.getconnection();
			ps = con .prepareStatement(sql);
			ps.setString(1,customer.getCustomerPwd());
			ps.setString(2, customer.getName());
			ps.setString(3, customer.getCustomerMail());
			ps.setString(4, customer.getCustomerPhone());
			ps.setString(5, customer.getCustomerAddress());
			ps.setString(6, customer.getCustomerName());
			/*execute用于执行返回多个结果集、多个更新计数或二者组合的语句*/
			flag = ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				super.CloseAll(null, ps, con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	public int updateMoney(String customerName,String customeMoney){
		String sql = "UPDATE customer SET customer_money=? WHERE customer_name=?";
		int i=0;
		try {
			con =DBManager.getconnection();
			ps = con .prepareStatement(sql);
			ps.setString(1,customeMoney);
			ps.setString(2, customerName);
			/*executeUpdate 的返回值是一个整数，指示受影响的行数*/
			i= ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				super.CloseAll(null, ps, con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return i;
	}
}

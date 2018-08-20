package com.haitao.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBManager {
	/*取得Connection*/
	/*接口不能实例化，只能靠实现接口的类实例化。*/
	public static Connection getconnection(){
		Connection con =null;
		
		try {
			/*加载驱动类*/
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (InstantiationException e) {
			/*//追踪异常事件发生时执行堆栈的内容*/
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			/*创建数据库连接，调用都是类同步的*/
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/haitaowang","root","root");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	/*用于将Connection对象释放,防止堆栈溢出*/
	public void CloseAll(ResultSet rs,PreparedStatement ps,Connection con ) throws SQLException{
		if(rs!=null){
			rs.close();
		}
		if(ps!= null){
			ps.close();
		}
		if(con!=null){
			con.close();
		}
	}
	

}

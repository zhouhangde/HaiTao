package com.haitao.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBManager {
	/*ȡ��Connection*/
	/*�ӿڲ���ʵ������ֻ�ܿ�ʵ�ֽӿڵ���ʵ������*/
	public static Connection getconnection(){
		Connection con =null;
		
		try {
			/*����������*/
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (InstantiationException e) {
			/*//׷���쳣�¼�����ʱִ�ж�ջ������*/
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			/*�������ݿ����ӣ����ö�����ͬ����*/
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/haitaowang","root","root");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	/*���ڽ�Connection�����ͷ�,��ֹ��ջ���*/
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

package com.haitao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.haitao.entity.CustomerLogin;


public class CustomerLoginDao extends DBManager {
	/*�������ݿ����Ӷ���*/
	private Connection con =null;
	/*PreparedStatement �����ݿ������ɾ�Ĳ�*/
	private PreparedStatement ps = null;
	/*��������SQL��������������н����*/
	private ResultSet rs = null;
	
	public List<CustomerLogin> SelectAllCustomer(){
		List<CustomerLogin> list = new ArrayList<CustomerLogin>();
		String sql = "select * from customer where role_id=2";
		try {
			con = DBManager.getconnection();
			/*����Statement�ӿڵ��ӽӿڣ�PreparedStatement������Ҳ��Ԥ������������ֹSQL������*/
			ps = con.prepareStatement(sql);
			/*java�����Դ���ִ�в�ѯ�����ص�ResultSet ����*/
			rs = ps.executeQuery();
			/*rs.next()��ʾ�ļ��ϱ��еĵ�һ���������α������ƶ�һ�е���˼������Ϊtrue��false��*/
			while(rs.next()){
				CustomerLogin customer =  new CustomerLogin();
				/*getString��ʾ��String ����ʽ��ȡ�� ResultSet ����ĵ�ǰ����ָ���е�ֵ*/
				customer.setCustomerName(rs.getString(3));
				customer.setCustomerPwd(rs.getString(4));
				list.add(customer);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			/*finally����Ĵ���һ���ᱻִ�У��ر�connection����*/
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
			/*executeQuery������������������*/
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
			/*execute����ִ�з��ض���������������¼����������ϵ����*/
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
			/*executeUpdate �ķ���ֵ��һ��������ָʾ��Ӱ�������*/
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

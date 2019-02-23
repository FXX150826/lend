package com.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import JDBC.*;



public class loginCheck {
	static Connection conn = null;
	static Statement stmt=null;
	static ResultSet rs=null;
	 public static boolean checkManager(Manager manager) {
		 boolean flag = false;
	        try {
	        	rs=DBGet.lookTheManager(manager.getCode());
	            if (rs.next()) {
	                String pwd = manager.getPwd();		//获取输入的密码并过滤输入字符串中的危险字符
	                flag = pwd.equals(rs.getString("pwd"));
	              if(flag){
	            	  manager.setName(rs.getString("name"));
	              }
	            }else{
	                flag = false;
	            }
	        } catch (SQLException ex) {
	            flag = false;
	        }
	        return flag;
	    }
	 public static boolean checkUser(User user) {
	       boolean flag = false;
	        try {
	        	rs=DBGet.lookTheUser(user.getCode());
	            if (rs.next()) {
	                String pwd = user.getPwd();		//获取输入的密码并过滤输入字符串中的危险字符
	                flag = pwd.equals(rs.getString("pwd"));
	              if(flag){
	            	  user.setName(rs.getString("name"));
	            	  user.setId(rs.getString("id"));
	              }
	            }else{
	                flag = false;
	            }
	        } catch (SQLException ex) {
	            flag = false;
	        }
	        return flag;
	    }
}

package com.action;
import java.sql.*;
import JDBC.*;

public class DBGet {

	public static Connection getConnection() {
		Connection conn = null;
		try {
//			连接mySql
//			Class.forName("com.mysql.jdbc.Driver");
//			conn = DriverManager.getConnection(
//					"jdbc:mysql://localhost:3306/test", "root",
//					"root");
			
//			连接SQL Server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn=(Connection)DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=test","root","root");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void closeConnection(Connection conn) {
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void closeStatement(Statement stmt) {
		try {
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void closePrepareStatement(PreparedStatement ps) {
		try {
			if (ps != null) {
				ps.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void closeResultSet(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

public static boolean addUser(User user){
	Connection conn = null;
	Statement stmt=null;
	try{
		conn=DBGet.getConnection();
		 String code=user.getCode();
         //byte b1[]=code.getBytes("ISO-8859-1");
         //code=new String(b1,"UTF-8");
         
         String name=user.getName();
         ///byte b2[]=name.getBytes("ISO-8859-1");
         //name=new String(b2,"UTF-8");
         
         String id=user.getId();
         //byte b3[]=id.getBytes("ISO-8859-1");
         //id=new String(b3,"UTF-8");
         
         String pwd=user.getPwd();
         //byte b4[]=pwd.getBytes("ISO-8859-1");
         //pwd=new String(b4,"UTF-8");
         
		String sql="insert into [user] values('"+code+"','"+name+"','"+id+"','"+pwd+"')";
        stmt= conn.createStatement();
        int num=stmt.executeUpdate(sql);
        if(num>0){
        	return true;
        }
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBGet.closeStatement(stmt);
		DBGet.closeConnection(conn);
	}
	return false;
}
public static boolean updateUser(User user){
	Connection conn = null;
	PreparedStatement ps=null;
	try{
		boolean flag=DBGet.deleteUser(user.getCode());
		if(flag){
			flag=DBGet.addUser(user);
		}
        if(flag){
        	return true;
        }
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBGet.closePrepareStatement(ps);
		DBGet.closeConnection(conn);
	}
	return false;
}
public static boolean deleteUser(String code){
	Connection conn = null;
	Statement stmt=null;
	try{
		conn=DBGet.getConnection();
        String sql="delete  from [user] where code="+code;
        stmt=conn.createStatement();
        int num=stmt.executeUpdate(sql);
        if(num>0){
        	return true;
        }
	}catch(Exception e){
		e.printStackTrace();
	}finally{
DBGet.closeStatement(stmt);
		DBGet.closeConnection(conn);
	}
	return false;
}

public static ResultSet lookUser(){
	Connection conn = null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
		conn=DBGet.getConnection();
		stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
        String sql="select * from [user]";//user关键字做表名。使用[]区分
        rs=stmt.executeQuery(sql);
        return rs;
	}catch (Exception e) {
		e.printStackTrace();
	}finally{
//		closeConnection(conn);
//		closeStatement(stmt);
//		closeResultSet(rs);
	}
	return rs;
}

public static  ResultSet lookTheUser(String code){
	Connection conn = null;
	Statement stmt=null;
	ResultSet rs=null;
	try{
		conn=DBGet.getConnection();
		stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
        String sql="select * from [user] where code="+code;
        rs=stmt.executeQuery(sql);
        return rs;
	}catch (Exception e) {
		e.printStackTrace();
	}finally{
//		closePrepareStatement(ps);
//		closeConnection(conn);
//		closeResultSet(rs);
	}
	return rs;
}
public static ResultSet lookCar(){
	Connection conn = null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
		conn=DBGet.getConnection();
		stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
        String sql="select * from car";
        rs=stmt.executeQuery(sql);
        return rs;
	}catch (Exception e) {
		e.printStackTrace();
	}finally{
//		closeConnection(conn);
//		closeStatement(stmt);
//		closeResultSet(rs);
	}
	return rs;
}

public static  ResultSet lookTheCar(String code){
	Connection conn = null;
	Statement stmt=null;
	ResultSet rs=null;
	try{
		conn=DBGet.getConnection();
		stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
        String sql="select * from car where code="+code;
        rs=stmt.executeQuery(sql);
        return rs;
	}catch (Exception e) {
		e.printStackTrace();
	}finally{
//		closePrepareStatement(ps);
//		closeConnection(conn);
//		closeResultSet(rs);
	}
	return rs;
}
public static  ResultSet lookTheManager(String code){
	Connection conn = null;
	Statement stmt=null;
	ResultSet rs=null;
	try{
		conn=DBGet.getConnection();
		stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
        String sql="select * from manager where code="+code;
        rs=stmt.executeQuery(sql);
        return rs;
	}catch (Exception e) {
		e.printStackTrace();
	}finally{
//		closePrepareStatement(ps);
//		closeConnection(conn);
//		closeResultSet(rs);
	}
	return rs;
}
public static boolean addCar(Car car){
	Connection conn = null;
	Statement stmt=null;
	try{
		conn=DBGet.getConnection();
		 String code=car.getCode();
         byte b1[]=code.getBytes("ISO-8859-1");
         code=new String(b1,"UTF-8");
         
         String type=car.getType();
         byte b2[]=type.getBytes("ISO-8859-1");
         type=new String(b2,"UTF-8");
         
         String brand=car.getBrand();
         byte b3[]=brand.getBytes("ISO-8859-1");
         brand=new String(b3,"UTF-8");
         
         String num=car.getNum();
         byte b4[]=num.getBytes("ISO-8859-1");
         num=new String(b4,"UTF-8");
         String price=car.getPrice();
         
		String sql="insert into car values('"+code+"','"+type+"','"+brand+"','"+num+"',"+price+")";
        stmt= conn.createStatement();
        int numCar=stmt.executeUpdate(sql);
        if(numCar>0){
        	return true;
        }
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBGet.closeStatement(stmt);
		DBGet.closeConnection(conn);
	}
	return false;
}
public static boolean updateCar(Car car){
	Connection conn = null;
	PreparedStatement ps=null;
	try{
		boolean flag=DBGet.deleteCar(car.getCode());
		if(flag){
			flag=DBGet.addCar(car);
		}
        if(flag){
        	return true;
        }
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBGet.closePrepareStatement(ps);
		DBGet.closeConnection(conn);
	}
	return false;
}
public static boolean deleteCar(String code){
	Connection conn = null;
	Statement stmt=null;
	try{
		conn=DBGet.getConnection();
        String sql="delete  from car where code="+code;
        stmt=conn.createStatement();
        int num=stmt.executeUpdate(sql);
        if(num>0){
        	return true;
        }
	}catch(Exception e){
		e.printStackTrace();
	}finally{
DBGet.closeStatement(stmt);
		DBGet.closeConnection(conn);
	}
	return false;
}
public static ResultSet lookLend(){
	Connection conn = null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
		conn=DBGet.getConnection();
		stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
        String sql="select * from lend";
        rs=stmt.executeQuery(sql);
        return rs;
	}catch (Exception e) {
		e.printStackTrace();
	}finally{
//		closeConnection(conn);
//		closeStatement(stmt);
//		closeResultSet(rs);
	}
	return rs;
}
public static  ResultSet lookTheLend(String code){
	Connection conn = null;
	Statement stmt=null;
	ResultSet rs=null;
	try{
		conn=DBGet.getConnection();
		stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
        String sql="select * from lend where userCode="+code;
        rs=stmt.executeQuery(sql);
        return rs;
	}catch (Exception e) {
		e.printStackTrace();
	}finally{
//		closePrepareStatement(ps);
//		closeConnection(conn);
//		closeResultSet(rs);
	}
	return rs;
}
public static boolean deleteLend(String code){
	Connection conn = null;
	Statement stmt=null;
	try{
		conn=DBGet.getConnection();
        String sql="delete  from lend where lendCode="+code;
        stmt=conn.createStatement();
        int num=stmt.executeUpdate(sql);
        if(num>0){
        	return true;
        }
	}catch(Exception e){
		e.printStackTrace();
	}finally{
DBGet.closeStatement(stmt);
		DBGet.closeConnection(conn);
	}
	return false;
}
public static boolean addLend(Lend lend){
	Connection conn = null;
	Statement stmt=null;
	try{
		conn=DBGet.getConnection();
		 String carCode=lend.getCarCode();
         //byte b1[]=code.getBytes("ISO-8859-1");
         //code=new String(b1,"UTF-8");
         
         String userCode=lend.getUserCode();
         ///byte b2[]=name.getBytes("ISO-8859-1");
         //name=new String(b2,"UTF-8");
         
         String lendCode=lend.getLendCode();
         //byte b3[]=id.getBytes("ISO-8859-1");
         //id=new String(b3,"UTF-8");
         
         String lendTime=lend.getLendTime();
         //byte b4[]=pwd.getBytes("ISO-8859-1");
         //pwd=new String(b4,"UTF-8");
   		String sql="insert into lend values('"+carCode+"','"+userCode+"','"+lendTime+"','"+lendCode+"')";
        stmt= conn.createStatement();
        int numLend=stmt.executeUpdate(sql);
        if(numLend>0){
        	return true;
        }
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBGet.closeStatement(stmt);
		DBGet.closeConnection(conn);
	}
	return false;
}
}

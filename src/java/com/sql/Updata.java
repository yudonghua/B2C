/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class Updata {
	public String findUsername(String username){
		String psw = null;
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		try {
			String driver ="com.mysql.jdbc.Driver";
			String url ="jdbc:mysql://localhost:3306/b2c";
			String user ="root";
			String password ="root";
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
                        Statement stat = con.createStatement();
			String sql = "select * from business where username=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			if(rs==null){
				return null;
			}
			if(rs.next()){
				psw=rs.getString("password");
			}else{
				psw=null;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
				} 
			catch (SQLException e) {		
									}
		}
		return psw;
	}
        public void addGoods(String id,String name,String type,String business,int money){
           // new Date().getTime()+""
		Connection con =null;
		PreparedStatement pstmt =null;
		try {
			String driver ="com.mysql.jdbc.Driver";
			String url ="jdbc:mysql://localhost:3306/b2c";
			String user ="root";
			String password ="root";//改为自己的用户名密码和数据库名
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
                        Statement stat = con.createStatement();
			String sql = "INSERT INTO goods (id,name,type,business,money) VALUES (?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
                        pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, type);
                        pstmt.setString(4, business);
                        pstmt.setInt(5, money);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
				} 
			catch (SQLException e) {		
									}
		}
	}
        public void addBuy(String id,String name,String customer,String business,String address,int money,int num){
		Connection con =null;
		PreparedStatement pstmt =null;
		try {
			String driver ="com.mysql.jdbc.Driver";
			String url ="jdbc:mysql://localhost:3306/b2c";
			String user ="root";
			String password ="root";//改为自己的用户名密码和数据库名
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
                        Statement stat = con.createStatement();
			String sql = "INSERT INTO buy (id,name,customer,business,status,address,money,num) VALUES (?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
                        pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, customer);
                        pstmt.setString(4, business);
                        pstmt.setString(5, "订单已提交");
                        pstmt.setString(6, address);
                        pstmt.setInt(7, money);
                        pstmt.setInt(8, num);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
				} 
			catch (SQLException e) {		
									}
		}
	}
         public void changeBuy(String id,String status){
		Connection con =null;
		PreparedStatement pstmt =null;
		try {
			String driver ="com.mysql.jdbc.Driver";
			String url ="jdbc:mysql://localhost:3306/b2c";
			String user ="root";
			String password ="root";//改为自己的用户名密码和数据库名
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
                        Statement stat = con.createStatement();
			String sql = "update buy set status = '"+status+"' where id='"+id+"';";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
				} 
			catch (SQLException e) {		
									}
		}
	}
	public void addUser(String table, String username,String psw,String phone,String address){
		Connection con =null;
		PreparedStatement pstmt =null;
		try {
			String driver ="com.mysql.jdbc.Driver";
			String url ="jdbc:mysql://localhost:3306/b2c";
			String user ="root";
			String password ="root";//改为自己的用户名密码和数据库名
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
                        Statement stat = con.createStatement();
			String sql = "INSERT INTO "+table+" (username,password,phone,address) VALUES (?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, psw);
                        pstmt.setString(3, phone);
			pstmt.setString(4, address);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
				} 
			catch (SQLException e) {		
									}
		}
	}
        public JSONArray getcomment(String id){
		String psw = null;
                JSONArray array=null ;
		Connection con =null;
		PreparedStatement pstmt =null;
		int rs=789;
		try {
			String driver ="com.mysql.jdbc.Driver";
			String url ="jdbc:mysql://localhost:3306/b2c";
			String user ="root";
			String password ="root";
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
                        Statement stat = con.createStatement();
                        stat.executeUpdate("USE b2c;");
			String sql = "select comment from goods where id='"+id+"';";
		//	pstmt = con.prepareStatement(sql);
                        ResultSet resultSet=stat.executeQuery(sql);
			if(resultSet.next()){
                            array = JSONArray.fromObject(resultSet.getString("comment"));
                        }else{
                            array = null;
                        }
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
				} 
			catch (SQLException e) {		
									}
		}
		return array;
	}
        public void addcomment(String id,String customer,String comment){
		String psw = null;
		Connection con =null;
		PreparedStatement pstmt =null;
                JSONArray array=getcomment(id);
                JSONObject json = JSONObject.fromObject("{customer:'"+customer+"',comment:'"+comment+"'}");
                if(array.getJSONObject(0).toString().equals("null"))array.clear();
                array.add(json);

		try {
			String driver ="com.mysql.jdbc.Driver";
			String url ="jdbc:mysql://localhost:3306/b2c";
			String user ="root";
			String password ="root";
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
                        Statement stat = con.createStatement();
                        stat.executeUpdate("USE b2c;");
			String sql = "update goods set comment = '"+array.toString()+"' where id='"+id+"';";
                        System.out.print(sql);
                        stat.execute(sql);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
				} 
			catch (SQLException e) {		
									}
		}
		return;
	}
	//单独测试使用
	public static void main(String[] args) {
         //   System.out.println(2|1);
       //     System.out.print(new Updata().findUsername("yhd"));
            new Updata().addcomment("1489895250283","yhd","test");
      //      new Updata().addUser("customer","sd","ff");
//		String psw =new Updata().findUsername("ff");
//		System.out.println(psw);
//              if(psw==null){
//                    Updata u = new Updata();
//                 //   u.addUser("ff", "ff");
//                }
		
	}
	
}

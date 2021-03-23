package model;
import java.sql.*;

import org.apache.jasper.tagplugins.jstl.core.Catch;
import org.omg.CORBA.PUBLIC_MEMBER;

public class userDetails {

	String username;
	String name;
	String email;
	String mobile;
	String password;
	Date DOB;
	String age;
	int salery;
	int target;
	
	public int getSalery() {
		return salery;
	}
	public void setSalery(int salery) {
		this.salery = salery;
	}
	public int getTarget() {
		return target;
	}
	public void setTarget(int target) {
		this.target = target;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getDOB() {
		return DOB;
	}
	public void setDOB(Date dOB) {
		DOB = dOB;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
	public void insert(userDetails obj) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.01:3306/project","root","root");
			
			String sql1 = "INSERT INTO userdetails (username, password, name, mobile, email, DOB) VALUES (?,?,?,?,?,?);"; 
			PreparedStatement stm = con.prepareStatement(sql1);
			
			stm.setString(1, obj.getUsername());
			stm.setString(2, obj.getPassword());
			stm.setString(3, obj.getName());
			stm.setString(4, obj.getMobile());
			stm.setString(5, obj.getEmail());
			stm.setDate(6, obj.getDOB());
			
			stm.execute();
			stm.close();
			
		}catch(Exception e) {
			System.out.println("Error in userDetails.insert: " + e);
		}
	}
	
	public void select(String username,userDetails us) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.01:3306/project","root","root");
			
			String sql1 = "SELECT * FROM userdetails where username = ?;";
			PreparedStatement stm = con.prepareStatement(sql1);
			
			stm.setString(1, username);
			ResultSet rs = stm.executeQuery();
			
			if(rs.next()) {
				us.setUsername(rs.getString(1));
				us.setPassword(rs.getString(2));
				us.setName(rs.getString(3));
				us.setMobile(rs.getString(4));
				us.setEmail(rs.getString(5));
				us.setDOB(rs.getDate(6));
				us.setSalery(rs.getInt(7));
				us.setTarget(rs.getInt(8));
			}
			else {
				System.out.println("select user information faild!");
			}
		
		}catch(Exception e) {
			System.out.println("Error in userDetails.select: " + e);
		}
	}
	
	public boolean isExist(String username,String password){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.01:3306/Project","root","root");
			
			String sql1 = "select * from userDetails where username = ? and password = ?";
			PreparedStatement stm = con.prepareStatement(sql1);
			
			stm.setString(1, username);
			stm.setString(2, password);
			
			ResultSet rs = stm.executeQuery();
			
			if(rs.next()) {
				return true;
			}
			else {
				return false;
			}
			
		}catch(Exception e) {
			System.out.println("Error in userDetails.isExist: " + e);
		}
		return false;
	}
	
}

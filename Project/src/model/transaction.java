package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;

public class transaction {

	int amount;
	String comment;
	String username;
	String category;
	Date date;
	java.sql.Timestamp  time;
	
	public ResultSet rs;
	
	public java.sql.Timestamp getTime() {
		return time;
	}
	public void setTime(java.sql.Timestamp time) {
		this.time = time;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	public void select(transaction obj) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.01:3306/project","root","root");
			
			String sql1 = "SELECT * FROM transaction where username = ? and date = ? order by tid ;";
			PreparedStatement stm = con.prepareStatement(sql1);
			
			java.util.Date date=new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			
			stm.setString(1, username);
			stm.setDate(2, sqlDate);
			obj.rs = stm.executeQuery();
			
		}catch(Exception e) {
			System.out.println("Error in transaction.select: " + e);
		}
	}
	
	public void insert(transaction obj) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.01:3306/project","root","root");
			
			String sql1 = "INSERT INTO transaction (username, amount, date, category, comment ,time) VALUES (?,?,?,?,?,?);";
			PreparedStatement stm = con.prepareStatement(sql1);
			
			stm.setString(1, obj.getUsername());
			stm.setString(4, obj.getCategory());
			stm.setString(5, obj.getComment());
			stm.setDate(3, obj.getDate());
			stm.setInt(2, obj.getAmount());
			stm.setTimestamp(6, obj.getTime());
			
			stm.execute();
			stm.close();
			
		}catch(Exception e) {
			System.out.println("Error in transaction.insert: " + e);
		}
	}
	
}

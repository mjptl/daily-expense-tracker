package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class savings {
	
	String username;
	Date date;
	int target;
	int saved;
	public ResultSet rs;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getTarget() {
		return target;
	}
	public void setTarget(int target) {
		this.target = target;
	}
	public int getSaved() {
		return saved;
	}
	public void setSaved(int saved) {
		this.saved = saved;
	}
	
	public void select(savings obj) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.01:3306/project","root","root");
			
			String sql1 = "SELECT * FROM savings where username = ? order by date;";
			PreparedStatement stm = con.prepareStatement(sql1);
		
			stm.setString(1, username);
			obj.rs = stm.executeQuery();
			
		}catch(Exception e) {
			System.out.println("Error in savings.select: " + e);
		}
	}
	
	public void insert(savings obj) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.01:3306/project","root","root");
			
			String sql = "delete from savings where username = ? and date = ?";
			PreparedStatement pr = con.prepareStatement(sql);
			
			pr.setString(1, obj.getUsername());
			pr.setDate(2, obj.getDate());
			
			pr.execute();
			
			String sql1 = "INSERT INTO savings (username, date, target, saved) VALUES (?,?,?,?);";
			PreparedStatement stm = con.prepareStatement(sql1);
			
			stm.setString(1, obj.getUsername());
			stm.setDate(2, obj.getDate());
			stm.setInt(3, obj.getTarget());
			stm.setInt(4, obj.getSaved());
			
			stm.execute();
			stm.close();
			
			System.out.print("Savings updated");
		}catch(Exception e) {
			System.out.println("Error in transaction.insert: " + e);
		}
	}

}

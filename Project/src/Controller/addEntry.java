package Controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.transaction;
import model.userDetails;

@WebServlet("/addEntry")
public class addEntry extends HttpServlet {

	public void init() {
		
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		System.out.println("Post --> addEntry");
		transaction tran = new transaction();
		
		java.util.Date date=new java.util.Date();
		
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
		
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("username");
		System.out.println("addEntry on --> " + username);
		
		if(Integer.parseInt(request.getParameter("amount")) > 0) {
			
			tran.setUsername(username);
			tran.setAmount(Integer.parseInt(request.getParameter("amount")));
			tran.setCategory(request.getParameter("category"));
			tran.setComment(request.getParameter("comment"));
			tran.setDate(sqlDate);
			tran.setTime(sqlTime);
			
			tran.insert(tran);
		}
		
		ServletContext sc = request.getServletContext();
		sc.getRequestDispatcher("/Home").forward(request, response);
	}
	
}

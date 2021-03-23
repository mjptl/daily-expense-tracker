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
import javax.websocket.Session;

import org.apache.catalina.connector.Request;

import model.userDetails;

@WebServlet("/Home")
public class Home extends HttpServlet {
	
	public void init() {

	}
		
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException {	
		doGet(request, response);
	}
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException {	
		System.out.println("Get --> Home");
		
		HttpSession session = request.getSession();
		String s = (String)session.getAttribute("status");
		
		if(s.equals("Y")) {
			ServletContext sc = request.getServletContext();
			
			userDetails us = new userDetails();
			us.select((String)session.getAttribute("username"),us);
			
			session.setAttribute("user", us);
			sc.getRequestDispatcher("/Home.jsp").include(request, response);
		}
		else {
			ServletContext sc = request.getServletContext();
			sc.getRequestDispatcher("/index.html").forward(request, response);
		}
	}
}

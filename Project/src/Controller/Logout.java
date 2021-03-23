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

@WebServlet("/Logout")
public class Logout extends HttpServlet {
	
	public void init() {
		
	}
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException {	
		System.out.println("Get --> Logout");
		
		HttpSession session = request.getSession();
		session.setAttribute("status", "N");
		
		ServletContext sc = request.getServletContext();
		sc.getRequestDispatcher("/index.html").forward(request, response);
	}
}
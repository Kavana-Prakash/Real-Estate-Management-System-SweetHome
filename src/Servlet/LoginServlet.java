package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.*;
import Helper.*;
import entities.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String username=request.getParameter("username1");
		String password=request.getParameter("password1");
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		User u=dao.getUserByUsernameAndPassword(username, password);
		int check=dao.checkType(username);
		if(u==null) {
			Message msg=new Message("Invalid details! try with another","error","alert-danger");
			HttpSession s=request.getSession();
			s.setAttribute("msg", msg);
			response.sendRedirect("login_page.jsp");
		}
		else{
			HttpSession s=request.getSession();
			s.setAttribute("currentuser", u);
			if(check==1) {
			  response.sendRedirect("AdminProfile.jsp");
			}
			else if(check==2) {
				response.sendRedirect("profile.jsp");
			}
			else if(check==3) {
				response.sendRedirect("OwnerProfile.jsp");
			}
			else {
				Message msg=new Message("Invalid details! try with another","error","alert-danger");
				HttpSession s1=request.getSession();
				s1.setAttribute("msg", msg);
				response.sendRedirect("login_page.jsp");
			}
		}
	}

}

package Servlet;

import java.io.IOException;
import entities.*;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.*;
import Helper.ConnectionProvider;
@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String check=request.getParameter("check");
		if(check==null) {
			out.println("terms and condition not checked");
		}
		else {
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			String firstname=request.getParameter("firstname");
			String lastname=request.getParameter("lastname");
			String gender=request.getParameter("gender");
			String phoneno=request.getParameter("phoneno");
			String email=request.getParameter("email");
			String city=request.getParameter("city");
			String state=request.getParameter("state");
			String zip=request.getParameter("zip");
			String type=request.getParameter("type");
			String about=request.getParameter("about");
			User user=new User(username,password,firstname,lastname,gender,phoneno,email,city,state,zip,type,about);
			UserDao dao=new UserDao(ConnectionProvider.getConnection());
			if(dao.saveUser(user))
			{
				Message msg=new Message("Your details has been registered","success","alert-success");
				HttpSession s=request.getSession();
				s.setAttribute("msg", msg);
				out.print("done");
			}
			else {
				Message msg=new Message("Enter proper user details","error","alert-danger");
				HttpSession s=request.getSession();
				s.setAttribute("msg", msg);
				out.print("User name exists give other name");
				
			}
		}
	}

}

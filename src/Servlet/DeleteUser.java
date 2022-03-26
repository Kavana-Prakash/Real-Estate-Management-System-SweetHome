package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.UserDao;
import Helper.ConnectionProvider;
import entities.Message;
import entities.User;

@MultipartConfig
@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s=request.getSession();
		User user=(User)s.getAttribute("currentuser");
	  int id=Integer.parseInt(request.getParameter("userid"));
	  UserDao dao=new UserDao(ConnectionProvider.getConnection());
		try {
			if(dao.deleteUser(id)) {
				Message msg=new Message("user deleted","success","alert-success alert-dismissible fade show");
				s.setAttribute("msg", msg);
				response.sendRedirect("getAllusers.jsp");
			}
			else {
				Message msg=new Message("user not deleted","error","alert-danger alert-dismissible fade show");
				s.setAttribute("msg", msg);
				response.sendRedirect("getAllusers.jsp");
			}
		} catch (SQLException e) {
			Message msg=new Message("User not deleted","error","alert-danger alert-dismissible fade show");
			s.setAttribute("msg", msg);
			response.sendRedirect("getAllusers.jsp");
			e.printStackTrace();
		}
	}

}

package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.UserDao;
import Helper.ConnectionProvider;
import entities.Message;
import entities.User;

/**
 * Servlet implementation class DeleteAccount
 */

@WebServlet("/DeleteAccount")
public class DeleteAccount extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s=request.getSession();
		User user=(User)s.getAttribute("currentuser");
		int id=user.getId();
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		try {
			if(dao.deleteUser(id)) {
				Message msg=new Message("Your complete details has been deleted...","success","alert-success alert-dismissible fade show");
				s.setAttribute("msg", msg);
				response.sendRedirect("login_page.jsp");
			}
			else {
				Message msg=new Message("Your account is not deleted pls login and try again","error","alert-danger alert-dismissible fade show");
				s.setAttribute("msg", msg);
				response.sendRedirect("login_page.jsp");
			}
		} catch (SQLException e) {
			Message msg=new Message("Your account is not deleted pls login and try again","error","alert-danger alert-dismissible fade show");
			s.setAttribute("msg", msg);
			response.sendRedirect("login_page.jsp");
			e.printStackTrace();
		}
	}

}

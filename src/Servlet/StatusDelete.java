package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.PropertyDao;
import Dao.StatusDao;
import Helper.ConnectionProvider;
import entities.Message;
import entities.User;

@WebServlet("/StatusDelete")
public class StatusDelete extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s=request.getSession();
		User user=(User)s.getAttribute("currentuser");
		int propid=Integer.parseInt(request.getParameter("propid"));
		int clientid=Integer.parseInt(request.getParameter("clientid"));
		PrintWriter out=response.getWriter();
		StatusDao sdao=new StatusDao(ConnectionProvider.getConnection());
		if(sdao.deletebought(propid, clientid)) {
			Message msg=new Message("Property request has been deleted..","success","alert-success alert-dismissible fade show");
			s.setAttribute("msg", msg);
			response.sendRedirect("profile.jsp");
		}
		else {
			Message msg=new Message("Property request not deleted pls try again","error","alert-danger alert-dismissible fade show");
			s.setAttribute("msg", msg);
			response.sendRedirect("profile.jsp");
		}
	}


}

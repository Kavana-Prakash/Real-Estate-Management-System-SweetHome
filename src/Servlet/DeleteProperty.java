package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.PropertyDao;
import Helper.ConnectionProvider;
import entities.Message;
import entities.User;

@MultipartConfig
@WebServlet("/DeleteProperty")
public class DeleteProperty extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s=request.getSession();
		User user=(User)s.getAttribute("currentuser");
		int propid=Integer.parseInt(request.getParameter("propid"));
		PrintWriter out=response.getWriter();
		PropertyDao pdao=new PropertyDao(ConnectionProvider.getConnection());
		if(pdao.deleteProperty(propid)) {
			Message msg=new Message("Property has been deleted..","success","alert-success alert-dismissible fade show");
			s.setAttribute("msg", msg);
			response.sendRedirect("OwnerProfile.jsp");
		}
		else {
			Message msg=new Message("Property not deleted pls try again","error","alert-danger alert-dismissible fade show");
			s.setAttribute("msg", msg);
			response.sendRedirect("OwnerProfile.jsp");
		}
	}
	

}

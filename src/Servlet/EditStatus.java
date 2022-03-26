package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.StatusDao;
import Helper.ConnectionProvider;
import entities.Message;
import entities.Status;
@WebServlet("/EditStatus")
public class EditStatus extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s=request.getSession();
		int propertyid=Integer.parseInt(request.getParameter("propid"));
		int clientid=Integer.parseInt(request.getParameter("clientid"));
		int ownerid=Integer.parseInt(request.getParameter("ownerid"));
		String status=request.getParameter("status");
		StatusDao sdao=new StatusDao(ConnectionProvider.getConnection());
		Status statusobj=(Status) sdao.getStatusByclientidandpropertyid(clientid, propertyid);
		statusobj.setStatus(status);
		statusobj.setClientid(clientid);
		statusobj.setOwnerid(ownerid);
		statusobj.setPropid(propertyid);
		if(sdao.EditStatus(statusobj)) {
			Message msg=new Message("Status Updated..","success","alert-success alert-dismissible fade show");
			s.setAttribute("msg", msg);
		}
		else {
            Message msg=new Message("Something went wrong...","error","alert-danger alert-dismissible fade show");
			s.setAttribute("msg", msg);
	}	
		response.sendRedirect("OwnerProfile.jsp");
	}
}

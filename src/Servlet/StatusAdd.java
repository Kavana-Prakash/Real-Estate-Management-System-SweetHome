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

import Helper.ConnectionProvider;
import entities.Message;
import Dao.*;

@WebServlet("/StatusAdd")
public class StatusAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
      
     
    public StatusAdd() {
        super();
       
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pid=Integer.parseInt(request.getParameter("pid"));
		int cid=Integer.parseInt(request.getParameter("cid"));
		PrintWriter out=response.getWriter();
		PropertyDao pdao=new PropertyDao(ConnectionProvider.getConnection());
		int oid=pdao.getOwneridfrompid(pid);
		out.print(pid+""+cid+""+oid);
		StatusDao sdao=new StatusDao(ConnectionProvider.getConnection());
		
		if(sdao.insertStatus(pid, oid, cid)) {
			HttpSession s=request.getSession();
			Message msg=new Message("Request has been directed to owner pls check the status frequently...","success","alert-success alert-dismissible fade show");
			s.setAttribute("msg", msg);
			response.sendRedirect("profile.jsp");
		}
		
	}
	

}

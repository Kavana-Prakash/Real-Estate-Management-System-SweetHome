package Servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Dao.PropertyDao;
import Helper.ConnectionProvider;
import Helper.Helper;
import entities.Message;
import entities.Property;
import entities.User;

@MultipartConfig
@WebServlet("/AddServletOwner")
public class AddServletOwner extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		int balcony,pool,backyard,garage;
		int ownerid=Integer.parseInt(request.getParameter("oid"));
		String ptype=request.getParameter("propertytype");
		String area=request.getParameter("sqfeet");
		String price=request.getParameter("price");
		String street=request.getParameter("street");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String pincode=request.getParameter("pincode");
		String bedroom=request.getParameter("bedroom");
		String bathroom=request.getParameter("bathroom");
		String age=request.getParameter("age");
		if(request.getParameter("balcony")!=null) 
		   balcony=1;
		else 
			balcony=0;
		if(request.getParameter("balcony")!=null)
		  pool=1;
		else
		  pool=0;
		if(request.getParameter("backyard")!=null)
		   backyard=1;
		else
			backyard=0;
		if(request.getParameter("garage")!=null)
		  garage=1;
		else
			garage=0;
		Part part=request.getPart("pimage");
		String pimage=part.getSubmittedFileName();
		String pdescription=request.getParameter("pdescription");
		
		
		Property property=new Property(ptype,area,ownerid,price,street,city,state,pincode,bedroom,bathroom,age,balcony,pool,backyard,garage,pdescription,pimage);
		PropertyDao dao=new PropertyDao(ConnectionProvider.getConnection());
		if(dao.saveProperty(property))
		{
			String proppath=request.getRealPath("/")+"img"+File.separator+"properties"+File.separator+property.getImg();
			if(Helper.saveFile(part.getInputStream(),proppath)){
			Message msg=new Message("property added","success","alert-success");
			HttpSession s=request.getSession();
			s.setAttribute("msg", msg);
			response.sendRedirect("OwnerProfile.jsp");
			}
			else {
				Message msg=new Message("property not added try again with proper details","error","alert-danger");
				HttpSession s=request.getSession();
				s.setAttribute("msg", msg);
				response.sendRedirect("OwnerProfile.jsp");
			}
		}
		else {
			Message msg=new Message("property not added try again with proper details","error","alert-danger");
			HttpSession s=request.getSession();
			s.setAttribute("msg", msg);
			response.sendRedirect("OwnerProfile.jsp");
		}
	}
	

}

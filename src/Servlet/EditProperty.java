package Servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Dao.PropertyDao;
import Dao.UserDao;
import Helper.ConnectionProvider;
import Helper.Helper;
import entities.Message;
import entities.Property;
import entities.User;

/**
 * Servlet implementation class EditProperty
 */
@MultipartConfig
@WebServlet("/EditProperty")
public class EditProperty extends HttpServlet {
	
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		int propid=Integer.parseInt(request.getParameter("propid"));
		String proptype=request.getParameter("proptype");
		String propsqft=request.getParameter("propsqft");
		int propoid=Integer.parseInt(request.getParameter("propoid"));
		String propprice=request.getParameter("propprice");
		String propstreet=request.getParameter("propstreet");
		String propcity=request.getParameter("propcity");
		String propstate=request.getParameter("propstate");
		String proppincode=request.getParameter("proppincode");
		String propbedroom=request.getParameter("propbedroom");
		String propbathroom=request.getParameter("propbathroom");
		String propage=request.getParameter("propage");
		int balcony=Integer.parseInt(request.getParameter("propbalcony"));
		int backyard=Integer.parseInt(request.getParameter("propbackyard"));
		int pool=Integer.parseInt(request.getParameter("proppool"));
		int garage=Integer.parseInt(request.getParameter("propgarage"));
		String description=request.getParameter("propdescription");
		Part part=request.getPart("propimage");
		String imagename=part.getSubmittedFileName();
		
		PropertyDao dao=new PropertyDao(ConnectionProvider.getConnection());
		Property prop=dao.getPropertybypropertyid(propid);
		prop.setType(proptype);
		prop.setSquarefeet(propsqft);
		prop.setOwnerid(propoid);
		prop.setPrice(propprice);
		prop.setStreet(propstreet);
		prop.setCity(propstreet);
		prop.setState(propstate);
        prop.setPincode(proppincode);
        prop.setBedroom(propbedroom);
        prop.setBathroom(propbathroom);
        prop.setAge(propage);
        prop.setBalcony(balcony);
        prop.setBackyard(backyard);
        prop.setPool(pool);
        prop.setGarage(garage);
        prop.setText(description);
        String oldfile=prop.getImg();
        prop.setImg(imagename);
        
       
		
		PropertyDao propdao=new PropertyDao(ConnectionProvider.getConnection());
		HttpSession s=request.getSession();
		User u=(User) s.getAttribute("currentuser");
		boolean ans=propdao.EditProperty(prop);
		if(ans) {
			
			//out.println("updated");
			String path=request.getRealPath("/")+"img"+File.separator+"properties"+File.separator+prop.getImg();
			System.out.println(path);
			String patholdfile=request.getRealPath("/")+"img"+File.separator+"properties"+File.separator+oldfile;
			if(!oldfile.equals("defaulthome.png"))
			   Helper.deleteFile(patholdfile);
			if(Helper.saveFile(part.getInputStream(), path)) {
					Message msg=new Message("Property details updated...","success","alert-success alert-dismissible fade show");
					s.setAttribute("msg", msg);
					if(u.getType()=="Owner")
						response.sendRedirect("OwnerProfile.jsp");
						if(u.getType()=="Admin")
							response.sendRedirect("AdminProfile.jsp");
			}
			else {
                    Message msg=new Message("Something went wrong...","error","alert-danger alert-dismissible fade show");
					s.setAttribute("msg", msg);
					if(u.getType()=="Owner")
						response.sendRedirect("OwnerProfile.jsp");
						if(u.getType()=="Admin")
							response.sendRedirect("AdminProfile.jsp");
			}	
		}
		else {
			 Message msg=new Message("Something went wrong...","error","alert-danger alert-dismissible fade show");
			 s.setAttribute("msg", msg);
			 if(u.getType()=="Owner")
					response.sendRedirect("OwnerProfile.jsp");
					if(u.getType()=="Admin")
						response.sendRedirect("AdminProfile.jsp");
		}
		
	}

	}



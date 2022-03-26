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

import Dao.UserDao;
import Helper.*;
import entities.*;

@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String username=request.getParameter("userusername");
		String password=request.getParameter("userpassword");
		String firstname=request.getParameter("userfirstname");
		String lastname=request.getParameter("userlastname");
		String phoneno=request.getParameter("userphoneno");
		String email=request.getParameter("useremail");
		String city=request.getParameter("usercity");
		String state=request.getParameter("userstate");
		String zip=request.getParameter("userzip");
		String about=request.getParameter("userabout");
		Part part=request.getPart("userimage");
		String imagename=part.getSubmittedFileName();
		
		HttpSession s=request.getSession();
		User user=(User)s.getAttribute("currentuser");
		user.setUsername(username);
		user.setPassword(password);
		user.setFirstname(firstname);
		user.setLastname(lastname);
		user.setPhoneno(phoneno);
		user.setEmail(email);
		user.setCity(city);
		user.setState(state);
		user.setZip(zip);
		user.setAbout(about);
		String oldfile=user.getProfile();
		user.setProfile(imagename);
		
		UserDao userdao=new UserDao(ConnectionProvider.getConnection());
		
		boolean ans=userdao.updateUser(user);
		if(ans) {
			out.println("updated");
			String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
			
			String patholdfile=request.getRealPath("/")+"pics"+File.separator+oldfile;
			if(!oldfile.equals("default.png"))
			   Helper.deleteFile(patholdfile);
			if(Helper.saveFile(part.getInputStream(), path)) {
					Message msg=new Message("Profile details updated...","success","alert-success alert-dismissible fade show");
					s.setAttribute("msg", msg);
			}
			else {
                    Message msg=new Message("Something went wrong...","error","alert-danger alert-dismissible fade show");
					s.setAttribute("msg", msg);
			}	
		}
		else {
			 Message msg=new Message("Something went wrong...","error","alert-danger alert-dismissible fade show");
				s.setAttribute("msg", msg);
		}
		response.sendRedirect("profile.jsp");
	}

}

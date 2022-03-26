package Servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Dao.UserDao;
import Helper.ConnectionProvider;
import Helper.Helper;
import entities.Message;
import entities.User;
@MultipartConfig
@WebServlet("/EditUser")
public class EditUser extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		int id=Integer.parseInt(request.getParameter("userid"));
		String username=request.getParameter("userusername");
		String password=request.getParameter("userpassword");
		String firstname=request.getParameter("userfirstname");
		String lastname=request.getParameter("userlastname");
		String gender=request.getParameter("usergender");
		String phoneno=request.getParameter("userphoneno");
		String email=request.getParameter("useremail");
		String city=request.getParameter("usercity");
		String state=request.getParameter("userstate");
		String zip=request.getParameter("userzip");
		String type=request.getParameter("usertype");
		String about=request.getParameter("userabout");
		Part part=request.getPart("userimage");
		String imagename=part.getSubmittedFileName();
		
		HttpSession s=request.getSession();
		UserDao userdao=new UserDao(ConnectionProvider.getConnection());
		
		User user=userdao.getAllUser(id);
		user.setUsername(username);
		user.setPassword(password);
		user.setFirstname(firstname);
		user.setLastname(lastname);
		user.setGender(gender);
		user.setPhoneno(phoneno);
		user.setEmail(email);
		user.setCity(city);
		user.setState(state);
		user.setZip(zip);
		user.setType(type);
		user.setAbout(about);
		String oldfile=user.getProfile();
		user.setProfile(imagename);
		
		
		
		boolean ans=userdao.updateUser(user);
		if(ans) {
			out.println("updated");
			String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
			System.out.println(path);
			String patholdfile=request.getRealPath("/")+"pics"+File.separator+oldfile;
			if(!oldfile.equals("default.png"))
			   Helper.deleteFile(patholdfile);
			if(Helper.saveFile(part.getInputStream(), path)) {
					Message msg=new Message("User details updated...","success","alert-success alert-dismissible fade show");
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
		response.sendRedirect("getAllusers.jsp");
	}
	}



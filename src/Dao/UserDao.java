/** Copyright Kavana to present
All Rights reserved.
*/
package Dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import entities.Property;
import entities.User;
import Helper.ConnectionProvider;
public class UserDao {
 private Connection con;
public UserDao(Connection con) {
	super();
	this.con = con;
}
 public boolean saveUser(User user) {
	 boolean flag=false;
	 try {
		 String query="insert into user(username,password,firstname,lastname,gender,phoneno,email,city,state,zip,type,about) values (?,?,?,?,?,?,?,?,?,?,?,?)";
		 PreparedStatement pstmt=this.con.prepareStatement(query);
		 pstmt.setString(1, user.getUsername());
		 pstmt.setString(2, user.getPassword());
		 pstmt.setString(3, user.getFirstname());
		 pstmt.setString(4, user.getLastname());
		 pstmt.setString(5, user.getGender());
		 pstmt.setString(6, user.getPhoneno());
		 pstmt.setString(7, user.getEmail());
		 pstmt.setString(8, user.getCity());
		 pstmt.setString(9, user.getState());
		 pstmt.setString(10, user.getZip());
		 pstmt.setString(11, user.getType());
		 pstmt.setString(12, user.getAbout());
		 pstmt.executeUpdate();
		 flag=true;
	 }
	 catch(Exception e) {
		 e.printStackTrace();
	 }
	 return flag;
 }
 
 public User getUserByUsernameAndPassword(String username,String password) {
	 User user=null;
	 try {
		 String query="select * from user where username=? and password=?";
		 PreparedStatement pstmt=con.prepareStatement(query);
		 pstmt.setString(1,username);
		 pstmt.setString(2, password);
		ResultSet rs= pstmt.executeQuery();
		if(rs.next()) {
			user=new User();
			user.setId(rs.getInt("id"));
			user.setUsername(rs.getString("username"));
			user.setPassword(rs.getString("password"));
			user.setFirstname(rs.getString("firstname"));
			user.setLastname(rs.getString("lastname"));
			user.setGender(rs.getString("gender"));
			user.setPhoneno(rs.getString("phoneno"));
			user.setEmail(rs.getString("email"));
			user.setCity(rs.getString("city"));
			user.setState(rs.getString("state"));
			user.setZip(rs.getString("zip"));
			user.setType(rs.getString("type"));
			user.setAbout(rs.getString("about"));
			user.setRdate(rs.getTimestamp("rdate"));
			user.setProfile(rs.getString("profile"));
		}
	 }
	 catch(Exception e) {
		e.printStackTrace(); 
	 }
	 return user;
 }
 public boolean updateUser(User user) {
	 boolean flag=false;
	 try {
		 String query="update user set username=?,password=?,firstname=?,lastname=?,phoneno=?,email=?,city=?,state=?,zip=?,about=?,profile=? where id=?";
	     PreparedStatement pst=con.prepareStatement(query);
	     pst.setString(1, user.getUsername());
	     pst.setString(2, user.getPassword());
	     pst.setString(3, user.getFirstname());
	     pst.setString(4, user.getLastname());
	     pst.setString(5, user.getPhoneno());
	     pst.setString(6, user.getEmail());
	     pst.setString(7, user.getCity());
	     pst.setString(8, user.getState());
	     pst.setString(9, user.getZip());
	     pst.setString(10, user.getAbout());
	     pst.setString(11, user.getProfile());
	     pst.setInt(12, user.getId());
	     pst.executeUpdate();
	     flag=true;
	 }
	 catch(Exception e) {
		e.printStackTrace(); 
	 }
	 return flag;
 }
 //check user type
 public int checkType(String uname) {
	   
		 String query1="select * from user where type='Admin' and username=?";
		 String query2="select * from user where type='Client' and username=?";
		 String query3="select * from user where type='Owner' and username=?";
		 PreparedStatement st1,st2,st3;
		 ResultSet rs1,rs2,rs3;
		 try {
		      
		       st1=con.prepareStatement(query1);
		       st1.setString(1, uname);
		       rs1=st1.executeQuery();
		       st2=con.prepareStatement(query2);
		       st2.setString(1, uname);
		       rs2=st2.executeQuery();
		       st3=con.prepareStatement(query3);
		       st3.setString(1, uname);
		       rs3=st3.executeQuery();
		       if(rs1.next())
		       {
				return 1;	
		       }
		       if(rs2.next())
		       {
				return 2;	
		       }
		       if(rs3.next()) {
		    	   return 3;
		       }
		       }
       catch (Exception e1) {
	            e1.printStackTrace();
       }
	   
	   return 0;
 }
 public User selectUserByID(int id) {
	 User user=null;
	 String query="select * from user by id=?";
	 PreparedStatement st;
	 ResultSet rs; 
	 try {
		 st=con.prepareStatement(query);
		 st.setInt(1, id);
		 rs=st.executeQuery();
		 while(rs.next()) {
			 String username=rs.getString("username");
			 String password=rs.getString("password");
			 String fname=rs.getString("firstname");
			 String lname=rs.getString("lastname");
			 String gender=rs.getString("gender");
			 String phoneno=rs.getString("phoneno");
			 String email=rs.getString("email");
			 String city=rs.getString("city");
			 String state=rs.getString("state");
			 String zip=rs.getString("zip");
			 String type=rs.getString("type");
			 String about=rs.getString("about");
			 Timestamp rdate=rs.getTimestamp("rdate");
			 String profile=rs.getString("profile");
			 user=new User(id,username,password,fname,lname,gender,phoneno,email,city,state,zip,type,about,rdate,profile);
		 }
		 
	 }
	 catch(Exception e) {
		 e.printStackTrace();
	 }
	 return user;
 }
 public List<User> selectAllUser(){
		List<User> list=new ArrayList<>();
		try {
			PreparedStatement pst=this.con.prepareStatement("select * from user where username!='Admin'");
			ResultSet rs1=pst.executeQuery();
			while(rs1.next()) {
				int id=rs1.getInt("id");
				String username=rs1.getString("username");
				String password=rs1.getString("password");
				String firstname=rs1.getString("firstname");
				String lastname=rs1.getString("lastname");
				String gender=rs1.getString("gender");
				String phoneno=rs1.getString("phoneno");
				String email=rs1.getString("email");
				String city=rs1.getString("city");
				String state=rs1.getString("state");
				String zip=rs1.getString("zip");
				String type=rs1.getString("type");
				String about=rs1.getString("about");
				Timestamp rdate=rs1.getTimestamp("rdate");
				String profile=rs1.getString("profile");
				User p=new User(id,username,password,firstname,lastname,gender,phoneno,email,city,state,zip,type,about,rdate,profile);
				list.add(p);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
 public User getAllUser(int uid){
		List<User> list=new ArrayList<>();
		User p=null;
		try {
			PreparedStatement pst=this.con.prepareStatement("select * from user where id=?");
			pst.setInt(1, uid);
			ResultSet rs1=pst.executeQuery();
			while(rs1.next()) {
				String username=rs1.getString("username");
				String password=rs1.getString("password");
				String firstname=rs1.getString("firstname");
				String lastname=rs1.getString("lastname");
				String gender=rs1.getString("gender");
				String phoneno=rs1.getString("phoneno");
				String email=rs1.getString("email");
				String city=rs1.getString("city");
				String state=rs1.getString("state");
				String zip=rs1.getString("zip");
				String type=rs1.getString("type");
				String about=rs1.getString("about");
				Timestamp rdate=rs1.getTimestamp("rdate");
				String profile=rs1.getString("profile");
				p=new User(uid,username,password,firstname,lastname,gender,phoneno,email,city,state,zip,type,about,rdate,profile);
				list.add(p);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return p;
	}
 public List<User> selectOwnerUser(){
		List<User> list=new ArrayList<>();
		try {
			PreparedStatement pst=this.con.prepareStatement("select * from user where type='Owner'");
			ResultSet rs1=pst.executeQuery();
			while(rs1.next()) {
				int id=rs1.getInt("id");
				String username=rs1.getString("username");
				String password=rs1.getString("password");
				String firstname=rs1.getString("firstname");
				String lastname=rs1.getString("lastname");
				String gender=rs1.getString("gender");
				String phoneno=rs1.getString("phoneno");
				String email=rs1.getString("email");
				String city=rs1.getString("city");
				String state=rs1.getString("state");
				String zip=rs1.getString("zip");
				String type=rs1.getString("type");
				String about=rs1.getString("about");
				Timestamp rdate=rs1.getTimestamp("rdate");
				String profile=rs1.getString("profile");
				User p=new User(id,username,password,firstname,lastname,gender,phoneno,email,city,state,zip,type,about,rdate,profile);
				list.add(p);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
 public boolean deleteUser(int id) throws SQLException{
	 boolean userdelete;
	 try {
		 PreparedStatement pst=con.prepareStatement("delete from user where id=?");
         pst.setInt(1, id);
         return(pst.executeUpdate()>0);
	 }
	 catch(Exception e) {
		 e.printStackTrace();
		 return false;
	 }
	 
 }
 public String getUsernameByUserID(int id) {
	 String username=null;
	 String firstname=null,lastname=null;
	 try {
		 String query="select firstname,lastname from user where id=?";
		 PreparedStatement pst=con.prepareStatement(query);
		 pst.setInt(1, id);
		 ResultSet rs=pst.executeQuery();
			if(rs.next()) {
			 firstname=rs.getString("firstname");
			 lastname=rs.getString("lastname");
	         }
		username=firstname+" "+lastname;	
	 }
	 catch(Exception e) {
		e.printStackTrace(); 
	 }
	 return username;
 }
 public String getPhonenumberByUserID(int id) {
	 String phoneno=null;
	 try {
		 String query="select phoneno from user where id=?";
		 PreparedStatement pst=con.prepareStatement(query);
		 pst.setInt(1, id);
		 ResultSet rs=pst.executeQuery();
			if(rs.next()) {
			 phoneno=rs.getString("phoneno");
	         }
			
	 }
	 catch(Exception e) {
		e.printStackTrace(); 
	 }
	 return phoneno;
 }
 public String getEmailByUserID(int id) {
	 String email=null;
	 try {
		 String query="select email from user where id=?";
		 PreparedStatement pst=con.prepareStatement(query);
		 pst.setInt(1, id);
		 ResultSet rs=pst.executeQuery();
			if(rs.next()) {
			 email=rs.getString("email");
	         }
			
	 }
	 catch(Exception e) {
		e.printStackTrace(); 
	 }
	 return email;
 }
 
}

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Helper.*" %>
<%@page import="entities.*" %>

<%@page import="Dao.*" %>
<%
User user=(User)session.getAttribute("currentuser");

if(user==null){
	 Message msg=new Message("You are not logged in ","error","alert-danger alert-dismissible fade show");
	 session.setAttribute("msg", msg);
	 response.sendRedirect("login_page.jsp");
}
else {
	 if(user.getType().equals("Client")){
		 Message msg=new Message("You are not allowed to access this page","error","alert-danger alert-dismissible fade show");
		 session.setAttribute("msg", msg);
		 response.sendRedirect("login_page.jsp"); 
	 }
	 
}
  
   int userid=Integer.parseInt(request.getParameter("userid"));
    UserDao userdao=new UserDao(ConnectionProvider.getConnection());
    User u=userdao.getAllUser(userid);
   PropertyDao dao=new PropertyDao(ConnectionProvider.getConnection());
   
  
   
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit user</title>
<link href="bootstrap-4.5.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="bootstrap-4.5.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" >
  <svg class="bi bi-house-fill" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M8 3.293l6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
  <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
</svg>SweetHome</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
     
      <li class="nav-item active">
        <a class="nav-link" href="ContactUs.jsp">
        <svg class="bi bi-envelope-fill" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
         <path fill-rule="evenodd" d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z"/>
        </svg>
        Contact</a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="About_us.jsp">
        <svg class="bi bi-info-square-fill" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
         <path fill-rule="evenodd" d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm8.93 4.588l-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM8 5.5a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
       </svg>
        About Us</a>
      </li>
      
     
      
     
    </ul>
    <ul class="navbar-nav mr-right">
     <li class="nav-item active">
       <a class="nav-link" href="#!" data-toggle="modal" data-target="#profilemodal" >
         <svg class="bi bi-person-check" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
           <path fill-rule="evenodd" d="M11 14s1 0 1-1-1-4-6-4-6 3-6 4 1 1 1 1h10zm-9.995-.944v-.002.002zM1.022 13h9.956a.274.274 0 0 0 .014-.002l.008-.002c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664a1.05 1.05 0 0 0 .022.004zm9.974.056v-.002.002zM6 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0zm6.854.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
         </svg>
       <%=user.getFirstname() %></a>
     </li>
    
<!--       <li class="nav-item active"> -->
<!--         <a class="nav-link" href="LogoutServlet" > -->
<!--         <svg class="bi bi-arrow-right-circle-fill" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg"> -->
<!--             <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-8.354 2.646a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L9.793 7.5H5a.5.5 0 0 0 0 1h4.793l-2.147 2.146z"/> -->
<!--          </svg> -->
<!--         LogOut</a> -->
<!--       </li> -->
    </ul>
  </div>
</nav> 
<!-- nav end -->
<div class="container-fluid">
 <div class="row mt-4">
   <div class="col-md-12">
             <!-- Main content -->
             <div class="container">
                 <div class="row my-4">
                   <div class="col-md-8 offset-md-2">
                     <div class="card">
                       <div class="card-header">
                          <h4>User details of user-<%= userid %></h4>
                       </div>
                       <div class="card-body">
                            <div id="profile-edit">
                          <h3 class="mt-2">Please Edit Carefully</h3>
                              <form action="EditUser" method="post" enctype="multipart/form-data">
                               <table class="table">
        <tr>
          <td>ID</td>
          <td><input type="text" class="form-control" name="userid" value="<%=u.getId() %>" readonly></td>
        </tr>
        
        <tr>
          <td>Name</td>
          <td><input type="text" class="form-control" name="userfirstname" value="<%=u.getFirstname()%>"> <input type="text" class="form-control" name="userlastname" value="<%=u.getLastname()%>"></td>
        </tr>
        
        <tr>
          <td>Username</td>
          <td><input type="text" class="form-control" name="userusername" value="<%=u.getUsername()%>"></td>
        </tr>
        
        <tr>
          <td>Password</td>
          <td><input type="password" class="form-control" name="userpassword" value="<%=u.getPassword()%>"  ></td>
        </tr>
        
        <tr>
          <td>Gender</td>
          <td><input type="text" class="form-control" name="usergender" value="<%=u.getGender()%>" readonly></td>
        </tr>
        
        <tr>
          <td>Phone no</td>
          <td><input type="number" class="form-control" name="userphoneno" value="<%=u.getPhoneno()%>"></td>
        </tr>
        
        <tr>
          <td>Email</td>
          <td><input type="email" class="form-control" name="useremail" value="<%=u.getEmail()%>"></td>
        </tr>
        
        <tr>
          <td>City</td>
          <td><input type="text" class="form-control" name="usercity" value="<%=u.getCity()%>"></td>
        </tr>
        
        <tr>
          <td>State</td>
          <td><select id="state" name="userstate" class="form-control">
                       <option value="Karnataka">Karnataka</option>
                       <option value="Andhra Pradesh">Andhra Pradesh</option>
                       <option value="Kerala">Kerala</option>
                      <option value="Tamil Nadu">Tamil Nadu</option>
                      <option value="Telangana">Telanagana</option>
                      <option value="Goa">Goa</option>
                   </select>
          </td>
        </tr>
        
         <tr>
          <td>Pincode</td>
          <td><input type="text" class="form-control" name="userzip" value="<%=u.getZip()%>"></td>
        </tr>
        
         <tr>
          <td>Type</td>
          <td><input type="text" name="usertype" class="form-control" value="<%=u.getType() %>" readonly ></td>
        </tr>
        
         <tr>
          <td>New Profile</td>
          <td>
             <input type="file" name="userimage" class="form-control" value="<%=u.getProfile()%>" accept="image/*" >
          </td>
          
          <tr>
          <td>About</td>
          <td>
             <textArea class="form-control" name="userabout" rows="5"><%=u.getAbout()%>
             </textArea>
          </td>
        </tr>
       </table>
       
       <div class="container">
          <button type="submit" class="btn btn-outline-dark">EDIT</button>
       </div>
       
     </form>
     </div>
        </div>
      </div>
    </div>
  </div>
</div>
     </div>
     
     
       
        </div>
      
   
                 
             
             
             
             
             
             
             
             
             <!-- END of main content -->
           
<footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; SweetHome</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="TermsConditions.html">Terms and conditions</a></li>
      <li class="list-inline-item"><a href="About_us.jsp">About Us</a></li>
      <li class="list-inline-item"><a href="ContactUs.jsp">Contact</a></li>
    </ul>
    <p class="float-right"><a href="#">Back to top</a></p>
  </footer> 
         
</div>

<script src="js/jquery.js" type="text/javascript"></script>
<script src="bootstrap-4.5.0-dist/js/bootstrap.min.js" type="text/javascript"></script>
<script src="bootstrap-4.5.0-dist/js/popper.min.js" type="text/javascript"></script>
<script>
$(document).ready(function(){
	localStorage.setItem("Select1","<%= user.getState()%>");
	 $('#userstate').find('option').each(function(i,e){
		 if($(e).val()==localStorage.getItem("Select1")){
			 $('#userstate').prop('selectedIndex',i);
		 }
	 });
</script>
</body>
</html>
<%@ page import="entities.*"  %>
<%@page import="Servlet.*" %>
<%@page import="Helper.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page errorPage="error_page.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//HTTP 1.1
  response.setHeader("Pragma","no-cache");//HTTP 1.0
  response.setHeader("Expires", "0");//proxies
  User user=(User)session.getAttribute("currentuser");
 if(user==null)
 {
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
	 if(user.getType().equals("Owner")){
		 Message msg=new Message("You are not allowed to access this page","error","alert-danger alert-dismissible fade show");
		 session.setAttribute("msg", msg);
		 response.sendRedirect("login_page.jsp"); 
	 }
 }
 session.setAttribute("currentuser", user);
 UserDao userdao=new UserDao(ConnectionProvider.getConnection());
%>
<%
PropertyDao dao=new PropertyDao(ConnectionProvider.getConnection());
ArrayList<Categories> list1=dao.getAllCategories();
List<Property> list2=dao.getAllProperty();
List<User> list3=dao.getAllUser();
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<link href="bootstrap-4.5.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="bootstrap-4.5.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/all.min.css" rel="stylesheet" type="text/css" />
<link href="css/mystyle.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet">
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="bootstrap-4.5.0-dist/js/bootstrap.min.js" type="text/javascript"></script>
<script src="bootstrap-4.5.0-dist/js/popper.min.js" type="text/javascript"></script>
<script src="css/sweetalert2.all.min.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</head>
<body>
<!-- navbar start -->
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
        <a class="nav-link" href="Welcome1.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
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
    
      <li class="nav-item active">
        <a class="nav-link" href="LogoutServlet" >
        <svg class="bi bi-arrow-right-circle-fill" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-8.354 2.646a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L9.793 7.5H5a.5.5 0 0 0 0 1h4.793l-2.147 2.146z"/>
         </svg>
        LogOut</a>
      </li>
    </ul>
  </div>
</nav> 

<!-- navbar end -->
 <%
              Message m=(Message)session.getAttribute("msg");
              if(m!=null){ 
        	%>
        	<div class="alert <%=m.getCssClass() %>" role="alert">
               <%=m.getContent() %>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                </button>
            </div>
           <% 
               session.removeAttribute("msg");
             }
           %>

<div class="container admin">

<!-- row 1 start -->

  <div class="row mt-3">
    <div class="col-md-4">
       <div class="card" onmouseover="this.style.background='#e2e2e2';" onmouseout="this.style.background='white';">
         <div class="card-body text-center" onMouseOver="this.style.cursor='pointer'">
           <div class="container">
            <img style="max-width: 150px" class="img-fluid" src="img/group.png"  alt="...">
           </div>
           <p class="mt-2"><A class="text-decoration-none" style="color:black" style="text-decoration:none;" href="getAllusers.jsp">Click here to view all users</A></p>
           <h2><%=list3.size() %></h2>
           <h2 class="text-muted">Users</h2>
         </div>
       </div>
    </div>
    <div class="col-md-4">
      <div class="card" onmouseover="this.style.background='#e2e2e2';" onmouseout="this.style.background='white';" >
         <div class="card-body text-center" onMouseOver="this.style.cursor='pointer'">
         <div class="container">
            <img style="max-width: 150px" class="img-fluid" src="img/property.png"  alt="...">
           </div>
           <p class="mt-2"><A class="text-decoration-none" style="color:black" style="text-decoration:none;" href="SHOWALLPROPERTY.jsp">Click here to view all properties</A></p>
           <h2><%=list2.size()%></h2>
           <h2 class="text-muted">Properties</h2>
         </div>
       </div>
    </div>
    <div class="col-md-4">
    
      <div class="card" data-toggle="modal" onclick="Welcome1.jsp" data-target="#propertytypeModal" onmouseover="this.style.background='#e2e2e2';" onmouseout="this.style.background='white';">
         <div class="card-body text-center" onMouseOver="this.style.cursor='pointer'" onmouseover="this.style.background='#e2e2e2';">
         <div class="container">
            <img style="max-width: 150px" class="img-fluid" src="img/property types.png"  alt="...">
           </div>
           <p class="mt-2">Click here to view all property types</p>
           <h2><%=list1.size() %></h2>
           <h2 class="text-muted">Property types</h2>
         </div>
         </div>
       </div>
    
  </div>
  
  
  <!-- row 1 end -->
  
  <!-- row 2 start -->
  <div class="row mt-3">
    <div class="col-md-6">
       <div class="card" data-toggle="modal" data-target="#addusermodal" onmouseover="this.style.background='#e2e2e2';" onmouseout="this.style.background='white';">
         <div class="card-body text-center" onMouseOver="this.style.cursor='pointer'">
           <div class="container">
            <img style="max-width: 150px" class="img-fluid" src="img\adduser.png"  alt="...">
           </div>
           <p class="mt-2">Click here to add new user</p>
           <h2 class="text-muted">Add User</h2>
         </div>
       </div>
    </div>
    <div class="col-md-6">
      <div class="card" data-toggle="modal" data-target="#addpropertymodal" onmouseover="this.style.background='#e2e2e2';" onmouseout="this.style.background='white';">
         <div class="card-body text-center" onMouseOver="this.style.cursor='pointer'">
         <div class="container">
            <img style="max-width: 150px" class="img-fluid" src="img\addproperty.png"  alt="...">
           </div>
           <p class="mt-2">Click here to add new property</p>
           <h2 class="text-muted">Add Property</h2>
         </div>
       </div>
    </div>
    
  </div>
  <!-- row 2 end -->
</div>



<!-- add property start -->
<div class="modal fade" id="addpropertymodal" tabindex="-1" role="dialog" aria-labelledby="addpropertymodalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Fill Property details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="property-form" name="property-form" action="AddProperty" method="post" enctype="multipart/form-data">
               <!--   <div class="form-group">
                <label for="price">Ownerid:</label> 
                  <input type="text" class="form-control" id="oid"  name="oid" value="<%=user.getId() %>" required>
              </div>-->
              
               <div class="form-group">
              <div class="input-group mb-3">
              <label for="price">Ownerid:</label>
                <input type="text" class="form-control" id="oid"  name="oid" aria-label="Recipient's username" aria-describedby="button-addon2" autocomplete="off">
              <div class="input-group-append">
                <button class="btn btn-outline-secondary" type="button" id="button-addon2" data-toggle="modal" data-target="#OwnerModal">OwnerID</button>
              </div>
              </div>
              </div>
              
              
                
               <div class="form-group">
               <label for="propertytype">Property Type</label>
               <select id="propertytype" name="propertytype" class="form-control">
                       <% 
            		      ArrayList<Categories> list=dao.getAllCategories();
            		      for(Categories c:list){
                        %>
                        <option value="<%=c.getCategory_name()%>"><%=c.getCategory_name()%></option>
                        <%} %>
              </select>
             </div>
             
              <div class="form-group">
               <label for="sqfeet">Area:</label> 
                 <select id="sqfeet" name="sqfeet" class="form-control">
                      <option value="100-500" selected>100-500 sqft</option>
                      <option value="500-1000">500-1000</option>
                      <option value="1000-3000">1000-3000</option>
                      <option value="3000-6000">3000-6000</option>
                      <option value="6000-10000">6000-10000</option>
                      <option value="10000-15000">10000-15000</option>
                   </select>
              </div>
              
              <div class="form-group">
                <label for="price">Price:</label> 
                  <input type="text" class="form-control" id="price" name="price" placeholder="Enter price in Rupees" required autocomplete="off">
              </div>
              
              <div class="form-group">
                <label for="street">Street:</label> 
                  <input type="text" class="form-control" id="street" name="street" placeholder="Enter street or locality details" autocomplete="off">
              </div>
              
              <div class="form-group">
                <label for="city">City:</label> 
                  <input type="text" class="form-control" id="city" name="city" placeholder="Enter city" required autocomplete="off">
              </div>
              
              <div class="form-group col-md-4">
                   <label for="state">State</label>
                   <select id="state" name="state" class="form-control">
                       <option value="Karnataka" selected>Karnataka</option>
                       <option value="Andhra Pradesh">Andhra Pradesh</option>
                       <option value="Kerala">Kerala</option>
                      <option value="Tamil Nadu">Tamil Nadu</option>
                      <option value="Telangana">Telanagana</option>
                      <option value="Goa">Goa</option>
                   </select>
             </div>
             
             <div class="form-group">
                <label for="pincode">Pincode:</label> 
                  <input type="text" class="form-control" id="pincode" name="pincode" placeholder="Enter pincode" autocomplete="off">
              </div>
              
              <div class="form-group col-md-4">
                   <label for="bedroom">Bedroom</label>
                    <select name="bedroom" id="bedroom" class="form-control">
                         <option value="0">0</option>
                         <option value="1">1</option>
                         <option value="2">2</option>
                         <option value="3 or more">3 or more</option>
                    </select>
               </div>   
               
               <div class="form-group col-md-4">
                   <label for="bathroom">Bathroom</label>
                    <select name="bathroom" id="bathroom" class="form-control">
                         <option value="0">0</option>
                         <option value="1">1</option>
                         <option value="2">2</option>
                         <option value="3 or more">3 or more</option>
                    </select>
               </div> 
               
               <div class="form-group col-md-4">
                   <label for="age">Age</label>
                    <select name="age" id="age" class="form-control">
                         <option value="0">0</option>
                         <option value="1">1</option>
                         <option value="2">2</option>
                         <option value="3 or more">3 or more</option>
                    </select>
               </div> 
               
               <div class="form-group col-md-4">
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="balcony" id="balcony" value="option1">
                    <label class="form-check-label" for="exampleRadios1">Balcony</label>
                 </div>
                 
                 <div class="form-check">
                    <input class="form-check-input" type="radio" name="pool" id="pool" value="option1">
                    <label class="form-check-label" for="exampleRadios1">Pool</label>
                 </div>
                 
                 <div class="form-check">
                    <input class="form-check-input" type="radio" name="backyard" id="backyard" value="option1">
                    <label class="form-check-label" for="exampleRadios1">Backyard</label>
                 </div>
                 
                 <div class="form-check">
                    <input class="form-check-input" type="radio" name="garage" id="garage" value="option1">
                    <label class="form-check-label" for="exampleRadios1">Garage</label>
                 </div>
              </div>
              
              <div class="form-group">
                <label for="pimage">Property image:</label> 
                  <input type="file" class="form-control" id="pimage" name="pimage" accept="image/*">
                  
              </div>
              
              <div class="form-group">
                  <textarea  name="pdescription" id="pdescription" class="form-control"  rows="5" placeholder="Give a small description on the property"></textarea>       
              </div>
                 
              <div class="container text-center">
              <button type="submit" class="btn btn-dark">Add Property</button>
              <button type="reset" class="btn btn-outline-secondary">Reset</button>
             </div>    
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->

<!-- end add property modal -->

<!-- Owner details -->

<% List<User> ownerlist=userdao.selectOwnerUser();
%>


<!-- Modal -->
<div class="modal fade" id="OwnerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Owners and thier ids</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Owner ID</th>
     
      <th scope="col">Owner name</th>
      
    </tr>
  </thead>
  <tbody>
  <%
  int i=0;
  for(User s:ownerlist){
	  i++;
   %>
    <tr>
      <th scope="row"><%=i %></th>
      <td><%=s.getId() %></td>
      <td><%=s.getFirstname()%> <%=s.getLastname() %></td>
      
    </tr>
    <%} %>
  </tbody>
</table>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>




<!-- end of owner details -->


<!-- add user start -->

<!-- Modal -->
<div class="modal fade" id="addusermodal" tabindex="-1" role="dialog" aria-labelledby="addusermodalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Fill User details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="reg-form" action="AddUser" method="post">
              <div class="form-group">
               <label for="username">User Name</label>
               <input type="text" class="form-control" id="username" placeholder="Enter name" name="username" required autocomplete="off">
             </div>
              
             <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" placeholder="password" name="password" required autocomplete="off">
            </div>
            
            <div class="row">
               <div class="col">
               <label for="firstname">First name</label>
                  <input type="text" class="form-control" placeholder="Enter First name" name="firstname" id="firstname" required autocomplete="off">
               </div>
               <div class="col">
               <label for="lastname">Last name</label>
                 <input type="text" class="form-control" placeholder="Enter Last name" name="lastname" id="lastname" autocomplete="off">
               </div>
            </div>
            <br>
            
             <div class="form-group">
               <label for="gender">Select gender</label>
               <br>
               <input type="radio" id="gender" value="male" name="gender">Male 
               <input type="radio" id="gender" value="female" name="gender">Female
             </div>
            
              <div class="form-group">
               <label for="phoneno">Phone no</label>
               <input type="tel" pattern="[789][0-9]{9}" minlength=10 maxlength="10" title="Please enter valid phone number" inputmode="numeric"  class="form-control" id="phoneno" name="phoneno" placeholder="Enter phone number" autocomplete="off" required>
               <small id="phoneHelp" class="form-text text-muted">Enter proper phone number(exactly 10 digits)</small>
             </div>
             
             <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" class="form-control" title="Please enter valid email address" id="email" name="email" aria-describedby="emailHelp" autocomplete="off">
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
             </div>
             
            <div class="form-row">
             <div class="form-group col-md-6">
                   <label for="city">City</label>
                   <input type="text" name="city" class="form-control" id="inputCity" autocomplete="off">
             </div>
             <div class="form-group col-md-4">
                   <label for="state">State</label>
                   <select id="state" name="state" class="form-control">
                       <option value="Karnataka" selected>Karnataka</option>
                       <option value="Andhra Pradesh">Andhra Pradesh</option>
                       <option value="Kerala">Kerala</option>
                      <option value="Tamil Nadu">Tamil Nadu</option>
                      <option value="Telangana">Telanagana</option>
                      <option value="Goa">Goa</option>
                   </select>
             </div>
             <div class="form-group col-md-2">
                      <label for="zip">Zip</label>
                     <input type="text" class="form-control" id="zip" name="zip" autocomplete="off">
              </div>
            </div>
             
      <div class="form-group col-md-4">
         <label for="type">Type</label>
              <select id="type" name="type" class="form-control">
                  <option value="Client">Client</option>
                  <option value="Owner">Owner</option>
              </select>
             </div>
            
            
            <div class="form-group">
             <textarea  name="about" id="about" class="form-control"  rows="5" placeholder="enter something about you"></textarea>       
           </div>
            
           
           
            <div class="container text-center">
              <button type="submit" class="btn btn-dark">Add User</button>
              <button type="reset" class="btn btn-outline-secondary">Reset</button>
             </div> 
            
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!--add user ends  -->
 
 <!-- show property modal-->
 
<!-- Modal -->
<div class="modal fade" id="propertytypeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Property types</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <table class="table">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">NAME</th>
      <th scope="col">DESCRIPTION</th>
    </tr>
  </thead>
  <tbody>
  <% for(Categories c:list){ %>
    <tr>
      <th scope="row"><%=c.getCategory_id() %></th>
      <td><%=c.getCategory_name() %></td>
      <td><%=c.getCategory_description() %></td>
    </tr>
    
    <%} %>
      
  </tbody>
</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>
 
 
</body>
</html>
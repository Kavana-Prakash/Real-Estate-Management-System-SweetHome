<%@ page import="entities.*"  %>
<%@page import="Servlet.*" %>
<%@page import="Dao.*" %>
<%@page import="Servlet.*" %>
<%@page import="Helper.*" %>
<%@page import="java.util.*" %>
<%@page errorPage="error_page.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//HTTP 1.1
response.setHeader("Pragma","no-cache");//HTTP 1.0
response.setHeader("Expires", "0");//proxies
  User user=(User)session.getAttribute("currentuser");

 if(user==null){
	 Message msg=new Message("You are not logged in ","error","alert-danger alert-dismissible fade show");
	 out.print(msg+"1st");
	 session.setAttribute("msg", msg);
	 response.sendRedirect("login_page.jsp");
 }
 else {
	 if(user.getType().equals("Client")){
		 Message msg=new Message("You are not allowed to access this page","error","alert-danger alert-dismissible fade show");
		 out.print(msg+"2nd");
		 session.setAttribute("msg", msg);
		 response.sendRedirect("login_page.jsp"); 
	 }
	 if(user.getType().equals("Admin")){
		 Message msg=new Message("You are not allowed to access this page","error","alert-danger alert-dismissible fade show");
		 out.print(msg+"3rd");
		 session.setAttribute("msg", msg);
		 response.sendRedirect("login_page.jsp"); 
	 }
 }
 session.setAttribute("currentuser", user);
 
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Owner</title>
<link href="bootstrap-4.5.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="bootstrap-4.5.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="bootstrap-4.5.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="bootstrap-4.5.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet">
<link href="css/all.min.css" rel="stylesheet" type="text/css" />
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
      
      <li class="nav-item dropdown active">
        <a class="nav-link dropdown-toggle"  id="navbarDropdown" role="button" data-toggle="modal" data-target="#propertytypeModal">
          About Property Types
        </a>
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
               
            </div>
           <% 
               session.removeAttribute("msg");
             }
           %>
<%PropertyDao dao=new PropertyDao(ConnectionProvider.getConnection()); %>
<!-- profile modal -->
<div class="modal fade" id="profilemodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-dark text-white">
        <h5 class="modal-title" id="exampleModalLabel">SweetHome</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container text-center">
          <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%; max-width: 150px;">
          <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getUsername() %></h5>
          
          <!-- details -->
          
          <div id="profile-detail">
            <table class="table">
           
                <tbody>
                  <tr>
                  <th scope="row">ID</th>
                    <td><%=user.getId() %></td>
                   </tr>
                   <tr>
                  <th scope="row">Name</th>
                    <td><%=user.getFirstname()%> <%=user.getLastname() %></td>
                  </tr>
         
                  <tr>
                  <th scope="row">Gender</th>
                   <td><%=user.getGender() %></td>
                  </tr>
         
                   <tr>
                   <th scope="row">Phone no</th>
                     <td><%=user.getPhoneno() %></td>
                   </tr>
         
                   <tr>
                   <th scope="row">Email</th>
                      <td><%=user.getEmail()%></td>
                   </tr>
         
                   <tr>
                   <th scope="row">City</th>
                     <td><%=user.getCity() %></td>
                   </tr>
         
                   <tr>
                   <th scope="row">State</th>
                      <td><%=user.getState() %></td>
                   </tr>
         
                   <tr>
                   <th scope="row">Pin code</th>
                      <td><%=user.getZip() %></td>
                   </tr>
         
                   <tr>
                   <th scope="row">About</th>
                    <td><%=user.getAbout() %></td>
                  </tr>
         
                   <tr>
                   <th scope="row">Registered on</th>
                     <td><%=user.getRdate().toString() %></td>
                  </tr>
             </tbody>
            </table>
          </div>
     <!-- details end -->
     
     <div id="profile-edit" style="display: none;">
        <h3 class="mt-2">Please Edit Carefully</h3>
     <form action="EditServlet1" method="post" enctype="multipart/form-data">
        <table class="table">
        <tr>
          <td>ID</td>
          <td><%=user.getId() %></td>
        </tr>
        
        <tr>
          <td>Name</td>
          <td><input type="text" class="form-control" name="userfirstname" value="<%=user.getFirstname()%>"> <input type="text" class="form-control" name="userlastname" value="<%=user.getLastname()%>"></td>
        </tr>
        
        <tr>
          <td>Username</td>
          <td><input type="text" class="form-control" name="userusername" value="<%=user.getUsername()%>"></td>
        </tr>
        
        <tr>
          <td>Password</td>
          <td><input type="password" class="form-control" name="userpassword" value="<%=user.getPassword()%>"  ></td>
        </tr>
        
        <tr>
          <td>Gender</td>
          <td><%=user.getGender().toUpperCase() %></td>
        </tr>
        
        <tr>
          <td>Phone no</td>
          <td><input type="number" class="form-control" name="userphoneno" value="<%=user.getPhoneno()%>"></td>
        </tr>
        
        <tr>
          <td>Email</td>
          <td><input type="email" class="form-control" name="useremail" value="<%=user.getEmail()%>"></td>
        </tr>
        
        <tr>
          <td>City</td>
          <td><input type="text" class="form-control" name="usercity" value="<%=user.getCity()%>"></td>
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
          <td><input type="text" class="form-control" name="userzip" value="<%=user.getZip()%>"></td>
        </tr>
        
         <tr>
          <td>Type</td>
          <td><%=user.getType() %></td>
        </tr>
        
         <tr>
          <td>New Profile</td>
          <td>
             <input type="file" name="userimage" class="form-control" value="<%=user.getProfile()%>" accept="image/*" >
          </td>
          
          <tr>
          <td>About</td>
          <td>
             <textArea class="form-control" name="userabout" rows="5"><%=user.getAbout()%>
             </textArea>
          </td>
        </tr>
       </table>
       
       <div class="container">
          <button type="submit" class="btn btn-light">SAVE</button>
       </div>
       
     </form>
     </div>
     
     
       
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-outline-dark">EDIT</button>
      </div>
    </div>
  </div>
</div>

<!-- profile modal end -->

<!-- show property modal-->
 <%PropertyDao cdao=new PropertyDao(ConnectionProvider.getConnection());
   ArrayList<Categories> clist=dao.getAllCategories();
   
 %>

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
  <% for(Categories c:clist){ %>
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




<!-- Add property modal -->
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
        <form id="property-form" name="property-form" action="AddServletOwner" method="post" enctype="multipart/form-data">
                <div class="form-group">
                <label for="price">Owner ID:</label> 
                  <input value="<%=user.getId() %>" type="text" class="form-control" id="oid" name="oid" readonly>
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
                  <input type="text" class="form-control" id="price" name="price" placeholder="Enter price in Rupees" autocomplete="off" required>
              </div>
              
              <div class="form-group">
                <label for="street">Street:</label> 
                  <input type="text" class="form-control" id="street" name="street" placeholder="Enter street or locality details">
              </div>
              
              <div class="form-group">
                <label for="city">City:</label> 
                  <input type="text" class="form-control" id="city" name="city" placeholder="Enter city" required>
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
                  <input type="text" class="form-control" id="pincode" name="pincode" placeholder="Enter pincode">
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
<!--delete Property  Modal -->


<!-- Modal -->
<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Confirm Delete</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Are you sure to delete the property
      </div>
      <div class="modal-footer">
        
        <a class="btn btn-outline-dark btn-ok">Yes</a>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
      </div>
    </div>
  </div>
</div>





<!-- end delete property modal -->
<!--delete Property  Modal -->


<!-- Modal -->
<div class="modal fade" id="Accountdelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Confirm Delete</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Are you sure to delete Your account
      </div>
      <div class="modal-footer">
        
        <a class="btn btn-outline-dark" href="<%=request.getContextPath() %>/DeleteAccount">Yes</a>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
      </div>
    </div>
  </div>
</div>





<!-- end delete property modal -->




<!-- Modal -->




<!-- end property delete modal -->
<%
StatusDao sdao=new StatusDao(ConnectionProvider.getConnection());
List<Status> statuslist=sdao.getStatusbyownerid(user.getId()); 
UserDao userdao=new UserDao(ConnectionProvider.getConnection());
int i=0;
%>
<!-- Modal -->
<div class="modal fade" id="statusModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Request Status</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Property ID</th>
      <th scope="col">Client ID</th>
      <th scope="col">Client name</th>
      <th scope="col">Contact details</th>
      <th scope="col">Status</th>
    </tr>
  </thead>
  <tbody>
  <%for(Status s:statuslist){
	  i++;
   %>
    <tr>
      <th scope="row"><%=i %></th>
      <td><%=s.getPropid() %></td>
      <td><%=s.getClientid()%></td>
      <td><%=userdao.getUsernameByUserID(s.getClientid()) %>
      </td>
      <td>Contact no:<%=userdao.getPhonenumberByUserID(s.getClientid()) %>
     <br>Email:<%=userdao.getEmailByUserID(s.getClientid()) %></td>
      <td><%=s.getStatus() %></td>
      <%if(s.getStatus()!="sold"){ %>
      <td><a href="AcceptRequest.jsp?propid=<%=s.getPropid() %>&clientid=<%=s.getClientid()%>"class="text-decoration-none" style="color:black">Reject/Accept request here</a></td>
      <%} %>
    </tr>
    <%} %>
  </tbody>
  <p>Number of properties sold here before:<%=sdao.countNumberOfRequestsHistory(user.getId()) %></p>
</table>
      </div>
      <div class="modal-footer">
      <p>Please delete the property details from the list once registration procedure completed as per terms and conditions</p>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<!-- end of show status modal -->

<%


List<Property> list1=null;  %>
<div class="container-fluid">
 <div class="row mt-3 mx-2">
   <div class="col-md-2">
    <div class="list-group mt-4">
  <a href="#!" class="list-group-item list-group-item-action" onmouseover="this.style.background='#e2e2e2';" onmouseout="this.style.background='white';" data-toggle="modal" data-target="#profilemodal">View and Edit Profile</a>
  <a href="viewallproperties.jsp" class="list-group-item list-group-item-action" onmouseover="this.style.background='#e2e2e2';" onmouseout="this.style.background='white';">View other properties</a>
  <a href="#!" class="list-group-item list-group-item-action" onmouseover="this.style.background='#e2e2e2';" onmouseout="this.style.background='white';" data-toggle="modal" data-target="#addpropertymodal">Add property</a>
  <a  href="#!" class="list-group-item list-group-item-action" onmouseover="this.style.background='#e2e2e2';" onmouseout="this.style.background='white';" data-toggle="modal" data-target="#statusModal">Property Requests<span><%=sdao.countNumberOfRequests(user.getId()) %></span></a>
  <a  href="#!" class="list-group-item list-group-item-action" onmouseover="this.style.background='#e2e2e2';" onmouseout="this.style.background='white';"  data-toggle="modal" data-target="#Accountdelete">Delete Account</a>
  </div>
</div>
   <div class="col-md-10">
        <div class="row mt-4">
           <div class="col-md-12">
             <div class="card-columns">
<%
                
               
                	list1=dao.getPropertybyownerid(user.getId());
               
                if(list1.size()==0){
                	out.print("<h3>");
                	out.print("Please add your properties");
                	out.print("</h3>");
                }
               
               
                   for(Property p:list1){
                 %>
                 <div class="card" onmouseover="this.style.background='#e2e2e2';" onmouseout="this.style.background='white';">
                       <div class="container text-center">
                      <img src="img/properties/<%=p.getImg()%>"  style="max-height:190px; max-width:100%;width:auto;" class="card-img-top m-2" alt="...">
                     </div>  
                    <div class="card-body" onMouseOver="this.style.cursor='pointer'">
                      <h5 class="card-title"><%=p.getState() %></h5>
                      <h6>Property ID:<%=p.getPid()%></h6>
                       <p class="card-text"><%=p.getCity()%><br>Price:&#8377;<%=p.getPrice() %></p>
                    </div>
                    <div class="card-footer" onMouseOver="this.style.cursor='pointer'">
                    
                      <a class="btn btn-outline-dark btn-sm" href="showProperty.jsp?propid=<%=p.getPid()%>">Details</a>
                      <a class="btn btn-dark btn-sm" href="editProperty.jsp?propid=<%=p.getPid()%>">Edit</a>
                      <a class="btn btn-danger btn-sm" data-href="<%=request.getContextPath() %>/DeleteProperty?propid=<%=p.getPid()%>" data-toggle="modal" data-target="#confirm-delete">Delete</a>         
                    </div>
                 </div>
                 <%
                 
                   }%>
             </div>
           </div>
        </div>
   </div>
 </div>
 </div>
<footer class=" my-5 pt-5 text-muted text-center text-small"> 
    <p class="mb-1">&copy; SweetHome</p>
    <ul class="list-inline">
     <!--  <li class="list-inline-item"><a href="TermsConditions.html">Terms and conditions</a></li>
      <li class="list-inline-item"><a href="About_us.jsp">About Us</a></li>
      <li class="list-inline-item"><a href="ContactUs.jsp">Contact</a></li>
    </ul>
    <p class="float-right"><a href="#">Back to top</a></p> -->
 </footer> 
<script src="js/jquery.js" type="text/javascript"></script>
<script src="bootstrap-4.5.0-dist/js/bootstrap.min.js" type="text/javascript"></script>
<script src="bootstrap-4.5.0-dist/js/popper.min.js" type="text/javascript"></script>
<script src="css/sweetalert2.all.min.js" type="text/javascript"></script>

<script>
  $(document).ready(function(){
	  
	  let editStatus=false;
	  
	 $('#edit-profile-button').click(function(){
		 if(editStatus==false){
			 $("#profile-detail").hide()
			 $("#profile-edit").show(); 
			 editStatus=true;
			 $(this).text("BACK")
			 localStorage.setItem("Select1","<%= user.getState()%>");
			 $('#userstate').find('option').each(function(i,e){
				 if($(e).val()==localStorage.getItem("Select1")){
					 $('#userstate').prop('selectedIndex',i);
				 }
			 });
		 }
		 else{
			 $("#profile-detail").show()
			 $("#profile-edit").hide(); 
			 editStatus=false;
			 $(this).text("EDIT")
		 }
		 

	 }) 
  });


</script>
<script>

  $('#confirm-delete').on('show.bs.modal',function(e){
	  $(this).find('.btn-ok').attr('href',$(e.relatedTarget).data('href'));
  });
</script>
</body>
</html>
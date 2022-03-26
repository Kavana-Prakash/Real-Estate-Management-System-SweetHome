<%@ page import="entities.*"  %>
<%@page import="Servlet.*" %>
<%@page import="Helper.*" %>
<%@page import="Dao.*" %>
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
	 if(user.getType().equals("Admin")){
		 Message msg=new Message("You are not allowed to access this page","error","alert-danger alert-dismissible fade show");
		 session.setAttribute("msg", msg);
		 response.sendRedirect("login_page.jsp"); 
	 }
 }
 session.setAttribute("currentuser", user);
 
%>
<%
PropertyDao dao=new PropertyDao(ConnectionProvider.getConnection());
ArrayList<Categories> list1=dao.getAllCategories();
List<Property> list2=dao.getAllProperty();
List<User> list3=dao.getAllUser();
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Properties</title>
<link href="bootstrap-4.5.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="bootstrap-4.5.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
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
      
     <!--  <li class="nav-item dropdown active">
        <a class="nav-link dropdown-toggle"  id="navbarDropdown" role="button" data-toggle="modal" data-target="#propertytypeModal">
          About Property Types
        </a>
      </li> -->
      
    </ul>
    <ul class="navbar-nav mr-right">
     <li class="nav-item active">
       <a class="nav-link" href="#!" data-toggle="modal" data-target="#profilemodal" >
         <svg class="bi bi-person-check" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
           <path fill-rule="evenodd" d="M11 14s1 0 1-1-1-4-6-4-6 3-6 4 1 1 1 1h10zm-9.995-.944v-.002.002zM1.022 13h9.956a.274.274 0 0 0 .014-.002l.008-.002c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664a1.05 1.05 0 0 0 .022.004zm9.974.056v-.002.002zM6 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0zm6.854.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
         </svg>
       <%=user.getFirstname() %></a>
     </li>
    
     <!--  <li class="nav-item active">
        <a class="nav-link" href="LogoutServlet" >
        <svg class="bi bi-arrow-right-circle-fill" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-8.354 2.646a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L9.793 7.5H5a.5.5 0 0 0 0 1h4.793l-2.147 2.146z"/>
         </svg>
        LogOut</a>
      </li> -->
    </ul>
  </div>
</nav> 
<div class="text-center"><h4>To buy properties signup as a client and login</h4></div>
<!-- navbar end -->
<%
String cat=request.getParameter("category");


List<Property> list4=null;  
%>
<div class="container-fluid">
 <div class="row mt-3 mx-2">
   <div class="col-md-2">
    <div class="list-group mt-4">
  <a href="SHOWALLPROPERTY.jsp?category=all" onclick="myFunction()" class="list-group-item list-group-item-action" onmouseover="this.style.background='#e2e2e2';" onmouseout="this.style.background='white';">All types</a>
  <%
    for(Categories c:list1){
  %>
  <a href="viewallproperties.jsp?category=<%=c.getCategory_name()%>" class="list-group-item list-group-item-action" onmouseover="this.style.background='#e2e2e2';" onmouseout="this.style.background='white';"><%=c.getCategory_name()%></a>
  <%} %>
  </div>
</div>
   <div class="col-md-10">
        <div class="row mt-4">
           <div class="col-md-12">
             <div class="card-columns">
                <%
                if(cat==null){
                	list4=dao.getAllProperty();
                }
                else if(cat.trim().equals("all")){
                	   list4=dao.getAllProperty();
                 }
                   else{
                	   list4=dao.getPropertybycatname(cat.trim());
                   }
                if(list4.size()==0){
                	out.print("<h3 class='text-center'>");
                	out.print("No properties in this category");
                	out.print("</h3>");
                }
                
                   for(Property p:list4){
                 %>
                 <div class="card" onmouseover="this.style.background='#e2e2e2';" onmouseout="this.style.background='white';">
                       <div class="container text-center">
                      <img src="img/properties/<%=p.getImg()%>"  style="max-height:190px; max-width:100%;width:auto;" class="card-img-top m-2" alt="...">
                      
                     </div>  
                    <div class="card-body" onMouseOver="this.style.cursor='pointer'">
                      <h5 class="card-title"><%=p.getState() %></h5>
                       <p class="card-text"><%=p.getCity()%><br>Price:&#8377;<%=p.getPrice() %></p>
                    </div>
                    <div class="card-footer" onMouseOver="this.style.cursor='pointer'">
                      <a class="btn btn-outline-dark" href="showProperty.jsp?propid=<%=p.getPid()%>">Get more details</a>
                      <!--  <a class="btn btn-dark text-white" href="editProperty.jsp?propid=<%=p.getPid()%>">edit</a>-->
<%--                       <a class="btn btn-danger" href="<%=request.getContextPath() %>/AdminDeleteProperty?propid=<%=p.getPid()%>">Delete</a> --%>
                 </div>
                 </div>
                 <%}%>
             </div>
           </div>
        </div>
   </div>
   </div>
 </div>
</body>
</html>
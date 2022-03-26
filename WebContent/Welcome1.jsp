<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@page import="Helper.*" %>
<%@page import="Dao.*" %>
<%@page errorPage="error_page.jsp" %>
<%@page import="java.io.File" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List" %>
<%@page import="entities.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SweetHome|Welcome</title>
<link href="bootstrap-4.5.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="bootstrap-4.5.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>
<%@include file="Normal_navbar.jsp" %>
<div class="container-fluid p-0 m-0">
    <div class="jumbotron jumbotron-dark bg-dark" >
       <div class="container container-dark bg-dark">
           <h4 class="display-3" style="color:white">Welcome everyone</h4>
           <h5 style="color:white">Owners and Buyers</h5>
           <p style="color:white" >SEARCHING FOR PROPERTY YOU ARE IN RIGHT PLACE</p>
           <p style="color:white">SweetHome is an online platform where real estate trade is taking place in a much faster and newer manner. </p>
           <p style="color:white"> We not just help you with finding the ideal real estate, but also ensure that your buying journey is as smooth as it can be. We understand that while buying a property, there are a lot of factors to be taken into consideration, like the locality, preferred area, budget, amenities, and a lot more. SweetHome is the destination where you will end up finding the best suitable property available across South India.</p>
           <a href="register_page.jsp" class="btn btn-outline-light">
             <svg class="bi bi-arrow-right-circle" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
               <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
               <path fill-rule="evenodd" d="M7.646 11.354a.5.5 0 0 1 0-.708L10.293 8 7.646 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0z"/>
               <path fill-rule="evenodd" d="M4.5 8a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5z"/>
             </svg>
           Get In Be a part</a>
            <a href="login_page.jsp" class="btn btn-outline-light">
             <svg class="bi bi-person-plus" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd" d="M11 14s1 0 1-1-1-4-6-4-6 3-6 4 1 1 1 1h10zm-9.995-.944v-.002.002zM1.022 13h9.956a.274.274 0 0 0 .014-.002l.008-.002c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664a1.05 1.05 0 0 0 .022.004zm9.974.056v-.002.002zM6 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0zm4.5 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
              <path fill-rule="evenodd" d="M13 7.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0v-2z"/>
             </svg>
            Login</a>
      </div>
    </div>
   <br>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Login first</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <p>To get further details please login and see details in your dashboard</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="login_page.jsp" class="btn btn-outline-dark">LOGIN</a>
      </div>
    </div>
  </div>
</div>
<%
String cat=request.getParameter("category");
PropertyDao dao=new PropertyDao(ConnectionProvider.getConnection());
ArrayList<Categories> list=dao.getAllCategories();
List<Property> list1=null;  
%>
<div class="container-fluid">
 <div class="row mt-3 mx-2">
   <div class="col-md-2">
    <div class="list-group mt-4">
  <a href="Welcome1.jsp?category=all" onclick="myFunction()" class="list-group-item list-group-item-action" onmouseover="this.style.background='#e2e2e2';" onmouseout="this.style.background='white';">All types</a>
  <%
    for(Categories c:list){
  %>
  <a href="Welcome1.jsp?category=<%=c.getCategory_name()%>" class="list-group-item list-group-item-action" onmouseover="this.style.background='#e2e2e2';" onmouseout="this.style.background='white';"><%=c.getCategory_name()%></a>
  <%} %>
  </div>
</div>
   <div class="col-md-10">
        <div class="row mt-4">
           <div class="col-md-12">
             <div class="card-columns">
                <%
                if(cat==null){
                	list1=dao.getAllProperty();
                }
                else if(cat.trim().equals("all")){
                	   list1=dao.getAllProperty();
                 }
                   else{
                	   list1=dao.getPropertybycatname(cat.trim());
                   }
                if(list1.size()==0){
                	out.print("<h3 class='text-center'>");
                	out.print("No properties in this category");
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
                       <p class="card-text"><%=p.getCity()%><br>Price:&#8377;<%=p.getPrice() %></p>
                    </div>
                    <div class="card-footer" onMouseOver="this.style.cursor='pointer'">
                      <button class="btn btn-outline-dark" data-toggle="modal" data-target="#exampleModal">Get more details</button>
                 </div>
                 </div>
                 <%}%>
             </div>
           </div>
        </div>
   </div>
 </div>
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
<script src="bootstrap-4.5.0-dist/js/popper.min.js" type="text/javascript"></script>
<script src="bootstrap-4.5.0-dist/js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/app-ajax.js" type="text/javascript"></script>
<script>
</script>
</body>
</html>
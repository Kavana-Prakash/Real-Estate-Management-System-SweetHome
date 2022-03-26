<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="entities.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="bootstrap-4.5.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet">
<title>loginpage</title>
</head>
<body>
<%@include file="Normal_navbar.jsp" %>
<main class="d-flex align-items-center bg-dark" style="height: 70vh">
   <div class="container">
     <div class="row">
       <div class="col-md-4 offset-md-4">
         <div class="card">
           <div class="card-header bg-dark text-white text-center" >
           <svg class="bi bi-person-plus" width="3em" height="3em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd" d="M11 14s1 0 1-1-1-4-6-4-6 3-6 4 1 1 1 1h10zm-9.995-.944v-.002.002zM1.022 13h9.956a.274.274 0 0 0 .014-.002l.008-.002c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664a1.05 1.05 0 0 0 .022.004zm9.974.056v-.002.002zM6 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0zm4.5 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
              <path fill-rule="evenodd" d="M13 7.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0v-2z"/>
             </svg>
             <br>
           <p>LOGIN here</p>
           </div>
           
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
           
           <div class="card-body">
              <form action="LoginServlet" method="post">
                <div class="form-group">
                     <label for="username">Username</label>
                     <input type="text" class="form-control" id="username" name="username1" required autocomplete="off">
                     
               </div>
               <div class="form-group">
                     <label for="password">Password</label>
                     <input type="password" class="form-control" id="password" name="password1" required autocomplete="off">
               </div>
               
              <a href="register_page.jsp" ><i>if not registered click here</i></a><br>
              
               <div class="container text-center">
                <button type="submit" class="btn btn-outline-dark bg-dark text-white">Submit</button>
                 <button type="reset" class="btn btn-light btn-outline-dark">Reset</button>
               </div>
             </form>
           </div>
         </div>
       </div>
     </div>
   </div>
</main>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/app-ajax.js" type="text/javascript"></script>
</body>
</html>
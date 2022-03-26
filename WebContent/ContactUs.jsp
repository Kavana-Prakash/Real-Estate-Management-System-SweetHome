<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ContactUs</title>
<link href="bootstrap-4.5.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="bootstrap-4.5.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="Normal_navbar.jsp" %>
<div class="container-fluid p-0 m-0">
    <div class="jumbotron jumbotron-dark bg-dark" >
       <div class="container container-dark bg-dark">
           <h6 class="display-2" style="color:white">Contact us</h6>
           <p style="color:white">SweetHome is an online platform where real estate trade is taking place in a much faster and newer manner. </p>
           <p style="color:white">Phone number:91215646856</p>
           <p style="color:white">For any queries mail your concerns to the mail address: <b><a style="color:white" href="#!">sweetHome@email.com</a></b></p><br>
           <script type="text/javascript">
       function goback(){
    	   window.history.back();
       }
      </script>
<br/>
<button class="btn btn-outline-light" onclick="goback()">BACK</button>
      </div>
   </div>
   <br>
</div>
</body>
</html>
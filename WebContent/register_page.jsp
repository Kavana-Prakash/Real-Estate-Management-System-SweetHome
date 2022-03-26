<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link href="bootstrap-4.5.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="bootstrap-4.5.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet">

</head>
<body>
<%@include file="Normal_navbar.jsp" %>

<main class="bg-dark" style="padding-bottom: 120px;">
  <div class="container">
    <div class="col-md-10 offset-md-1">
      <div class="card">
        <div class="card-header text-center bg-dark text-white">
          <svg class="bi bi-person-lines-fill" width="3em" height="3em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
         <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm7 1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm-2-3a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm2 9a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5z"/>
         </svg>
         <br>
          REGISTER HERE
        </div>
        <div class="card-body">
           <form id="reg-form" action="RegisterServlet" method="post">
              <div class="form-group">
               <label for="username">User Name</label>
               <input type="text" class="form-control" id="username" placeholder="Enter name" name="username" autocomplete="off" required>
             </div>
              
             <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" placeholder="password" name="password" autocomplete="off" required>
            </div>
            
            <div class="row">
               <div class="col">
               <label for="firstname">First name</label>
                  <input type="text" class="form-control" placeholder="Enter First name" name="firstname" id="firstname" autocomplete="off" required>
               </div>
               <div class="col">
               <label for="lastname">Last name</label>
                 <input type="text" class="form-control" placeholder="Enter Last name" name="lastname" autocomplete="off" id="lastname">
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
                <input type="email" class="form-control" title="Please enter valid email address" id="email" name="email" autocomplete="off" placeholder="Enter email-id" aria-describedby="emailHelp">
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
             </div>
             
            <div class="form-row">
             <div class="form-group col-md-6">
                   <label for="city">City</label>
                   <input type="text" name="city" class="form-control" id="inputCity" placeholder="Enter city name " autocomplete="off">
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
                     <input type="text" class="form-control" id="zip" name="zip" placeholder="Enter pincode" autocomplete="off">
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
             <textarea  name="about" id="about" class="form-control"  rows="5" placeholder="enter something about you" autocomplete="off"></textarea>       
           </div>
            
           <div class="form-group form-check">
             <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
            <label class="form-check-label" for="exampleCheck1">Agree <a href="TermsConditions.html">terms and conditions</a></label>
           </div>
           
           <div class="container text-center" id="loading" style="display: none;">
             <h4>Loading please wait.......</h4>
           </div>
           
            <button id="submit-btn" type="submit" class="btn btn-outline-dark bg-dark text-white">Submit</button>
            <button type="reset" class="btn btn-light btn-outline-dark">Reset</button>
            </form>
        </div>
        
      </div>
    </div>
  </div>
</main>

<script src="js/jquery.js" type="text/javascript"></script>
<script src="bootstrap-4.5.0-dist/js/popper.min.js" type="text/javascript"></script>
<script src="css/sweetalert2.all.min.js" type="text/javascript"></script>
<script type="text/javascript" >
$(document).ready(function(){
	 console.log("loaded");
	 $('#reg-form').on('submit',function(event){
		event.preventDefault();
		let form=new FormData(this);
		$("#submit-btn").hide();
		$("#loading").show();
		$.ajax({
		  url:"RegisterServlet",
		  type: 'POST',
		  data: form,
		  success: function (data, textStatus, jqXHR){
			 console.log(data) 
			 $("#submit-btn").show();
		     $("#loading").hide();
		     if(data.trim()=='done'){
	             swal("registered successfully...we redirect you to login page.")
                 .then((value) => {
                   window.location="login_page.jsp"
              });
		     }
		     else
		    	 {
		    	 swal(data); 
		    	 }
		  },
		  error: function(jqXHR, textStatus, errorThrown){
			 console.log(jqXHR)
			  $("#submit-btn").show();
		      $("#loading").hide();  
		      swal("something went wrong... try again"); 
		  },
		  processData: false,
		  contentType: false
		});
	 });
	   
 });
</script>
</body>
</html>
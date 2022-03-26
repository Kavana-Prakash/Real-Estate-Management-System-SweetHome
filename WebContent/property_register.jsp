<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="bootstrap-4.5.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="bootstrap-4.5.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/all.min.css" rel="stylesheet" type="text/css" />
<link href="css/mystyle.css" rel="stylesheet">
</head>
<body>
<%-- <button data-toggle="modal" data-target="#addpropertymodal">Modal</button>
<div class="modal fade" id="addpropertymodal" tabindex="-1" role="dialog" aria-labelledby="addpropertyModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header bg-dark text-white">
        <h5 class="modal-title" id="addproductModalLabel">Fill Property details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>--%>
      <div class="modal-body">
          <form id="property-form"action="AddProperty" method="post">
          
               
              
              <div class="form-group col-md-4">
         <label for="ptype">Property Type</label>
              <select id="ptype" name="ptype" class="form-control">
                       <option value="Commercial">Commercial</option>
                       <option value="Agriculture">Agriculture</option>
                       <option value="Residential">Residential</option>
                       <option value="Industrial">Industrial</option>
                       <option value="Special Use">Special use</option>
                       <option value="Mixed Use">Mixed use</option>
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
                  <input type="text" class="form-control" id="price" name="price" placeholder="Enter price in Rupees" required>
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
                  <input type="file" class="form-control" id="pimage" name="pimage" placeholder="Enter proper property image" required accept="image/*">
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
 <!--     </div>
  </div>
</div>--> 
</body>
</html>
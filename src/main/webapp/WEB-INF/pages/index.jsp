<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Rent Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD0iD9YAtgOxEybEtVdXe_ztK2ron5UWnY"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/map.js"></script>
  <style>
  h3, h4 {
      margin: 10px 0 30px 0;
      letter-spacing: 10px;      
      font-size: 20px;
      color: #111;
  }
  .container {
      padding: 80px 120px;
  }
  .person {
      border: 10px solid transparent;
      margin-bottom: 25px;
      width: 80%;
      height: 80%;
      opacity: 0.7;
  }
  .person:hover {
      border-color: #f1f1f1;
  }
  .carousel-inner img {
      -webkit-filter: grayscale(90%);
      filter: grayscale(90%); /* make all photos black and white */ 
      width: 100%; /* Set width to 100% */
      margin: auto;
  }
  .carousel-caption h3 {
      color: #fff !important;
  }
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  }
  .bg-1 {
      background: #2d2d30;
      color: #bdbdbd;
  }
  .bg-1 h3 {color: #fff;}
  .bg-1 p {font-style: italic;}
  .list-group-item:first-child {
      border-top-right-radius: 0;
      border-top-left-radius: 0;
  }
  .list-group-item:last-child {
      border-bottom-right-radius: 0;
      border-bottom-left-radius: 0;
  }
  .thumbnail {
      padding: 0 0 15px 0;
      border: none;
      border-radius: 0;
  }
  .thumbnail p {
      margin-top: 15px;
      color: #555;
  }
  .btn {
      padding: 10px 20px;
      background-color: #333;
      color: #f1f1f1;
      border-radius: 0;
      transition: .2s;
  }
  .btn:hover, .btn:focus {
      border: 1px solid #333;
      background-color: #fff;
      color: #000;
  }
  .modal-header, h4, .close {
      background-color: #333;
      color: #fff !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-header, .modal-body {
      padding: 40px 50px;
  }
  .nav-tabs li a {
      color: #777;
  }
  #map-canvas {
      width: 100%;
      height: 100%;
      -webkit-filter: grayscale(100%);
      filter: grayscale(100%);
  }  
  .navbar {
      font-family: Montserrat, sans-serif;
      margin-bottom: 0;
      background-color: #2d2d30;
      border: 0;
      font-size: 11px !important;
      letter-spacing: 4px;
      opacity: 0.9;
  }
  .navbar li a, .navbar .navbar-brand { 
      color: #d5d5d5 !important;
  }
  .navbar-nav li a:hover {
      color: #fff !important;
  }
  .navbar-nav li.active a {
      color: #fff !important;
      background-color: #29292c !important;
  }
  .navbar-default .navbar-toggle {
      border-color: transparent;
  }
  .open .dropdown-toggle {
      color: #fff;
      background-color: #555 !important;
  }
  .dropdown-menu li a {
      color: #000 !important;
  }
  .dropdown-menu li a:hover {
      background-color: red !important;
  }
  footer {
      background-color: #2d2d30;
      color: #f5f5f5;
      padding: 32px;
  }
  footer a {
      color: #f5f5f5;
  }
  footer a:hover {
      color: #777;
      text-decoration: none;
  }  
  .form-control {
      border-radius: 0;
  }
  textarea {
      resize: none;
  }
  </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#myPage">Rent Home</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#myPage">HOME</a></li>
        <li><a href="#contact">PUT ON RENT</a></li>
        <li><a href="#map-canvas">FOR RENT</a></li>
      </ul>
    </div>
  </div>
</nav>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="${pageContext.request.contextPath}/resources/images/ny.jpg" alt="New York" width="1200" height="700">
        <div class="carousel-caption">
          <h3>Windsor, Ontario, Canada</h3>
          <p>A town right on the border.</p>
        </div>      
      </div>

      <div class="item">
        <img src="${pageContext.request.contextPath}/resources/images/chicago.jpg" alt="Chicago" width="1200" height="700">
        <div class="carousel-caption">
          <h3>Windsor, Ontario, Canada</h3>
          <p>A town right on the border.</p>
        </div>      
      </div>
    
      <div class="item">
        <img src="${pageContext.request.contextPath}/resources/images/la.jpg" alt="Los Angeles" width="1200" height="700">
        <div class="carousel-caption">
          <h3>Windsor, Ontario, Canada</h3>
          <p>A town right on the border.</p>
        </div>      
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>

<div id="band" class="container text-center">
  <h3>Rent Home</h3>
  <p><em>We help people to find home!</em></p>
  <p>We are a group of four Masters in Applied Computing students at University of Windsor. For our Advance Software Engineering we wanted to help new international students to find homes easily and know about rent trends. That's why we made this web application as our course project.</p>
  <br>
  <div class="row">


    
</div>

</div>






<!-- Container (Contact Section) -->
<div id="contact" class="container">
  <h3 class="text-center">House details</h3>

  <div class="row">

<div class="col-md-4">
      <p><span class="glyphicon glyphicon-map-marker"></span>  House / Apartment Number :</p>
      <p><span class="glyphicon glyphicon-map-marker"></span>  Street Name :</p>
      <p><span class="glyphicon glyphicon-map-marker"></span>  City :</p>
      <p><span class="glyphicon glyphicon-map-marker"></span>  Province :</p>
      <p><span class="glyphicon glyphicon-map-marker"></span>  Country :</p>
      <p><span class="glyphicon"></span>  Postal Code :</p>
      <p><span class="glyphicon"></span>  Rent :</p>
      <p><span class="glyphicon"></span>  Date :</p>
<!--       <p><span class="glyphicon glyphicon-phone"></span>  Phone : +1 519 1111111</p> -->
<!--       <p><span class="glyphicon glyphicon-envelope"></span>  Email : Email@example.com</p><br> -->
    </div>

   <form action="/RentHome/login" method="POST">
   <div class="col-sm-6 form-group">
        <input class="form-control" name="houseNumber" placeholder="House Number" type="text" required/>
   </div>
   <div class="col-sm-6 form-group">
        <input class="form-control" name="streetName" placeholder="Street Name" type="text" required/>
   </div>
   <div class="col-sm-6 form-group">     
        <input class="form-control"  name="cityName" placeholder="City" type="text" required/>
   </div>
   <div class="col-sm-6 form-group">
        <input class="form-control" name="provinceName" placeholder="Province" type="text" required/>
   </div>
   <div class="col-sm-6 form-group">
        <input class="form-control" name="country" placeholder="Country" type="text" required/>
   </div>
   <div class="col-sm-6 form-group">
        <input class="form-control" name="postalCode" placeholder="Postal Code" type="text" required/>
   </div>     
   <div class="col-sm-6 form-group">    
        <input class="form-control" name="rent" placeholder="Rent" type="text" required/>
   </div>
    <div class="col-sm-6 form-group">    
        <input class="form-control" name="date" placeholder="Date" type="text" required/>
   </div>      
<!--    <div class="col-sm-6 form-group"> -->
<!--         <input class="form-control" name="phone" placeholder="Phone" type="text" required/> -->
<!--    </div> -->
<!--    <div class="col-sm-6 form-group"> -->
<!--         <input class="form-control" name="emailAddress" placeholder="Email address" type="email" required /> -->
<!--    </div> -->
   <br>
   <div class="row">
        <div class="col-md-12 form-group">
          <input class="btn pull-right" type="submit" />
        </div>
      </div>
    </form>
  </div>
  <br>
</div>

<!-- Add Google Maps -->
 <div class="container">
		<script>
		var count = 0;
		var model = [];
		var markersData = [];
		
		var model1 = [];
		var count1 = 0;
		<c:forEach items ="${rentdetails}" var="rentdetail">
		model1[count1] = ${rentdetail.coordinates.id};
		model1[count1+1] = ${rentdetail.rent};
		model1[count1+2] = ${rentdetail.rentDate};
		count1 = count1+3;
		</c:forEach>
		
		<c:forEach items="${coordinates}" var="temp">  
			model[count] = ${temp.id};
			model[count+1] = ${temp.longitude};
			model[count+2] = ${temp.latitude};
			model[count+3] = ${temp.address};
			count = count+4;
			</c:forEach>
			
			var i, count1 = 0;
			for (i = 0; i < 3; i++) {
				markersData[i] = {
						id : model[count1],
						lat : model[count1+1],
						lng : model[count1+2],
						name : model[count1+3]
					};
				count1=count1+4;
			}
			
// necessary variables
var map;
var infoWindow;

function initialize() {
   var mapOptions = {
      center: new google.maps.LatLng(42.3095373,-83.054898200),
      zoom: 8,
      mapTypeId: 'roadmap',
   };

   map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

   // a new Info Window is created
   infoWindow = new google.maps.InfoWindow();

   // Event that closes the Info Window with a click on the map
   google.maps.event.addListener(map, 'click', function() {
      infoWindow.close();
   });

   // Finally displayMarkers() function is called to begin the markers creation
   displayMarkers();
	}
	google.maps.event.addDomListener(window, 'load', initialize);

// This function will iterate over markersData array
// creating markers with createMarker function
function displayMarkers(){

   // this variable sets the map bounds according to markers position
   var bounds = new google.maps.LatLngBounds();
   
   // for loop traverses markersData array calling createMarker function for each marker 
   for (var i = 0; i < markersData.length; i++){

      var latlng = new google.maps.LatLng(markersData[i].lat, markersData[i].lng);
      var name = markersData[i].name;
//    var address1 = markersData[i].address1;
	var count2 = 0;
	var rents = '';
	var dates = '';
	var len = 0;
	for (var j = 0; j < (model1.length)/3; j++){
	  if(markersData[i].id == model1[count2]){
		  len = len+1;
		  rents = rents+", "+model1[count2+1];
		  dates = dates+", "+model1[count2+2];
	  }
	  count2 = count2 + 3;
	}
      createMarker(latlng, name, rents, dates, len);
      // marker position is added to bounds variable
      bounds.extend(latlng);  
   }

   // Finally the bounds variable is used to set the map bounds
   // with fitBounds() function
   map.fitBounds(bounds);
}

// This function creates each marker and it sets their Info Window content
function createMarker(latlng, name, rent, dates, len){
   var marker = new google.maps.Marker({
      map: map,
      position: latlng,
      title: name
   });

   // This event expects a click on a marker
   // When this event is fired the Info Window content is created
   // and the Info Window is opened.
   google.maps.event.addListener(marker, 'click', function() {

		var arrayOfString = [];
		var arrayOfString1 = [];
		
		arrayOfString = rent.split(', ');
		arrayOfString1 = dates.split(', ');

		var iwContent = '<div id="iw_container">' +
            '<div class="iw_title">' + name + '</div>' +
         '<div class="iw_content"><table class="table table-striped"><thead><tr class="tr tr-success"><td><b>Rent</b></td><td><b>Date</b></td></tr></thead><tbody>';
//          '<div class="iw_content">' + arrayOfString[1]+ '<br /></div></div>';

         for (var j = 1; j < arrayOfString.length; j++){
        	 iwContent = iwContent+"<tr><td>"+arrayOfString[j]+"</td><td>"+arrayOfString1[j]+'</td></tr>';
         }
         iwContent = iwContent+'</tbody></table></div></div>';
      
      // including content to the Info Window.
      infoWindow.setContent(iwContent);

      // opening the Info Window in the current map and at the current marker location.
      infoWindow.open(map, marker);
   });
}
			
		</script>
	</div>
    <div id="map-canvas"></div>

<footer class="text-center">
  <a class="up-arrow" href="#myPage" data-toggle="tooltip" title="TO TOP">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a><br><br>
</footer>

<script>
$(document).ready(function(){
  // Initialize Tooltip
  $('[data-toggle="tooltip"]').tooltip(); 
  
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {

    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {

      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
})
</script>

</body>
</html>

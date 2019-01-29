<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rent Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD0iD9YAtgOxEybEtVdXe_ztK2ron5UWnY"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/map.js"></script>

</head>
    <body>

    <div class="container">
<!--         <table class="table table-striped"> -->
<%--             <caption><h3>Houses available for Rent in Windsor, Ontario, Canada :</h3></caption> --%>
<!--             <thead> -->
<!--                 <tr class="tr tr-success"> -->
<!--                     <td>Id</td> -->
<!--                     <td>Name</td> -->
<!--                     <td>PIN</td> -->
<!--                 </tr>    -->
<!--             </thead> -->
<!--             <tbody> -->
<%--                 <c:forEach items="${coordinates}" var="temp"> --%>
<!--                     <tr> -->
<%--                         <td>${temp.id}</td> --%>
<%--                         <td>${temp.longitude}</td> --%>
<%--                         <td>${temp.latitude}</td> --%>
<!--                     </tr> -->
<%--                 </c:forEach> --%>
<!--             </tbody> -->
<!--         </table> -->


<div class="jumbotron text-center">
  <h1>Rent Home</h1>
  <p>Houses available for Rent in Windsor, Ontario, Canada</p> 
</div>
         
		<script>
		var count = 0;
		var model = [];
		var markersData = [];
		
		var model1 = [];
		var count1 = 0;
		<c:forEach items ="${rentdetails}" var="rentdetail">
// 		model1[count1] = ${rentdetail.id};
		model1[count1] = ${rentdetail.coordinates.id};
//  	model1[count1+1] = ${rentdetail.coordinates.longitude};
//  	model1[count1+2] = ${rentdetail.coordinates.latitude};
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
// 			var j, item;
// 			for (j = 0; j < markersData.length; j++) {
// 			    for (item in markersData[j]) {
// 			        alert(item + ": " + markersData[j][item]);
// 			    }
// 			}
			
			//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			
			
			// *
// * Add multiple markers
// * 2013 - en.marnoto.com
// *

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
      
      // Creating the content to be inserted in the infowindow
//       var iwContent = '<div id="iw_container">' +
//             '<div class="iw_title">' + name + '</div></div>';

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
			
			//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			
		</script>
		

	</div>
    <div id="map-canvas"/>
    
</body>
</html>








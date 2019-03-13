<!DOCTYPE html>
<%@page import = "java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "com.opencsv.*"%>
<%@page import = "java.util.*"%>
<%@page import = "java.sql.*" %>
<html>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
    <head><title> Map </title>
    <style>
      /* Set the size of the div element that contains the map */
      #map {
        height: 400px;  /* The height is 400 pixels */
        width: 100%;
        align-content: center;/* The width is the width of the web page */
       }
       td {
    
    text-align: left;
    padding-right: 150px;
       padding-bottom: 10px}
       div.taxonomy
       {
           margin-left: 30px;
           width: 50%;
           float: left
           
       }
       div.image
       {
           width: 100;
           margin-right: 100px;
           float: right
           
       }
       .head 
{
   overflow: hidden;
   position: fixed;
  top: 0;
  width: 100%;
    
}
   .main {
    
    padding: 16px;
    margin-top: 200px;
    height: 80%;
    position:fixed;
    overflow: scroll;
    
}
button.download {
    background-color: #4CAF50;
    color: white;
    padding: 10px;
    margin: 5px;
    border: none;
    cursor: pointer;
    
   
}
button.download a{
    text-decoration: none;
    
    font-size:15px;
    display: block;
}
button:hover
{
    opacity: 0.8
}
    
    </style>
    
  <div class="head">   
   <img class = "image" src = "../images/IIRS.jpg" align="left" height="120" width="120">
 <img class = "image" src = "../images/ISRO.gif"  align="right"  height="120" width="120">
 <br>
 <br>
  <br>
  <br><br>
  <br>
  
  <% String id=request.getParameter("id");%>
  <nav class="w3-bar w3-black">
  <a href="../home/home.jsp" class="w3-button w3-bar-item">Home</a>
  <a href="#documentation" class="w3-button w3-bar-item">Documentation</a>
  <a href="#tools" class="w3-button w3-bar-item">Tools</a>
  <a href="../contact.jsp" class="w3-button w3-bar-item">Contact</a>
  <a href="../logout.jsp" class="w3-button w3-bar-item">Logout&emsp;&emsp;</a>
  <button class="download"><a href="response.jsp?array=<%=id%>">Download</a></button>
 
  </nav>
  </div>
  
    
  </head>
  <body>
      <script>
        function download1()
        {
            alert("downloading...");
            document.location.href="response.jsp?array="+<%=id%>;
        }
    </script>
      
      <%
      String username=(String)session.getAttribute("username");
        if(username==null)
        {
            response.sendRedirect("../error.jsp?address=login");
        }
    %>
       
  
    <!--The div element for the map -->
   
    
    <%
//String id = request.getParameter("userId");
String url = "jdbc:postgresql://localhost:5432/postgres";
String user = "postgres";
String pass = "hclfamily";
String b = request.getParameter("id");
String b1= "'"+b+"'";

String lat=null;
String longi=null;
float latitude=0.0f;
float longitude =0.0f;




Class.forName("org.postgresql.Driver");


Connection connection = null;
PreparedStatement ps = null;
ResultSet resultSet = null;
String name=null;
String datasetkey1=null;
%>



<%

connection = DriverManager.getConnection(url,user,pass);
String sql ="SELECT * FROM test where id ="+b1;
ps=connection.prepareStatement(sql);


resultSet = ps.executeQuery();

resultSet.next();

    name=resultSet.getString("scientificname");
    lat=(resultSet.getString("latitude"));
    longi=(resultSet.getString("longitude"));
    datasetkey1=resultSet.getString("datasetkey");
   if(!(lat.equals("")))
   {
    latitude=Float.parseFloat(lat);
    longitude=Float.parseFloat(longi);
   }
%>

<div class="main">

<h1 align="center" style ="color:steelblue"><strong><%= name%></strong></h1> 
<h2 align="center" style ="color:slategrey"><b>Dataset Key :</b> <a href="dataset.jsp?datasetkey=<%=datasetkey1%>"><button style="backgound-color:steelblue;color: black;padding: 3px"><%= datasetkey1%></button></a></h2> <br>
<h3 align="center" style ="color:slategrey"><b>GUID :</b><%= id%></h3> <br> 
<hr style="border-style: inset; border-width: 3px">
<div id="map"></div>
<hr style="border-style: inset; border-width: 3px">
<br>
<br>
<div class="taxonomy">
<h2>Taxonomy</h2>
<hr style="border-style: inset; width:500px; margin-left:-120px">

<table style="font-family: verdana; border-collapse: collapse">
 
    <tr><td>Kingdom</td>
   <td> <a target='_blank' > <%=(resultSet.getString("kingdom")==null)?"-":resultSet.getString("kingdom") %></a></td>
    </tr>
   <tr><td>Phylum</td>
   <td> <a target='_blank' > <%=(resultSet.getString("phyllum")==null)?"-":resultSet.getString("phyllum") %></a></td>
    </tr>
    <tr><td>Class</td>
   <td> <a target='_blank' > <%=(resultSet.getString("class")==null)?"-":resultSet.getString("class") %></a></td>
    </tr>
   <tr><td>Sub-Class</td>
   <td> <a target='_blank' > <%=(resultSet.getString("subclass")==null)?"-":resultSet.getString("subclass") %></a></td>
    </tr>
    <tr><td>Order</td>
   <td> <a target='_blank' > <%=(resultSet.getString("order_")==null)?"-":resultSet.getString("order_") %></a></td>
    </tr>
   <tr><td>Genus</td>
   <td> <a target='_blank' > <%=(resultSet.getString("genus")==null)?"-":resultSet.getString("genus") %></a></td>
    </tr>
    <tr><td>Family</td>
   <td> <a target='_blank' > <%=(resultSet.getString("family_")==null)?"-":resultSet.getString("family_") %></a></td>
    </tr>
   <tr><td>Species</td>
   <td> <a target='_blank' > <%=(resultSet.getString("species")==null)?"-":resultSet.getString("species") %></a></td>
    </tr>
    
</table>
</div>
    <div class="image" >
       <%
           String datasetkey= resultSet.getString("datasetkey");
     String picname= resultSet.getString("picname");
     String imgurl= "../documents/"+username+"/"+datasetkey+"/images/"+picname+".jpg";
       %>
       <br><br><br><br> <img class = "image" src = "<%=imgurl%>"  height="250" width="300" style="border: #102090 3px outset">                                          
   </div>
<div class="taxonomy">
<h2>Location</h2>
<hr style="border-style: inset; width:500px; margin-left: -120px">

<table style="font-family: verdana; border-collapse: collapse">
 
    <tr><td>Institute</td>
   <td> <a target='_blank' > <%=(resultSet.getString("institute")==null)?"-":resultSet.getString("institute") %></a></td>
    </tr>
   <tr><td>Author</td>
   <td> <a target='_blank' > <%=(resultSet.getString("author")==null)?"-":resultSet.getString("author") %></a></td>
    </tr>
    <tr><td>State</td>
   <td> <a target='_blank' > <%=(resultSet.getString("state")==null)?"-":resultSet.getString("state") %></a></td>
    </tr>
   <tr><td>Year</td>
   <td> <a target='_blank' > <%=(resultSet.getString("year")==null)?"-":resultSet.getString("year") %></a></td>
    </tr>
    <tr><td>Latitude</td>
   <td> <a target='_blank' > <%=(resultSet.getString("latitude")==null)?"-":resultSet.getString("latitude") %></a></td>
    </tr>
   <tr><td>Longitude</td>
   <td> <a target='_blank' > <%=(resultSet.getString("longitude")==null)?"-":resultSet.getString("longitude") %></a></td>
    </tr>
   <%
       
   %> 
    
</table>
    <hr style="border-style: inset; width:500%; margin-left:-100px">
</div>
   
<%-- Initialize and add the map--%>

<script>
    var marker;
 
      var coordinates = {lat: <%=latitude%>, lng: <%=longitude%>};
function initMap() {
  // The location of place
  
  // The map, centered at place
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 4, center: coordinates});
  // The marker, positioned at place
    marker=new google.maps.Marker({position: coordinates, map: map});
  
      marker.setVisible(true);
     
      
      
}


    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVGr1GsbPevKwyaV4xqO5bN1LjAYpZ1R4&callback=initMap">
    </script>
    <br><br>
    


  <nav style="margin-left: -30px; width: 130%; height: 60px" class="w3-bar w3-green">
  <a href="../home/home.jsp" title="Home" class="w3-button w3-bar-item">&emsp;Home</a>
  <a href="#documentation" title="Documentation" class="w3-button w3-bar-item">Documentation</a>
  <a href="#tools" title="Tools" class="w3-button w3-bar-item">Tools</a>
  <a href="../contact.jsp" title="Contact" class="w3-button w3-bar-item">Contact</a>
  <a href="../logout.jsp" title="Logout" class="w3-button w3-bar-item">Logout&emsp;&emsp;</a>
  
  </nav>
  <hr style="border-style: inset; width:150%; margin-left:-30px">
    </div>
  </body>
</html>
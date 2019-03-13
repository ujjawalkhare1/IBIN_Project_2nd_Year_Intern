<!DOCTYPE html>
<%@page import = "java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "com.opencsv.*"%>
<%@page import = "java.util.*"%>
<%@page import = "java.sql.*" %>
<html>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
    <head><title> dataset </title>
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
       
       div.gallery {
    margin: 5px;
    border: 1px solid #ccc;
    float: left;
    width: 180px;
}

div.gallery:hover {
    border: 1px solid #777;
}

div.gallery img {
    width: 100%;
    
    }

div.desc {
    padding: 15px;
    text-align: center;
}
.sidenav {
    height: 90%;
    width: 160px;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #111;
    overflow-x: hidden;
    padding-top: 20px;
    margin-top: 198px;
}

.sidenav a {
    padding: 6px 8px 6px 16px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
}

.sidenav a:hover {
    color: #f1f1f1;
}
.main {
    
    padding: 16px;
    margin-top: 200px;
    margin-left: 160px;
    height: 80%;
    position:fixed;
    overflow: scroll;
    
}

.head 
{
   overflow: hidden;
   position: fixed;
  top: 0;
  width: 100%;
    
}


@media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
    .sidenav a {font-size: 18px;}
}
button {
    background-color: #4CAF50;
    color: white;
    padding: 10px;
    margin: 5px;
    border: none;
    cursor: pointer;
    
   
}
button a{
    text-decoration: none;
    
    font-size:15px;
    display: block;
}
button:hover
{
    opacity: 0.8
}

    </style>
    
    <%
        
        
        String csvfilename=null;
        String datasetkey1=request.getParameter("datasetkey");
        String username=(String)session.getAttribute("username");
        String dirPath="d:/NetbeansProjects/WebApplication1/web/web pages/documents/"+username+"/"+datasetkey1+"/";
        File dir = new File(dirPath);
        String[] files = dir.list();
        
             for(String aFile : files)
             {
                    if(aFile.endsWith(".csv"))
                     csvfilename=aFile;
                }
             String relpath="../documents/"+username+"/"+datasetkey1+"/";
        
        String file=relpath+csvfilename;
    %>
 <div class="head">   
   <img class = "image" src = "../images/IIRS.jpg" align="left" height="120" width="120">
 <img class = "image" src = "../images/ISRO.gif"  align="right"  height="120" width="120">
 <br>
 <br>
  <br>
  <br><br>
  <br>
  <nav class="w3-bar w3-black">
  <a href="../home/home.jsp" class="w3-button w3-bar-item">Home</a>
  <a href="#documentation" class="w3-button w3-bar-item">Documentation</a>
  <a href="#tools" class="w3-button w3-bar-item">Tools</a>
  <a href="../contact.jsp" class="w3-button w3-bar-item">Contact</a>
  <a href="../logout.jsp" class="w3-button w3-bar-item">Logout&emsp;&emsp;</a>
  <button type="submit"><a href="<%=file%>" download>Download</a></button>
 
  </nav>
  </div>
       
  
    <!--The div element for the map -->
   
    
    <%
//String id = request.getParameter("userId");
String url = "jdbc:postgresql://localhost:5432/postgres";
String user = "postgres";
String pass = "hclfamily";
String b = request.getParameter("datasetkey");
String b1= "'"+b+"'";

String lat=null;
String longi=null;
float latitude=0.0f;
float longitude =0.0f;



try {
Class.forName("org.postgresql.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
PreparedStatement ps = null;
ResultSet resultSet = null;

%>


 <div class="sidenav">
  <a href="mapapi.jsp">Map API</a>
  
</div>

 

<div class="main">
    <h1 align="center" style ="color:steelblue"><strong>DatasetKey: <%=request.getParameter("datasetkey")%></strong></h1> 
    <div>
    <hr style="border-style: inset; border-width: 3px">
</div>
<div id="map"></div>

<hr style="border-style: inset; border-width: 3px">
<br>
<br>
<h2 style=" margin-left: 30px; color: green"><b>Gallery</b></h2>
<hr style="border-style: inset; width:500px; margin-left:30px; float:left">
<br>
<br>


<%
 
connection = DriverManager.getConnection(url,user,pass);
String sql ="SELECT * FROM test where datasetkey ="+b1;
ps=connection.prepareStatement(sql);


resultSet = ps.executeQuery();




%>

    

<%-- Initialize and add the map--%>

<script>
function initMap() {
  
  var coordinates1 = {lat: 10.0, lng: 10.0};
  var coordinates;
  // The map, centered at place
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 4, center: coordinates1});
<%
    label:
    while(resultSet.next())
    {
        
    lat=(resultSet.getString("latitude"));
    longi=(resultSet.getString("longitude"));
    
    if(lat.equals(""))
    continue label;
    latitude=Float.parseFloat(lat);
    longitude=Float.parseFloat(longi);
    
    


    
%>
   coordinates = {lat: <%=latitude%>, lng: <%=longitude%>};      
        // The location of place
  // The marker, positioned at place
    new google.maps.Marker({position: coordinates, map: map});
<%
    
    }
%>
}


    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVGr1GsbPevKwyaV4xqO5bN1LjAYpZ1R4&callback=initMap">
    </script>
    
    <div id="imggallery" style="height: 300px; margin-left: 30px; width: 100%">
    <%
        
        PreparedStatement ps1 =connection.prepareStatement(sql);
        ResultSet resultSet1 =ps1.executeQuery();
        
        ignore:
        while(resultSet1.next())
        {
            String basepath="../documents/";
    String datasetkey= resultSet1.getString("datasetkey");
     String picname= resultSet1.getString("picname");
     String imgurl= basepath+username+"/"+datasetkey+"/images/"+picname+".jpg";
            if(picname.equals(""))
            continue ignore;
    %>
                <div class="gallery">
                        <a target="_blank" href="<%=imgurl%>">
                            <img src="<%=imgurl%>" alt="<%=picname%>"  height="150">
                        </a>
                    <div class="desc"><%=picname%></div>
                </div>
            <%
        }
    %>
    </div><br><br><br><br><br>
    <div>    
    <h2 style=" margin-left: 30px; color: green"><b>Description</b></h2>
<hr style="border-style: inset; width:500px; margin-left:30px; float:left">
<br>
<br>

Some Content<br>
<%
    for(int i=0; i<50; i++)
    {
        %>
        .<br>
        <%
    }
%>
  

</div>
<hr style="border-style: inset; width:150%; margin-left:-30px">


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
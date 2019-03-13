<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<style>
.container {
    position: relative;
    width: 30%;
    margin-left: 200px;
}


.image {
  opacity: 1;
  display: block;
  width: 200px;
  height: 200px;
  transition: 1s ease;
  backface-visibility: hidden;
}

.middle {
  transition: 1s ease;
  opacity: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  text-align: center;
}

.container:hover .image {
  opacity: 0.3;
}

.container:hover .middle {
  opacity: 1;
}

.text {
  background-color: #4CAF50;
  color: white;
  font-size: 16px;
  padding: 16px 32px;
}
a:link, a:visited {
    color: white;
    padding: 14px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
}


a:hover, a:active {
    background-color: #5CA060;
    transition: 1s ease;
}
</style>
</head>
<body style="color: lemonchiffon">
    
<%
      
        if(((String)session.getAttribute("username"))==null)
        {
            response.sendRedirect("../error.jsp?address=login");
        }
    %>
<img class = "image" src = "../images/IIRS.jpg" align="left" height="100" width="100">
 <img class = "image" src = "../images/ISRO.gif"  align="right"  height="100" width="100">
 <br>
 <br>
 <br>
 <br>
  <br>
 <br> <br><br> <br>
 <br>


<nav class="w3-bar w3-black">
  <a href="home.jsp" class="w3-button w3-bar-item">Home</a>
  <a href="#documentation" class="w3-button w3-bar-item">Documentation</a>
  <a href="#tools" class="w3-button w3-bar-item">Tools</a>
  <a href="../contact.jsp" class="w3-button w3-bar-item">Contact</a>
  <a href="../logout.jsp" class="w3-button w3-bar-item">Logout</a>
  
 
  
</nav>
 
 <br>
 <br>
 <br>
 <br>

<div class="container" style="float: left">
  <img src="../images/map.png" alt="Avatar" class="image">
  <div class="middle">
      <div class="text"><a href="../googlemap/mapapi.jsp">Open Map API</a></div>
  </div>
</div>
<div class="container" style="float: right">
  <img src="../images/upload.png" alt="Avatar" class="image">
  <div class="middle">
      <div class="text"><a href="upload.jsp">Upload Data</a></div>
  </div>
</div>
<div class="container" style="float: left">
  <img src="../images/home.jpg" alt="Avatar" class="image">
  <div class="middle">
      <div class="text"><a href="data.jsp">View our Home data</a></div>
  </div>
</div>
<div class="container" style="float:right">
  <img src="../images/download.jpg" alt="Avatar" class="image">
  <div class="middle">
      <div class="text"><a href="#home.jsp">Documentation</a></div>
  </div>
</div>

  
</body>
</html>
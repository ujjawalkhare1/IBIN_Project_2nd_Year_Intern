<%-- 
    Document   : upload
    Created on : Jul 2, 2018, 4:07:36 PM
    Author     : trainee2018089
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
    </head>
    
         <body style="background-color:white">
        
        <div style="margin-top: 10px; margin-bottom: 10px; position: static; padding-bottom: 50px">
            <img class = "image" src = "../images/IIRS.jpg" align="left" height="120" width="120">
            <img class = "image" src = "../images/ISRO.gif"  align="right"  height="120" width="120">
        </div>
             <br>
             <br>
             <br>
             
             <nav class="w3-bar w3-black">
  <a href="home.jsp" class="w3-button w3-bar-item">Home</a>
  <a href="#documentation" class="w3-button w3-bar-item">Documentation</a>
  <a href="#tools" class="w3-button w3-bar-item">Tools</a>
  <a href="../contact.jsp" class="w3-button w3-bar-item">Contact</a>
  <a href="../logout.jsp" class="w3-button w3-bar-item">Logout</a>
  
</nav>
             <form action="uploadcsv1.jsp" method="post" enctype="multipart/form-data">
    <div style="background-color:lightblue; padding: 20px" >
            <h3>CSV File Upload:</h3>
            Select one csv (containing data with along with image names) and one zip (containing images) file to upload: <br />
            <input type="file" accept=".csv,.zip" name="file" size="50" title="1 csv and 1 zip file containing images" multiple required/>
            <br />
            <input type="submit" value="Upload File" />
    </div>
</form>
             
    </body>
</html>

<!DOCTYPE html>
<html>
    <head><title>Upload</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
}

hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}

button:hover {
    opacity:1;
}

/* Extra styles for the cancel button */
.subbtn {
    padding: 14px 20px;
    background-color: #f44336;
    float: left;
    width: 15%;
}

/* Add padding to container elements */
.container {
    padding: 16px;
}

/* Clear floats */
.clearfix::after {
    content: "";
    clear: both;
    display: table;
}


</style>
</head>
<body>
    <img class = "image" src = "../images/IIRS.jpg" align="left" height="100" width="100">
 <img class = "image" src = "../images/ISRO.gif"  align="right"  height="120" width="120">


<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<form method="post" action="upload1.jsp" enctype="multipart/form-data" style="border:1px solid #ccc">
  <div class="container">
    <h1>Please upload verification documents</h1>
    <p>Formats: pdf, jpeg, jpg</p>
    <hr> 
    <label><b>Select files</b></label>
    <input type="file"  name="file" size="50" multiple required>
     <div class="clearfix">
      <button type="submit" class="subbtn">SUBMIT</button>
     
    </div>
  </div>
</form>

</body>
</html>

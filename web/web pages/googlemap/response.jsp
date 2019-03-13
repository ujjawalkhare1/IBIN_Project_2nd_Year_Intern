<%-- 
    Document   : response
    Created on : Jul 1, 2018, 3:52:38 PM
    Author     : trainee2018089
--%>

<%@page import="java.io.*"%>
<%@page import="java.sql.*,java.util.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="javax.xml.parsers.DocumentBuilder,org.w3c.dom.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
        <title>Data</title>
        <style>
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
    </head>
    <body>
         <%
            String url = "jdbc:postgresql://localhost:5432/postgres";
            String user = "postgres";
            String pass = "hclfamily";
            Class.forName("org.postgresql.Driver");
            String sql="select * from test";
            Connection con=DriverManager.getConnection(url,user,pass);
            PreparedStatement pst=con.prepareStatement(sql);
            ResultSet rs=pst.executeQuery();
            ResultSetMetaData rsmd=rs.getMetaData();
            String array=request.getParameter("array");
            String usern=request.getParameter("usern");
                 
           List<String> tokens = Arrays.asList(array.split(","));
             
	serve.Download_Service service = new serve.Download_Service();
	serve.Download port = service.getDownloadPort();
	 // TODO initialize WS operation arguments here
	java.lang.String username = usern;
	java.util.List<java.lang.String> id = tokens;
	// TODO process result here
	java.lang.String result = port.download(username, id);
	
        


// Load and Parse the XML document
// document contains the complete XML as a Tree
DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

DocumentBuilder db = dbf.newDocumentBuilder();

Document doc = db.parse(result);
NodeList[] n=new NodeList[19];

int index=result.lastIndexOf("/");
String filename=result.substring(index+1);
String relPath="../documents/repository/"+filename;
%>
        
        <img class = "image" src = "../images/IIRS.jpg" align="left" height="100" width="100">
 <img class = "image" src = "../images/ISRO.gif"  align="right"  height="100" width="100">
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
  <a href="../logout.jsp" class="w3-button w3-bar-item">Logout</a>
  <a href="<%=relPath%>" download><button>Download XML Schema</button></a>
 
  
</nav>
  <br>      


  <div style='width:100%;overflow: auto'>
    <center>
 <table width="500" border="0" cellspacing="0" cellpadding="0">
 <tr>    
     <%
         
         String[] column=new String[19];
         for(int h=0;h<19;h++)
         {
             column[h]=rsmd.getColumnLabel(h+1);
         }

for(int i=0; i<19;i++)
{
 try{n[i]= doc.getElementsByTagName(column[i]);}
 catch(Exception e){e.getMessage();}
 %>
     <td style="background:#000033;color:#FFFFFF;font-weight:bold;padding: 10px;"><%=column[i]%></td>
     <%}%>
 </tr>
 <tr>
 <%
 for(int i=0;i<tokens.size();i++)
    {
        for(int j=0;j<19;j++)
        {
 try{
 %>
 <td style="padding: 10px;"><%=n[j].item(i).getFirstChild().getNodeValue()%></td>
 
 <%  }catch(Exception e){e.getMessage();}              
        }
 %>
 </tr>
 <%
    }

 %>
 
 </table>
 </center>
 </div>
</body>
</html>

   

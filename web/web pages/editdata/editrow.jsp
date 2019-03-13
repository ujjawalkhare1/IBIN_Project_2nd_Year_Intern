
<%@page contentType="text/html" pageEncoding="UTF-8"  import = "java.sql.* " import = "java.lang.*"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">

<head>
    <title>editrow.jsp</title>
</head>
<body>

<img class = "image" src = "../images/IIRS.jpg" align="left" height="100" width="100">
 <img class = "image" src = "../images/ISRO.gif"  align="right"  height="120" width="120">


<nav class="w3-bar w3-black">
  <a href="#home" class="w3-button w3-bar-item">Home</a>
  <a href="#documentation" class="w3-button w3-bar-item">Documentation</a>
  <a href="#tools" class="w3-button w3-bar-item">Tools</a>
  <a href="#contact" class="w3-button w3-bar-item">Contact</a>
  
</nav>
 <br>
 <br>
 
 <style>
 table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 4px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
<div style='white-space: nowrap; overflow: auto; height: 100%'>
<table>
    <col width="130">
  <col width="80">
   <tr>
    
    <th>Scientific Name</th>
    <th></th>
    <th>Author</th>
    <th></th>
    <th>Institute</th>
    <th></th>
    <th>State</th>
    <th></th>
    <th>Year</th>
    <th></th>
    <th>Kingdom</th>
    <th></th>
    <th>Phylum</th>
    <th></th>
    <th>Class</th>
    <th></th>
    <th>Sub Class</th>
    <th></th>
    <th>Order</th>
    <th></th>
    <th>Genus</th>
    <th></th>
    <th>Family</th>
    <th></th>
    <th>Species</th>
    <th></th>
    <th>Pic Name</th>
    <th></th>
    <th>Submission Date</th>
    <th></th>
    <th>Habit</th>
    <th></th>
    
  </tr>

 <script        type="text/javascript">
     function show(c) 
                  
         {          
            
             //alert(pk);
        // response.sendRedirect("update.jsp");
         document.location.href="editxcell.jsp?column="+c; //"&;
       
    }
      
               
</script>
  
     <% String url ="jdbc:postgresql://localhost:5432/postgres";
        String user = "postgres";
        String pwd= "hclfamily";
        
        String val =request.getParameter("pk");
        String val1="'"+val+"'";//important
     
       
        String temp =(String)session.getAttribute("temp");
        
     
        
        HttpSession sessio = request.getSession(true); 
        sessio.setAttribute("pk", val);
  
        Class.forName("org.postgresql.Driver");
        Connection cn = DriverManager.getConnection(url, user, pwd);
        String sql = "select * from "+temp+" where id ="+val1;
      
        PreparedStatement ps = cn.prepareStatement(sql);
        ResultSet r = ps.executeQuery();
        while(r.next())
       {
      
        
     %>
        <tr>
            
     <td> <a target='_blank' > <%= r.getString("scientificname")==null?"-":r.getString("scientificname") %></a></td>      
     <td> <a target='_blank' href="javascript:show('scientificname');" style='text-decoration: none'> <button> Edit</button></a></td>
         
     <td> <a target='_blank' > <%=r.getString("author")==null?"-":r.getString("author") %>  </a>  </td>
     <td> <a target='_blank' href="javascript:show('author');" style='text-decoration: none'> <button> Edit</button></a></td>
         
     <td> <a target='_blank'>  <%= r.getString("institute")==null?"-":r.getString("institute") %>  </a>   </td>
     <td> <a target='_blank' href="javascript:show('institute');" style='text-decoration: none'> <button> Edit</button></a></td>
     
     <td> <a target='_blank'>  <%= r.getString("state")==null?"-":r.getString("state") %>  </a>   </td>
     <td> <a target='_blank' href="javascript:show('state');" style='text-decoration: none'> <button> Edit</button></a></td>
     
     <td> <a target='_blank'>  <%= r.getString("year")==null?"-":r.getString("year") %>  </a>   </td>
     <td> <a target='_blank' href="javascript:show('year');" style='text-decoration: none'> <button> Edit</button></a></td>
     
     <td> <a target='_blank' > <%= r.getString("kingdom")==null?"-":r.getString("kingdom") %></a></td>      
     <td> <a target='_blank' href="javascript:show('kingdom');" style='text-decoration: none'> <button> Edit</button></a></td>
         
     <td> <a target='_blank' > <%=r.getString("phyllum")==null?"-":r.getString("phyllum") %>  </a>  </td>
     <td> <a target='_blank' href="javascript:show('phyllum');" style='text-decoration: none'> <button> Edit</button></a></td>
         
     <td> <a target='_blank'>  <%= r.getString("class")==null?"-":r.getString("class") %>  </a>   </td>
     <td> <a target='_blank' href="javascript:show('class');" style='text-decoration: none'> <button> Edit</button></a></td>
     
     <td> <a target='_blank'>  <%= r.getString("subclass")==null?"-":r.getString("subclass") %>  </a>   </td>
     <td> <a target='_blank' href="javascript:show('subclass');" style='text-decoration: none'> <button> Edit</button></a></td>
     
     <td> <a target='_blank'>  <%= r.getString("order_")==null?"-":r.getString("order_") %>  </a>   </td>
     <td> <a target='_blank' href="javascript:show('order_');" style='text-decoration: none'> <button> Edit</button></a></td>
     
     <td> <a target='_blank' > <%= r.getString("genus")==null?"-":r.getString("genus") %></a></td>      
     <td> <a target='_blank' href="javascript:show('genus');" style='text-decoration: none'> <button> Edit</button></a></td>
         
     <td> <a target='_blank' > <%=r.getString("family_")==null?"-":r.getString("family_") %>  </a>  </td>
     <td> <a target='_blank' href="javascript:show('family_');" style='text-decoration: none'> <button> Edit</button></a></td>
         
     <td> <a target='_blank'>  <%= r.getString("species")==null?"-":r.getString("species") %>  </a>   </td>
     <td> <a target='_blank' href="javascript:show('species');" style='text-decoration: none'> <button> Edit</button></a></td>
     
     <td> <a target='_blank'>  <%= r.getString("submissiondate")==null?"-":r.getString("submissiondate") %>  </a>   </td>
     <td> <a target='_blank' href="javascript:show('submissiondate');" style='text-decoration: none'> <button> Edit</button></a></td>
     
     <td> <a target='_blank'>  <%= r.getString("picname")==null?"-":r.getString("picname") %>  </a>   </td>
     <td> <a target='_blank' href="javascript:show('picname');" style='text-decoration: none'> <button> Edit</button></a></td>
     
     <td> <a target='_blank'>  <%= r.getString("habit")==null?"-":r.getString("habit") %>  </a>   </td>
     <td> <a target='_blank' href="javascript:show('habit');" style='text-decoration: none'> <button> Edit</button></a></td>
     
     </tr>
           
     <%
         }
     %>
     
     
      
    

      
 </table>
</div>
  
</body>
</html>
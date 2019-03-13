<%-- 
    Document   : mapapi
    Created on : Jun 28, 2018, 2:53:43 PM
    Author     : trainee2018089
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
        <title>JSP Page</title>
        <style>
            #map {
                 width: 100%;
                align-content: center;/* The width is the width of the web page */
                margin-right: 20px;
        }
                
        #buttonid{
            background-color:#4CAF50;
            color: white;
            padding: 2px;
            margin: 5px;
        }
        button:hover {
    opacity: 0.6;
}
        
</style>
    </head>
    
    <%
         Class.forName("org.postgresql.Driver");
    String url ="jdbc:postgresql://localhost:5432/postgres";
        String user = "postgres";
        String pwd= "hclfamily";
        
        
        String search=request.getParameter("search");
        String sql=null;
        PreparedStatement pstr=null;
        PreparedStatement pst=null;
        ResultSet rs=null;
        ResultSet rs4=null;
        String sname=null;
        Connection con=DriverManager.getConnection(url, user, pwd);
        
        
        
   
        
        if(search==null || search.equals(""))
        {
            sql="select * from test";
            pst=con.prepareStatement(sql);
            rs=pst.executeQuery();
        }
        
        else
        {
            String search1= "'"+search+"'";
            String sql2 = "select scientificname from test where id="+search1;
            pstr=con.prepareStatement(sql2);
            rs4=pstr.executeQuery();
            
            while(rs4.next())
            {
            sname=rs4.getString("scientificname");
            }
            sql="select * from test where scientificname='"+sname+"'";
            pst=con.prepareStatement(sql);
            rs=pst.executeQuery();
            search=null;
            
        }
        String sql1="select distinct datasetkey from test";
       
        String sql3="select distinct species from test";
       
        
    
    pst=con.prepareStatement(sql);
     PreparedStatement pst2=con.prepareStatement(sql);
      PreparedStatement pd=con.prepareStatement(sql);
       PreparedStatement pp=con.prepareStatement(sql);
    
    
    
    PreparedStatement pst1=con.prepareStatement(sql1);
    ResultSet rs1=pst1.executeQuery();
    
    PreparedStatement pst3=con.prepareStatement(sql3);
    ResultSet rs2=pst2.executeQuery();
  
    
    
%>
    <body style="background-color:oldlace">
        
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
  
 
  
</nav>
 
 
        <hr style="margin-top: 10px">
        <h1 style=" color: steelblue; font-family: fantasy; text-align: center">MAP API</h1>
        <div style="width:40%">
            <button onclick="display('all')" style="color: darkgreen; text-align: center; width: 16%" type="submit">
               All Data 
            </button>
            <button onclick="display('dataset')" style="color: darkgreen; text-align: center;width: 16%" type="submit">
               Datasets
            </button>
            <form action="#" method="post" style="display:inline">
            <input type="text" name="search" placeholder="Enter key to search" style="width:30">
            <input type="submit" value="Search" style="display:inline; width: 16%">
            </form>
               

           
           
            <script>
                
                
        var coordinates=[];
        var markers=[];
        var markers1=[];
        var array=[];
        var dataArray=[];
        var dataindex=[];
        var index1;
         
        var i=0;
        var s=0;
        var z=0;
        var f=0;
        var map;
        
       
                function display(element) 
                {
                    var x=document.getElementById("all");
                    var y=document.getElementById("dataset");
                   
                    
                   if(element==='all')
                   {
                       x.style.display= 'block';
                       y.style.display= 'none';
                       
                   }
                   else if(element==='dataset')
                   {
                       y.style.display= 'block';
                       x.style.display= 'none';
                       
                   }
                   
                }
                
               
            </script> 
            <script>           
                function showById(id)
                {
                    for(var k=0;k<markers.length; k++)
                    {
                        if(markers[k].mycategory == id)
                        {   markers[k].setVisible(true);
                            array[z]=id;
                            z++;
                            document.getElementById(id).style.display='none';
                        }
                       
                        
                    };
                    
                }
                
                
</script>

<script>           
                function hideById(id)
                {
                    for(var k=0;k<markers.length; k++)
                    {
                        if(markers[k].mycategory == id)
                        {   markers[k].setVisible(false);
                            var index=array.indexOf(id);
                            array.splice(index,1);
                            z--;
                            document.getElementById(id).style.display='inline';
                        }
                        
                    }
                    
                }
                
                
</script>

<script>           
                function showByDataset(datasetkey)
                {
                    for(var k=0;k<markers1.length; k++)
                    {
                        if(markers1[k].mycategory == datasetkey)
                        {   markers1[k].setVisible(true);
                            dataArray[f]=dataindex[k];
                            f++;
                            document.getElementById(datasetkey).style.display='none';
                        }
                        
                        
                    }
                    
                }
                
                
</script>
<script>           
                function hideByDataset(datasetkey)
                {
                    for(var k=0;k<markers1.length; k++)
                    {
                        if(markers1[k].mycategory == datasetkey)
                        
                        {
                            
                            markers1[k].setVisible(false);
                            index1=dataArray.indexOf(dataindex[k]);
                            dataArray.splice(index1,1);
                            f--;
                            document.getElementById(datasetkey).style.display='inline';
                        }
                        
                        
                    }
                    
                }
                
                
</script>
<div id="all" style="width:100%; float: left; height: 250px; white-space: nowrap; overflow: auto">
            
            
                <form action="#">
                    <%
                        while(rs.next())
                        {
                    %>
                    <button id="<%=rs.getString("id")%>" onclick="showById('<%=rs.getString("id")%>')" style="background-color:#4CAF50; color: white; padding: 2px; margin: 5px;">Add</button><button onclick="hideById('<%=rs.getString("id")%>')" style="background-color:#cc0000; color: white; padding: 2px; margin: 5px;">Remove</button><%=rs.getString("scientificname")%>&nbsp;&nbsp;<%=rs.getString("author")%><br>                                                                
                     <%
                         }
                     %>
                </form>
            
        </div>
        <div id="dataset" style="width:100%; float: left; height: 250px; white-space: nowrap;overflow: scroll;display: none">
            
            
                <form action="#">
                    
                    <%
                        while(rs1.next())
                        {
                    %>
                    <button id="<%=rs1.getString("datasetkey")%>" onclick="showByDataset('<%=rs1.getString("datasetkey")%>')" style="background-color:#4CAF50; color: white; padding: 2px; margin: 5px;">Add</button><button onclick="hideByDataset('<%=rs1.getString("datasetkey")%>')" style="background-color:#cc0000; color: white; padding: 2px; margin: 5px;">Remove</button><%=rs1.getString("datasetkey")%><br>                                                          
                     <%
                         }
                     %>
                </form>
                
            
        </div>
                    
       
        </div>
        <div id="map" style="width:54%; float: right; height: 350px; position: static;"></div>
<script>
function initMap() {
  // The location of place
  var coordinatesorigin = {lat: 0, lng: 0};
  // The map, centered at place
  map = new google.maps.Map(
      document.getElementById('map'), {zoom: 2, center: coordinatesorigin});
  // The marker, positioned at place
  <%
   while(rs2.next())
               {%>
           coordinates[i] = {lat: <%=rs2.getString("latitude")%>, lng: <%=rs2.getString("longitude")%>};
          
    markers[i]=new google.maps.Marker({
                position: coordinates[i], 
                map: map, 
               
               
                
            });
            
            markers[i].mycategory='<%=rs2.getString("id")%>';
            markers[i].setVisible(false);
            
            markers1[i]=new google.maps.Marker({
                position: coordinates[i], 
                map: map, 
             
                
            });
                    
            markers1[i].mycategory='<%=rs2.getString("datasetkey")%>';
            markers1[i].setVisible(false);
            dataindex[i]='<%=rs2.getString("id")%>';
           
            
            i++;
                  <% }%>
                      
  
   
    
    
}



    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVGr1GsbPevKwyaV4xqO5bN1LjAYpZ1R4&callback=initMap">
    </script>

      <input type="text" placeholder="Username" id="usern" required style="width: 95%;margin: 20px; padding: 10px;">
            <button type="submit" onclick="send(document.getElementById('usern').value)" style="width: 97%;margin: 20px; padding: 10px; background-color: darkgreen; color: white; alignment-adjust: central">
            Send
            </button>
        
        
    
    <script>
       
        function send(usern)
        {   
            var array1=array+","+dataArray;
            alert("sending...");
            window.location="response.jsp?usern="+usern+"&array="+array1;
        }
    </script>
       

    </body>
    
</html>

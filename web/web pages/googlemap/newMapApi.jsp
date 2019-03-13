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
        <title>JSP Page</title>
        <style>
            #map {
                 width: 100%;
                align-content: center;/* The width is the width of the web page */
        }
        </style>
    </head>
    <body style="background-color:oldlace">
        
        <div style="margin-top: 10px; position: static; padding-bottom: 50px">
            <img class = "image" src = "../images/IIRS.jpg" align="left" height="120" width="120">
            <img class = "image" src = "../images/ISRO.gif"  align="right"  height="120" width="120">
        </div>
        <hr style="margin-top: 100px">
        <h1 style=" color: steelblue; font-family: fantasy; text-align: center">MAP API</h1>
        <div style="width:30%">
            <button onclick="display('all')" style="color: darkgreen; text-align: center; width: 30%" type="submit">
               Species 
            </button>
            <button onclick="display('dataset')" style="color: darkgreen; text-align: center;width: 30%" type="submit">
               Dataset
            </button>
            <button onclick="display('species')" style="color: darkgreen; text-align: center;width: 30%" type="submit">
               All Data 
            </button>
            
            <script>
                function display(element) 
                {
                    var x=document.getElementById("all");
                    var y=document.getElementById("dataset");
                    var z=document.getElementById("species");
                    
                   if(element==='all')
                   {
                       x.style.display= 'block';
                       y.style.display= 'none';
                       z.style.display= 'none';
                   }
                   else if(element==='dataset')
                   {
                       y.style.display= 'block';
                       x.style.display= 'none';
                       z.style.display= 'none';
                   }
                   else if(element==='species')
                   {
                       z.style.display= 'block';
                       y.style.display= 'none';
                       x.style.display= 'none';
                   }
                }
</script>

<%
    Class.forName("org.postgresql.Driver");
    String url ="jdbc:postgresql://localhost:5432/postgres";
        String user = "postgres";
        String pwd= "hclfamily";
        String sql="select * from test";
        String sql1="select distinct datasetkey from test";
        String sql2="select * from test where datasetkey=?";
        String sql3="select distinct species from test";
        String sql4="select * from test where species=?";
        
    Connection con=DriverManager.getConnection(url, user, pwd);
    PreparedStatement pst=con.prepareStatement(sql);
    
    PreparedStatement pst1=con.prepareStatement(sql1);
    ResultSet rs1=pst1.executeQuery();
    
    PreparedStatement pst3=con.prepareStatement(sql3);
    ResultSet rs3=pst3.executeQuery();
    
    ResultSet rs=pst.executeQuery();
%>
            
        
        <div id="all" style="width:120%; float: left; height: 250px; overflow: scroll">
            
            
                <form action="#">
                    <%
                        while(rs.next())
                        {
                    %>
                    <input type="checkbox" onclick="javascript: boxclick(this,'<%=rs.getString("id")%>');"><%=rs.getString("scientificname")%>&nbsp;&nbsp;&nbsp; <%=rs.getString("datasetkey")%><br>                                                          
                     <%
                         }
                     %>
                </form>
            
        </div>
        <div id="dataset" style="width:120%; float: left; height: 250px; overflow: scroll;display: none">
            
            
                <form action="#">
                    <%
                        while(rs1.next())
                        {
                    %>
                    <input type="checkbox" onclick="javascript: boxclick(this,'<%=rs1.getString("id")%>');"><%=rs1.getString("datasetkey")%><br>                                                          
                     <%
                         }
                     %>
                </form>
            
        </div>
        <div id="species" style="width:120%; float: left; height: 250px; overflow: scroll; display: none">
            
            
                <form action="#">
                    <%
                        while(rs3.next())
                        {
                    %>
                    <input type="checkbox" onclick="javascript: boxclick(this,'<%=rs3.getString("id")%>');"><%=rs3.getString("species")%><br>                                                          
                     <%
                         }
                     %>
                </form>
            
        </div>
        </div>
        <div id="map" style="width:58%; float: right; height: 250px; position: static"></div>
          
        <iframe src="../home/home.jsp" style="width: 100%;height: 300px; margin-top: 40px; position: static">
            your browser doesn't support iframe!!
        </iframe>
<script>
function initMap() {
  // The location of place
  var coordinates = {lat: 0, lng: 0};
  // The map, centered at place
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 4, center: coordinates});
  // The marker, positioned at place
    new google.maps.Marker({position: coordinates, map: map});
}
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVGr1GsbPevKwyaV4xqO5bN1LjAYpZ1R4&callback=initMap">
    </script>
    </body>
    
</html>

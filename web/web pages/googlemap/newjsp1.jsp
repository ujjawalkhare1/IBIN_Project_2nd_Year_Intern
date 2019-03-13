
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="java.sql.*"%>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml">
<head> 
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" /> 
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/> 
<title>Google Maps Javascript API v3 with Infoboxes, Checkbox filtering</title> 
<style type="text/css">
html, body { height: 100%; padding: 10px; } 

form {
  width: 150px;
  float: left;
}

#map {
  float: left;
}
</style>

 <%
    Class.forName("org.postgresql.Driver");
    String url ="jdbc:postgresql://localhost:5432/postgres";
        String user = "postgres";
        String pwd= "hclfamily";
        String sql="select * from test";
    Connection con=DriverManager.getConnection(url, user, pwd);
    PreparedStatement pst=con.prepareStatement(sql);
    ResultSet rs=pst.executeQuery();
  
    
%>


<script type="text/javascript">
var gmarkers = [];
var map = null;
var ib = new InfoBox();

// A function to create the marker and set up the event window
function createMarker(latlng,name,html,category) {
  var boxText = document.createElement("div");
  boxText.style.cssText = "margin-top: 10px; background: rgba(255,255,255,0.7); padding: 10px; border-radius: 10px; color: #000";
  boxText.innerHTML = html;

  var myOptions = {
    content: boxText,
    disableAutoPan: false,
    maxWidth: 0,
    pixelOffset: new google.maps.Size(-100, 0),
    zIndex: null,
    boxStyle: { 
     
      width: "250px",
    },
    closeBoxURL: "",
    infoBoxClearance: new google.maps.Size(1, 1),
    isHidden: false,
    pane: "floatPane",
    enableEventPropagation: false
  };

  var marker = new google.maps.Marker({
    position: latlng,
    
    map: map,
    title: name,
    zIndex: Math.round(latlng.lat()*-100000)<<5
  });

  // === Store the category and name info as a marker properties ===
  marker.mycategory = category;                                 
  marker.myname = name;
  gmarkers.push(marker);

  google.maps.event.addListener(marker, 'click', function() {
    ib.setOptions(myOptions)
    ib.open(map, this);
  });
} // end createMarker

// == shows all markers of a particular category, and ensures the checkbox is checked ==
function show(category) {
  for (var i=0; i<gmarkers.length; i++) {
    if (gmarkers[i].mycategory == category) {
      gmarkers[i].setVisible(true);
    }
  }
  // == check the checkbox ==
  document.getElementById(category+"box").checked = true;
}

// == hides all markers of a particular category, and ensures the checkbox is cleared ==
function hide(category) {
  for (var i=0; i<gmarkers.length; i++) {
    if (gmarkers[i].mycategory === category) {
      gmarkers[i].setVisible(false);
    }
  }
  // == clear the checkbox ==
  document.getElementById(category+"box").checked = false;
  // == close the info window, in case its open on a marker that we just hid
  ib.close();
}

// == a checkbox has been clicked ==
function boxclick(box,category) {
  if (box.checked) {
    show(category);
  } else {
    hide(category);
  }
}

function myclick(i) {
  google.maps.event.trigger(gmarkers[i],"click");
}

function initialize() {
  var myOptions = {
    zoom: 2,
    center: new google.maps.LatLng(0,0),
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    streetViewControl: false
  }
  map = new google.maps.Map(document.getElementById("map"), myOptions);

  google.maps.event.addListener(map, 'click', function() {
    ib.close();
  });

  
    
      while(<%=rs.next()%>) {
        // obtain the attribues of each marker
       
        var point = new google.maps.LatLng(<%=Float.parseFloat(rs.getString("latitude"))%>, <%=Float.parseFloat(rs.getString("longitude"))%>);
        var name = <%=rs.getString("id")%>;
        var place = <%=rs.getString("state")%>;
        var url="www.google.com"
        var html = "<b>"+name+"<\/b><br \/>"+place+"<br \/><a href='"+url +"' title='"+name +"'>View details<\/a>";
        var category = <%=rs.getString("habit")%>;
        // create the marker
        var marker = createMarker(point,name,html,category);
      }
     


} //end initialize

</script>
        <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVGr1GsbPevKwyaV4xqO5bN1LjAYpZ1R4&callback=initialize">
    </script>






  </head>
<body style="margin:0px; padding:0px;" onload="initialize()"> 

<form action="#">
  <div class="map-check"><div><input type="checkbox" id="Treebox" onclick="boxclick(this,'Tree')" /> Trees</div></div>
  <div class="map-check"><div><input type="checkbox" id="Shrubsbox" onclick="boxclick(this,'Shrubs')" /> Shrubs</div></div>
  </form>  

<div id="map" style="width: 750px; height: 600px"></div>



  </body>

</html>
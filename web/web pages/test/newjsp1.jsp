<%-- 
    Document   : newjsp1
    Created on : Jul 1, 2018, 3:57:56 PM
    Author     : trainee2018089
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
           
    <%
        String[] array={"10","11","12"};
   List<String> token=Arrays.asList(array);
	serve.Download_Service service = new serve.Download_Service();
	serve.Download port = service.getDownloadPort();
	 // TODO initialize WS operation arguments here
	java.lang.String username = "mj";
	java.util.List<java.lang.String> id = token;
	// TODO process result here
	java.lang.String result = port.download(username, id);
	out.println("Result = "+result);
    
    %>
    

        
    </body>
</html>

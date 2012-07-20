<%-- 
    Document   : empHome
    Created on : Jul 20, 2012, 8:45:12 AM
    Author     : Moghira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
         <center>
        <div style="position: absolute; left: 00px; top: 20px;">
             <img src="pics/tata2.jpg" width="60" height="50" alt="tata2"/></div>
      
        <font size="6px"><b>eCarParking System</b></font><br>
    <font color="#3399FF" size="5px">
    <b> TATA STEEL </b></font><br><br>
    <hr/>
    
    <strong><a href="index.jsp" target="_parent">Home</a> | <a href="regform.html" target="_parent">Registration</a> | <a href="index.jsp" target="_parent">Sign out</a></strong>
    </center>
        
    <hr/>
    <b> Welcome <%= request.getParameter("user") %></b><br>
    <br>
    i.  <a href="regform.html">Request a parking space</a><br>
        ii. Manage Vehicle<br>
        iii.Manage Account<br>
   
    </body>
</html>

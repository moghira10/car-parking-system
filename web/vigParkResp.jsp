<%-- 
    Document   : vigParkResp
    Created on : Jul 27, 2012, 7:33:09 PM
    Author     : Moghira
--%>


<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Respond to Request</title>
    </head>
    <body>
        <center>
        <div style="position: absolute; left: 00px; top: 20px;">
             <img src="pics/tata2.jpg" width="60" height="50" alt="tata2"/></div>
      
        <font size="6px"><b>eCarParking System</b></font><br>
    <font color="#3399FF" size="5px">
    <b> TATA STEEL </b></font><br><br>
    <hr/>
    
     <strong><a href="index.jsp" target="_parent">Home</a> | <a href="regform.html" target="_parent">Registration</a> | Sign In</strong>
    </center>        
    <hr/>
    <center>
        <br>
        <style>
            .myTable { background-color:white;border-collapse:collapse; }
            .myTable th { background-color:black;color:white; }
            .myTable td, .myTable th { padding:5px;border:1px solid black; }
            </style>
            
        
    <table frame="box" cellspacing="12" class="myTable">
        
      
        <tr>
            <th>Request Code</th>
            <th>P.No</th>
            <th>DL Type</th>
            <th>Model</th>
            <th>Grant Request</th>
            <th>Reject Request</th>
         </tr>
       
        <% 
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/epark","root","tiger");
            String query="select Request_Code,Personal_no,DL_type,Model from car_park_syst";
            PreparedStatement ps=con.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            while(rs.next())
          { 
        %>
        <tr align="center">
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getString(2)%></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(4)%></td>
            <td><input type="Submit" value="Grant" ></td>
            <td><input type="Submit" value="Reject"></td>
        </tr>
          <%      
            }
           %>   
       
      </table>
  
    </center>
    </body>
</html>

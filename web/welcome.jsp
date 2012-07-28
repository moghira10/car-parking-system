<%-- 
    Document   : welcome
    Created on : Jul 24, 2012, 12:27:02 AM
    Author     : Moghira
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        
        <%
        try{
        String user=(String)session.getAttribute("username");
        String rol=(String)session.getAttribute("role");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/epark","root","tiger");
        String nameqry="select First_Name,Last_Name from hr_master_table where Personal_No='"+user+"'";
        PreparedStatement ps=con.prepareStatement(nameqry);
        ResultSet rs=ps.executeQuery();
        while(rs.next())
                       {
        out.println("<b>Welcome "+rs.getString(1)+" "+rs.getString(2)+"</b><br>");}
        if(rol.equals("vigil"))
                     {
            out.print("<a href='regform.html'>i.Request Parking Space<br></a>");
             out.print("<a href='status.jsp' targer='_parent'>ii.Check Status</a><br>");
             out.print("iii.Manage Vehicle<br>");
            out.print("<a href='vigParkResp.jsp'>iv.Respond to Request</a><br>");
             out.print("v.Defaulters List<br>vi.Vigilence Check<br>"); }
        else
             {
             out.print("<a href='regform.html'>i.Request Parking Space<br></a>");
             out.print("<a href='quick.jsp' targer='_parent'>ii.Check Status</a><br>");
             out.print("iii.Manage Vehicle<br>");
               }
               
        }
        catch(Exception e){e.printStackTrace();}
               %>
    </body>
</html>

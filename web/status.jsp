<%-- 
    Document   : quick
    Created on : Jul 20, 2012, 9:09:28 AM
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
  
        <br>
        <h2>Quick Quote</h2>
        <% 
        
        
        String stat="";
         String pn=request.getParameter("pno");
         String vn=request.getParameter("vhno");
         
         String qry="select Personal_no,Vehicle_No,status from epark.car_park_syst where Personal_no='"+pn+"' and Vehicle_No='"+vn+"'";
         try{
           Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/epark","root","tiger");
            PreparedStatement pst=con.prepareStatement(qry);
            ResultSet res=pst.executeQuery();
            while(res.next()){
                stat=res.getString(3);
                       }
         }
         catch(Exception e){e.printStackTrace();}
        %>
        <table>
            <tr><td>P.No</td><td><%= pn %></td></tr>
            <tr><td>Vehicle No.</td><td><%= vn %></td></tr>
            <tr><td>Status:</td><td><% if(stat.equals("Not Granted"))%>
                    <font color="red"> <% if(stat.equals("Granted")) %> <font color="green"> <% if(stat.equals("Pending"))%> <font color="orange">
                <%= stat %></td></tr>
            
        </table>
        
        
        
        <form action="status.jsp">
            <div style="position: absolute; top:230px;right:00px;">  
          <img src="pics/jpeg.jpg" width="350" height="260" alt="quick"/>
            </div>
          <div style="position: absolute; top:300px;right:120px">   
              <i>Check Status Instantly</i>
              <table>       
            
                <tr>
                    <td>P.No:</td></tr><tr>
                    <td><input type="text" name="pno"></td>
                </tr>
                <tr>    
                    <td>Vehicle No./Reg.Code:</td></tr>
                <tr> <td><input type="text" name="vhno"></td>
                </tr>
                <tr><td>
                        <input type="submit" value="Submit">                    
                    </td></tr>
            </table>
            
          </div>
         </form> 
    </body>
</html>

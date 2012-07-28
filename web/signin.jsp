<%-- 
    Document   : signin
    Created on : Jul 24, 2012, 12:37:45 AM
    Author     : Moghira
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>  
            function trim(s)   
            {  
                return s.replace( /^\s*/, "" ).replace( /\s*$/, "" );  
            }  
  
            function validate()  
            {  
                if(trim(document.form.user.value)=="")  
                {  
                  alert("Login empty");  
                  document.form.user.focus();  
                  return false;  
                }   
                else if(trim(document.form.pass.value)=="")  
                {  
                  alert("password empty");  
                  document.form.pass.focus();  
                  return false;
                }  
            }  
        </script>  
    </head>
    <body>
   
        <img src="pics/car.jpg" width="180" height="150" alt="car"/>
        <br>
        Car Parking System by VT<br><br><br><br>
        <b>Login</b><br>
        <form action="" method="POST" onsubmit="return validate();" target="_parent" name="form">
            Username:&nbsp;&nbsp;&nbsp;
            <input type="text"  name="user"><br>
          Department: <select title="Department" name="dept"><br>
            <option label="ITS" value="its"/>
            <option label="RMH" value="rmh"/>
            <option label="VIGIL" value="vigil"/>
            <option label="HR" value="hr"/>
            </select>
          <br>Password:&nbsp;&nbsp;&nbsp;
           <input type="password" name="pass"><br>
        <input type="Submit" value="Login"><input type="Submit" value="Clear"><br>
            
        <a href="empReg.html" target="_parent">New Employee?Register</a>
   
         <% try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection ("jdbc:mysql://localhost:3306/mysql","root","tiger");
        System.out.println("Connection Established!"); 
        String usr=request.getParameter("user");
        String pas=request.getParameter("pass");
        String role=request.getParameter("dept");
        String qry= "select * from epark.login_details";
        PreparedStatement st= con.prepareStatement(qry);
        ResultSet rs=st.executeQuery();
        while(rs.next())
         {
         String pn=rs.getString(1);
         String pass=rs.getString(2);
         String rol=rs.getString(3);
         if(pn.equals(usr) && pass.equals(pas) && rol.equals(role)){
              session.setAttribute("username",usr); 
              session.setAttribute("role",role); 
             response.sendRedirect("http://localhost:8080/ePark/welcome.jsp");}
               
       }
         }
    catch(Exception e){ e.printStackTrace();}              
        %>
     </form>
        </body>
    
</html>
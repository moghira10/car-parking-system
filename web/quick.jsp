<%-- 
    Document   : quick
    Created on : Jul 20, 2012, 9:09:28 AM
    Author     : Moghira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Quick Quote</h2>
        P.No      :<%= request.getParameter("pno") %><br>
        Vehicle No:<%= request.getParameter("vhno") %><br>
        Status    :<font color="blue"> <b>Pending</b></font>
             <form action="quick.jsp">
            <div style="position: absolute; top:80px;right:00px;">  
          <img src="pics/jpeg.jpg" width="350" height="260" alt="quick"/>
            </div>
          <div style="position: absolute; top:150px;right:120px">   
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

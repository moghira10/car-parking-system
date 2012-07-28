/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package serv;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.*;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Moghira
 */
public class EmpReg extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String pnum;
        int i = 0,j;
        String dob;
        
        String pas;
        String dept;
        pnum=request.getParameter("pno");
        
        dob=request.getParameter("dob");
        dept=request.getParameter("department");
        pas=request.getParameter("pass");
        String query;
        query="insert into epark.login_details values(?,?,?,?)";
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection ("jdbc:mysql://localhost:3306/mysql","root","tiger");
        System.out.println("Connection Established!");
        PreparedStatement pst = con.prepareStatement(query);
        pst.setString(1, pnum);
        pst.setString(2, pas);
        pst.setString(3, dept);
        pst.setString(4, dob);
        i=pst.executeUpdate();
        System.out.println("Database Updated Successfully!");
        }
        catch(ClassNotFoundException e){e.printStackTrace();}
        catch(SQLException e){e.printStackTrace();}
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Employee Registration</title>");            
            out.println("</head>");
            out.println("<body>");
            if(i==0){
                out.println("<h1>unexpexted error</h1>");   
            }
            else{
            out.println("<center><div style='position: absolute; left: 00px; top: 20px;'><img src='pics/tata2.jpg' width='60' height='50'/></div>");
            out.println("<font size='6px'><b><i>e</i>CarParking System</b></font><br>");
            out.println("<font color='#3399FF' size='5px'><b> TATA STEEL </b></font><br><br></center><hr/>");        
            out.println("<b>Welcome to Tata Steel eCar Parking System</b><br>");
            out.println("Thank you for registering with us.<br>Login to your account to register for a parking space<br><b>TATA STEEL</b>");
            out.println("<br><a href='index.jsp' target='_parent'><b>Go Home-></b></a>");
                    }
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

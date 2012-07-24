/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bookSpace;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Moghira
 */
public class ReqPark extends HttpServlet {
    String rc;
    int i;
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
        String pno=request.getParameter("pno");
        String vno=request.getParameter("vhno");
        String mod=request.getParameter("model");
        String paper=request.getParameter("paper");
        String dl=request.getParameter("dlno");
        String dlt=request.getParameter("dlty");
        String exp=request.getParameter("expd");
        String qry="select Personal_No from epark.hr_master_table where Personal_No='"+pno+"'and Designation='designated'";
        String insert="insert into epark.car_park_syst values(?,?,?,?,?,?,?,?,?,?)";
      try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection ("jdbc:mysql://localhost:3306/mysql","root","tiger");
        System.out.println("Connection Established!");
        PreparedStatement st=con.prepareStatement(qry);
        ResultSet rs=st.executeQuery();
        while(rs.next())
        {
            String desPno=rs.getString(1);
            if(desPno.equals(pno))
            {   String pt="designated";
                String pc="RMH0001";
               Random rand = new Random();  
                long drand = (long)(rand.nextDouble()*10000L);
                
               rc= Double.toString(drand);
              
                //System.out.println(exp);
                 PreparedStatement pst = con.prepareStatement(insert);
                     pst.setString(1, dl);
                     pst.setString(2, pno);
                     pst.setString(3, exp);
                     pst.setString(4, pc);
                     pst.setString(5, dlt);
                     pst.setString(6, vno);
                     pst.setString(7, mod);
                     pst.setString(8, paper);
                     pst.setString(9, pt);
                     pst.setString(10, rc);
                     i= pst.executeUpdate();
            }
        }
    
       
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ReqPark</title>");            
            out.println("</head>");
            out.println("<body>");
            if(i==0){
            out.println("<b>Your Request cannot be sent.Try again later.</b>");}
            else{
              out.println("Your Request has been sent<br> Your Request Code is:<b>"+rc+"</b>");   
            }
            out.println("</body>");
            out.println("</html>");
        
      }catch(Exception e){e.printStackTrace();}
      finally {            
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

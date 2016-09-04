

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dbconfig.dbconfig;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * Last edit 2015-05-01
 *
 * @author Sanip
 * 
 */

public class ContactAdmin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        dbconfig dbinfo = new dbconfig();


        try {
            String contactName = (String) request.getParameter("contactName");
            String contactEmail = (String) request.getParameter("contactEmail");
            String messageSubject = (String) request.getParameter("messageSubject");
            String adminMessages = (String) request.getParameter("adminMessages");

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(
                                       "jdbc:mysql://saniprealestate-ap-southeast-2a.c3mrp52txpvn.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate","saniprealestate", "saniprealestate");

            String sql = "INSERT INTO " + dbinfo.TABLEadmin_messages()
                    + "(contactName, "
                    + "contactEmail, "
                    + "messageSubject, "
                    + "messageDate, "
                    + "adminMessage) "
                    + "VALUES (?, ?, ?, NOW(), ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, contactName);
            pstmt.setString(2, contactEmail);
            pstmt.setString(3, messageSubject);
            pstmt.setString(4, adminMessages);
            pstmt.executeUpdate();

            session.setAttribute("messageModal", "true");
            session.setAttribute("message", "Your message has been sent to admin successfully.");
            session.setAttribute("error", null);
            session.setAttribute("action", "about-us.jsp");
            session.setAttribute("buttonAction", "modal");
            session.setAttribute("buttonLabel", "Ok");
            response.sendRedirect("/about-us.jsp");
            //request.getRequestDispatcher("/property-details.jsp").forward(request, response);

            pstmt.close();
            conn.close();

        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            session.setAttribute("messageModal", "true");
            session.setAttribute("message", "An error occurred trying to send your message!<br/>Please try again.");
            session.setAttribute("error", ex.getMessage());
            session.setAttribute("action", "about-us.jsp");
            session.setAttribute("buttonAction", "modal");
            session.setAttribute("buttonLabel", "Try again");
            response.sendRedirect("/about-us.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
    }

}

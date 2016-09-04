/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dbconfig.dbconfig;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Date;

/**
 * Last edit 2015-05-01
 *
 * @author Sanip
 */
public class upgradepremium extends HttpServlet {

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
            throws ServletException, IOException, ParseException {

        HttpSession session = request.getSession(true);
        String propertyID = (String) request.getParameter("propertyID");
        String premiumType = (String) request.getParameter("premiumType");
        String amountPaid = (String) request.getParameter("amountPaid");
        String premiumID = null;
        String premiumExpire = null;
        //set premium start date

        //load database config
        dbconfig dbinfo = new dbconfig();
        //check the premium property history
        String dbpremiumtype = null;// old premium type
        String dbexpire = null;//old premium expire date

        //find record from database
        try {
            Connection con;
            Statement sql1;
            ResultSet rs1;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://saniprealestate-ap-southeast-2a.c3mrp52txpvn.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate","saniprealestate", "saniprealestate");

            sql1 = con.createStatement();
            rs1 = sql1.executeQuery("SELECT * FROM premium " + "WHERE propertyID = " + propertyID + " AND premiumType= '" + premiumType + "'");
            while (rs1.next()) {
                premiumID = rs1.getString(1);
                dbpremiumtype = rs1.getString(2);
                dbexpire = rs1.getString(6);
            }
            con.close();
            Date now_time = (Date) Calendar.getInstance().getTime();
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Calendar c = Calendar.getInstance();
            String currentDate = df.format(now_time);
            c.add(Calendar.DATE, 7);
            if (premiumID != null) {//found property premium type record,it is same premium type update record

                String sql;

                if (dbexpire.compareTo(currentDate) < 0) {//the old premium is expire. new premium;
                    sql = "UPDATE premium SET amountPaid = '"+amountPaid+"' , premiumExpire = DATE_ADD(now(),INTERVAL 7 DAY) where premiumID = '"+premiumID+"'";

                    session.setAttribute("message", "Your premium has been renewed to " + df.format(c.getTime()));

                } else { //the old premium not expire extend preimum;
                    sql = "UPDATE premium SET amountPaid = '"+amountPaid+"' , premiumExpire = DATE_ADD(premiumExpire,INTERVAL 7 DAY) where premiumID = '"+premiumID+"'";
                    String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";

                    java.text.SimpleDateFormat sdf
                            = new java.text.SimpleDateFormat(DATE_FORMAT);
                    Date date = (Date) sdf.parse(dbexpire);
                    Calendar c1 = Calendar.getInstance();
                    c1.setTime(date);
                    c1.add(Calendar.DATE, 7);
                    session.setAttribute("message", "Your premium has been renewed to" + sdf.format(c1.getTime()));
                }

                try {//update record

                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection conn = DriverManager.getConnection(
                            "jdbc:mysql://" + dbinfo.getdburl() + ":3306/" + dbinfo.getdb(),
                            dbinfo.getdbuser(), dbinfo.getdbpassword());

                    PreparedStatement pstmt = conn.prepareStatement(sql);

                    pstmt.executeUpdate();

                    session.setAttribute("messageModal", "true");
                    session.setAttribute("error", null);
                    session.setAttribute("action", "about-us.jsp");
                    session.setAttribute("buttonAction", "modal");
                    session.setAttribute("buttonLabel", "Ok");
                    response.sendRedirect("/owner-dashboard.jsp");
                    //request.getRequestDispatcher("/property-details.jsp").forward(request, response);

                    pstmt.close();
                    conn.close();

                } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
                    session.setAttribute("messageModal", "true");
                    session.setAttribute("message", "Cant renew your premium!<br/>Please try again.");
                    session.setAttribute("error", ex.getMessage());
                    session.setAttribute("action", "about-us.jsp");
                    session.setAttribute("buttonAction", "modal");
                    session.setAttribute("buttonLabel", "Try again");
                    response.sendRedirect("/upgrade-premium.jsp");
                }

            } else {// not found property premium type record,create new record

                try {

                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection conn = DriverManager.getConnection(
                            "jdbc:mysql://" + dbinfo.getdburl() + ":3306/" + dbinfo.getdb(),
                            dbinfo.getdbuser(), dbinfo.getdbpassword());
                    String sql = "INSERT INTO " + dbinfo.TABLEpremium()
                            + "(propertyID, "
                            + "premiumType, "
                            + "amountPaid, "
                            + "premiumCreate, "
                            + "premiumExpire) "
                            + "VALUES (?, ?, ?, now(), DATE_ADD(now(), INTERVAL 7 DAY))";

                    PreparedStatement pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, propertyID);
                    pstmt.setString(2, premiumType);
                    pstmt.setString(3, amountPaid);
                    pstmt.executeUpdate();

                    session.setAttribute("messageModal", "true");
                    session.setAttribute("message", "Your premium property created successfully. The expire time is" + df.format(c.getTime()));
                    session.setAttribute("action", "about-us.jsp");
                    session.setAttribute("error", null);
                    session.setAttribute("buttonAction", "modal");
                    session.setAttribute("buttonLabel", "Ok");
                    response.sendRedirect("/owner-dashboard.jsp");
                    //request.getRequestDispatcher("/property-details.jsp").forward(request, response);

                    pstmt.close();
                    conn.close();

                } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
                    session.setAttribute("messageModal", "true");
                    session.setAttribute("message", "Cant create premium property!<br/>Please try again.");
                    session.setAttribute("error", ex.getMessage());
                    session.setAttribute("action", "about-us.jsp");
                    session.setAttribute("buttonAction", "modal");
                    session.setAttribute("buttonLabel", "Try again");
                    response.sendRedirect("/upgrade-premium.jsp");
                }

            }
        } catch (SQLException ex) {
            session.setAttribute("messageModal", "true");

            session.setAttribute("error", ex.getMessage());
            session.setAttribute("action", "about-us.jsp");
            session.setAttribute("buttonAction", "modal");
            session.setAttribute("buttonLabel", "Try again");
            response.sendRedirect("/upgrade-premium.jsp");
            session.setAttribute("message", "Some error between server and database!<br/>Please try again.");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(upgradepremium.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(upgradepremium.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(upgradepremium.class.getName()).log(Level.SEVERE, null, ex);
        }
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

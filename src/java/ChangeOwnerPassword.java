
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Allows the owner to change his/her password
 *
 * @author Sanip
 */
public class ChangeOwnerPassword extends HttpServlet {

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
        // Create a session
        HttpSession session = request.getSession(true);
        // set session variables with data from request
        storeVariables(session, request);

        // Get value from "signInCancel" button at Change Owner Password Form
        String chOwnerPassCancel = (String) request.getParameter("chOwnerPassCancel");
        if (chOwnerPassCancel == null) {
            chOwnerPassCancel = "";
        }
        // Get value from "signUpSubmit" button at Change Owner Password Form
        String chOwnerPassSubmit = (String) request.getParameter("chOwnerPassSubmit");
        if (chOwnerPassSubmit == null) {
            chOwnerPassSubmit = "";
        }

        // If clicked on "Cancel"
        if (chOwnerPassCancel.equals("Cancel")) {
            // Clear form
            clearForm(session);
            // Reset window status
            session.setAttribute("chOwnerPassError", "");
            // Redirect to owner dashboard
            response.sendRedirect("/owner-dashboard.jsp");

            // If clicked on "Submit"
        } else if (chOwnerPassSubmit.equals("Submit")) {
            // If there are no errors in the form, update database
            if (checkChangePassword(session, response)) {
                // Reset window status
                session.setAttribute("chOwnerPassError", "");
                // Change password
                changePassword(session, response);
            } else {
                // Set window status
                session.setAttribute("chOwnerPassError", "true");
                // Return to form window
                response.sendRedirect("/owner-dashboard.jsp");
            }
        }
    }

    // Set session variables
    protected void storeVariables(HttpSession session, HttpServletRequest request) {

        session.setAttribute("password", request.getParameter("password"));
        session.setAttribute("errPassword", "");
        session.setAttribute("newPassword", request.getParameter("newPassword"));
        session.setAttribute("errNewPassword", "");
        session.setAttribute("cfmNewPassword", request.getParameter("cfmNewPassword"));
        session.setAttribute("errCfmNewPassword", "");
    }

    // Clear session variables
    protected void clearForm(HttpSession session) {

        session.setAttribute("password", "");
        session.setAttribute("errPassword", "");
        session.setAttribute("newPassword", "");
        session.setAttribute("errNewPassword", "");
        session.setAttribute("cfmNewPassword", "");
        session.setAttribute("errCfmNewPassword", "");
    }

    // Check user name and password
    protected boolean checkChangePassword(HttpSession session, HttpServletResponse response)
            throws IOException {

        // Get form data from session
        String ownerID = (String) session.getAttribute("ownerID");
        String password = (String) session.getAttribute("password");
        String newPassword = (String) session.getAttribute("newPassword");
        String cfmNewPassword = (String) session.getAttribute("cfmNewPassword");
        try {
            // Create JDBC instance
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            // Create a connection with database
            Connection conn = DriverManager.getConnection(
                                      "jdbc:mysql://saniprealestate-ap-southeast-2a.c3mrp52txpvn.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate","saniprealestate", "saniprealestate");

            // Create SQL statement to update database
            Statement stmt = conn.createStatement();
            // Create SQL string
            String sql = "SELECT password FROM owners WHERE ownerID = '" + ownerID + "'";
            // Retrieve records from database
            ResultSet rs = stmt.executeQuery(sql);
            // Check password
            rs.next();
            if (password == null || password.trim().length() == 0 || password.equals("")) {
                session.setAttribute("errPassword", "This field cannot be left blank");
                return false;
            } else if (!password.equals(rs.getString("password"))) {
                session.setAttribute("errPassword", "Invalid password");
                return false;
                // Check new password
            } else if (newPassword == null || newPassword.trim().length() == 0 || newPassword.equals("")) {
                session.setAttribute("errNewPassword", "This field cannot be left blank");
                return false;
            } else if (newPassword == null || newPassword.trim().length() < 6 || newPassword.trim().length() > 10) {
                session.setAttribute("errNewPassword", "The password must be 6 to 10 characters long");
                return false;
                // Check confirm new password
            } else if (cfmNewPassword == null || cfmNewPassword.trim().length() == 0 || cfmNewPassword.equals("")) {
                session.setAttribute("errCfmNewPassword", "This field cannot be left blank");
                return false;
            } else if (!cfmNewPassword.equals(newPassword)) {
                session.setAttribute("errCfmNewPassword", "This field must match New password field");
                return false;
            }
            // Close connections
            rs.close();
            stmt.close();
            conn.close();
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(ChangeOwnerPassword.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("message", "An error occurred trying to verify your password!<br/>Please try again.");
            session.setAttribute("error", ex.getMessage());
            session.setAttribute("action", "servlet/LoadOwnerDashboard");
            session.setAttribute("buttonAction", "messageModal");
            session.setAttribute("buttonLabel", "Try again");
            response.sendRedirect("/owner-dashboard.jsp");
        }
        return true;
    }

    protected void changePassword(HttpSession session, HttpServletResponse response)
            throws IOException {
        try {
            // retrieve form data from session
            String ownerID = (String) session.getAttribute("ownerID");
            String newPassword = (String) session.getAttribute("newPassword");
            // Create JDBC instance
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            // Create a connection with database
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://ssx.caclpzhk20ad.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate", "ssxrealestate", "ssxrealestate");
            // Create SQL statement to update database
            String sql = "UPDATE owners SET password = ? WHERE ownerID = ?";
            // Prepare Statement to update database
            PreparedStatement pstmt = conn.prepareStatement(sql);
            //update database
            pstmt.setString(1, newPassword);
            pstmt.setString(2, ownerID);
            int status = pstmt.executeUpdate();
            // Close connections
            pstmt.close();
            conn.close();
            // If an error occur updating database, return to dashboard
            if (status == 0) {
                session.setAttribute("messageModal", "true");
                session.setAttribute("message", "An error occurred trying to change your password!<br/>Please try again.");
                session.setAttribute("error", null);
                session.setAttribute("action", "servlet/LoadOwnerDashboard");
                session.setAttribute("buttonAction", "messageModal");
                session.setAttribute("buttonLabel", "Try again");
                response.sendRedirect("/owner-dashboard.jsp");
            } else {
                // If successful, send to successful message page
                session.setAttribute("messageModal", "true");
                session.setAttribute("message", "Password changed successfully!");
                session.setAttribute("error", null);
                session.setAttribute("action", "servlet/LoadOwnerDashboard");
                session.setAttribute("buttonAction", "messageModal");
                session.setAttribute("buttonLabel", "Ok");
                response.sendRedirect("/owner-dashboard.jsp");
            }
        // Catch errors and display message
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(ChangeOwnerPassword.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("messageModal", "true");
            session.setAttribute("message", "An error occurred trying to change your password!<br/>Please try again.");
            session.setAttribute("error", ex.getMessage());
            session.setAttribute("action", "servlet/LoadOwnerDashboard");
            session.setAttribute("buttonAction", "messageModal");
            session.setAttribute("buttonLabel", "Try again");
            response.sendRedirect("/owner-dashboard.jsp");
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
    }// </editor-fold>

}

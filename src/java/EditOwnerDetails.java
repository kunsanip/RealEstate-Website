
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Allows the owner to edit his/her details
 *
 * @author Sanip
 */
public class EditOwnerDetails extends HttpServlet {

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
        // Get session from request
        HttpSession session = request.getSession(true);
        // set session variables with data from request
        storeVariables(session, request);
        // Get value from "Edit details" button at Owner details box
        String loadOwnerDetails = (String) request.getParameter("loadOwnerDetails");
        if (loadOwnerDetails == null) {
            loadOwnerDetails = "";
        }
        // Get value from "Cancel" button at Edit Owner Details Form
        String editOwnerCancel = (String) request.getParameter("editOwnerCancel");
        if (editOwnerCancel == null) {
            editOwnerCancel = "";
        }
        // Get value from "Submit" button at Edit Owner Details Form
        String editOwnerSubmit = (String) request.getParameter("editOwnerSubmit");
        if (editOwnerSubmit == null) {
            editOwnerSubmit = "";
        }
        // Get value from "Confirm" button at Delete Accunt window
        String deleteOwnerConfirm = (String) request.getParameter("deleteOwnerConfirm");
        if (deleteOwnerConfirm == null) {
            deleteOwnerConfirm = "";
        }

        // If clicked on "Edit details" at Owner details box
        if (loadOwnerDetails.equals("true")) {
            // Load owner details
            loadOwnerDetails(session, response);
            //Set form window status
            session.setAttribute("editOwnerError", "true");
            // Redirect to owner dashboard page
            response.sendRedirect("/owner-dashboard.jsp");
            // If clicked on "Cancel" at form window
        } else if (editOwnerCancel.equals("Cancel")) {
            //Clear form window status
            session.setAttribute("editOwnerError", "");
            //forward to LoadOwnerDashboard servlet
            RequestDispatcher rd = request.getRequestDispatcher("LoadOwnerDashboard");
            rd.forward(request, response);
            // If clicked on "Submit" at  Edit Owner Details Form
        } else if (editOwnerSubmit.equals("Submit")) {
            // If there are no errors in the form, execute update
            if (checkForm(session, response)) {
                // Reset form window status
                session.setAttribute("editOwnerError", "");
                //call editOwnerDetails method
                editOwnerDetails(request, session, response);
            } else {
                // If any error in the form, return to  Edit Owner Details Form
                // Reset form window status
                session.setAttribute("editOwnerError", "true");
                // Redirect to owner dashboard page
                response.sendRedirect("/owner-dashboard.jsp");
            }
            // If clicked on "CONFIRM" at Delete Account window
        } else if (deleteOwnerConfirm.equals("CONFIRM")) {
            //Clear form window status
            session.setAttribute("editOwnerError", "");
            //Delete owner record from database
            deleteOwner(session, response);
        }
    }

    // set session variables with data from request
    protected void storeVariables(HttpSession session, HttpServletRequest request) {

        session.setAttribute("newFirstName", request.getParameter("newFirstName"));
        session.setAttribute("errNewFirstName", "");
        session.setAttribute("newLastName", request.getParameter("newLastName"));
        session.setAttribute("errNewLastName", "");
        session.setAttribute("newEmail", request.getParameter("newEmail"));
        session.setAttribute("errNewEmail", "");
        session.setAttribute("newPhone", request.getParameter("newPhone"));
        session.setAttribute("errNewPhone", "");
        session.setAttribute("newAddress", request.getParameter("newAddress"));
        session.setAttribute("errNewAddress", "");
        session.setAttribute("newSuburb", request.getParameter("newSuburb"));
        session.setAttribute("errNewSuburb", "");
        session.setAttribute("newState", request.getParameter("newState"));
        session.setAttribute("errNewState", "");
        session.setAttribute("newPostcode", request.getParameter("newPostcode"));
        session.setAttribute("errNewPostcode", "");
    }

    // Load owner details
    protected void loadOwnerDetails(HttpSession session, HttpServletResponse response) throws IOException {

        String ownerID = (String) session.getAttribute("ownerID");
        try {
            // Create JDBC instance
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            // Create a connection with database
            Connection conn = DriverManager.getConnection(
                                      "jdbc:mysql://saniprealestate-ap-southeast-2a.c3mrp52txpvn.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate","saniprealestate", "saniprealestate");

            Statement stmt = conn.createStatement();
            // Create a SQL Statement String
            String sql = "SELECT * FROM owners WHERE ownerID = '" + ownerID + "'";
            // Execute SQL statement
            ResultSet rs = stmt.executeQuery(sql);
            // Read data from resultset to session
            rs.next();
            session.setAttribute("newFirstName", rs.getString("firstName"));
            session.setAttribute("newLastName", rs.getString("lastName"));
            session.setAttribute("newEmail", rs.getString("email"));
            session.setAttribute("newPhone", rs.getString("phone"));
            session.setAttribute("newAddress", rs.getString("address"));
            session.setAttribute("newSuburb", rs.getString("suburb"));
            session.setAttribute("newState", rs.getString("state"));
            session.setAttribute("newPostcode", rs.getString("postcode"));
            // Close connections
            rs.close();
            stmt.close();
            conn.close();

            // Catch errors
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            session.setAttribute("messageModal", "true");
            session.setAttribute("message", "An error occurred trying to load owner details.<br/>Please try again.");
            session.setAttribute("error", ex.getMessage());
            session.setAttribute("action", "servlet/LoadOwnerDashboard");
            session.setAttribute("buttonAction", "messageModal");
            session.setAttribute("buttonLabel", "Try again");
            response.sendRedirect("/owner-dashboard.jsp");
        }
    }

    // Check owner's details
    protected boolean checkForm(HttpSession session, HttpServletResponse response) throws IOException {

        boolean result = true;

        // Get form data from session
        String newFirstName = (String) session.getAttribute("newFirstName");
        String newLastName = (String) session.getAttribute("newLastName");
        String newEmail = (String) session.getAttribute("newEmail");
        String newPhone = (String) session.getAttribute("newPhone");
        String newAddress = (String) session.getAttribute("newAddress");
        String newSuburb = (String) session.getAttribute("newSuburb");
        String newState = (String) session.getAttribute("newState");
        String newPostcode = (String) session.getAttribute("newPostcode");

        // Process first name
        if (newFirstName == null || newFirstName.trim().length() == 0 || newFirstName.equals("")) {
            session.setAttribute("errNewFirstName", "This field cannot be left blank");
            result = false;
        }
        // Process last name
        if (newLastName == null || newLastName.trim().length() == 0 || newLastName.equals("")) {
            session.setAttribute("errNewLastName", "This field cannot be left blank");
            result = false;
        }
        // Process email
        if (newEmail == null || newEmail.trim().length() == 0 || newEmail.equals("")) {
            session.setAttribute("errNewEmail", "This field cannot be left blank");
            result = false;
        }
        // Process phone number
        if (newPhone == null || newPhone.trim().length() == 0 || newPhone.equals("")) {
            session.setAttribute("errNewPhone", "This field cannot be left blank");
            result = false;
        } else if (!newPhone.matches("\\d+")) {
            session.setAttribute("errNewPhone", "Please enter numbers only");
            result = false;
        }
        // Process address
        if (newAddress == null || newAddress.trim().length() == 0 || newAddress.equals("")) {
            session.setAttribute("errNewAddress", "This field cannot be left blank");
            result = false;
        }
        // Process address
        if (newSuburb == null || newSuburb.trim().length() == 0 || newSuburb.equals("")) {
            session.setAttribute("errNewSuburb", "This field cannot be left blank");
            result = false;
        }
        // Process address
        if (newState == null || newState.trim().length() == 0 || newState.equals("")) {
            session.setAttribute("errNewState", "This field cannot be left blank");
            result = false;
        }
        // Process address
        if (newPostcode == null || newPostcode.trim().length() == 0 || newPostcode.equals("")) {
            session.setAttribute("errNewPostcode", "This field cannot be left blank");
            result = false;
        } else if (!newPostcode.matches("\\d+")) {
            session.setAttribute("errNewPostcode", "Please enter numbers only");
            result = false;
        }
        // Return false if any errors
        return result;
    }

    // Update owner record in database
    protected void editOwnerDetails(HttpServletRequest request, HttpSession session, HttpServletResponse response)
            throws IOException, ServletException {
        try {
            // retrieve form data from session
            String ownerID = (String) session.getAttribute("ownerID");
            String newFirstName = (String) session.getAttribute("newFirstName");
            String newLastName = (String) session.getAttribute("newLastName");
            String newEmail = (String) session.getAttribute("newEmail");
            String newPhone = (String) session.getAttribute("newPhone");
            String newAddress = (String) session.getAttribute("newAddress");
            String newSuburb = (String) session.getAttribute("newSuburb");
            String newState = (String) session.getAttribute("newState");
            String newPostcode = (String) session.getAttribute("newPostcode");
            // Create JDBC instance
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            // Create a connection with database
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://ssx.caclpzhk20ad.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate",
                    "ssxrealestate", "ssxrealestate");
            // Create SQL statement to update database
            String sql = "UPDATE owners SET "
                    + "firstName = ?, "
                    + "lastName = ?, "
                    + "email = ?, "
                    + "phone = ?, "
                    + "address = ?, "
                    + "suburb = ?, "
                    + "state = ?, "
                    + "postcode = ? "
                    + "WHERE ownerID = ?";
            // Prepare Statement to update database
            PreparedStatement pstmt = conn.prepareStatement(sql);
            //update database
            pstmt.setString(1, newFirstName);
            pstmt.setString(2, newLastName);
            pstmt.setString(3, newEmail);
            pstmt.setString(4, newPhone);
            pstmt.setString(5, newAddress);
            pstmt.setString(6, newSuburb);
            pstmt.setString(7, newState);
            pstmt.setString(8, newPostcode);
            pstmt.setString(9, ownerID);
            int status = pstmt.executeUpdate();
            // Close connections
            pstmt.close();
            conn.close();
            // If an error occur updating database, return to dashboard
            if (status == 0) {
                session.setAttribute("messageModal", "true");
                session.setAttribute("message", "An error occurred trying to update your details.<br/>Please try again.");
                session.setAttribute("error", null);
                session.setAttribute("action", "servlet/LoadOwnerDashboard");
                session.setAttribute("buttonAction", "messageModal");
                session.setAttribute("buttonLabel", "Try again");
                response.sendRedirect("/owner-dashboard.jsp");
            } else {
                session.setAttribute("messageModal", "true");
                session.setAttribute("message", "Your details have been updated sussessfuly.");
                session.setAttribute("error", null);
                session.setAttribute("action", "servlet/LoadOwnerDashboard");
                session.setAttribute("buttonAction", "messageModal");
                session.setAttribute("buttonLabel", "Ok");
                response.sendRedirect("/owner-dashboard.jsp");
            }
            // Catch any error and display message
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(EditOwnerDetails.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("messageModal", "true");
            session.setAttribute("message", "An error occurred trying to update your details.<br/>Please try again.");
            session.setAttribute("error", ex.getMessage());
            session.setAttribute("action", "servlet/LoadOwnerDashboard");
            session.setAttribute("buttonAction", "messageModal");
            session.setAttribute("buttonLabel", "Try again");
            response.sendRedirect("/owner-dashboard.jsp");
        }
    }

    // Remove user from database
    protected void deleteOwner(HttpSession session, HttpServletResponse response)
            throws IOException {
        String ownerID = (String) session.getAttribute("ownerID");
        try {
            // Create JDBC instance
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            // Create a connection with database
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://ssx.caclpzhk20ad.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate",
                    "ssxrealestate", "ssxrealestate");
            // Create SQL statement
            Statement stmt = conn.createStatement();
            // Create SQL statement String
            String sql = "DELETE FROM owners WHERE OwnerID = '" + ownerID + "'";
            // Execute SQL statment
            int status = stmt.executeUpdate(sql);
            // If an error occurs, display error message
            // Close connections
            stmt.close();
            conn.close();
            if (status == 0) {
                session.setAttribute("messageModal", "true");
                session.setAttribute("message", "An error occurred trying to delete your account.<br/>Please try again!");
                session.setAttribute("error", null);
                session.setAttribute("action", "servlet/LoadOwnerDashboard");
                session.setAttribute("buttonAction", "messageModal");
                session.setAttribute("buttonLabel", "Try again");
                response.sendRedirect("/owner-dashboard.jsp");
            } else {
                session.setAttribute("messageModal", "true");
                session.setAttribute("message", "Your account has been deleted sussessfuly.");
                session.setAttribute("error", null);
                session.setAttribute("action", "servlet/SignOut");
                session.setAttribute("buttonAction", "messageModal");
                session.setAttribute("buttonLabel", "Ok");
                response.sendRedirect("/owner-dashboard.jsp");
            }

            // Catch errors and display error message
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException | IOException ex) {
            Logger.getLogger(EditOwnerDetails.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("messageModal", "true");
            session.setAttribute("message", "An error occurred trying to delete your account.<br/>Please try again.");
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

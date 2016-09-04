
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
 * Allows the owner to edit property details
 *
 * @author Sanip
 */
public class EditPropertyDetails extends HttpServlet {

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
        // Get value from "Edit details" button at Property details box
        String loadPropertyDetails = (String) request.getParameter("loadPropertyDetails");
        if (loadPropertyDetails == null) {
            loadPropertyDetails = "";
        }
        // Get value from "Cancel" button at Edit Property Details Form
        String editAdCancel = (String) request.getParameter("editAdCancel");
        if (editAdCancel == null) {
            editAdCancel = "";
        }
        // Get value from "Submit" button at Edit Property Details Form
        String editAdSubmit = (String) request.getParameter("editAdSubmit");
        if (editAdSubmit == null) {
            editAdSubmit = "";
        }
        // Get value from "Confirm" button at Delete Property window
        String deletePropertyConfirm = (String) request.getParameter("deletePropertyConfirm");
        if (deletePropertyConfirm == null) {
            deletePropertyConfirm = "";
        }

        // If clicked on "Edit details"
        if (loadPropertyDetails.equals("true")) {
            // Load owner details
            session.setAttribute("propertyID", request.getParameter("propertyID"));
            loadPropertyDetails(session, response);
            //Set form window status
            session.setAttribute("editAdError", "true");
            // Redirect to owner dashboard page
            response.sendRedirect("/owner-dashboard.jsp");
            // If clicked on "Cancel"
        } else if (editAdCancel.equals("Cancel")) {
            //Clear form window status
            session.setAttribute("editAdError", "");
            //forward to LoadOwnerDashboard servlet
            RequestDispatcher rd = request.getRequestDispatcher("LoadOwnerDashboard");
            rd.forward(request, response);
            // If clicked on "Submit"
        } else if (editAdSubmit.equals("Submit")) {
            // If there are no errors in the form, execute update
            if (checkForm(session, response)) {
                // Reset form window status
                session.setAttribute("editAdError", "");
                //call editOwnerDetails method
                updatePropertyDetails(request, session, response);
            } else {
                // If any error in the form, return to  Edit Owner Details Form
                // Reset form window status
                session.setAttribute("editAdError", "true");
                // Redirect to owner dashboard page
                response.sendRedirect("/owner-dashboard.jsp");
            }
            // If clicked on "CONFIRM" at Delete Account window
        } else if (deletePropertyConfirm.equals("CONFIRM")) {
            //Clear form window status
            session.setAttribute("editAdError", "");
            //Delete owner record from database
            deleteProperty(session, response);
        }
    }

    // Set session variables
    protected void storeVariables(HttpSession session, HttpServletRequest request) {

        session.setAttribute("newAdTitle", request.getParameter("newAdTitle"));
        session.setAttribute("errNewAdTitle", request.getParameter("errNewAdTitle"));
        session.setAttribute("newAdPurpose", request.getParameter("newAdPurpose"));
        session.setAttribute("errNewAdPurpose", request.getParameter("errNewAdPurpose"));
        session.setAttribute("newPropertyType", request.getParameter("newPropertyType"));
        session.setAttribute("errNewPropertyType", request.getParameter("errNewPropertyType"));
        session.setAttribute("newPropertySize", request.getParameter("newPropertySize"));
        session.setAttribute("errNewPropertySize", request.getParameter("errNewPropertySize"));
        session.setAttribute("newPropertyPrice", request.getParameter("newPropertyPrice"));
        session.setAttribute("errNewPropertyPrice", request.getParameter("errNewPropertyPrice"));
        session.setAttribute("newPropertyAddress", request.getParameter("newPropertyAddress"));
        session.setAttribute("errNewPropertyAddress", request.getParameter("errNewPropertyAddress"));
        session.setAttribute("newPropertySuburb", request.getParameter("newPropertySuburb"));
        session.setAttribute("errNewPropertySuburb", request.getParameter("errNewPropertySuburb"));
        session.setAttribute("newPropertyState", request.getParameter("newPropertyState"));
        session.setAttribute("errNewPropertyState", request.getParameter("errNewPropertyState"));
        session.setAttribute("newPropertyPostcode", request.getParameter("newPropertyPostcode"));
        session.setAttribute("errNewPropertyPostcode", request.getParameter("errNewPropertyPostcode"));
        session.setAttribute("newPropertyBedrooms", request.getParameter("newPropertyBedrooms"));
        session.setAttribute("errNewPropertyBedrooms", request.getParameter("errNewPropertyBedrooms"));
        session.setAttribute("newPropertyBathrooms", request.getParameter("newPropertyBathrooms"));
        session.setAttribute("errNewPropertyBathrooms", request.getParameter("errNewPropertyBathrooms"));
        session.setAttribute("newPropertyCarSpaces", request.getParameter("newPropertyCarSpaces"));
        session.setAttribute("errNewPropertyCarSpaces", request.getParameter("errNewPropertyCarSpaces"));
        session.setAttribute("newPropertyDescription", request.getParameter("newPropertyDescription"));
        session.setAttribute("errNewPropertyDescription", request.getParameter("errNewPropertyDescription"));
    }

    // Load owner details
    protected void loadPropertyDetails(HttpSession session, HttpServletResponse response) throws IOException {

        String propertyID = (String) session.getAttribute("propertyID");
        try {
            // Create JDBC instance
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            // Create a connection with database
            Connection conn = DriverManager.getConnection(
                                       "jdbc:mysql://saniprealestate-ap-southeast-2a.c3mrp52txpvn.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate","saniprealestate", "saniprealestate");

            Statement stmt = conn.createStatement();
            // Create a SQL Statement String
            String sql = "SELECT * FROM properties WHERE propertyID = '" + propertyID + "'";
            // Execute SQL statement
            ResultSet rs = stmt.executeQuery(sql);
            // Read data from resultset to session
            rs.next();
            session.setAttribute("newAdTitle", rs.getString("adTitle"));
            session.setAttribute("newAdPurpose", rs.getString("adPurpose"));
            session.setAttribute("newPropertyType", rs.getString("propertyType"));
            session.setAttribute("newPropertySize", rs.getString("propertySize"));
            session.setAttribute("newPropertyPrice", rs.getString("propertyPrice"));
            session.setAttribute("newPropertyAddress", rs.getString("propertyAddress"));
            session.setAttribute("newPropertySuburb", rs.getString("propertySuburb"));
            session.setAttribute("newPropertyState", rs.getString("propertyState"));
            session.setAttribute("newPropertyPostcode", rs.getString("propertyPostcode"));
            session.setAttribute("newPropertyBedrooms", rs.getString("propertyBedrooms"));
            session.setAttribute("newPropertyBathrooms", rs.getString("propertyBathrooms"));
            session.setAttribute("newPropertyCarSpaces", rs.getString("propertyCarSpaces"));
            session.setAttribute("newPropertyDescription", rs.getString("propertyDescription"));
            // Close connections
            rs.close();
            stmt.close();
            conn.close();

            // Catch errors
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            session.setAttribute("messageModal", "true");
            session.setAttribute("message", "An error occurred trying to load property details.<br/>Please try again.");
            session.setAttribute("error", ex.getMessage());
            session.setAttribute("action", "servlet/LoadOwnerDashboard");
            session.setAttribute("buttonAction", "messageModal");
            session.setAttribute("buttonLabel", "Try again");
            response.sendRedirect("/owner-dashboard.jsp");
        }
    }

    // Check form data
    protected boolean checkForm(HttpSession session, HttpServletResponse response) throws IOException {

        boolean result = true;

        // Get form data from session
        String newAdTitle = (String) session.getAttribute("newAdTitle");
        String newAdPurpose = (String) session.getAttribute("newAdPurpose");
        String newPropertyType = (String) session.getAttribute("newPropertyType");
        String newPropertySize = (String) session.getAttribute("newPropertySize");
        String newPropertyPrice = (String) session.getAttribute("newPropertyPrice");
        String newPropertyAddress = (String) session.getAttribute("newPropertyAddress");
        String newPropertySuburb = (String) session.getAttribute("newPropertySuburb");
        String newPropertyState = (String) session.getAttribute("newPropertyState");
        String newPropertyPostcode = (String) session.getAttribute("newPropertyPostcode");
        String newPropertyBedrooms = (String) session.getAttribute("newPropertyBedrooms");
        String newPropertyBathrooms = (String) session.getAttribute("newPropertyBathrooms");
        String newPropertyCarSpaces = (String) session.getAttribute("newPropertyCarSpaces");
        String newPropertyDescription = (String) session.getAttribute("newPropertyDescription");
        // Process title
        if (newAdTitle == null || newAdTitle.trim().length() == 0 || newAdTitle.equals("")) {
            session.setAttribute("errNewAdTitle", "This field cannot be left blank");
            result = false;
        } else if (newAdTitle.trim().length() > 20) {
            session.setAttribute("errNewPassword", "This field cannot be longer than 20 characters");
            result = false;
        }
        // Process purpose
        if (newAdPurpose == null || newAdPurpose.trim().length() == 0 || newAdPurpose.equals("")) {
            session.setAttribute("errNewAdPurpose", "This field cannot be left blank");
            result = false;
        }
        // Process type
        if (newPropertyType == null || newPropertyType.trim().length() == 0 || newPropertyType.equals("")) {
            session.setAttribute("errNewPropertyType", "This field cannot be left blank");
            result = false;
        }
        // Process size
        if (newPropertySize == null || newPropertySize.trim().length() == 0 || newPropertySize.equals("")) {
            session.setAttribute("errNewPropertySize", "This field cannot be left blank");
            result = false;
        } else if (!newPropertySize.matches("\\d+")) {
            session.setAttribute("errNewPropertySize", "Please enter numbers only");
            result = false;
        }
        // Process price
        if (newPropertyPrice == null || newPropertyPrice.trim().length() == 0 || newPropertyPrice.equals("")) {
            session.setAttribute("errNewPropertyPrice", "This field cannot be left blank");
            result = false;
        } else if (!newPropertyPrice.matches("\\d+")) {
            session.setAttribute("errNewPropertyPrice", "Please enter numbers only");
            result = false;
        }
        // Process address
        if (newPropertyAddress == null || newPropertyAddress.trim().length() == 0 || newPropertyAddress.equals("")) {
            session.setAttribute("errNewPropertyAddress", "This field cannot be left blank");
            result = false;
        } else if (newPropertyAddress.trim().length() > 30) {
            session.setAttribute("errNewPropertyAddress", "This field cannot be longer than 30 characters");
            result = false;
        }
        // Process suburb
        if (newPropertySuburb == null || newPropertySuburb.trim().length() == 0 || newPropertySuburb.equals("")) {
            session.setAttribute("errNewPropertySuburb", "This field cannot be left blank");
            result = false;
        }
        // Process state
        if (newPropertyState == null || newPropertyState.trim().length() == 0 || newPropertyState.equals("")) {
            session.setAttribute("errNewPropertyState", "This field cannot be left blank");
            result = false;
        }
        // Process postcode
        if (newPropertyPostcode == null || newPropertyPostcode.trim().length() == 0 || newPropertyPostcode.equals("")) {
            session.setAttribute("errNewPropertyPostcode", "This field cannot be left blank");
        } else if (!newPropertyPostcode.matches("\\d{4}")) {
            session.setAttribute("errNewPropertyPostcode", "Please enter 4 digits only");
            result = false;
        }
        // Process bedroons
        if (newPropertyBedrooms == null || newPropertyBedrooms.trim().length() == 0 || newPropertyBedrooms.equals("")) {
            session.setAttribute("errNewPropertyBedrooms", "This field cannot be left blank");
            result = false;
        }
        // Process bathroons
        if (newPropertyBathrooms == null || newPropertyBathrooms.trim().length() == 0 || newPropertyBathrooms.equals("")) {
            session.setAttribute("errNewPropertyBathrooms", "This field cannot be left blank");
            result = false;
        }
        // Process car spaces
        if (newPropertyCarSpaces == null || newPropertyCarSpaces.trim().length() == 0 || newPropertyCarSpaces.equals("")) {
            session.setAttribute("errNewPropertyCarSpaces", "This field cannot be left blank");
            result = false;
        }
        // Process Description
        if (newPropertyDescription == null || newPropertyDescription.trim().length() == 0 || newPropertyDescription.equals("")) {
            session.setAttribute("errNewPropertyDescription", "This field cannot be left blank");
            result = false;
        } else if (newPropertyDescription.trim().length() > 500) {
            session.setAttribute("errNewPropertyDescription", "This field cannot be longer than 100 characters");
            result = false;
        }
        return result;
    }

    // Update owner record in database
    protected void updatePropertyDetails(HttpServletRequest request, HttpSession session, HttpServletResponse response)
            throws IOException, ServletException {
        try {
            // retrieve form data from session
            String propertyID = (String) session.getAttribute("propertyID");
            //String propertyID = "4";
            String newAdTitle = (String) session.getAttribute("newAdTitle");
            String newAdPurpose = (String) session.getAttribute("newAdPurpose");
            String newPropertyType = (String) session.getAttribute("newPropertyType");
            String newPropertySize = (String) session.getAttribute("newPropertySize");
            String newPropertyPrice = (String) session.getAttribute("newPropertyPrice");
            String newPropertyAddress = (String) session.getAttribute("newPropertyAddress");
            String newPropertySuburb = (String) session.getAttribute("newPropertySuburb");
            String newPropertyState = (String) session.getAttribute("newPropertyState");
            String newPropertyPostcode = (String) session.getAttribute("newPropertyPostcode");
            String newPropertyBedrooms = (String) session.getAttribute("newPropertyBedrooms");
            String newPropertyBathrooms = (String) session.getAttribute("newPropertyBathrooms");
            String newPropertyCarSpaces = (String) session.getAttribute("newPropertyCarSpaces");
            String newPropertyDescription = (String) session.getAttribute("newPropertyDescription");
            // Create JDBC instance
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            // Create a connection with database
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://ssx.caclpzhk20ad.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate",
                    "ssxrealestate", "ssxrealestate");
            // Create SQL statement to update database
            String sql = "UPDATE properties SET "
                    + "adTitle = ?, "
                    + "adPurpose = ?, "
                    + "propertyType = ?, "
                    + "propertySize = ?, "
                    + "propertyPrice = ?, "
                    + "propertyAddress = ?, "
                    + "propertySuburb = ?, "
                    + "propertyState = ?, "
                    + "propertyPostcode = ?, "
                    + "propertyBedrooms = ?, "
                    + "propertyBathrooms = ?, "
                    + "propertyCarSpaces = ?, "
                    + "propertyDescription = ? "
                    + "WHERE propertyID = ?";
            // Prepare Statement to update database
            PreparedStatement pstmt = conn.prepareStatement(sql);
            //update database
            pstmt.setString(1, newAdTitle);
            pstmt.setString(2, newAdPurpose);
            pstmt.setString(3, newPropertyType);
            pstmt.setString(4, newPropertySize);
            pstmt.setString(5, newPropertyPrice);
            pstmt.setString(6, newPropertyAddress);
            pstmt.setString(7, newPropertySuburb);
            pstmt.setString(8, newPropertyState);
            pstmt.setString(9, newPropertyPostcode);
            pstmt.setString(10, newPropertyBedrooms);
            pstmt.setString(11, newPropertyBathrooms);
            pstmt.setString(12, newPropertyCarSpaces);
            pstmt.setString(13, newPropertyDescription);
            pstmt.setString(14, propertyID);
            int status = pstmt.executeUpdate();
            // Close connections
            pstmt.close();
            conn.close();
            // If an error occur updating database, return to dashboard
            if (status == 0) {
                session.setAttribute("messageModal", "true");
                session.setAttribute("message", "An error occurred trying to update property details.<br/>Please try again.");
                session.setAttribute("error", null);
                session.setAttribute("action", "servlet/LoadOwnerDashboard");
                session.setAttribute("buttonAction", "messageModal");
                session.setAttribute("buttonLabel", "Try again");
                response.sendRedirect("/owner-dashboard.jsp");
            } else {
                session.setAttribute("messageModal", "true");
                session.setAttribute("message", "Property details have been updated sussessfuly.");
                session.setAttribute("error", null);
                session.setAttribute("action", "servlet/LoadOwnerDashboard");
                session.setAttribute("buttonAction", "messageModal");
                session.setAttribute("buttonLabel", "Ok");
                response.sendRedirect("/owner-dashboard.jsp");
            }
            // Catch any error and display message
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(EditPropertyDetails.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("messageModal", "true");
            session.setAttribute("message", "An error occurred trying to update property details.<br/>Please try again.");
            session.setAttribute("error", ex.getMessage());
            session.setAttribute("action", "servlet/LoadOwnerDashboard");
            session.setAttribute("buttonAction", "messageModal");
            session.setAttribute("buttonLabel", "Try again");
            response.sendRedirect("/owner-dashboard.jsp");
        }
    }

    // Remove user from database
    protected void deleteProperty(HttpSession session, HttpServletResponse response)
            throws IOException {
        String propertyID = (String) session.getAttribute("propertyID");
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
            String sql = "DELETE FROM properties WHERE propertyID = '" + propertyID + "'";
            // Execute SQL statment
            int status = stmt.executeUpdate(sql);
            // If an error occurs, display error message
            // Close connections
            stmt.close();
            conn.close();
            if (status == 0) {
                session.setAttribute("messageModal", "true");
                session.setAttribute("message", "An error occurred trying to delete the property ad.<br/>Please try again!");
                session.setAttribute("error", null);
                session.setAttribute("action", "servlet/LoadOwnerDashboard");
                session.setAttribute("buttonAction", "messageModal");
                session.setAttribute("buttonLabel", "Try again");
                response.sendRedirect("/owner-dashboard.jsp");
            } else {
                session.setAttribute("messageModal", "true");
                session.setAttribute("message", "The property ad has been deleted sussessfuly.");
                session.setAttribute("error", null);
                session.setAttribute("action", "servlet/LoadOwnerDashboard");
                session.setAttribute("buttonAction", "messageModal");
                session.setAttribute("buttonLabel", "Ok");
                response.sendRedirect("/owner-dashboard.jsp");
            }

            // Catch errors and display error message
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException | IOException ex) {
            Logger.getLogger(EditOwnerDetails.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("messageModal", "true");
            session.setAttribute("message", "An error occurred trying to delete the property ad.<br/>Please try again.");
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

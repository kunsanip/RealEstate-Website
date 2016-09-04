
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig

/**
 * Allows owner to create property ad
 *
 * @author Sanip
 * 
 */
public class CreatePropertyAd extends HttpServlet {

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

        // Get value from "signUCancel" button at Sign Up Form
        String createAdCancel = (String) request.getParameter("createAdCancel");
        if (createAdCancel == null) {
            createAdCancel = "";
        }
        // Get value from "signUReset" button at Sign Up Form
        String createAdReset = (String) request.getParameter("createAdReset");
        if (createAdReset == null) {
            createAdReset = "";
        }
        // Get value from "signUpSubmit" button at Sign Up Form
        String createAdSubmit = (String) request.getParameter("createAdSubmit");
        if (createAdSubmit == null) {
            createAdSubmit = "";
        }

        // If clicked on "Cancel" at Sign Up page
        if (createAdCancel.equals("Cancel")) {
            // Clear form
            clearForm(session);
            //Clear form window status
            session.setAttribute("createAdError", "");
            // Redirect to Index page
            response.sendRedirect("/owner-dashboard.jsp");

            // If clicked on "Clear Form" at Sign Up page
        } else if (createAdReset.equals("Clear form")) {
            // Clear form
            clearForm(session);
            // Set form window status
            session.setAttribute("createAdError", "true");
            // Redirect to Index page
            response.sendRedirect("/owner-dashboard.jsp");

            // If clicked on "Create Account" at login page
        } else if (createAdSubmit.equals("Submit")) {
            // If there are no errors in the form, create account in database
            if (checkForm(session, response)) {
                // Reset form window status
                session.setAttribute("createAdError", "");
                //call createAccount method
                createPropertyAd(session, request, response);
            } else {
                // If any error in the form, return to login page
                // Reset form window status
                session.setAttribute("createAdError", "true");
                response.sendRedirect("/owner-dashboard.jsp");
            }
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

    // Clear session variables
    protected void clearForm(HttpSession session) {

        session.setAttribute("newAdTitle", "");
        session.setAttribute("errNewAdTitle", "");
        session.setAttribute("newAdPurpose", "");
        session.setAttribute("errNewAdPurpose", "");
        session.setAttribute("newPropertyType", "");
        session.setAttribute("errNewPropertyType", "");
        session.setAttribute("newPropertySize", "");
        session.setAttribute("errNewPropertySize", "");
        session.setAttribute("newPropertyPrice", "");
        session.setAttribute("errNewPropertyPrice", "");
        session.setAttribute("newPropertyAddress", "");
        session.setAttribute("errNewPropertyAddress", "");
        session.setAttribute("newPropertySuburb", "");
        session.setAttribute("errNewPropertySuburb", "");
        session.setAttribute("newPropertyState", "");
        session.setAttribute("errNewPropertyState", "");
        session.setAttribute("newPropertyPostcode", "");
        session.setAttribute("errNewPropertyPostcode", "");
        session.setAttribute("newPropertyBedrooms", "");
        session.setAttribute("errNewPropertyBedrooms", "");
        session.setAttribute("newPropertyBathrooms", "");
        session.setAttribute("errNewPropertyBathrooms", "");
        session.setAttribute("newPropertyCarSpaces", "");
        session.setAttribute("errNewPropertyCarSpaces", "");
        session.setAttribute("newPropertyDescription", "");
        session.setAttribute("errNewPropertyDescription", "");
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

    // Create property
    protected void createPropertyAd(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            // retrieve form data from session
            String ownerID = (String) session.getAttribute("ownerID");
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
            Part newPropertyPicturePart = request.getPart("newPropertyPicture");
            InputStream newPropertyPictureStream = newPropertyPicturePart.getInputStream();
            // Create JDBC instance
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            // Create a connection with database
            Connection conn = DriverManager.getConnection(
                   "jdbc:mysql://saniprealestate-ap-southeast-2a.c3mrp52txpvn.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate","saniprealestate", "saniprealestate");
            // Create SQL statement to update database
            String sql = "INSERT INTO properties "
                    + "(ownerID, "
                    + "adTitle, "
                    + "adPurpose, "
                    + "propertyType, "
                    + "propertySize, "
                    + "propertyPrice, "
                    + "propertyAddress, "
                    + "propertySuburb, "
                    + "propertyState, "
                    + "propertyPostcode, "
                    + "propertyBedrooms, "
                    + "propertyBathrooms, "
                    + "propertyCarSpaces, "
                    + "propertyDescription, "
                    + "propertyPicture) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            // Prepare Statement to update database
            PreparedStatement pstmt = conn.prepareStatement(sql);
            //update database
            pstmt.setString(1, ownerID);
            pstmt.setString(2, newAdTitle);
            pstmt.setString(3, newAdPurpose);
            pstmt.setString(4, newPropertyType);
            pstmt.setString(5, newPropertySize);
            pstmt.setString(6, newPropertyPrice);
            pstmt.setString(7, newPropertyAddress);
            pstmt.setString(8, newPropertySuburb);
            pstmt.setString(9, newPropertyState);
            pstmt.setString(10, newPropertyPostcode);
            pstmt.setString(11, newPropertyBedrooms);
            pstmt.setString(12, newPropertyBathrooms);
            pstmt.setString(13, newPropertyCarSpaces);
            pstmt.setString(14, newPropertyDescription);
            pstmt.setBlob(15, newPropertyPictureStream);
            int status = pstmt.executeUpdate();
            // Close connections
            pstmt.close();
            conn.close();
            // If an error occur updating database, return to login page
            if (status == 0) {
                session.setAttribute("messageModal", "true");
                session.setAttribute("message", "An error occurred trying to create the ad.<br/>Please try again.");
                session.setAttribute("error", null);
                session.setAttribute("action", "servlet/LoadOwnerDashboard");
                session.setAttribute("buttonAction", "messageModal");
                session.setAttribute("buttonLabel", "Try again");
                response.sendRedirect("/owner-dashboard.jsp");
            } else {
                // If successful, send to successful message page
                session.setAttribute("messageModal", "true");
                session.setAttribute("message", "Property ad created successfully.");
                session.setAttribute("error", null);
                session.setAttribute("action", "servlet/LoadOwnerDashboard");
                session.setAttribute("buttonAction", "messageModal");
                session.setAttribute("buttonLabel", "Ok");
                response.sendRedirect("/owner-dashboard.jsp");
            }

        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("messageModal", "true");
            session.setAttribute("message", "An error occurred trying to create the ad.<br/>Please try again.");
            session.setAttribute("error", ex.getMessage());
            session.setAttribute("action", "servlet/LoadOwnerDashboard");
            session.setAttribute("buttonAction", "messageModal");
            session.setAttribute("buttonLabel", "Try again");
            response.sendRedirect("/owner-dashboard.jsp");
        } catch (ServletException ex) {
            Logger.getLogger(CreatePropertyAd.class.getName()).log(Level.SEVERE, null, ex);
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


import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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

public class SignUp extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {
        // Create a session
        HttpSession session = request.getSession(true);
        // set session variables with data from request
        storeVariables(session, request);

        // Get value from "signUCancel" button at Sign Up Form
        String signUpCancel = (String) request.getParameter("signUpCancel");
        if (signUpCancel == null) {
            signUpCancel = "";
        }
        // Get value from "signUReset" button at Sign Up Form
        String signUpReset = (String) request.getParameter("signUpReset");
        if (signUpReset == null) {
            signUpReset = "";
        }
        // Get value from "signUpSubmit" button at Sign Up Form
        String signUpSubmit = (String) request.getParameter("signUpSubmit");
        if (signUpSubmit == null) {
            signUpSubmit = "";
        }

        // If clicked on "Cancel" at Sign Up page
        if (signUpCancel.equals("Cancel")) {
            // Clear form
            clearForm(session);
            //Clear form window status
            session.setAttribute("signUpError", "");
            // Redirect to Index page
            response.sendRedirect("/index.jsp");

        // If clicked on "Clear Form" at Sign Up page
        } else if (signUpReset.equals("Clear form")) {
            // Clear form
            clearForm(session);
            // Set form window status
            session.setAttribute("signUpError", "true");
            // Redirect to Index page
            response.sendRedirect("/index.jsp");

            // If clicked on "Create Account" at login page
        } else if (signUpSubmit.equals("Submit")) {
            // If there are no errors in the form, create account in database
            if (checkForm(session, response)) {
                // Reset form window status
                session.setAttribute("signUpError", "");
                //call createAccount method
                createAccount(session, request, response);
            } else {
                // If any error in the form, return to login page
                // Reset form window status
                session.setAttribute("signUpError", "true");
                response.sendRedirect("/index.jsp");
            }
        }
    }

    // Set session variables
    protected void storeVariables(HttpSession session, HttpServletRequest request) {

        session.setAttribute("ownerID", request.getParameter("ownerID"));
        session.setAttribute("errOwnerID", "");
        session.setAttribute("password", request.getParameter("password"));
        session.setAttribute("errPassword", "");
        session.setAttribute("newOwnerID", request.getParameter("newOwnerID"));
        session.setAttribute("errNewOwnerID", "");
        session.setAttribute("newPassword", request.getParameter("newPassword"));
        session.setAttribute("errNewPassword", "");
        session.setAttribute("cfmNewPassword", request.getParameter("cfmNewPassword"));
        session.setAttribute("errCfmNewPassword", "");
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

    // Clear session variables
    protected void clearForm(HttpSession session) {

        session.setAttribute("ownerID", "");
        session.setAttribute("errOwnerID", "");
        session.setAttribute("password", "");
        session.setAttribute("errPassword", "");
        session.setAttribute("newOwnerID", "");
        session.setAttribute("errNewOwnerID", "");
        session.setAttribute("newPassword", "");
        session.setAttribute("errNewPassword", "");
        session.setAttribute("cfmNewPassword", "");
        session.setAttribute("errCfmNewPassword", "");
        session.setAttribute("newFirstName", "");
        session.setAttribute("errNewFirstName", "");
        session.setAttribute("newLastName", "");
        session.setAttribute("errNewLastName", "");
        session.setAttribute("newEmail", "");
        session.setAttribute("errNewEmail", "");
        session.setAttribute("newPhone", "");
        session.setAttribute("errNewPhone", "");
        session.setAttribute("newAddress", "");
        session.setAttribute("errNewAddress", "");
        session.setAttribute("newSuburb", "");
        session.setAttribute("errNewSuburb", "");
        session.setAttribute("newState", "");
        session.setAttribute("errNewState", "");
        session.setAttribute("newPostcode", "");
        session.setAttribute("errNewPostcode", "");
    }

    // Check owner's details
    protected boolean checkForm(HttpSession session, HttpServletResponse response) throws IOException {

        boolean result = true;

        try {
            // Get form data from session
            String newOwnerID = (String) session.getAttribute("newOwnerID");
            String newPassword = (String) session.getAttribute("newPassword");
            String cfmNewPassword = (String) session.getAttribute("cfmNewPassword");
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
            Connection conn = DriverManager.getConnection("jdbc:mysql://saniprealestate-ap-southeast-2a.c3mrp52txpvn.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate","saniprealestate", "saniprealestate");

            // Create SQL statement to update database
            Statement stmt = conn.createStatement();
            // Create SQL string
            String sql = "SELECT ownerID FROM owners";
            // Retrieve records from database
            ResultSet rs = stmt.executeQuery(sql);
            // Process name
            while (rs.next()) {
                if (newOwnerID.equals(rs.getString("ownerID"))) {
                    session.setAttribute("errNewOwnerID", "Username already taken");
                    result = false;
                }
            }
            if (newOwnerID == null || newOwnerID.trim().length() == 0 || newOwnerID.equals("")) {
                session.setAttribute("errNewOwnerID", "This field cannot be left blank");
                result = false;
            }
            // Process password
            if (newPassword == null || newPassword.trim().length() == 0 || newPassword.equals("")) {
                session.setAttribute("errNewPassword", "This field cannot be left blank");
                result = false;
            } else if (newPassword == null || newPassword.trim().length() < 6 || newPassword.trim().length() > 10) {
                session.setAttribute("errNewPassword", "The password must be 6 to 10 characters long");
                result = false;
            }
            // Process confirm password
            if (cfmNewPassword == null || cfmNewPassword.trim().length() == 0 || cfmNewPassword.equals("")) {
                session.setAttribute("errCfmNewPassword", "This field cannot be left blank");
                result = false;
            } else if (!cfmNewPassword.equals(newPassword)) {
                session.setAttribute("errCfmNewPassword", "This password must be the same as above");
                result = false;
            }
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
            // Process suburb
            if (newSuburb == null || newSuburb.trim().length() == 0 || newSuburb.equals("")) {
                session.setAttribute("errNewSuburb", "This field cannot be left blank");
                result = false;
            }
            // Process state
            if (newState == null || newState.trim().length() == 0 || newState.equals("")) {
                session.setAttribute("errNewState", "This field cannot be left blank");
                result = false;
            }
            // Process postcode
            if (newPostcode == null || newPostcode.trim().length() == 0 || newPostcode.equals("")) {
                session.setAttribute("errNewPostcode", "This field cannot be left blank");
                result = false;
            } else if (!newPostcode.matches("\\d+")) {
                session.setAttribute("errNewPostcode", "Please enter numbers only");
                result = false;
            }
            // Return false if any errors
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("messageModal", "true");
            session.setAttribute("message", "An error occurred trying to create your account.<br/>Please try again.");
            session.setAttribute("error", ex.getMessage());
            session.setAttribute("action", "servlet/LoadHomePage");
            session.setAttribute("buttonAction", "messageModal");
            session.setAttribute("buttonLabel", "Try again");
            response.sendRedirect("/index.jsp");
        }
        return result;
    }

    // Create Account in database
    protected void createAccount(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            // retrieve form data from session
            String newOwnerID = (String) session.getAttribute("newOwnerID");
            String newPassword = (String) session.getAttribute("newPassword");
            String newFirstName = (String) session.getAttribute("newFirstName");
            String newLastName = (String) session.getAttribute("newLastName");
            String newEmail = (String) session.getAttribute("newEmail");
            String newPhone = (String) session.getAttribute("newPhone");
            String newAddress = (String) session.getAttribute("newAddress");
            String newSuburb = (String) session.getAttribute("newSuburb");
            String newState = (String) session.getAttribute("newState");
            String newPostcode = (String) session.getAttribute("newPostcode");
            Part newPicturePart = request.getPart("newPicture");
            InputStream newPictureStream = newPicturePart.getInputStream();
            // Create JDBC instance
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            // Create a connection with database
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://ssx.caclpzhk20ad.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate", "ssxrealestate", "ssxrealestate");
            // Create SQL statement to update database
            String sql = "INSERT INTO owners "
                    + "(ownerID, "
                    + "password, "
                    + "firstName, "
                    + "lastName, "
                    + "email, "
                    + "phone, "
                    + "address, "
                    + "suburb, "
                    + "state, "
                    + "postcode, "
                    + "picture) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            // Prepare Statement to update database
            PreparedStatement pstmt = conn.prepareStatement(sql);
            //update database
            pstmt.setString(1, newOwnerID);
            pstmt.setString(2, newPassword);
            pstmt.setString(3, newFirstName);
            pstmt.setString(4, newLastName);
            pstmt.setString(5, newEmail);
            pstmt.setString(6, newPhone);
            pstmt.setString(7, newAddress);
            pstmt.setString(8, newSuburb);
            pstmt.setString(9, newState);
            pstmt.setString(10, newPostcode);
            pstmt.setBlob(11, newPictureStream);
            int status = pstmt.executeUpdate();
            // Close connections
            pstmt.close();
            conn.close();
            // If an error occur updating database, return to login page
            if (status == 0) {
                session.setAttribute("messageModal", "true");
                session.setAttribute("message", "An error occurred trying to create your account.<br/>Please try again.");
                session.setAttribute("error", null);
                session.setAttribute("action", "index.jsp");
                session.setAttribute("buttonAction", "messageModal");
                session.setAttribute("buttonLabel", "Try again");
                response.sendRedirect("/home.jsp");
            } else { 
                // If successful, send to successful message page
                session.setAttribute("ownerID", newOwnerID);
                session.setAttribute("messageModal", "true");
                session.setAttribute("error", null);
                session.setAttribute("message", "Account created successfully.");
                session.setAttribute("action", "servlet/LoadOwnerDashboard");
                session.setAttribute("buttonAction", "messageModal");
                session.setAttribute("buttonLabel", "Go to Dashboard");
                response.sendRedirect("/home.jsp");
            }

        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("messageModal", "true");
            session.setAttribute("message", "An error occurred trying to create your account.<br/>Please try again.");
            session.setAttribute("error", ex.getMessage());
            session.setAttribute("action", "index.jsp");
            session.setAttribute("buttonAction", "messageModal");
            session.setAttribute("buttonLabel", "Try again");
            response.sendRedirect("/home.jsp");
        } catch (ServletException ex) {
            Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

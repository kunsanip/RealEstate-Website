import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
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
 *
 * @author Sanip
 */
public class SignIn extends HttpServlet {

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

        // Get value from "signInReset" button at Sign Up Form
        String signInCancel = (String) request.getParameter("signInCancel");
        if (signInCancel == null) {
            signInCancel = "";
        }
        // Get value from "signUpSubmit" button at Sign Up Form
        String signInSubmit = (String) request.getParameter("signInSubmit");
        if (signInSubmit == null) {
            signInSubmit = "";
        }

        // If clicked on "Clear Form" at Sign Up page
        if (signInCancel.equals("Cancel")) {
            // Clear form
            clearForm(session);
            // Reset window status
            session.setAttribute("signInError", "");
            // Redirect to Index page
            response.sendRedirect("/index.jsp");

            // If clicked on "Create Account" at login page
        } else if (signInSubmit.equals("Submit")) {
            // If there are no errors in the form, create account in database
            if (checkSignIn(session, response)) {
                // Reset window status
                session.setAttribute("signInError", "");
                session.setAttribute("signIn", "true");
                //forward to LoadOwnerDashboard servet
                RequestDispatcher rd = request.getRequestDispatcher("LoadOwnerDashboard");
                rd.forward(request, response);
            } else {
                // Set window status
                session.setAttribute("signInError", "true");
                // Return to form window
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
    }

    // Clear session variables
    protected boolean clearForm(HttpSession session) {

        session.setAttribute("ownerID", "");
        session.setAttribute("errOwnerID", "");
        session.setAttribute("password", "");
        session.setAttribute("errPassword", "");
        return false;
    }

    // Check user name and password
    protected boolean checkSignIn(HttpSession session, HttpServletResponse response)
            throws IOException {
        boolean result = true;
        boolean rsOwnerID = false;
        boolean rsPassword = false;
        // Get form data from session
        String ownerID = (String) session.getAttribute("ownerID");
        String password = (String) session.getAttribute("password");
        try {
            // Create JDBC instance
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            // Create a connection with database
            Connection conn = DriverManager.getConnection(
                                      "jdbc:mysql://saniprealestate-ap-southeast-2a.c3mrp52txpvn.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate","saniprealestate", "saniprealestate");

            // Create SQL statement to update database
            Statement stmt = conn.createStatement();
            // Create SQL string
            String sql = "SELECT ownerID, password FROM owners";
            // Retrieve records from database
            ResultSet rs = stmt.executeQuery(sql);
            // Process userName and password
            while (rs.next()) {
                if (ownerID.equals(rs.getString("ownerID"))) {
                    rsOwnerID = true;
                    if (password.equals(rs.getString("password"))) {
                        rsPassword = true;
                    } else {
                        session.setAttribute("errPassword", "Invalid password");
                        result = false;
                    }
                    break;
                }
            }
            if (!rsOwnerID) {
                session.setAttribute("errOwnerID", "Invalid user name");
                result = false;
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(SignIn.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("messageModal", "true");
            session.setAttribute("message", "An error occurred trying to sign you in!<br/>Please try again.");
            session.setAttribute("error", ex.getMessage());
            session.setAttribute("action", "servlet/LoadHomePage");
            session.setAttribute("buttonAction", "messageModal");
            session.setAttribute("buttonLabel", "Try again");
            response.sendRedirect("/index.jsp");
        }
        return result;
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

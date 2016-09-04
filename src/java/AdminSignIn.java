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
public class AdminSignIn extends HttpServlet {

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

        // Get value from "adminSignReset" button at Sign Up Form
        String adminSignInCancel = (String) request.getParameter("adminSignInCancel");
        if (adminSignInCancel == null) {
            adminSignInCancel = "";
        }
        // Get value from "signUpSubmit" button at Sign Up Form
        String adminSignInSubmit = (String) request.getParameter("adminSignInSubmit");
        if (adminSignInSubmit == null) {
            adminSignInSubmit = "";
        }

        // If clicked on "Clear Form" at Sign Up page
        if (adminSignInCancel.equals("Cancel")) {
            // Clear form
            clearForm(session);
            // Reset window status
            session.setAttribute("adminSignInError", "");
            // Redirect to Index page
            response.sendRedirect("/index.jsp");

            // If clicked on "Create Account" at login page
        } else if (adminSignInSubmit.equals("Submit")) {
            // If there are no errors in the form, create account in database
            if (checkSignIn(session, response)) {
                // Reset window status
                session.setAttribute("adminSignInError", "");
                session.setAttribute("adminID", "");
                //forward to LoadAdminDashboard servet
                
                RequestDispatcher rd = request.getRequestDispatcher("LoadAdminDashboard");
                rd.forward(request, response);
                //response.sendRedirect("/servlet/LoadAdminDashboard");

            } else {
                // Set window status
                session.setAttribute("adminSignInError", "true");
                // Return to form window
                response.sendRedirect("/index.jsp");
            }
        }
    }

    // Set session variables
    protected void storeVariables(HttpSession session, HttpServletRequest request) {

        session.setAttribute("adminID", request.getParameter("adminID"));
        session.setAttribute("errAdminID", "");
        session.setAttribute("adminPassword", request.getParameter("adminPassword"));
        session.setAttribute("errAdminPassword", "");
    }

    // Clear session variables
    protected boolean clearForm(HttpSession session) {

        session.setAttribute("adminID", "");
        session.setAttribute("errAdminID", "");
        session.setAttribute("adminPassword", "");
        session.setAttribute("errAdminPassword", "");
        return false;
    }

    // Check user name and adminPassword
    protected boolean checkSignIn(HttpSession session, HttpServletResponse response)
            throws IOException {
        boolean result = true;
        boolean rsAdminID = false;
        boolean rsPassword = false;
        // Get form data from session
        String adminID = (String) session.getAttribute("adminID");
        String adminPassword = (String) session.getAttribute("adminPassword");
        try {
            // Create JDBC instance
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            // Create a connection with database
            Connection conn = DriverManager.getConnection(
                   "jdbc:mysql://saniprealestate-ap-southeast-2a.c3mrp52txpvn.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate","saniprealestate", "saniprealestate");
            // Create SQL statement to update database
            Statement stmt = conn.createStatement();
            // Create SQL string
            String sql = "SELECT adminID, adminPassword FROM admins";
            // Retrieve records from database
            ResultSet rs = stmt.executeQuery(sql);
            // Process userName and adminPassword
            while (rs.next()) {
                if (adminID.equals(rs.getString("adminID"))) {
                    rsAdminID = true;
                    if (adminPassword.equals(rs.getString("adminPassword"))) {
                        rsPassword = true;
                    } else {
                        session.setAttribute("errAdminPassword", "Invalid password");
                        result = false;
                    }
                    break;
                }
            }
            if (!rsAdminID) {
                session.setAttribute("errAdminID", "Invalid user name");
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

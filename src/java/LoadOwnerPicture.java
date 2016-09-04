
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sanip
 */
public class LoadOwnerPicture extends HttpServlet {

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
        String ownerID = (String) request.getParameter("ownerID");

        try {
            // Create JDBC instance
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            // Create a connection with database
            Connection conn = DriverManager.getConnection(
                                       "jdbc:mysql://saniprealestate-ap-southeast-2a.c3mrp52txpvn.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate","saniprealestate", "saniprealestate");

            // Create a SQL Statement
            Statement stmt = conn.createStatement();

            // Create a SQL Statement String
            String sql = "SELECT picture FROM owners WHERE ownerID = '"+ ownerID +"'";
            // Execute SQL statement
            ResultSet rs = stmt.executeQuery(sql);
            // Read data from resultset to session
            if (rs.next()) {
            byte[] picture = rs.getBytes("picture");
            response.setContentType("image/jpg");
            response.setContentLength(picture.length);
            response.getOutputStream().write(picture);
            } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404.
            }
                          
            session.setAttribute("messageModal", "");

            // Close connections
            rs.close();
            stmt.close();
            conn.close();

            // Catch errors and display message
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            session.setAttribute("messageModal", "true");
            session.setAttribute("message", "An error occurred trying to load picture!<br/>Please try again.");
            session.setAttribute("error", ex.getMessage());
            session.setAttribute("action", "servlet/LoadOwnerDashboard");
            session.setAttribute("buttonAction", "messageModal");
            session.setAttribute("buttonLabel", "Try again");
            response.sendRedirect("/index.jsp");
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

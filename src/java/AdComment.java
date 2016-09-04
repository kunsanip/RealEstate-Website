
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

/**
 *
 * @author Sanip
 */
public class AdComment extends HttpServlet {

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
                
        try {
            String propertyID = (String) request.getParameter("propertyID");
            String customerName = (String) request.getParameter("customerName");
            String customerEmail = (String) request.getParameter("customerEmail");
            String comment = (String) request.getParameter("comment");

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://saniprealestate-ap-southeast-2a.c3mrp52txpvn.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate",
                    "saniprealestate", "saniprealestate");
            String sql = "INSERT INTO comments "
                    + "(propertyID, "
                    + "customerName, "
                    + "customerEmail, "
                    + "comment) "
                    + "VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, propertyID);
            pstmt.setString(2, customerName);
            pstmt.setString(3, customerEmail);
            pstmt.setString(4, comment);
            pstmt.executeUpdate();

            session.setAttribute("propertyID", propertyID);
            session.setAttribute("messageModal", "");

            request.getRequestDispatcher("/servlet/LoadPropertyDetails").forward(request, response);

            pstmt.close();
            conn.close();

        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            session.setAttribute("messageModal", "true");
            session.setAttribute("message", "An error occurred trying to record your comment!<br/>Please try again.");
            session.setAttribute("error", ex.getMessage());
            session.setAttribute("action", "property-details.jsp");
            session.setAttribute("buttonAction", "messageModal");
            session.setAttribute("buttonLabel", "Try again");
            response.sendRedirect("/property.jsp");
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

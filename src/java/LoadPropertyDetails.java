
import beans.Comment;
import beans.Owner;
import beans.Property;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sanip
 */
public class LoadPropertyDetails extends HttpServlet {

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
        session.setMaxInactiveInterval(0);
        String propertyID = (String) request.getParameter("propertyID");
        ArrayList<Comment> commentsList = new ArrayList<>();
        

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(
                                      "jdbc:mysql://saniprealestate-ap-southeast-2a.c3mrp52txpvn.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate","saniprealestate", "saniprealestate");

            Statement stmt = conn.createStatement();

            String sql = "SELECT *, DATE(dateCreated) as created FROM properties"
                + " WHERE propertyID = '" + propertyID + "'";
            ResultSet rs = stmt.executeQuery(sql);
            rs.next();
            Property propertyBean = new Property();
            propertyBean.setPropertyID(rs.getString("propertyID"));
            propertyBean.setOwnerID(rs.getString("ownerID"));
            propertyBean.setAdTitle(rs.getString("adTitle"));
            propertyBean.setAdPurpose(rs.getString("adPurpose"));
            propertyBean.setPropertyType(rs.getString("propertyType"));
            propertyBean.setPropertySize(rs.getString("propertySize"));
            propertyBean.setPropertyPrice(rs.getString("propertyPrice"));
            propertyBean.setPropertyAddress(rs.getString("propertyAddress"));
            propertyBean.setPropertySuburb(rs.getString("propertySuburb"));
            propertyBean.setPropertyState(rs.getString("propertyState"));
            propertyBean.setPropertyPostcode(rs.getString("propertyPostcode"));
            propertyBean.setPropertyBedrooms(rs.getString("propertyBedrooms"));
            propertyBean.setPropertyBathrooms(rs.getString("propertyBathrooms"));
            propertyBean.setPropertyCarSpaces(rs.getString("propertyCarSpaces"));
            propertyBean.setPropertyDescription(rs.getString("propertyDescription"));
            propertyBean.setAdType(rs.getString("adType"));
            propertyBean.setDateCreated(rs.getString("created"));

            sql = "SELECT *, DATE(memberSince) AS since FROM owners WHERE ownerID = '" + propertyBean.getOwnerID() + "'";
            rs = stmt.executeQuery(sql);
            rs.next();
            Owner ownerBean = new Owner();
            ownerBean.setOwnerID(rs.getString("ownerID"));
            ownerBean.setFirstName(rs.getString("firstName"));
            ownerBean.setLastName(rs.getString("lastName"));
            ownerBean.setMemberSince(rs.getString("since"));
            
            sql = "SELECT *, DATE(commentDate) AS date FROM comments WHERE propertyID = '" + propertyID + "'";
            rs = stmt.executeQuery(sql);
            while(rs.next()) {
                Comment commentBean = new Comment();
                commentBean.setCustomerName(rs.getString("customerName"));
                commentBean.setComment(rs.getString("comment"));
                commentBean.setCommentDate(rs.getString("date"));
                commentsList.add(commentBean);
            }
            
            sql = "SELECT COUNT(*) AS totalProperties FROM properties WHERE ownerID = '" + propertyBean.getOwnerID() + "'";
            rs = stmt.executeQuery(sql);
            rs.next();
            ownerBean.setTotalProperties(rs.getString("totalProperties"));

            session.setAttribute("propertyID", propertyID);
            session.setAttribute("ownerBean", ownerBean);
            session.setAttribute("propertyBean", propertyBean);
            session.setAttribute("commentsList", commentsList);
            session.setAttribute("error", null);
            session.setAttribute("messageModal", "");

            response.sendRedirect("/property.jsp");
            //request.getRequestDispatcher("/home.jsp").forward(request, response);

            rs.close();
            stmt.close();
            conn.close();

        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            session.setAttribute("messageModal", "true");
            session.setAttribute("message", "An error occurred trying to load property details page!<br/>Please try again.");
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

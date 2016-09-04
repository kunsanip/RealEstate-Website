
import beans.Inspection;
import beans.Owner;
import beans.OwnerMessage;
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
 * Populates Owner's Dashboard according to current ownerID
 *
 * @author Sanip
 */
public class LoadOwnerDashboard extends HttpServlet {

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
        String ownerID = (String) session.getAttribute("ownerID");
        Owner owner = new Owner();
        ArrayList<Property> propertiesList = new ArrayList<>();
        ArrayList<OwnerMessage> ownerMessagesList = new ArrayList<>();
        ArrayList<Inspection> inspectionsList = new ArrayList<>();

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(
                                    "jdbc:mysql://saniprealestate-ap-southeast-2a.c3mrp52txpvn.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate","saniprealestate", "saniprealestate");

            Statement stmt = conn.createStatement();

            String sql = "SELECT * FROM owners WHERE ownerID = '" + ownerID + "'";
            ResultSet rs = stmt.executeQuery(sql);
            rs.next();
            owner.setOwnerID(rs.getString("ownerID"));
            owner.setPassword(rs.getString("password"));
            owner.setFirstName(rs.getString("firstName"));
            owner.setLastName(rs.getString("lastName"));
            owner.setEmail(rs.getString("email"));
            owner.setPhone(rs.getString("phone"));
            owner.setAddress(rs.getString("address"));
            owner.setSuburb(rs.getString("suburb"));
            owner.setState(rs.getString("state"));
            owner.setPostcode(rs.getString("postcode"));

            sql = "SELECT propertyID, "
                    + "propertyAddress, "
                    + "adPurpose, "
                    + "adType, "
                    + "DATE(dateCreated) as expireDate "
                    + "FROM properties "
                    + "WHERE ownerID = '" + ownerID + "' "
                    + "ORDER BY expireDate";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Property propertyBean = new Property();
                propertyBean.setPropertyID(rs.getString("propertyID"));
                propertyBean.setPropertyAddress(rs.getString("propertyAddress"));
                propertyBean.setAdPurpose(rs.getString("adPurpose"));
                propertyBean.setAdType(rs.getString("adType"));
                propertyBean.setExpireDate(rs.getString("expireDate"));
                propertiesList.add(propertyBean);
            }
            
            sql = "SELECT * FROM ownerMessages "
                    + "WHERE ownerID = '" + ownerID + "' "
                    + "ORDER BY messageDate DESC";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                OwnerMessage ownerMessageBean = new OwnerMessage();
                ownerMessageBean.setOwnerMessageID(rs.getString("ownerMessageID"));
                ownerMessageBean.setSenderName(rs.getString("senderName"));
                ownerMessageBean.setSenderEmail(rs.getString("senderEmail"));
                ownerMessageBean.setMessageDate(rs.getString("messageDate"));
                ownerMessageBean.setMessage(rs.getString("message"));
                ownerMessagesList.add(ownerMessageBean);
            }
            
            sql = "SELECT * FROM inspections "
                    + "WHERE ownerID = '" + ownerID + "' "
                    + "ORDER BY inspectionDate";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Inspection inspectionBean = new Inspection();
                inspectionBean.setInspectionID(rs.getString("InspectionID"));
                inspectionBean.setPropertyID(rs.getString("propertyID"));
                inspectionBean.setCustomerName(rs.getString("customerName"));
                inspectionBean.setCustomerEmail(rs.getString("customerEmail"));
                inspectionBean.setInspectionDate(rs.getString("inspectionDate"));
                inspectionBean.setInspectionTime(rs.getString("inspectionTime"));
                inspectionsList.add(inspectionBean);
            }
            
            // Set ownerID and owner beans to session
            session.setAttribute("ownerID", ownerID);
            session.setAttribute("owner", owner);
            session.setAttribute("propertiesList", propertiesList);
            session.setAttribute("ownerMessagesList", ownerMessagesList);
            session.setAttribute("inspectionsList", inspectionsList);

            // Clean password data from session
            session.setAttribute("password", "");
            session.setAttribute("newPassword", "");
            session.setAttribute("cfmNewPassword", "");
            session.setAttribute("messageModal", "");

            // Redirect to owner dashboard
            response.sendRedirect("/owner-dashboard.jsp");

            // Close connections
            rs.close();
            stmt.close();
            conn.close();

            // Catch errors and display message
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            session.setAttribute("messageModal", "true");
            session.setAttribute("message", "An error occurred trying to load dashboard!<br/>Please try again.");
            session.setAttribute("error", ex.getMessage());
            session.setAttribute("action", "index.jsp");
            session.setAttribute("buttonAction", "messageModal");
            session.setAttribute("buttonLabel", "Try again");
            response.sendRedirect("/home.jsp");
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

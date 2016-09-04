
import beans.AdminMessage;
import beans.DeletedOwner;
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
 * Populates Owner's Dashboard according to current ownerID
 *
 * @author Sanip
 */
public class LoadAdminDashboard extends HttpServlet {

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
        ArrayList<Property> propertiesList = new ArrayList<>();
        ArrayList<Owner> ownersList = new ArrayList<>();
        ArrayList<AdminMessage> adminMessagesList = new ArrayList<>();
        ArrayList<DeletedOwner> deletedOwnersList = new ArrayList<>();
        String totalOwners, totalProperties, totalMessages;

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(
                                      "jdbc:mysql://saniprealestate-ap-southeast-2a.c3mrp52txpvn.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate","saniprealestate", "saniprealestate");

            Statement stmt = conn.createStatement();

            String sql = "SELECT "
                    + "owners.ownerID, "
                    + "owners.firstName, "
                    + "owners.lastName, "
                    + "owners.email, "
                    + "owners.phone, "
                    + "owners.address, "
                    + "owners.suburb, "
                    + "owners.state, "
                    + "owners.postcode, "
                    + "DATE_FORMAT(DATE(owners.memberSince),'%m/%d/%Y') AS since, "
                    + "COUNT(properties.propertyID) AS totalProperties  "
                    + "FROM owners LEFT JOIN properties "
                    + "ON properties.ownerID = owners.ownerID "
                    + "GROUP BY ownerID";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Owner ownerBean = new Owner();
                ownerBean.setOwnerID(rs.getString("ownerID"));
                ownerBean.setFirstName(rs.getString("firstName"));
                ownerBean.setLastName(rs.getString("lastName"));
                ownerBean.setEmail(rs.getString("email"));
                ownerBean.setPhone(rs.getString("phone"));
                ownerBean.setAddress(rs.getString("address"));
                ownerBean.setSuburb(rs.getString("suburb"));
                ownerBean.setState(rs.getString("state"));
                ownerBean.setPostcode(rs.getString("postcode"));
                ownerBean.setMemberSince(rs.getString("since"));
                ownerBean.setTotalProperties(rs.getString("totalProperties"));
                ownersList.add(ownerBean);
            }

            sql = "SELECT ownerID, reason, "
                + "DATE_FORMAT(DATE(deletionDate),'%m/%d/%Y') AS deletion "
                + "FROM deletedOwnersList";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                DeletedOwner deletedOwnerBean = new DeletedOwner();
                deletedOwnerBean.setOwnerID(rs.getString("ownerID"));
                deletedOwnerBean.setReason(rs.getString("reason"));
                deletedOwnerBean.setDeletionDate(rs.getString("deletion"));
                deletedOwnersList.add(deletedOwnerBean);
            }

            sql = "SELECT *, "
                + "FORMAT(propertyPrice,2) as price, "
                + "DATE_FORMAT(DATE(dateCreated),'%m/%d/%Y') as created, "
                + "DATE_FORMAT(DATE(dateCreated),'%m/%d/%Y') as expire "
                + "FROM properties ";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Property propertyBean = new Property();
                propertyBean.setPropertyID(rs.getString("propertyID"));
                propertyBean.setOwnerID(rs.getString("ownerID"));
                propertyBean.setAdTitle(rs.getString("adTitle"));
                propertyBean.setAdPurpose(rs.getString("adPurpose"));
                propertyBean.setPropertyType(rs.getString("propertyType"));
                propertyBean.setPropertySize(rs.getString("propertySize"));
                if((propertyBean.getAdPurpose()).equals("For rent")){
                    propertyBean.setPropertyPrice(rs.getString("price") + " p/w");
                } else {
                    propertyBean.setPropertyPrice(rs.getString("price"));
                }
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
                propertyBean.setExpireDate(rs.getString("expire"));
                propertiesList.add(propertyBean);
            }
            
            sql = "SELECT * FROM adminMessages ORDER BY messageDate DESC";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                AdminMessage adminMessageBean = new AdminMessage();
                adminMessageBean.setAdminMessageID(rs.getString("adminMessageID"));
                adminMessageBean.setSenderName(rs.getString("senderName"));
                adminMessageBean.setSenderEmail(rs.getString("senderEmail"));
                adminMessageBean.setMessageDate(rs.getString("messageDate"));
                adminMessageBean.setMessage(rs.getString("message"));
                adminMessagesList.add(adminMessageBean);
            }
            
            sql = "SELECT COUNT(ownerID) AS totalOwners FROM owners";
            rs = stmt.executeQuery(sql);
            rs.next();
            totalOwners = rs.getString("totalOwners");
            
            sql = "SELECT COUNT(propertyID) AS totalProperties FROM properties";
            rs = stmt.executeQuery(sql);
            rs.next();
            totalProperties = rs.getString("totalProperties");
            
            sql = "SELECT COUNT(adminMessageID) AS totalMessages FROM adminMessages";
            rs = stmt.executeQuery(sql);
            rs.next();
            totalMessages = rs.getString("totalMessages");
            
            session.setAttribute("propertiesList", propertiesList);
            session.setAttribute("ownersList", ownersList);
            session.setAttribute("deletedOwnersList", deletedOwnersList);
            session.setAttribute("adminMessagesList", adminMessagesList);
            session.setAttribute("totalOwners", totalOwners);
            session.setAttribute("totalProperties", totalProperties);
            session.setAttribute("totalMessages", totalMessages);
            session.setAttribute("messageModal", "");

            response.sendRedirect("/admin-dashboard.jsp");

            rs.close();
            stmt.close();
            conn.close();

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


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
public class SearchProperties extends HttpServlet {

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

        // Get value from "search" button
        String search = (String) request.getParameter("search");
        if (search == null) {
            search = "";
        }
        // Get value from "refine" button
        String reset = (String) request.getParameter("reset");
        if (reset == null) {
            reset = "";
        }
        // Get value from "refine" button
        String refine = (String) request.getParameter("refine");
        if (refine == null) {
            refine = "";
        }

        // If clicked on search button
        if (search.equals("search")) {
            //Call Search by Criteria method
            searchByKeyword(request, session, response);
        // If clicked on refine button
        } else if (reset.equals("Reset")) {
            // Call Refine Criteria method
            clearForm(session);
        } else if (refine.equals("Update")) {
            // Call Refine Criteria method
            refineCriteria(request, session, response);
        }
        
        loadPageData(session, response);
        //request.getRequestDispatcher("/search.jsp").forward(request, response);
        response.sendRedirect("/search.jsp");
    }

    // Set session variables
    protected void storeVariables(HttpSession session, HttpServletRequest request) {

        session.setAttribute("searchCriteria", request.getParameter("searchCriteria"));
        session.setAttribute("newAdPurpose", request.getParameter("newAdPurpose"));
        session.setAttribute("newPropertyType", request.getParameter("newPropertyType"));
        session.setAttribute("newPropertySuburb", request.getParameter("newPropertySuburb"));
        session.setAttribute("newPropertyBedrooms", request.getParameter("newPropertyBedrooms"));
        session.setAttribute("newPropertyBathrooms", request.getParameter("newPropertyBathrooms"));
        session.setAttribute("newPropertyCarSpaces", request.getParameter("newPropertyCarSpaces"));
    }

    // Clear session variables
    protected void clearForm(HttpSession session) {

        session.setAttribute("searchCriteria", "");
        session.setAttribute("newAdPurpose", "");
        session.setAttribute("newPropertyType", "");
        session.setAttribute("newPropertySuburb", "");
        session.setAttribute("newPropertyBedrooms", "");
        session.setAttribute("newPropertyBathrooms", "");
        session.setAttribute("newPropertyCarSpaces", "");
    }
    
    // Search by keyword field
    public void searchByKeyword(HttpServletRequest request, HttpSession session, HttpServletResponse response)
        throws IOException{

        try {
            ArrayList<Property> propertiesList = new ArrayList<>();
            String searchCriteria = (String) request.getParameter("searchCriteria");
            // Create JDBC instance
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            // Create a connection with database
            Connection conn = DriverManager.getConnection(
                                      "jdbc:mysql://saniprealestate-ap-southeast-2a.c3mrp52txpvn.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate","saniprealestate", "saniprealestate");

            // Create a SQL Statement
            Statement stmt = conn.createStatement();

            // Create a SQL Statement String
            String sql = "SELECT *, "
                    + "FORMAT(propertyPrice,2) as price, "
                    + "DATE_FORMAT(DATE(dateCreated),'%m/%d/%Y') as created "
                    + "FROM properties INNER JOIN owners "
                    + "ON properties.ownerID = owners.ownerID "
                    + "WHERE adTitle LIKE '%" + searchCriteria + "%' "
                    + "OR adPurpose LIKE '%" + searchCriteria + "%' "
                    + "OR propertyType LIKE '%" + searchCriteria + "%' "
                    + "OR propertySuburb LIKE '%" + searchCriteria + "%' "
                    + "OR propertyState LIKE '%" + searchCriteria + "%' "
                    + "OR propertyPostcode LIKE '%" + searchCriteria + "%' "
                    + "OR propertyAddress LIKE '%" + searchCriteria + "%' "
                    + "OR propertyDescription LIKE '%" + searchCriteria + "%' "
                    + "ORDER BY adType DESC";

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Property propertyBean = new Property();
                propertyBean.setPropertyID(rs.getString("propertyID"));
                propertyBean.setOwnerID(rs.getString("ownerID"));
                propertyBean.setOwnerFirstName(rs.getString("firstName"));
                propertyBean.setOwnerLastName(rs.getString("lastName"));
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
                propertiesList.add(propertyBean);
            }
            
            // Set data tosession
            session.setAttribute("propertiesList", propertiesList);

            // Close connections
            rs.close();
            stmt.close();
            conn.close();

            // Catch errors and display message
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            session.setAttribute("messageModal", "true");
            session.setAttribute("message", "An error occurred trying to perform the search!<br/>Please try again.");
            session.setAttribute("error", ex.getMessage());
            session.setAttribute("action", "search-properties.jsp");
            session.setAttribute("buttonAction", "messageModal");
            session.setAttribute("buttonLabel", "Try again");
            response.sendRedirect("/browse.jsp");
        }
    }
    
    // Search by dropbox fields
    public void refineCriteria(HttpServletRequest request, HttpSession session, HttpServletResponse response)
        throws IOException{

        try {
            ArrayList<Property> propertiesList = new ArrayList<>();

            String searchCriteria = (String) session.getAttribute("searchCriteria");
            String newAdPurpose = (String) session.getAttribute("newAdPurpose");
            String newPropertyType = (String) session.getAttribute("newPropertyType");
            String newPropertySuburb = (String) session.getAttribute("newPropertySuburb");
            String newPropertyBedrooms = (String) session.getAttribute("newPropertyBedrooms");
            String newPropertyBathrooms = (String) session.getAttribute("newPropertyBathrooms");
            String newPropertyCarSpaces = (String) session.getAttribute("newPropertyCarSpaces");
            
            // Create JDBC instance
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            // Create a connection with database
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://ssx.caclpzhk20ad.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate",
                    "ssxrealestate", "ssxrealestate");
            // Create a SQL Statement
            Statement stmt = conn.createStatement();

            // Create a SQL Statement String
            String sql = "SELECT * FROM (SELECT *, "
                    + "FORMAT(propertyPrice,2) as price, "
                    + "DATE_FORMAT(DATE(dateCreated),'%m/%d/%Y') as created "
                    + "FROM properties "
                    + "WHERE adTitle LIKE '%" + searchCriteria + "%' "
                    + "OR adPurpose LIKE '%" + searchCriteria + "%' "
                    + "OR propertyType LIKE '%" + searchCriteria + "%' "
                    + "OR propertySuburb LIKE '%" + searchCriteria + "%' "
                    + "OR propertyState LIKE '%" + searchCriteria + "%' "
                    + "OR propertyPostcode LIKE '%" + searchCriteria + "%' "
                    + "OR propertyAddress LIKE '%" + searchCriteria + "%' "
                    + "OR propertyDescription LIKE '%" + searchCriteria + "%') result "
                    + "WHERE adPurpose LIKE '" + newAdPurpose + "' "
                    + "AND propertyType LIKE '" + newPropertyType + "' "
                    + "AND propertySuburb LIKE '" + newPropertySuburb + "' "
                    + "AND propertyBedrooms > '" + newPropertyBedrooms + "' "
                    + "AND propertyBathrooms > '" + newPropertyBathrooms + "' "
                    + "AND propertyCarSpaces > '" + newPropertyCarSpaces + "' "
                    + "ORDER BY adType DESC";
            
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Property propertyBean = new Property();
                propertyBean.setPropertyID(rs.getString("propertyID"));
                propertyBean.setOwnerID(rs.getString("ownerID"));
                propertyBean.setOwnerFirstName(rs.getString("ownerID"));
                //propertyBean.setOwnerFirstName(rs.getString("firstName"));
                //propertyBean.setOwnerLastName(rs.getString("lastName"));
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
                propertiesList.add(propertyBean);
            }
            
            // Set data to session
            session.setAttribute("propertiesList", propertiesList);

            // Close connections
            rs.close();
            stmt.close();
            conn.close();

            // Catch errors and display message
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            session.setAttribute("messageModal", "true");
            session.setAttribute("message", "An error occurred trying to perform the search!<br/>Please try again.");
            session.setAttribute("error", ex.getMessage());
            session.setAttribute("action", "search-properties.jsp");
            session.setAttribute("buttonAction", "messageModal");
            session.setAttribute("buttonLabel", "Try again");
            response.sendRedirect("/browse.jsp");
        }
    }
    
    // Load remaining elements
    public void loadPageData(HttpSession session, HttpServletResponse response) throws IOException{

        try {
            ArrayList<Owner> ownersList = new ArrayList<>();
            ArrayList<String> suburbsList = new ArrayList<>();
            // Create JDBC instance
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            // Create a connection with database
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://ssx.caclpzhk20ad.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate",
                    "ssxrealestate", "ssxrealestate");
            // Create a SQL Statement
            Statement stmt = conn.createStatement();

            // Create a SQL Statement String
            String sql = "SELECT "
                    + "owners.ownerID, "
                    + "owners.firstName, "
                    + "owners.lastName, "
                    + "DATE_FORMAT(DATE(owners.memberSince),'%m/%d/%Y') AS since, "
                    + "COUNT(properties.propertyID) AS totalProperties  "
                    + "FROM properties LEFT JOIN owners "
                    + "ON properties.ownerID = owners.ownerID "
                    + "GROUP BY ownerID "
                    + "ORDER BY totalProperties DESC";
            
            // Execute SQL statement
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Owner ownerBean = new Owner();
                ownerBean.setOwnerID(rs.getString("ownerID"));
                ownerBean.setFirstName(rs.getString("firstName"));
                ownerBean.setLastName(rs.getString("lastName"));
                ownerBean.setMemberSince(rs.getString("since"));
                ownerBean.setTotalProperties(rs.getString("totalProperties"));
                ownersList.add(ownerBean);
            }

            sql = "SELECT DISTINCT propertySuburb FROM properties ORDER BY propertySuburb";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                suburbsList.add(rs.getString("propertySuburb"));
            }
            
            // Set data tosession
            session.setAttribute("ownersList", ownersList);
            session.setAttribute("suburbsList", suburbsList);
            session.setAttribute("error", null);
            session.setAttribute("messageModal", "");

            // Close connections
            rs.close();
            stmt.close();
            conn.close();

            // Catch errors and display message
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            session.setAttribute("messageModal", "true");
            session.setAttribute("message", "An error occurred trying to load the page!<br/>Please try again.");
            session.setAttribute("error", ex.getMessage());
            session.setAttribute("action", "search-properties.jsp");
            session.setAttribute("buttonAction", "messageModal");
            session.setAttribute("buttonLabel", "Try again");
            response.sendRedirect("/browse.jsp");
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

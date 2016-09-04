
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
 * Allows the owner to edit his/her details
 *
 * @author Sanip
 * 
 */
public class DeleteAccountByAdmin extends HttpServlet {

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
        String deleteOwnerID = (String) request.getParameter("deleteOwnerID");
        String reason = (String) request.getParameter("reason");
        String loadDeleteOwner = (String) request.getParameter("loadDeleteOwner");
        String deleteOwnerCancel = (String) request.getParameter("deleteOwnerCancel");
        String deleteOwnerSubmit = (String) request.getParameter("deleteOwnerSubmit");
        String deleteOwnerConfirmCancel = (String) request.getParameter("deleteOwnerConfirmCancel");
        String deleteOwnerConfirmCONFIRM = (String) request.getParameter("deleteOwnerConfirmCONFIRM");

        if (loadDeleteOwner == null) {
            loadDeleteOwner = "";
        }
        if (deleteOwnerCancel == null) {
            deleteOwnerCancel = "";
        }
        if (deleteOwnerSubmit == null) {
            deleteOwnerSubmit = "";
        }
        if (deleteOwnerConfirmCancel == null) {
            deleteOwnerConfirmCancel = "";
        }
        if (deleteOwnerConfirmCONFIRM == null) {
            deleteOwnerConfirmCONFIRM = "";
        }

        if (loadDeleteOwner.equals("true")) {
            session.setAttribute("loadDeleteOwner", "true");
            session.setAttribute("deleteOwnerID", deleteOwnerID);
            session.setAttribute("reason", "");
            session.setAttribute("errReason", "");
            response.sendRedirect("/admin-dashboard.jsp");
        } else if (deleteOwnerCancel.equals("Cancel")) {
            session.setAttribute("loadDeleteOwner", "");
            session.setAttribute("reason", "");
            session.setAttribute("errReason", "");
            session.setAttribute("deleteOwnerID", "");
            response.sendRedirect("/admin-dashboard.jsp");
            //RequestDispatcher rd = request.getRequestDispatcher("LoadAdminDashboard");
            //rd.forward(request, response);
        } else if (deleteOwnerSubmit.equals("Submit")) {
            if (reason == null || reason.trim().length() == 0 || reason.equals("")) {
                session.setAttribute("errReason", "This field cannot be left blank.");
                response.sendRedirect("/admin-dashboard.jsp");
            } else {
                session.setAttribute("loadDeleteOwner", "");
                session.setAttribute("loadDeleteOwnerConfirm", "true");
                session.setAttribute("reason", reason);
                response.sendRedirect("/admin-dashboard.jsp");
            }
        } else if (deleteOwnerConfirmCancel.equals("Cancel")) {
            session.setAttribute("loadDeleteOwnerConfirm", "");
            session.setAttribute("reason", "");
            session.setAttribute("deleteOwnerID", "");
            response.sendRedirect("/admin-dashboard.jsp");
        } else if (deleteOwnerConfirmCONFIRM.equals("CONFIRM")) {
            session.setAttribute("loadDeleteOwnerConfirm", "");
            deleteOwner(session, response);
        }
    }

    protected void deleteOwner(HttpSession session, HttpServletResponse response)
            throws IOException {
        String deleteOwnerID = (String) session.getAttribute("deleteOwnerID");
        String reason = (String) session.getAttribute("reason");
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(
                                       "jdbc:mysql://saniprealestate-ap-southeast-2a.c3mrp52txpvn.ap-southeast-2.rds.amazonaws.com:3306/ssx-real-estate","saniprealestate", "saniprealestate");

            Statement stmt = conn.createStatement();
            String sql = "INSERT INTO deletedOwnersBackup SELECT * FROM owners WHERE OwnerID = '" + deleteOwnerID + "'";
            int status = stmt.executeUpdate(sql);
            if (status == 0) {
                session.setAttribute("messageModal", "true");
                session.setAttribute("message", "An error occurred trying to backup the account.<br/>Please try again!");
                session.setAttribute("error", null);
                session.setAttribute("action", "servlet/LoadAdminDashboard");
                session.setAttribute("buttonAction", "messageModal");
                session.setAttribute("buttonLabel", "Try again");
                response.sendRedirect("/admin-dashboard.jsp");
            }
            sql = "INSERT INTO deletedOwnersList (ownerID, reason) "
                    + "VALUES ('" + deleteOwnerID + "', '" + reason + "')";
            status = stmt.executeUpdate(sql);
            if (status == 0) {
                session.setAttribute("messageModal", "true");
                session.setAttribute("message", "An error occurred trying to insert account to deleted list.<br/>Please try again!");
                session.setAttribute("error", null);
                session.setAttribute("action", "servlet/LoadAdminDashboard");
                session.setAttribute("buttonAction", "messageModal");
                session.setAttribute("buttonLabel", "Try again");
                response.sendRedirect("/admin-dashboard.jsp");
            }
            sql = "DELETE FROM owners WHERE OwnerID = '" + deleteOwnerID + "'";
            status = stmt.executeUpdate(sql);
            if (status == 0) {
                session.setAttribute("messageModal", "true");
                session.setAttribute("message", "An error occurred trying to delete account.<br/>Please try again!");
                session.setAttribute("error", null);
                session.setAttribute("action", "servlet/LoadAdminDashboard");
                session.setAttribute("buttonAction", "messageModal");
                session.setAttribute("buttonLabel", "Try again");
                response.sendRedirect("/admin-dashboard.jsp");
            } else {
                session.setAttribute("messageModal", "true");
                session.setAttribute("message", "Owner acount has been deleted sussessfuly.");
                session.setAttribute("error", null);
                session.setAttribute("action", "servlet/LoadAdminDashboard");
                session.setAttribute("buttonAction", "messageModal");
                session.setAttribute("buttonLabel", "Ok");
                response.sendRedirect("/admin-dashboard.jsp");
            }
            stmt.close();
            conn.close();
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException | IOException ex) {
            Logger.getLogger(EditOwnerDetails.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("messageModal", "true");
            session.setAttribute("message", "An error occurred trying to delete your account.<br/>Please try again.");
            session.setAttribute("error", ex.getMessage());
            session.setAttribute("action", "servlet/LoadOwnerDashboard");
            session.setAttribute("buttonAction", "messageModal");
            session.setAttribute("buttonLabel", "Try again");
            response.sendRedirect("/owner-dashboard.jsp");
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

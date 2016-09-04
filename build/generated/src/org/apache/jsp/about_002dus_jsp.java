package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class about_002dus_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <!--last edit 2015-05-01 by sanip-->\n");
      out.write("\n");
      out.write("\n");
      out.write("    ");

        session = request.getSession(true);
        String ownerID = (String) session.getAttribute("ownerID");
        String errOwnerID = (String) session.getAttribute("errOwnerID");
        String errPassword = (String) session.getAttribute("errPassword");
        String newOwnerID = (String) session.getAttribute("newOwnerID");
        String errNewOwnerID = (String) session.getAttribute("errNewOwnerID");
        String newPassword = (String) session.getAttribute("newPassword");
        String errNewPassword = (String) session.getAttribute("errNewPassword");
        String cfmNewPassword = (String) session.getAttribute("cfmNewPassword");
        String errCfmNewPassword = (String) session.getAttribute("errCfmNewPassword");
        String newFirstName = (String) session.getAttribute("newFirstName");
        String errNewFirstName = (String) session.getAttribute("errNewFirstName");
        String newLastName = (String) session.getAttribute("newLastName");
        String errNewLastName = (String) session.getAttribute("errNewLastName");
        String newEmail = (String) session.getAttribute("newEmail");
        String errNewEmail = (String) session.getAttribute("errNewEmail");
        String newPhone = (String) session.getAttribute("newPhone");
        String errNewPhone = (String) session.getAttribute("errNewPhone");
        String newAddress = (String) session.getAttribute("newAddress");
        String errNewAddress = (String) session.getAttribute("errNewAddress");
        String newSuburb = (String) session.getAttribute("newSuburb");
        String errNewSuburb = (String) session.getAttribute("errNewSuburb");
        String newState = (String) session.getAttribute("newState");
        String errNewState = (String) session.getAttribute("errNewState");
        String newPostcode = (String) session.getAttribute("newPostcode");
        String errNewPostcode = (String) session.getAttribute("errNewPostcode");

        String signIn = (String) session.getAttribute("signIn");
        String signInError = (String) session.getAttribute("signInError");
        String signUpError = (String) session.getAttribute("signUpError");
        String messageModal = (String) session.getAttribute("messageModal");

        String message = (String) session.getAttribute("message");
        String error = (String) session.getAttribute("error");
        String action = (String) session.getAttribute("action");
        String buttonAction = (String) session.getAttribute("buttonAction");
        String buttonLabel = (String) session.getAttribute("buttonLabel");
        //contact admin
        String contactName = (String) session.getAttribute("contactName");
        String contactEmail = (String) session.getAttribute("contactEmail");
        String messageSubject = (String) session.getAttribute("messageSubject");
        String adminMessages = (String) session.getAttribute("adminMessages");
    
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <meta name=\"description\" content=\"ITC303 201460 Project\">\n");
      out.write("        <meta name=\"author\" content=\"SSX Team\">\n");
      out.write("        <link rel=\"icon\" href=\"images/favicon.ico\">\n");
      out.write("        <title>SSX Real Estate - about</title>\n");
      out.write("        <!-- Bootstrap core CSS -->\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/bootstrap-theme.min.css\" rel=\"stylesheet\">\n");
      out.write("        <!--<link href=\"css/navbar.css\" rel=\"stylesheet\">-->\n");
      out.write("        <!--<link href=\"css/grid.css\" rel=\"stylesheet\">-->\n");
      out.write("        <!--<link href=\"css/theme.css\" rel=\"stylesheet\">-->\n");
      out.write("        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->\n");
      out.write("        <!--[if lt IE 9]><script src=\"../../assets/js/ie8-responsive-file-warning.js\"></script><![endif]-->\n");
      out.write("\n");
      out.write("        <script type= \"text/javascript\" src=\"js/ie-emulation-modes-warning.js\"></script>\n");
      out.write("        <script type= \"text/javascript\" src=\"js/ie10-viewport-bug-workaround.js\"></script>\n");
      out.write("        <script type= \"text/javascript\" src=\"js/jquery.min.js\"></script>\n");
      out.write("        <script type= \"text/javascript\" src=\"js/bootstrap.min.js\"></script>\n");
      out.write("        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->\n");
      out.write("        <!--[if lt IE 9]>\n");
      out.write("              <script src=\"https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js\"></script>\n");
      out.write("              <script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>\n");
      out.write("            <![endif]-->\n");
      out.write("        <style type=\"text/css\">\n");
      out.write("            small {\n");
      out.write("                color: red;\n");
      out.write("            }\n");
      out.write("            .header {\n");
      out.write("\n");
      out.write("                color: #36A0FF;\n");
      out.write("                height: 70px;\n");
      out.write("                font-size: 27px;\n");
      out.write("                padding: 10px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("            var signInError = \"");
      out.print(signInError);
      out.write("\";\n");
      out.write("            if (signInError == \"true\") {\n");
      out.write("                $(function () {\n");
      out.write("                    $('#signIn').modal();\n");
      out.write("                });\n");
      out.write("            }\n");
      out.write("            var signUpError = \"");
      out.print(signUpError);
      out.write("\";\n");
      out.write("            if (signUpError == \"true\") {\n");
      out.write("                $(function () {\n");
      out.write("                    $('#signUp').modal();\n");
      out.write("                });\n");
      out.write("            }\n");
      out.write("            $(function () {\n");
      out.write("                $('[data-toggle=\"tooltip\"]').tooltip();\n");
      out.write("                $('[data-toggle=\"popover\"]').popover();\n");
      out.write("            });\n");
      out.write("            var messageModal = \"");
      out.print(messageModal);
      out.write("\";\n");
      out.write("            if (messageModal == \"true\") {\n");
      out.write("                $(function () {\n");
      out.write("                    $('#message').modal();\n");
      out.write("                });\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <!-- Logo -->\n");
      out.write("            <div style=\"width: 400px; margin: auto;\">\n");
      out.write("                <a href=\"index.jsp\">\n");
      out.write("                    <img src=\"images/SSX_logo_Blue.png\" alt=\"SSX Real Estate\" />\n");
      out.write("                </a>\n");
      out.write("            </div>\n");
      out.write("            <!-- Static navbar -->\n");
      out.write("            <nav class=\"navbar navbar-default\" style=\"background-image: linear-gradient(to bottom,#8897BB 0,#3D4C70 100%)\">\n");
      out.write("                <div class=\"container-fluid\">\n");
      out.write("                    <div class=\"navbar-header\">\n");
      out.write("                        <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#navbar\">\n");
      out.write("                            <span class=\"icon-bar\" style=\"\"></span>\n");
      out.write("                            <span class=\"icon-bar\"></span>\n");
      out.write("                            <span class=\"icon-bar\"></span>\n");
      out.write("                        </button>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"collapse navbar-collapse\" id=\"navbar\">\n");
      out.write("                        <form class=\"navbar-form navbar-left\" action=\"search-properties.jsp\" method=\"post\">\n");
      out.write("                            <div class=\"input-group\" style=\"width: 300px\">\n");
      out.write("                                <input type=\"text\" class=\"form-control\" name=\"searchCriteria\" placeholder=\"Enter any keyword...\">\n");
      out.write("                                <span class=\"input-group-btn\">\n");
      out.write("                                    <button class=\"btn btn-warning\" type=\"submit\" name=\"search\" value=\"search\">\n");
      out.write("                                        <span class=\"glyphicon glyphicon-search\"></span></button>\n");
      out.write("                                </span>\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                        <div class=\"navbar-form navbar-left\" action=\"\">\n");
      out.write("                            <a class=\"btn btn-link\" style=\"color: white\" href=\"search-properties.jsp\"><strong>Advanced Search</strong></a>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"navbar-form navbar-right\" style=\"color: white\">\n");
      out.write("                            ");
if (signIn == "true") {
      out.write("\n");
      out.write("                            Signed in as: ");
      out.print(ownerID);
      out.write("\n");
      out.write("                            <a class=\"btn btn-link\" style=\"font-weight: bold; color: white\"\n");
      out.write("                               data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Go to Dashboard\" \n");
      out.write("                               href=\"servlet/LoadOwnerDashboard?ownerID=");
      out.print(ownerID);
      out.write("\">\n");
      out.write("                                <span class=\"glyphicon glyphicon-cog\" style=\"font-size: 18px\"></span> </a>\n");
      out.write("                            <a class=\"btn btn-danger\" href=\"servlet/SignOut\">Sign out</a>\n");
      out.write("                            ");
} else {
      out.write("\n");
      out.write("                            <div class=\"btn-group\">\n");
      out.write("                                <button class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#signIn\">Sign in</button>\n");
      out.write("                                <button class=\"btn btn-warning\" data-toggle=\"modal\" data-target=\"#signUp\">Sign up</button>\n");
      out.write("                            </div>\n");
      out.write("                            ");
}
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </nav>\n");
      out.write("            <!-- Main component for a primary marketing message or call to action -->\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-md-12\" style=\"margin-top: 15px\">\n");
      out.write("                    <ol class=\"breadcrumb\">\n");
      out.write("                        <li><a href=\"#\">Home</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"active\">about us</li>\n");
      out.write("                    </ol>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <div class=\"panel panel-default\">\n");
      out.write("                        <div class=\"panle-body\" style=\"margin:15px\">\n");
      out.write("                            <legend>About us</legend>\n");
      out.write("\n");
      out.write("                            <!--information-->\n");
      out.write("\n");
      out.write("                            <p>SSX Realestate </p>\n");
      out.write("                            <ul>\n");
      out.write("                                <li>sell property</li>\n");
      out.write("                                <li>rent property</li>\n");
      out.write("                                <li>property ad</li>\n");
      out.write("                                <li>premium owners</li>\n");
      out.write("                                <li>premium property</li>\n");
      out.write("                            </ul>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <!-- Contact with Map - START -->\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("\n");
      out.write("                        <div class=\"col-md-6\">\n");
      out.write("                            <div>\n");
      out.write("                                <div class=\"panel panel-default\">\n");
      out.write("\n");
      out.write("                                    <div class=\"panel-body text-center\">\n");
      out.write("                                        <h4>Address</h4>\n");
      out.write("                                        <div>\n");
      out.write("                                            2217 Oxford Street<br />\n");
      out.write("                                            Darlinghurst NSW<br />\n");
      out.write("                                            #(0061) 1234 1234<br />\n");
      out.write("                                            service@ssxrealestate.com<br />\n");
      out.write("                                        </div>\n");
      out.write("                                        <hr />\n");
      out.write("                                        <div id=\"map1\" class=\"map\"><iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d424396.3176723366!2d150.92243255000005!3d-33.796923500000005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b129838f39a743f%3A0x3017d681632a850!2sSydney+NSW!5e0!3m2!1sen!2sau!4v1430480015290\" width=\"530\" height=\"280\" frameborder=\"0\" style=\"border:0\"></iframe>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-md-6\">\n");
      out.write("                            <form class=\"form-horizontal\"  action=\"ContactAdmin\" method = \"post\" name=\"ContactAdmin\" id=\"ContactAdmin\">\n");
      out.write("\n");
      out.write("\n");
      out.write("                                <legend class=\"text-center header\">Contact us</legend>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <div class=\"col-md-10 col-md-offset-1\">\n");
      out.write("                                        <input id=\"contactName\" name=\"contactName\" type=\"text\" placeholder=\"Contact Name\" class=\"form-control\" required>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <div class=\"col-md-10 col-md-offset-1\">\n");
      out.write("                                        <input id=\"contactEmail\" name=\"contactEmail\" type=\"email\" placeholder=\"Email Address\" class=\"form-control\" required>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <div class=\"col-md-10 col-md-offset-1\">\n");
      out.write("\n");
      out.write("                                        <select class=\"form-control col-sm-4\" name=\"messageSubject\" id=\"messageSubject\">\n");
      out.write("                                            <option value=\"Suggest\">Suggest</option>\n");
      out.write("                                            <option value=\"Sell\">Sell</option>\n");
      out.write("                                            <option value=\"Rent\">Rent</option>\n");
      out.write("                                            <option value=\"Bug\">Bug report</option>\n");
      out.write("                                        </select>\n");
      out.write("\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <div class=\"col-md-10 col-md-offset-1\">\n");
      out.write("                                        <textarea class=\"form-control\" id=\"adminMessages\" name=\"adminMessages\" placeholder=\"Enter your massage for us here. We will get back to you within 2 business days.\" rows=\"7\" required></textarea>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <div class=\"col-md-12 text-center\">\n");
      out.write("                                        <input class=\"btn btn-primary\"  type=\"submit\"  id=\"submit\" name=\"submit\" value=\"submit\">\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                            </form>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                <!-- Contact with Map - END -->\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("            <div class=\"panel panel-default\" style=\"background: linear-gradient(to bottom,#8897BB 0,#3D4C70 100%)\">\n");
      out.write("                <div class=\"panel-body\">\n");
      out.write("                    <div class=\"btn-group btn-group-justified\">\n");
      out.write("                        <div class=\"btn-group\">\n");
      out.write("                            <button type=\"button\" class=\"btn btn-link\" style=\"color: white; font-size: 12px;\">Privacy Policy</button>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"btn-group\">\n");
      out.write("                            <button type=\"button\" class=\"btn btn-link\" style=\"color: white; font-size: 12px;\">Conditions of use</button>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"btn-group\">\n");
      out.write("                            <button type=\"button\" class=\"btn btn-link\" style=\"color: white; font-size: 12px;\">Site Map</button>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"btn-group\">\n");
      out.write("                            <button type=\"button\" class=\"btn btn-link\" style=\"color: white; font-size: 12px;\">About us</button>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"btn-group\">\n");
      out.write("                            <button type=\"button\" class=\"btn btn-link\" style=\"color: white; font-size: 12px;\">Admin Dashboard</button>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <p style=\"color: white; text-align: center; font-size: 12px;\">\n");
      out.write("                        <br/>© Copyright 2016 by SSX Real Estate Australia Pty Ltd - All rights reserved\n");
      out.write("                    </p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!--Sign in Modal-->\n");
      out.write("        <div class=\"modal\" id=\"signIn\" tabindex=\"-1\" role=\"dialog\" data-backdrop=\"static\" data-keyboard=\"false\">\n");
      out.write("            <div class=\"modal-dialog\" style=\"margin-top: 10%\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("                    <div class=\"modal-header\">\n");
      out.write("                        <h4 class=\"modal-title\">Sign in</h4>\n");
      out.write("                    </div>\n");
      out.write("                    <form action=\"servlet/SignIn\" method=\"post\" id=\"signIn\">\n");
      out.write("                        <div class=\"modal-body\">\n");
      out.write("                            <input type=\"text\" class=\"form-control\" id=\"ownerID\" name=\"ownerID\" placeholder=\"Username\"\n");
      out.write("                                   ");
if (ownerID != null) {
      out.write(" value=\"");
      out.print(ownerID);
      out.write('"');
      out.write(' ');
}
      out.write("/>\n");
      out.write("                            ");
if (errOwnerID != null) {
      out.write("  <small> ");
      out.print(errOwnerID);
      out.write(" </small> ");
}
      out.write("\n");
      out.write("                            <br/>\n");
      out.write("                            <input type=\"password\" class=\"form-control\" id=\"password\" name=\"password\" placeholder=\"Password\"/>\n");
      out.write("                            ");
if (errPassword != null) {
      out.write("  <small> ");
      out.print(errPassword);
      out.write(" </small> ");
}
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-footer\">\n");
      out.write("                            <div class=\"btn-group btn-group-sm\">\n");
      out.write("                                <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Cancel</button>\n");
      out.write("                                <input type=\"submit\" class=\"btn btn-primary\" id=\"signInSubmit\" name=\"signInSubmit\" value=\"Submit\"/>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!--Sign up Modal-->\n");
      out.write("        <div class=\"modal \" id=\"signUp\" tabindex=\"-1\" role=\"dialog\" data-backdrop=\"static\" data-keyboard=\"false\">\n");
      out.write("            <div class=\"modal-dialog modal-lg\" style=\"margin-top: 10%\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("                    <div class=\"modal-header\">\n");
      out.write("                        <h4 class=\"modal-title\">Sign up</h4>\n");
      out.write("                    </div>\n");
      out.write("                    <form class=\"form-horizontal\" action=\"servlet/SignUp\" method=\"post\" id=\"signUpForm\" enctype=\"multipart/form-data\">\n");
      out.write("                        <div class=\"modal-body\">\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <div class=\"col-sm-6\">\n");
      out.write("                                    <!-- Username -->\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label class=\"col-sm-4 control-label\" for=\"newOwnerID\">Username</label>\n");
      out.write("                                        <div class=\"col-sm-8\">\n");
      out.write("                                            <div class=\"input-group\">\n");
      out.write("                                                <input type=\"text\" class=\"form-control\" id=\"newOwnerID\" name=\"newOwnerID\"\n");
      out.write("                                                       ");
if (newOwnerID != null) {
      out.write(" value=\"");
      out.print(newOwnerID);
      out.write('"');
      out.write(' ');
}
      out.write("/>\n");
      out.write("                                                <span class=\"input-group-btn\">\n");
      out.write("                                                    <button class=\"btn btn-link\" type=\"button\" tabindex=\"-1\" data-toggle=\"popover\"\n");
      out.write("                                                            data-trigger=\"focus\" data-placement=\"bottom\" data-container=\"#signUp\"\n");
      out.write("                                                            data-content=\"Must be 6 to 10 characters long)\">\n");
      out.write("                                                        <span class=\"glyphicon glyphicon-question-sign\" style=\"font-size: 20px\"></span>\n");
      out.write("                                                    </button>\n");
      out.write("                                                </span>\n");
      out.write("                                            </div>\n");
      out.write("                                            ");
if (errNewOwnerID != null) {
      out.write(" <small> ");
      out.print(errNewOwnerID);
      out.write(" </small> ");
}
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <!-- Password -->\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label class=\"col-sm-4 control-label\" for=\"newPassword\">Password</label>\n");
      out.write("                                        <div class=\"col-sm-8\">\n");
      out.write("                                            <div class=\"input-group\">\n");
      out.write("                                                <input type=\"password\" class=\"form-control\" id=\"newPassword\" name=\"newPassword\"\n");
      out.write("                                                       ");
if (newPassword != null) {
      out.write(" value=\"");
      out.print(newPassword);
      out.write('"');
      out.write(' ');
}
      out.write("/>\n");
      out.write("                                                <span class=\"input-group-btn\">\n");
      out.write("                                                    <button class=\"btn btn-link\" type=\"button\" tabindex=\"-1\" data-toggle=\"popover\"\n");
      out.write("                                                            data-trigger=\"focus\" data-placement=\"bottom\" data-container=\"#signUp\"\n");
      out.write("                                                            data-content=\"Must be 6 to 10 characters long\">\n");
      out.write("                                                        <span class=\"glyphicon glyphicon-question-sign\" style=\"font-size: 20px\"></span>\n");
      out.write("                                                    </button>\n");
      out.write("                                                </span>\n");
      out.write("                                            </div>\n");
      out.write("                                            ");
if (errNewPassword != null) {
      out.write("  <small> ");
      out.print(errNewPassword);
      out.write(" </small> ");
}
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <!-- Confirm password -->\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label class=\"col-sm-4 control-label\" for=\"cfmNewPassword\">Confirm password</label>\n");
      out.write("                                        <div class=\"col-sm-8\">\n");
      out.write("                                            <div class=\"input-group\">\n");
      out.write("                                                <input type=\"password\" class=\"form-control\" id=\"cfmNewPassword\" name=\"cfmNewPassword\"\n");
      out.write("                                                       ");
if (cfmNewPassword != null) {
      out.write(" value=\"");
      out.print(cfmNewPassword);
      out.write('"');
      out.write(' ');
}
      out.write("/>\n");
      out.write("                                                <span class=\"input-group-btn\">\n");
      out.write("                                                    <button class=\"btn btn-link\" type=\"button\" tabindex=\"-1\" data-toggle=\"popover\"\n");
      out.write("                                                            data-trigger=\"focus\" data-placement=\"bottom\" data-container=\"#signUp\"\n");
      out.write("                                                            data-content=\"Must match password field\">\n");
      out.write("                                                        <span class=\"glyphicon glyphicon-question-sign\" style=\"font-size: 20px\"></span>\n");
      out.write("                                                    </button>\n");
      out.write("                                                </span>\n");
      out.write("                                            </div>\n");
      out.write("                                            ");
if (errCfmNewPassword != null) {
      out.write("  <small> ");
      out.print(errCfmNewPassword);
      out.write(" </small> ");
}
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <!-- First name -->\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label class=\"col-sm-4 control-label\" for=\"newFirstName\">First name</label>\n");
      out.write("                                        <div class=\"col-sm-8\">\n");
      out.write("                                            <div class=\"input-group\">\n");
      out.write("                                                <input type=\"text\" class=\"form-control\" id=\"newFirstName\" name=\"newFirstName\"\n");
      out.write("                                                       ");
if (newFirstName != null) {
      out.write(" value=\"");
      out.print(newFirstName);
      out.write('"');
      out.write(' ');
}
      out.write("/>\n");
      out.write("                                                <span class=\"input-group-btn\">\n");
      out.write("                                                    <button class=\"btn btn-link\" type=\"button\" tabindex=\"-1\" data-toggle=\"popover\"\n");
      out.write("                                                            data-trigger=\"focus\" data-placement=\"bottom\" data-container=\"#signUp\"\n");
      out.write("                                                            data-content=\"Your first name (only letters)\">\n");
      out.write("                                                        <span class=\"glyphicon glyphicon-question-sign\" style=\"font-size: 20px\"></span>\n");
      out.write("                                                    </button>\n");
      out.write("                                                </span>\n");
      out.write("                                            </div>\n");
      out.write("                                            ");
if (errNewFirstName != null) {
      out.write("  <small> ");
      out.print(errNewFirstName);
      out.write(" </small> ");
}
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <!-- Last name -->\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label class=\"col-sm-4 control-label\" for=\"newLastName\">Last name</label>\n");
      out.write("                                        <div class=\"col-sm-8\">\n");
      out.write("                                            <div class=\"input-group\">\n");
      out.write("                                                <input type=\"text\" class=\"form-control\" id=\"newLastName\" name=\"newLastName\"\n");
      out.write("                                                       ");
if (newLastName != null) {
      out.write(" value=\"");
      out.print(newLastName);
      out.write('"');
      out.write(' ');
}
      out.write("/>\n");
      out.write("                                                <span class=\"input-group-btn\">\n");
      out.write("                                                    <button class=\"btn btn-link\" type=\"button\" tabindex=\"-1\" data-toggle=\"popover\"\n");
      out.write("                                                            data-trigger=\"focus\" data-placement=\"bottom\" data-container=\"#signUp\"\n");
      out.write("                                                            data-content=\"Your last name (only letters)\">\n");
      out.write("                                                        <span class=\"glyphicon glyphicon-question-sign\" style=\"font-size: 20px\"></span>\n");
      out.write("                                                    </button>\n");
      out.write("                                                </span>\n");
      out.write("                                            </div>\n");
      out.write("                                            ");
if (errNewLastName != null) {
      out.write("  <small> ");
      out.print(errNewLastName);
      out.write(" </small> ");
}
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <!-- Email -->\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label class=\"col-sm-4 control-label\" for=\"newEmail\">email</label>\n");
      out.write("                                        <div class=\"col-sm-8\">\n");
      out.write("                                            <div class=\"input-group\">\n");
      out.write("                                                <input type=\"email\" class=\"form-control\" id=\"newEmail\" name=\"newEmail\"\n");
      out.write("                                                       ");
if (newEmail != null) {
      out.write(" value=\"");
      out.print(newEmail);
      out.write('"');
      out.write(' ');
}
      out.write("/>\n");
      out.write("                                                <span class=\"input-group-btn\">\n");
      out.write("                                                    <button class=\"btn btn-link\" type=\"button\" tabindex=\"-1\" data-toggle=\"popover\"\n");
      out.write("                                                            data-trigger=\"focus\" data-placement=\"bottom\" data-container=\"#signUp\"\n");
      out.write("                                                            data-content=\"Format must be: email@server.com\">\n");
      out.write("                                                        <span class=\"glyphicon glyphicon-question-sign\" style=\"font-size: 20px\"></span>\n");
      out.write("                                                    </button>\n");
      out.write("                                                </span>\n");
      out.write("                                            </div>\n");
      out.write("                                            ");
if (errNewEmail != null) {
      out.write("  <small> ");
      out.print(errNewEmail);
      out.write(" </small> ");
}
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"col-sm-6\">\n");
      out.write("                                    <!-- Phone number -->\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label class=\"col-sm-4 control-label\" for=\"newPhone\">Phone number</label>\n");
      out.write("                                        <div class=\"col-sm-8\">\n");
      out.write("                                            <div class=\"input-group\">\n");
      out.write("                                                <input type=\"text\" class=\"form-control\" id=\"newPhone\" name=\"newPhone\"\n");
      out.write("                                                       ");
if (newPhone != null) {
      out.write(" value=\"");
      out.print(newPhone);
      out.write('"');
      out.write(' ');
}
      out.write("/>\n");
      out.write("                                                <span class=\"input-group-btn\">\n");
      out.write("                                                    <button class=\"btn btn-link\" type=\"button\" tabindex=\"-1\" data-toggle=\"popover\"\n");
      out.write("                                                            data-trigger=\"focus\" data-placement=\"bottom\" data-container=\"#signUp\"\n");
      out.write("                                                            data-content=\"Only numbers\">\n");
      out.write("                                                        <span class=\"glyphicon glyphicon-question-sign\" style=\"font-size: 20px\"></span>\n");
      out.write("                                                    </button>\n");
      out.write("                                                </span>\n");
      out.write("                                            </div>\n");
      out.write("                                            ");
if (errNewPhone != null) {
      out.write("  <small> ");
      out.print(errNewPhone);
      out.write(" </small> ");
}
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <!-- Address -->\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label class=\"col-sm-4 control-label\" for=\"newAddress\">Address</label>\n");
      out.write("                                        <div class=\"col-sm-8\">\n");
      out.write("                                            <div class=\"input-group\">\n");
      out.write("                                                <input type=\"text\" class=\"form-control\" id=\"newAddress\" name=\"newAddress\"\n");
      out.write("                                                       ");
if (newAddress != null) {
      out.write(" value=\"");
      out.print(newAddress);
      out.write('"');
      out.write(' ');
}
      out.write("/>\n");
      out.write("                                                <span class=\"input-group-btn\">\n");
      out.write("                                                    <button class=\"btn btn-link\" type=\"button\" tabindex=\"-1\" data-toggle=\"popover\"\n");
      out.write("                                                            data-trigger=\"focus\" data-placement=\"bottom\" data-container=\"#signUp\"\n");
      out.write("                                                            data-content=\"Your street address\">\n");
      out.write("                                                        <span class=\"glyphicon glyphicon-question-sign\" style=\"font-size: 20px\"></span>\n");
      out.write("                                                    </button>\n");
      out.write("                                                </span>\n");
      out.write("                                            </div>\n");
      out.write("                                            ");
if (errNewAddress != null) {
      out.write("  <small> ");
      out.print(errNewAddress);
      out.write(" </small> ");
}
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <!-- Suburb -->\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label class=\"col-sm-4 control-label\" for=\"newSuburb\">Suburb</label>\n");
      out.write("                                        <div class=\"col-sm-8\">\n");
      out.write("                                            <div class=\"input-group\">\n");
      out.write("                                                <input type=\"text\" class=\"form-control\" id=\"newSuburb\" name=\"newSuburb\"\n");
      out.write("                                                       ");
if (newSuburb != null) {
      out.write(" value=\"");
      out.print(newSuburb);
      out.write('"');
      out.write(' ');
}
      out.write("/>\n");
      out.write("                                                <span class=\"input-group-btn\">\n");
      out.write("                                                    <button class=\"btn btn-link\" type=\"button\" tabindex=\"-1\" data-toggle=\"popover\"\n");
      out.write("                                                            data-trigger=\"focus\" data-placement=\"bottom\" data-container=\"#signUp\"\n");
      out.write("                                                            data-content=\"Your suburb\">\n");
      out.write("                                                        <span class=\"glyphicon glyphicon-question-sign\" style=\"font-size: 20px\"></span>\n");
      out.write("                                                    </button>\n");
      out.write("                                                </span>\n");
      out.write("                                            </div>\n");
      out.write("                                            ");
if (errNewSuburb != null) {
      out.write("  <small> ");
      out.print(errNewSuburb);
      out.write(" </small> ");
}
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <!-- State -->\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label class=\"col-sm-4 control-label\" for=\"newState\">State</label>\n");
      out.write("                                        <div class=\"col-sm-4\">\n");
      out.write("                                            <select class=\"form-control\" id=\"newState\" name=\"newState\">\n");
      out.write("                                                <option></option>\n");
      out.write("                                                <option value=\"ACT\" ");
if (newState != null) {
                                                        if (newState.equals("ACT")) {
      out.write(' ');
      out.print("selected");
      out.write(' ');
}
                                                            }
      out.write(">ACT</option>\n");
      out.write("                                                <option value=\"NSW\" ");
if (newState != null) {
                                                        if (newState.equals("NSW")) {
      out.write(' ');
      out.print("selected");
      out.write(' ');
}
                                                            }
      out.write(">NSW</option>\n");
      out.write("                                                <option value=\"NT\" ");
if (newState != null) {
                                                        if (newState.equals("NT")) {
      out.write(' ');
      out.print("selected");
      out.write(' ');
}
                                                            }
      out.write(">NT</option>\n");
      out.write("                                                <option value=\"QLD\" ");
if (newState != null) {
                                                        if (newState.equals("QLD")) {
      out.write(' ');
      out.print("selected");
      out.write(' ');
}
                                                            }
      out.write(">QLD</option>\n");
      out.write("                                                <option value=\"SA\" ");
if (newState != null) {
                                                        if (newState.equals("SA")) {
      out.write(' ');
      out.print("selected");
      out.write(' ');
}
                                                            }
      out.write(">SA</option>\n");
      out.write("                                                <option value=\"TAS\" ");
if (newState != null) {
                                                        if (newState.equals("TAS")) {
      out.write(' ');
      out.print("selected");
      out.write(' ');
}
                                                            }
      out.write(">TAS</option>\n");
      out.write("                                                <option value=\"VIC\" ");
if (newState != null) {
                                                        if (newState.equals("VIC")) {
      out.write(' ');
      out.print("selected");
      out.write(' ');
}
                                                            }
      out.write(">VIC</option>\n");
      out.write("                                                <option value=\"WA\" ");
if (newState != null) {
                                                        if (newState.equals("WA")) {
      out.write(' ');
      out.print("selected");
      out.write(' ');
}
                                                            }
      out.write(">WA</option>\n");
      out.write("                                            </select>\n");
      out.write("                                            ");
if (errNewState != null) {
      out.write("  <small> ");
      out.print(errNewState);
      out.write(" </small> ");
}
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <!-- Owner Postcode -->\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label class=\"col-sm-4 control-label\" for=\"newPostcode\">Postcode</label>\n");
      out.write("                                        <div class=\"col-sm-8\">\n");
      out.write("                                            <div class=\"input-group\">\n");
      out.write("                                                <input type=\"text\" class=\"form-control\" id=\"newPostcode\" name=\"newPostcode\"\n");
      out.write("                                                       ");
if (newPostcode != null) {
      out.write(" value=\"");
      out.print(newPostcode);
      out.write('"');
      out.write(' ');
}
      out.write("/>\n");
      out.write("                                                <span class=\"input-group-btn\">\n");
      out.write("                                                    <button class=\"btn btn-link\" type=\"button\" tabindex=\"-1\" data-toggle=\"popover\"\n");
      out.write("                                                            data-trigger=\"focus\" data-placement=\"bottom\" data-container=\"#signUp\"\n");
      out.write("                                                            data-content=\"Your postcode (4 numbers)\">\n");
      out.write("                                                        <span class=\"glyphicon glyphicon-question-sign\" style=\"font-size: 20px\"></span>\n");
      out.write("                                                    </button>\n");
      out.write("                                                </span>\n");
      out.write("                                            </div>\n");
      out.write("                                            ");
if (errNewPostcode != null) {
      out.write("  <small> ");
      out.print(errNewPostcode);
      out.write(" </small> ");
}
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <!-- Owner Picture -->\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <div class=\"col-sm-10\">\n");
      out.write("                                            <label for=\"newPicture\">Picture (optional)</label>\n");
      out.write("                                            <input type=\"file\" id=\"newPicture\" name=\"newPicture\"/>\n");
      out.write("                                        </div>\n");
      out.write("                                        <br/>\n");
      out.write("                                        <div class=\"col-sm-2\">\n");
      out.write("                                            <button class=\"btn btn-link\" type=\"button\" tabindex=\"-1\" data-toggle=\"popover\"\n");
      out.write("                                                    data-trigger=\"focus\" data-placement=\"bottom\" data-container=\"#signUp\"\n");
      out.write("                                                    data-content=\"Upload a picture for your profile (max. size: 1MB)\">\n");
      out.write("                                                <span class=\"glyphicon glyphicon-question-sign\" style=\"font-size: 20px\"></span>\n");
      out.write("                                            </button>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-footer\">\n");
      out.write("                            <div class=\"btn-group btn-group-sm\">\n");
      out.write("                                <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Cancel</button>\n");
      out.write("                                <input type=\"submit\" class=\"btn btn-warning\" id=\"signUpReset\" name=\"signUpReset\" value=\"Clear form\"/>\n");
      out.write("                                <input type=\"submit\" class=\"btn btn-primary\" id=\"signUpSubmit\" name=\"signUpSubmit\" value=\"Submit\"/>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!--Messsage Modal-->\n");
      out.write("        <div class=\"modal\" id=\"message\" tabindex=\"-1\" role=\"dialog\">\n");
      out.write("            <div class=\"modal-dialog\" style=\"margin-top: 10%\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("\n");
      out.write("                    <div class=\"modal-body\" style=\"text-align: center\">\n");
      out.write("                        <h2>");
      out.print(message);
      out.write("</h2>\n");
      out.write("                        ");
if (error != null) {
      out.write("\n");
      out.write("                        <h4>\n");
      out.write("                            Or report the error: <br/> <small> ");
      out.print(error);
      out.write(" </small>\n");
      out.write("                        </h4>\n");
      out.write("                        ");
}
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"modal-footer\" style=\"text-align: center\">\n");
      out.write("                        <input type=\"submit\" class=\"btn btn-warning\" style=\"width: 150px\"\n");
      out.write("                               data-dismiss=\"");
      out.print(buttonAction);
      out.write("\"  value=\"");
      out.print(buttonLabel);
      out.write("\"/>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- /container -->\n");
      out.write("        <!-- Bootstrap core JavaScript\n");
      out.write("            ================================================== -->\n");
      out.write("        <!-- Placed at the end of the document so the pages load faster -->\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

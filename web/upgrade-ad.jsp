<!DOCTYPE html>

<%
    session = request.getSession(true);
    String ownerID = (String) session.getAttribute("ownerID");
    String propertyID = (String) request.getParameter("propertyID");

    String signIn = (String) session.getAttribute("signIn");
    String signInError = (String) session.getAttribute("signInError");
    String signUpError = (String) session.getAttribute("signUpError");
    String messageModal = (String) session.getAttribute("messageModal");

    String message = (String) session.getAttribute("message");
    String error = (String) session.getAttribute("error");
    String action = (String) session.getAttribute("action");
    String buttonAction = (String) session.getAttribute("buttonAction");
    String buttonLabel = (String) session.getAttribute("buttonLabel");
%>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="ITC303 201460 Project">
        <meta name="author" content="SSX Team">
        <link rel="icon" href="images/favicon.ico">
        <title>SSX Real Estate</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-theme.min.css" rel="stylesheet">
        <script src="js/ie-emulation-modes-warning.js"></script>
        <script src="js/ie10-viewport-bug-workaround.js"></script>
    </head>
    <body>
        <div class="container">
            <!--Logo-->
            <div style="width: 400px; margin: auto;">
                <a href="index.jsp" data-toggle="tooltip" data-placement="bottom" title="Go to Home page">
                    <img src="images/SSX_logo_Blue.png" alt="SSX Real Estate"/></a>
            </div>

            <!--Navigation Bar-->
            <nav class="navbar navbar-default" style="background-image: linear-gradient(to bottom,#8897BB 0,#3D4C70 100%)">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
                            <span class="icon-bar" style=""></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        
                        <div class="navbar-brand" style="color: white; font-size: 26px">
                            <a style="color: white; font-size: 22px" href="index.jsp"
                            data-toggle="tooltip" data-placement="bottom" title="Go to Home page">
                            <span class="glyphicon glyphicon-home"></span></a>
                            &nbsp; Upgrade Ad to Premium</div>
                        </div>
                    <div class="collapse navbar-collapse" id="navbar">
                        <div class="navbar-form navbar-right" style="color: white">
                            <%if (signIn == "true") {%>
                                Signed in as: <%=ownerID%>
                                <a class="btn btn-link" style="font-weight: bold; color: white"
                                    data-toggle="tooltip" data-placement="bottom" title="Go to Dashboard" 
                                    href="servlet/LoadOwnerDashboard?ownerID=<%=ownerID%>">
                                    <span class="glyphicon glyphicon-cog" style="font-size: 18px"></span> </a>
                                <a class="btn btn-danger" href="servlet/SignOut">Sign out</a>
                            <%} else {%>
                                <div class="btn-group">
                                    <button class="btn btn-primary" data-toggle="modal" data-target="#signIn">Sign in</button>
                                    <button class="btn btn-warning" data-toggle="modal" data-target="#signUp">Sign up</button>
                                </div>
                            <%}%>
                        </div>
                    </div>
                </div>
            </nav>
                        
            <!--Bread crumb-->
            <ol class="breadcrumb">
                <li> <a href="index.jsp"> <strong> Home </strong> </a> </li>
                <li> <a href="servlet/LoadOwnerDashboard"> Owner's Dashboard </a> </li>
                <li class="active"> Upgrade to Premium </li>
            </ol>
            <!-- Main component for a primary marketing message or call to action -->
            <div style="height: 500px">
                <div class="page-header">
                    <h2>Property Id: <span style="color: #428bca"><%=propertyID%></span></h2>
                </div>
                <h3>
                    Please chose one of the following plans:
                </h3>
                <div style="margin: 50px 100px 0px 100px">
                        <!--<form action="servlet/UpgradeAdToPremium" method="post">-->
                    <table class="table" style="padding: 100px">
                        <thead>
                            <tr>
                                <th style="width: 400px; text-align: center">Characteristic</th>
                                <th style="width: 150px; text-align: center">Special Ad</th>
                                <th style="width: 150px; text-align: center">Sponsored Ad</th>
                                <th style="width: 150px; text-align: center">Top Ad</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>No of weeks available</td>
                                <td style="text-align: center">2</td>
                                <td style="text-align: center">3</td>
                                <td style="text-align: center">4</td>
                            </tr>
                            <tr>
                                <td>Published on the first page</td>
                                <td style="text-align: center">-</td>
                                <td style="text-align: center"><span class="glyphicon glyphicon-ok" style="color: #428bca"></span></td>
                                <td style="text-align: center"><span class="glyphicon glyphicon-ok" style="color: #428bca"></span></td>
                            </tr>
                            <tr>
                                <td>Large pictures</td>
                                <td style="text-align: center">-</td>
                                <td style="text-align: center"><span class="glyphicon glyphicon-ok" style="color: #428bca"></span></td>
                                <td style="text-align: center"><span class="glyphicon glyphicon-ok" style="color: #428bca"></span></td>
                            </tr>
                            <tr>
                                <td>Extra week if the property is still available at the end of the period</td>
                                <td style="text-align: center">-</td>
                                <td style="text-align: center">-</td>
                                <td style="text-align: center"><span class="glyphicon glyphicon-ok" style="color: #428bca"></span></td>
                            </tr>
                            <tr>
                                <td>Price</td>
                                <td style="text-align: center">$25.00</td>
                                <td style="text-align: center">$35.00</td>
                                <td style="text-align: center">$50.00</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align: center">
                                    <button type="submit" class="btn btn-warning" style="width: 150">Upgrade to Special</button>
                                </td>
                                <td style="text-align: center">
                                    <button type="submit" class="btn btn-warning" style="width: 150">Upgrade to Sponsored</button>
                                </td>
                                <td style="text-align: center">
                                    <button type="submit" class="btn btn-warning" style="width: 150">Upgrade to Top</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                        <!--</form>-->
                </div>
            </div>
            <div class="panel panel-default" style="background: linear-gradient(to bottom,#8897BB 0,#3D4C70 100%)">
                <div class="panel-body">
                    <div class="btn-group btn-group-justified">
                        <div class="btn-group">
                            <button type="button" class="btn btn-link" style="color: white; font-size: 12px;">Privacy Policy</button>
                        </div>
                        <div class="btn-group">
                            <button type="button" class="btn btn-link" style="color: white; font-size: 12px;">Conditions of use</button>
                        </div>
                        <div class="btn-group">
                            <button type="button" class="btn btn-link" style="color: white; font-size: 12px;">Site Map</button>
                        </div>
                        <div class="btn-group">
                            <button type="button" class="btn btn-link" style="color: white; font-size: 12px;">About us</button>
                        </div>
                        <div class="btn-group">
                            <button type="button" class="btn btn-link" style="color: white; font-size: 12px;">Admin Dashboard</button>
                        </div>
                    </div>
                    <p style="color: white; text-align: center; font-size: 12px;">
                        <br/>
                        © Copyright 2014 by SSX Real Estate Australia Pty Ltd - All rights reserved
                    </p>
                </div>
            </div>
        </div> <!-- /container -->
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <!--Messsage Modal-->
        <div class="modal" id="message" tabindex="-1" role="dialog">
            <div class="modal-dialog" style="margin-top: 10%">
                <div class="modal-content">
                    <form class="form-horizontal" action="<%=action%>" method="post">
                        <div class="modal-body" style="text-align: center">
                                <h2><%=message%></h2>
                                <%if (error != null) {%>
                            <h4>
                                Or report the error: <br/> <small> <%=error%> </small>
                            </h4>
                                <%}%>
                        </div>
                        <div class="modal-footer" style="text-align: center">
                            <input type="submit" class="btn btn-warning" style="width: 150px"
                                id="<%=buttonAction%>" name="<%=buttonAction%>" value="<%=buttonLabel%>"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

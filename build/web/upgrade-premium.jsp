<%-- 
    Document   : upgrade-premium
    Created on : May 2, 2015, 8:48:02 PM
    Author     : Keanu
--%>
<!DOCTYPE html>
<html lang="en">
    <!--last edit 2015-05-01 by wang-->


    <%
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

        String propertyID = (String) request.getParameter("propertyID");
        String premiumType = (String) request.getParameter("premiumType");
        String amountPaid = (String) request.getParameter("amountPaid");


    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="ITC303 201460 Project">
        <meta name="author" content="SSX Team">
        <link rel="icon" href="images/favicon.ico">
        <title>SSX Real Estate - Upgrade Ad to Premium</title>
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-theme.min.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <!--<link href="css/navbar.css" rel="stylesheet">-->
        <!--<link href="css/grid.css" rel="stylesheet">-->
        <!--<link href="css/theme.css" rel="stylesheet">-->
        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="js/ie-emulation-modes-warning.js"></script>
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="js/ie10-viewport-bug-workaround.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->
        <style type="text/css">
            small {
                color: red;
            }

        </style>
        <style>
            /* GENERAL STYLES */
            body {
                padding-top: 70px; /*REQUIRED FOR FIXED TOP NAVBAR*/
            }
            /* CREDIT CARD DIV STYLES */

            .credit-card-div  span {
                padding-top:10px;
            }
            .credit-card-div img {
                padding-top:30px;
            }
            .credit-card-div .small-font {
                font-size:9px;
            }
            .credit-card-div .pad-adjust {
                padding-top:10px;
            }
        </style>


        <script>
            var signInError = "<%=signInError%>";
            if (signInError == "true") {
                $(function () {
                    $('#signIn').modal();
                });
            }
            var signUpError = "<%=signUpError%>";
            if (signUpError == "true") {
                $(function () {
                    $('#signUp').modal();
                });
            }
            $(function () {
                $('[data-toggle="tooltip"]').tooltip();
                $('[data-toggle="popover"]').popover();
            });
            var messageModal = "<%=messageModal%>";
            if (messageModal == "true") {
                $(function () {
                    $('#message').modal();
                });
            }
        </script>
        <%if (propertyID == null) {%> <meta http-equiv="refresh" content="0; url=owner-dashboard.jsp"> <%} %>
        <%if (premiumType == null) {%> <meta http-equiv="refresh" content="0; url=owner-dashboard.jsp"> <%} %>
    </head>

    <body>
        <div class="container">
            <!-- Logo -->
            <div style="width: 400px; margin: auto;">
                <a href="index.jsp">
                    <img src="images/SSX_logo_Blue.png" alt="SSX Real Estate" />
                </a>
            </div>
            <!-- Static navbar -->
            <nav class="navbar navbar-default" style="background-image: linear-gradient(to bottom,#8897BB 0,#3D4C70 100%)">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
                            <span class="icon-bar" style=""></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse" id="navbar">
                        <form class="navbar-form navbar-left" action="search-properties.jsp" method="post">
                            <div class="input-group" style="width: 300px">
                                <input type="text" class="form-control" name="searchCriteria" placeholder="Enter any keyword...">
                                <span class="input-group-btn">
                                    <button class="btn btn-warning" type="submit" name="search" value="search">
                                        <span class="glyphicon glyphicon-search"></span></button>
                                </span>
                            </div>
                        </form>
                        <div class="navbar-form navbar-left" action="">
                            <a class="btn btn-link" style="color: white" href="search-properties.jsp"><strong>Advanced Search</strong></a>
                        </div>
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
            <!-- Main component for a primary marketing message or call to action -->
            <div class="row">
                <div class="col-md-12" style="margin-top: 15px">
                    <ol class="breadcrumb">
                        <li> <a href="index.jsp"> <strong> Home </strong> </a> </li>
                        <li> <a href="servlet/LoadOwnerDashboard"> Owner's Dashboard </a> </li>
                        <li class="active"> Upgrade to Premium </li>
                    </ol>



                    <!--payment body-->
                    <div class="panel panel-default">
                        <div class="panel-heading">Payment Method</div>
                        <div class="panel-body"><h3> <%if (ownerID != null) {%> Hi <%=ownerID%> ,<%}%>  Your proeprty ID : <kbd><%=propertyID%></kbd> , 
                                You choose premium type <kbd><%=premiumType%></kbd>, the amount you need to paid :<kbd><%=amountPaid%></kbd></h3> </div>
                        <table class="table table-striped">
                            ${param.premiumType=='Special'?'
                              <tr><td>Number of weeks premium ad :</td><td><kbd>2</kbd></td></tr>
                              <tr><td>Published on the first page :</td><td><kbd>No</kbd></td></tr>
                              <tr><td>Large pictures :</td><td><kbd>No</kbd></td></tr>
                              <tr><td>Extra week if the property is still available at the end of the period :</td><td><kbd>No</kbd></td></tr>
                              ':''}
                            ${param.premiumType=='Sponsored'?'
                              <tr><td>Number of weeks premium ad :</td><td><kbd>3</kbd></td></tr>
                              <tr><td>Published on the first page :</td><td><kbd>YES</kbd></td></tr>
                              <tr><td>Large pictures :</td><td><kbd>YES</kbd></td></tr>
                              <tr><td>Extra week if the property is still available at the end of the period :</td><td><kbd>No</kbd></td></tr>
                              ':''}
                            ${param.premiumType=='Top'?'
                              <tr><td>Number of weeks premium ad :</td><td><kbd>4</kbd></td></tr>
                              <tr><td>Published on the first page :</td><td><kbd>YES</kbd></td></tr>
                              <tr><td>Large pictures :</td><td><kbd>YES</kbd></td></tr>
                              <tr><td>Extra week if the property is still available at the end of the period :</td><td><kbd>YES</kbd></td></tr>
                              ':''}
                            </table>
                        

                        <center>
                            <button class="btn btn-primary" data-toggle="modal" data-target="#visa">Credit Card</button>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <button class="btn btn-primary" data-toggle="modal" data-target="#paypal">Paypal</button>
                        </center>
                        </div>
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
                        <br/>© Copyright 2014 by SSX Real Estate Australia Pty Ltd - All rights reserved
                    </p>
                </div>
            </div>
        </div>
        <!--Sign in Modal-->
        <div class="modal" id="signIn" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="margin-top: 10%">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Sign in</h4>
                    </div>
                    <form action="servlet/SignIn" method="post" id="signIn">
                        <div class="modal-body">
                            <input type="text" class="form-control" id="ownerID" name="ownerID" placeholder="Username"
                                   <%if (ownerID != null) {%> value="<%=ownerID%>" <%}%>/>
                            <%if (errOwnerID != null) {%>  <small> <%=errOwnerID%> </small> <%}%>
                            <br/>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Password"/>
                            <%if (errPassword != null) {%>  <small> <%=errPassword%> </small> <%}%>
                        </div>
                        <div class="modal-footer">
                            <div class="btn-group btn-group-sm">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                <input type="submit" class="btn btn-primary" id="signInSubmit" name="signInSubmit" value="Submit"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--Sign up Modal-->
        <div class="modal " id="signUp"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" style="margin-top: 10%">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Sign up</h4>
                    </div>
                    <form class="form-horizontal" action="servlet/SignUp" method="post" id="signUpForm" enctype="multipart/form-data">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <!-- Username -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newOwnerID">Username</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newOwnerID" name="newOwnerID"
                                                       <%if (newOwnerID != null) {%> value="<%=newOwnerID%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#signUp"
                                                            data-content="Must be 6 to 10 characters long)">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewOwnerID != null) {%> <small> <%=errNewOwnerID%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- Password -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newPassword">Password</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="password" class="form-control" id="newPassword" name="newPassword"
                                                       <%if (newPassword != null) {%> value="<%=newPassword%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#signUp"
                                                            data-content="Must be 6 to 10 characters long">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewPassword != null) {%>  <small> <%=errNewPassword%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- Confirm password -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="cfmNewPassword">Confirm password</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="password" class="form-control" id="cfmNewPassword" name="cfmNewPassword"
                                                       <%if (cfmNewPassword != null) {%> value="<%=cfmNewPassword%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#signUp"
                                                            data-content="Must match password field">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errCfmNewPassword != null) {%>  <small> <%=errCfmNewPassword%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- First name -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newFirstName">First name</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newFirstName" name="newFirstName"
                                                       <%if (newFirstName != null) {%> value="<%=newFirstName%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#signUp"
                                                            data-content="Your first name (only letters)">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewFirstName != null) {%>  <small> <%=errNewFirstName%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- Last name -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newLastName">Last name</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newLastName" name="newLastName"
                                                       <%if (newLastName != null) {%> value="<%=newLastName%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#signUp"
                                                            data-content="Your last name (only letters)">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewLastName != null) {%>  <small> <%=errNewLastName%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- Email -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newEmail">email</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="email" class="form-control" id="newEmail" name="newEmail"
                                                       <%if (newEmail != null) {%> value="<%=newEmail%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#signUp"
                                                            data-content="Format must be: email@server.com">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewEmail != null) {%>  <small> <%=errNewEmail%> </small> <%}%>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <!-- Phone number -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newPhone">Phone number</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newPhone" name="newPhone"
                                                       <%if (newPhone != null) {%> value="<%=newPhone%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#signUp"
                                                            data-content="Only numbers">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewPhone != null) {%>  <small> <%=errNewPhone%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- Address -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newAddress">Address</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newAddress" name="newAddress"
                                                       <%if (newAddress != null) {%> value="<%=newAddress%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#signUp"
                                                            data-content="Your street address">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewAddress != null) {%>  <small> <%=errNewAddress%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- Suburb -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newSuburb">Suburb</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newSuburb" name="newSuburb"
                                                       <%if (newSuburb != null) {%> value="<%=newSuburb%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#signUp"
                                                            data-content="Your suburb">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewSuburb != null) {%>  <small> <%=errNewSuburb%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- State -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newState">State</label>
                                        <div class="col-sm-4">
                                            <select class="form-control" id="newState" name="newState">
                                                <option></option>
                                                <option value="ACT" <%if (newState != null) {
                                                        if (newState.equals("ACT")) {%> <%="selected"%> <%}
                                                            }%>>ACT</option>
                                                <option value="NSW" <%if (newState != null) {
                                                        if (newState.equals("NSW")) {%> <%="selected"%> <%}
                                                            }%>>NSW</option>
                                                <option value="NT" <%if (newState != null) {
                                                        if (newState.equals("NT")) {%> <%="selected"%> <%}
                                                            }%>>NT</option>
                                                <option value="QLD" <%if (newState != null) {
                                                        if (newState.equals("QLD")) {%> <%="selected"%> <%}
                                                            }%>>QLD</option>
                                                <option value="SA" <%if (newState != null) {
                                                        if (newState.equals("SA")) {%> <%="selected"%> <%}
                                                            }%>>SA</option>
                                                <option value="TAS" <%if (newState != null) {
                                                        if (newState.equals("TAS")) {%> <%="selected"%> <%}
                                                            }%>>TAS</option>
                                                <option value="VIC" <%if (newState != null) {
                                                        if (newState.equals("VIC")) {%> <%="selected"%> <%}
                                                            }%>>VIC</option>
                                                <option value="WA" <%if (newState != null) {
                                                        if (newState.equals("WA")) {%> <%="selected"%> <%}
                                                            }%>>WA</option>
                                            </select>
                                            <%if (errNewState != null) {%>  <small> <%=errNewState%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- Owner Postcode -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newPostcode">Postcode</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newPostcode" name="newPostcode"
                                                       <%if (newPostcode != null) {%> value="<%=newPostcode%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#signUp"
                                                            data-content="Your postcode (4 numbers)">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewPostcode != null) {%>  <small> <%=errNewPostcode%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- Owner Picture -->
                                    <div class="form-group">
                                        <div class="col-sm-10">
                                            <label for="newPicture">Picture (optional)</label>
                                            <input type="file" id="newPicture" name="newPicture"/>
                                        </div>
                                        <br/>
                                        <div class="col-sm-2">
                                            <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                    data-trigger="focus" data-placement="bottom" data-container="#signUp"
                                                    data-content="Upload a picture for your profile (max. size: 1MB)">
                                                <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="btn-group btn-group-sm">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                <input type="submit" class="btn btn-warning" id="signUpReset" name="signUpReset" value="Clear form"/>
                                <input type="submit" class="btn btn-primary" id="signUpSubmit" name="signUpSubmit" value="Submit"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--Credit card modal-->
        <div class="modal" id="visa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                        </button>
                        <center>
                            <h4 class="modal-title" id="myModalLabel">Credit Card Form</h4>
                        </center>
                    </div>
                    <div class="modal-body">
                        <form action="upgradepremium" method="post" id="upgradepremium">
                            <div class="credit-card-div">
                                <div class="panel panel-default">
                                    <div class="panel-heading">

                                        <div class="row ">
                                            <div class="col-md-12">
                                                <input type="number" class="form-control" placeholder="Enter Card Number" required>
                                            </div>
                                        </div>
                                        <div class="row ">
                                            <div class="col-md-3 col-sm-3 col-xs-3">
                                                <span class="help-block text-muted small-font"> Expiry Month</span>
                                                <input type="number" class="form-control" placeholder="MM" required>
                                            </div>
                                            <div class="col-md-3 col-sm-3 col-xs-3">
                                                <span class="help-block text-muted small-font">  Expiry Year</span>
                                                <input type="number" class="form-control" placeholder="YY"required>
                                            </div>
                                            <div class="col-md-3 col-sm-3 col-xs-3">
                                                <span class="help-block text-muted small-font">  CCV</span>
                                                <input type="number" class="form-control" placeholder="CCV"required>
                                            </div>
                                            <div class="col-md-3 col-sm-3 col-xs-3">
                                                <img src="images/visa.png" class="img-rounded">
                                            </div>
                                        </div>
                                        <div class="row ">
                                            <div class="col-md-12 pad-adjust">

                                                <input type="text" class="form-control" placeholder="Name On The Card" required>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 pad-adjust">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" checked="" class="text-muted"> Save details for fast payments <a href="#"> learn how ?</a>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row ">
                                            <div class="col-md-6 col-sm-6 col-xs-6 pad-adjust">
                                                <button type="button" class="btn btn-danger" data-dismiss="modal">CANCEL</button>

                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-6 pad-adjust">
                                                <input type="hidden" id="propertyID" name="propertyID" value="<%=propertyID%>" />
                                                <input type="hidden" id="premiumType" name="premiumType" value="<%=premiumType%>" />
                                                <input type="hidden" id="amountPaid" name="amountPaid" value="<%=amountPaid%>"/>
                                                <input type="submit" class="btn btn-warning btn-block" id="PAYNOW" name="PAY NOW" value="PAY NOW"/>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div></form></div>
                </div>
                <!-- CREDIT CARD DIV END -->
            </div>
        </div>
        <!--paypal modal-->
        <div class="modal" id="paypal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                        </button>
                        <center>
                            <h4 class="modal-title" id="myModalLabel">Paypal Form</h4>
                        </center>
                    </div>
                    <div class="modal-body">
                        <form action="upgradepremium" method="post" id="upgradepremium">
                            <div class="credit-card-div">
                                <div class="panel panel-default">
                                    <div class="panel-heading">

                                        <div class="row ">
                                            <div class="col-md-12">
                                                <input type="email" class="form-control" placeholder="Paypal Email" required>
                                            </div>
                                        </div>
                                        <div class="row ">
                                            <div class="col-md-12 pad-adjust">

                                                <input type="password" class="form-control" placeholder="Paypal password" required>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 pad-adjust">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" checked="" class="text-muted"> Save details for fast payments <a href="#"> learn how ?</a>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row ">
                                            <div class="col-md-6 col-sm-6 col-xs-6 pad-adjust">
                                                <button type="button" class="btn btn-danger" data-dismiss="modal">CANCEL</button>

                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-6 pad-adjust">
                                                <input type="hidden" id="propertyID" name="propertyID" value="<%=propertyID%>" />
                                                <input type="hidden" id="premiumType" name="premiumType" value="<%=premiumType%>" />
                                                <input type="hidden" id="amountPaid" name="amountPaid" value="<%=amountPaid%>"/>
                                                <input type="submit" class="btn btn-warning btn-block" id="PAYNOW" name="PAY NOW" value="PAY NOW"/>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div></form></div>
                </div>

            </div>
        </div>
        <!-- /container -->
        <!-- Bootstrap core JavaScript
            ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->

    </body>

</html>

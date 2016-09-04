<!DOCTYPE html>
<html lang="en">
    <!--last edit 2015-05-01 by sanip-->


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
    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="ITC303 201460 Project">
        <meta name="author" content="SSX Team">
        <link rel="icon" href="images/favicon.ico">
        <title>SSX Real Estate - about</title>
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-theme.min.css" rel="stylesheet">
        <!--<link href="css/navbar.css" rel="stylesheet">-->
        <!--<link href="css/grid.css" rel="stylesheet">-->
        <!--<link href="css/theme.css" rel="stylesheet">-->
        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

        <script type= "text/javascript" src="js/ie-emulation-modes-warning.js"></script>
        <script type= "text/javascript" src="js/ie10-viewport-bug-workaround.js"></script>
        <script type= "text/javascript" src="js/jquery.min.js"></script>
        <script type= "text/javascript" src="js/bootstrap.min.js"></script>
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->
        <style type="text/css">
            small {
                color: red;
            }
            .header {

                color: #36A0FF;
                height: 70px;
                font-size: 27px;
                padding: 10px;
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
                        <li><a href="#">Home</a>
                        </li>
                        <li class="active">about us</li>
                    </ol>




                    <div class="panel panel-default">
                        <div class="panle-body" style="margin:15px">
                            <legend>About us</legend>

                            <!--information-->

                            <p>SSX Realestate </p>
                            <ul>
                                <li>sell property</li>
                                <li>rent property</li>
                                <li>property ad</li>
                                <li>premium owners</li>
                                <li>premium property</li>
                            </ul>

                        </div>
                    </div>

                </div>
                <!-- Contact with Map - START -->
                <div class="container">
                    <div class="row">

                        <div class="col-md-6">
                            <div>
                                <div class="panel panel-default">

                                    <div class="panel-body text-center">
                                        <h4>Address</h4>
                                        <div>
                                            2217 Oxford Street<br />
                                            Darlinghurst NSW<br />
                                            #(0061) 1234 1234<br />
                                            service@ssxrealestate.com<br />
                                        </div>
                                        <hr />
                                        <div id="map1" class="map"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d424396.3176723366!2d150.92243255000005!3d-33.796923500000005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b129838f39a743f%3A0x3017d681632a850!2sSydney+NSW!5e0!3m2!1sen!2sau!4v1430480015290" width="530" height="280" frameborder="0" style="border:0"></iframe>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <form class="form-horizontal"  action="ContactAdmin" method = "post" name="ContactAdmin" id="ContactAdmin">


                                <legend class="text-center header">Contact us</legend>
                                <div class="form-group">
                                    <div class="col-md-10 col-md-offset-1">
                                        <input id="contactName" name="contactName" type="text" placeholder="Contact Name" class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-10 col-md-offset-1">
                                        <input id="contactEmail" name="contactEmail" type="email" placeholder="Email Address" class="form-control" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-10 col-md-offset-1">

                                        <select class="form-control col-sm-4" name="messageSubject" id="messageSubject">
                                            <option value="Suggest">Suggest</option>
                                            <option value="Sell">Sell</option>
                                            <option value="Rent">Rent</option>
                                            <option value="Bug">Bug report</option>
                                        </select>

                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-10 col-md-offset-1">
                                        <textarea class="form-control" id="adminMessages" name="adminMessages" placeholder="Enter your massage for us here. We will get back to you within 2 business days." rows="7" required></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12 text-center">
                                        <input class="btn btn-primary"  type="submit"  id="submit" name="submit" value="submit">
                                    </div>
                                </div>

                            </form>

                        </div>
                    </div>
                </div>








                <!-- Contact with Map - END -->

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
                        <br/>© Copyright 2016 by SSX Real Estate Australia Pty Ltd - All rights reserved
                    </p>
                </div>
            </div>
        </div>
        <!--Sign in Modal-->
        <div class="modal" id="signIn" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
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
        <div class="modal " id="signUp" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
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
        <!--Messsage Modal-->
        <div class="modal" id="message" tabindex="-1" role="dialog">
            <div class="modal-dialog" style="margin-top: 10%">
                <div class="modal-content">

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
                               data-dismiss="<%=buttonAction%>"  value="<%=buttonLabel%>"/>

                    </div>


                </div>
            </div>
        </div>



        <!-- /container -->
        <!-- Bootstrap core JavaScript
            ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->

    </body>

</html>

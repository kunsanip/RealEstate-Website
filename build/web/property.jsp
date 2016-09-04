<!DOCTYPE html>

<%@page import="java.util.ArrayList"%>
<%@page import="beans.Owner"%>
<%@page import="beans.Property"%>
<%@page import="beans.Comment"%>

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
    
    Owner ownerBean = (Owner) session.getAttribute("ownerBean");
    Property propertyBean = (Property) session.getAttribute("propertyBean");
    ArrayList<Comment> commentsList = (ArrayList<Comment>) session.getAttribute("commentsList");
    ArrayList<String> favoritesList = (ArrayList<String>) session.getAttribute("favoritesList");
    ArrayList<String> comparisonList = (ArrayList<String>) session.getAttribute("comparisonList");
    boolean comparator = false;
    boolean favorite = false;
    
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
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-theme.css">
        <script type= "text/javascript" src="js/ie-emulation-modes-warning.js"></script>
        <script type= "text/javascript" src="js/ie10-viewport-bug-workaround.js"></script>
        <script type= "text/javascript" src="js/jquery.min.js"></script>
        <script type= "text/javascript" src="js/bootstrap.min.js"></script>

        <style type="text/css">
            small {
                color: red;
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

        <!--Container-->
        <div class="container">

            <!--Logo-->
            <div style="width: 400px; margin: auto;">
                <a href="index.jsp" data-toggle="tooltip" data-placement="bottom" title="Go to Home page">
                    <img src="images/SSX_logo_Blue.png" alt="SSX Real Estate"/></a>
            </div>

            <!--Navigation Bar-->
            <nav class="navbar navbar-default" style="background: #505585">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
                            <span class="icon-bar" style=""></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <div class="navbar-brand" style="color: white; font-size: 26px">
                            <a style="color: turquoise; font-size: 22px" href="index.jsp"
                            onmouseover="this.style.color = 'cyan'" onmouseout="this.style.color = 'turquoise'"
                            data-toggle="tooltip" data-placement="bottom" title="Go to Home page">
                            <span class="glyphicon glyphicon-home"></span></a> &nbsp; Property Details
                        </div>
                    </div>
                    <div class="collapse navbar-collapse" id="navbar">
                        <div class="navbar-form navbar-right" style="color: white">
                            <%if (signIn == "true") {%>
                                Signed in as: <%=ownerID%> &nbsp;
                                <a class="btn btn-link" style="color: turquoise" onmouseover="this.style.color = 'cyan'"
                                        onmouseout="this.style.color = 'turquoise'"
                                    data-toggle="tooltip" data-placement="bottom" title="Go to Dashboard" 
                                    href="servlet/LoadOwnerDashboard?ownerID=<%=ownerID%>">
                                    <span class="glyphicon glyphicon-cog" style="font-size: 18px"></span></a>
                                &nbsp;<strong style="font-size: 18px">|</strong>&nbsp;
                                <a class="btn btn-link" style="color: orange" onmouseover="this.style.color = '#ffcc33'"
                                        onmouseout="this.style.color = 'orange'" href="servlet/SignOut"
                                   data-toggle="tooltip" data-placement="bottom" title="Sign out">
                                <span class="glyphicon glyphicon-log-out" style="font-size: 18px"></span></a>
                            <%} else {%>
                                <button class="btn btn-link" data-toggle="modal" data-target="#signIn">
                                    <span style="color: turquoise" onmouseover="this.style.color = 'cyan'"
                                        onmouseout="this.style.color = 'turquoise'"
                                        data-toggle="tooltip" data-placement="bottom"title="Sign in">
                                        <span class="glyphicon glyphicon-user" style="font-size: 18px"></span>
                                        <span class="glyphicon glyphicon-ok"></span>
                                    </span>
                                </button>
                                &nbsp;<strong style="font-size: 18px">|</strong>&nbsp;
                                <button class="btn btn-link" data-toggle="modal" data-target="#signUp">
                                    <span style="color: orange" onmouseover="this.style.color = '#ffcc33'"
                                        onmouseout="this.style.color = 'orange'"
                                        data-toggle="tooltip" data-placement="bottom"title="Sign up">
                                        <span class="glyphicon glyphicon-user" style="font-size: 18px"></span>
                                        <span class="glyphicon glyphicon-plus"></span>
                                    </span>
                                </button>
                            <%}%>
                        </div>
                    </div>
                </div>
            </nav>
                        
            <!--Bread crumb-->
            <ol class="breadcrumb">
                <li> <a href="index.jsp"> <strong> Home </strong> </a> </li>
                <li class="active"> Property Details </li>
            </ol>

            <!--Main Content-->
            <div class="row">

                <!--Left Panel-->
                <div class="col-sm-8">

                    <!-- Property Box-->
                    <%if ((propertyBean.getAdType()).equals("Premium")) {%>
                    <div class="panel panel-warning">
                    <%} else {%>
                    <div class="panel panel-primary">
                    <%}%>
                    <!-- Property Box Heading-->
                    <div class="panel-heading">
                        <div class="row">
                            <%if ((propertyBean.getAdType()).equals("Premium")) {%>
                            <div class="col-xs-1">
                                <img src="images/premium-badge.png" style="width: 50px"/>
                            </div>
                            <div class="col-xs-7">
                            <%} else {%>
                            <div class="col-xs-8">
                            <%}%>
                                <h3 class="panel-title">
                                    <%=propertyBean.getPropertyAddress()%>, 
                                    <%=propertyBean.getPropertySuburb()%>, 
                                    <%=propertyBean.getPropertyState()%>, 
                                    <%=propertyBean.getPropertyPostcode()%>
                                </h3>
                            </div>
                            <div class="col-xs-4">
                                <h3 class="panel-title text-right"> $<%=propertyBean.getPropertyPrice()%> </h3>
                            </div>
                        </div>
                    </div>
                    <!-- Property Box Body-->
                    <div class="panel-body">
                        <div id="property_pictures" class=" thumbnail">
                            <img class="img-rounded" src="servlet/LoadPropertyPicture?propertyID=<%=propertyBean.getPropertyID()%>"
                                 onError="this.onerror=null; this.src='images/property-placeholder.png';"/>
                        </div>
                            <div style="float: right">
                                <%if ((propertyBean.getAdPurpose()).equals("For sale")) {%>
                                <img style="width: 150px" src="images/for_sale.png"/>
                                <%} else {%>
                                <img style="width: 150px" src="images/for_rent.png"/>
                                 <%}%>
                            </div>
                            <h4> <strong> <%=propertyBean.getPropertyType()%> </strong> </h4>
                            <p>
                                <img src="images/beds.png" title="Bedrooms"/>
                                <%=propertyBean.getPropertyBedrooms()%>
                                <img src="images/baths.png" title="Bathrooms"/>
                                <%=propertyBean.getPropertyBathrooms()%>
                                <img src="images/parking_spaces.png" title="Parking Spaces"/>
                                <%=propertyBean.getPropertyCarSpaces()%>
                            </p>
                            <p><strong>Property size:</strong> <%=propertyBean.getPropertySize()%>m&sup2;<br/>
                               <strong>Ad published in: </strong> <%=propertyBean.getDateCreated()%></p>
                            <p>
                                <strong> <%=propertyBean.getAdTitle()%> </strong> <br/>
                                <span style="font-size: 12px"> <%=propertyBean.getPropertyDescription()%> </span>
                            </p>
                            
                            <div class="pull-right">
                                <% if(favoritesList != null){
                                    for (int j = 0; j < favoritesList.size(); j++){
                                        if((favoritesList.get(j)).equals(propertyBean.getPropertyID())){
                                        favorite = true;
                                        }
                                    }
                                }
                                if(comparisonList != null){
                                    for (int j = 0; j < comparisonList.size(); j++){
                                        if((comparisonList.get(j)).equals(propertyBean.getPropertyID())){
                                        comparator = true;
                                        }
                                    }
                                }%>
                                <%if(favorite){%>
                                <a class="btn btn-sm btn-warning"
                                   href="servlet/LoadFavorites"
                                   data-toggle="tooltip" data-placement="bottom" title="Display favorites">
                                    <span class="glyphicon glyphicon-star"></span></a>
                                <%}%>
                                &nbsp;&nbsp;
                                <%if(comparator && comparisonList.size() > 1){%>
                                <a class="btn btn-sm btn-success"
                                   href="servlet/LoadCompareProperties"
                                   data-toggle="tooltip" data-placement="bottom" title="Compare properties">
                                    <span class="glyphicon glyphicon-stats"></span></a>
                                <%}%>
                                &nbsp;&nbsp;
                                <div class="btn-group">
                                    <%if(favorite){%>
                                    <a class="btn btn-lg btn-default"
                                       href="servlet/ManageFavorites?propertyID=<%=propertyBean.getPropertyID()%>&from=/servlet/LoadPropertyDetails&favorite=remove"
                                       data-toggle="tooltip" data-placement="bottom" title="Remove from favorites">
                                        <span class="glyphicon glyphicon-star" style="color: orange"></span></a>
                                    <%}else{%>
                                    <a class="btn btn-lg btn-default"
                                       href="servlet/ManageFavorites?propertyID=<%=propertyBean.getPropertyID()%>&from=/servlet/LoadPropertyDetails&favorite=add"
                                       data-toggle="tooltip" data-placement="bottom" title="Save to favorites">
                                       <span class="glyphicon glyphicon-star"></span></a>
                                    <%}favorite = false;%>

                                    <%if(comparator){%>
                                    <a class="btn btn-lg btn-default"
                                       href="servlet/ManageComparisonList?propertyID=<%=propertyBean.getPropertyID()%>&from=/servlet/LoadPropertyDetails&comparator=remove"
                                       data-toggle="tooltip" data-placement="bottom" title="Remove from comparison list">
                                        <span class="glyphicon glyphicon-stats" style="color: green"></span></a>
                                    <%}else{%>
                                    <a class="btn btn-lg btn-default"
                                       href="servlet/ManageComparisonList?propertyID=<%=propertyBean.getPropertyID()%>&from=/servlet/LoadPropertyDetails&comparator=add"
                                       data-toggle="tooltip" data-placement="bottom" title="Add to comparison list">
                                       <span class="glyphicon glyphicon-stats"></span></a>
                                    <%}comparator = false;%>

                                <button type="button" class="btn btn-lg btn-default" data-toggle="modal" data-target="#bookInspection"
                                    data-property="<%=propertyBean.getPropertyID()%>" data-owner="<%=ownerBean.getOwnerID()%>">
                                    <span class="glyphicon glyphicon-calendar"
                                    data-toggle="tooltip" data-placement="bottom" title="Book an inspection"></span></button>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>

                <!--Right Panel-->
                <div class="col-sm-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Owner</h3>
                        </div>
                        <div class="panel-body">
                            <!--Owner-->
                            <div class="row">
                                <div class="col-xs-4">
                                    <div class="thumbnail" style="width: 90px">
                                        <a href="#" data-toggle="modal" data-target="#contactOwner"
                                            data-owner="<%=ownerBean.getOwnerID()%>">
                                        <img class="img-rounded" data-toggle="tooltip" data-placement="bottom"title="Contact owner"
                                            src="servlet/LoadOwnerPicture?ownerID=<%=ownerBean.getOwnerID()%>"
                                            onError="this.onerror=null; this.src='images/owner-placeholder.png';"/>
                                        </a>
                                    </div>
                                </div>
                                <div class="caption col-xs-8">
                                    <h4> <%=ownerBean.getFirstName()%> &nbsp; <%=ownerBean.getLastName()%> </h4>
                                    <table>
                                        <tr>
                                            <th style="width: 110px">Member since:</th>
                                            <td> <span class="text-primary">  <%=ownerBean.getMemberSince()%>  </span> </td>
                                        </tr>
                                        <tr>
                                            <th>Properties:</th>
                                            <td> <span class="text-primary"> <%=ownerBean.getTotalProperties()%> </span> </td>
                                        </tr>
                                    </table>
                                    <br/>
                                            <div class="btn-group pull-right">
                                                <button type="button" class="btn btn-link" 
                                                    data-toggle="tooltip" data-placement="bottom"title="View properties">
                                                    <span class="glyphicon glyphicon-folder-open"></span></button>
                                                <button type="button" class="btn btn-link" data-toggle="modal"
                                                    data-target="#contactOwner" data-owner="<%=ownerBean.getOwnerID()%>">
                                                    <span data-toggle="tooltip" data-placement="bottom"title="Contact owner">
                                                    <span class="glyphicon glyphicon-envelope"></span></span></button>
                                            </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--comments-->
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Comments</h3>
                        </div>
                        <div class="panel-body">
                            <!--Comment form-->
                            <div class="panel panel-default">
                                <div class="panel-heading"> <strong>Leave your comment</strong></div>
                                <div class="panel-body">
                                    <form action="servlet/AdComment" method="post">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="customerName"
                                                placeholder="Enter your name">
                                        </div>
                                        <div class="form-group">
                                            <input type="email" class="form-control" name="customerEmail"
                                                placeholder="Enter your email">
                                        </div>
                                        <div class="form-group">
                                            <textarea class="form-control" name="comment" rows="4"
                                                placeholder="Enter your comment here"></textarea>
                                        </div>
                                        <input type="hidden" name="propertyID" value="<%=propertyBean.getPropertyID()%>">
                                        <div class="pull-right"> <button type="submit" class="btn btn-sm btn-default">Submit</button> </div>
                                    </form>
                                </div>
                            </div>
                            <!--Comments-->
                            <%for (int i = 0; i < commentsList.size(); i++) {%>
                            <div class="panel panel-default">
                                <div class="panel-heading"> <strong><%=(commentsList.get(i)).getCustomerName()%></strong>
                                    <span class="pull-right"><%=(commentsList.get(i)).getCommentDate()%></span></div>
                                <div class="panel-body">
                                    <p><%=(commentsList.get(i)).getComment()%></p>                            
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>

            <!--Footer-->
            <div class="panel panel-default" style="background: #505585">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-8">
                            <div class="btn-group btn-group-justified">
                                <div class="btn-group">
                                    <a class="btn btn-link" style="color: whitesmoke; font-size: 12px;" href="index.jsp">Privacy Policy</a>
                                </div>
                                <div class="btn-group">
                                    <a class="btn btn-link" style="color: whitesmoke; font-size: 12px;" href="index.jsp">Conditions of use</a>
                                </div>
                                <div class="btn-group">
                                    <a class="btn btn-link" style="color: whitesmoke; font-size: 12px;" href="index.jsp">Site Map</a>
                                </div>
                                <div class="btn-group">
                                    <a class="btn btn-link" style="color: whitesmoke; font-size: 12px;" href="about-us.jsp">About us</a>
                                </div>
                                <div class="btn-group">
                                    <a class="btn btn-link" style="color: whitesmoke; font-size: 12px;" data-toggle="modal" data-target="#adminSignIn">Admin Dashboard</a>
                                </div>
                            </div>
                            <p style="color: white; text-align: center; font-size: 12px;">
                                © Copyright 2014 by SSX Real Estate Australia Pty Ltd - All rights reserved
                            </p>
                        </div>
                        <div class="col-md-2">
                        </div>
                    </div>
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
                                <input type="submit" class="btn btn-default" id="signInCancel" name="signInCancel" value="Cancel"/>
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
                                                    <option value="ACT" <%if(newState!=null) {if(newState.equals("ACT")) {%> <%="selected"%> <%}}%>>ACT</option>
                                                    <option value="NSW" <%if(newState!=null) {if(newState.equals("NSW")) {%> <%="selected"%> <%}}%>>NSW</option>
                                                    <option value="NT" <%if(newState!=null) {if(newState.equals("NT")) {%> <%="selected"%> <%}}%>>NT</option>
                                                    <option value="QLD" <%if(newState!=null) {if(newState.equals("QLD")) {%> <%="selected"%> <%}}%>>QLD</option>
                                                    <option value="SA" <%if(newState!=null) {if(newState.equals("SA")) {%> <%="selected"%> <%}}%>>SA</option>
                                                    <option value="TAS" <%if(newState!=null) {if(newState.equals("TAS")) {%> <%="selected"%> <%}}%>>TAS</option>
                                                    <option value="VIC" <%if(newState!=null) {if(newState.equals("VIC")) {%> <%="selected"%> <%}}%>>VIC</option>
                                                    <option value="WA" <%if(newState!=null) {if(newState.equals("WA")) {%> <%="selected"%> <%}}%>>WA</option>
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
                                <input type="submit" class="btn btn-default" id="signUpCancel" name="signUpCancel" value="Cancel"/>
                                <input type="submit" class="btn btn-warning" id="signUpReset" name="signUpReset" value="Clear form"/>
                                <input type="submit" class="btn btn-primary" id="signUpSubmit" name="signUpSubmit" value="Submit"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--Book inspection Modal-->
        <div class="modal" id="bookInspection" tabindex="-1" role="dialog">
            <div class="modal-dialog" style="margin-top: 10%">
                <div class="modal-content">
                    <form class="form-horizontal" action="servlet/BookInspection" method="post">
                        <div class="modal-header">
                            <h4 class="modal-title">Book Inspection</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Property</label>
                                <div class="col-sm-8">
                                    <p class="form-control-static">
                                    <%=propertyBean.getPropertyAddress()%>, 
                                    <%=propertyBean.getPropertySuburb()%>, 
                                    <%=propertyBean.getPropertyState()%>, 
                                    <%=propertyBean.getPropertyPostcode()%>
                                    </p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="customerName" class="col-sm-3 control-label">Name</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="customerName">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="customerEmail" class="col-sm-3 control-label">email</label>
                                <div class="col-sm-8">
                                    <input type="email" class="form-control" name="customerEmail">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inspectionDate" class="col-sm-3 control-label">Date</label>
                                <div class="col-sm-8">
                                    <input type="date" class="form-control" name="inspectionDate">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inspectionTime" class="col-sm-3 control-label">Time</label>
                                <div class="col-sm-8">
                                    <input type="time" class="form-control" name="inspectionTime">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="btn-group btn-group-sm">
                                <input type="hidden" id="ownerID" name="ownerID"/>
                                <input type="hidden" id="propertyID" name="propertyID"/>
                                <input type="submit" class="btn btn-default" data-dismiss="modal" value="Cancel"/>
                                <input type="submit" class="btn btn-primary"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
<script>
$('#bookInspection').on(
    'show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var owner = button.data('owner')
        var property = button.data('property')
        var modal = $(this)
        modal.find('#ownerID').val(owner)
        modal.find('#propertyID').val(property)
    }
)
</script>

        <!--Contact Owner Modal-->
        <div class="modal" id="contactOwner" tabindex="-1" role="dialog">
            <div class="modal-dialog" style="margin-top: 10%">
                <div class="modal-content">
                    <form class="form-horizontal" action="servlet/ContactOwner" method="post">
                        <div class="modal-header">
                            <h4 class="modal-title">Contact Owner</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="senderName" class="col-sm-3 control-label">Name</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="senderName">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="senderEmail" class="col-sm-3 control-label">email</label>
                                <div class="col-sm-8">
                                    <input type="email" class="form-control" name="senderEmail">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Message" class="col-sm-3 control-label">message</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" name="message" rows="4"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="btn-group btn-group-sm">
                                <input type="hidden" id="ownerID" name="ownerID"/>
                                <input type="submit" class="btn btn-default" data-dismiss="modal" value="Cancel"/>
                                <input type="submit" class="btn btn-primary"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
<script>
$('#contactOwner').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var owner = button.data('owner') // Extract info from data-* attributes
  var modal = $(this)
  modal.find('#ownerID').val(owner)
})
</script>
                                        
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

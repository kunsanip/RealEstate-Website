<!DOCTYPE html>
<%@page import="beans.Inspection"%>
<%@page import="beans.OwnerMessage"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.Owner"%>
<%@page import="beans.Property"%>
<jsp:useBean id="owner" scope="session" class="beans.Owner"/>

<%
    session = request.getSession(true);

    String ownerID = (String) session.getAttribute("ownerID");
    String password = (String) session.getAttribute("password");
    String errPassword = (String) session.getAttribute("errPassword");
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

    String newAdTitle = (String) session.getAttribute("newAdTitle");
    String errNewAdTitle = (String) session.getAttribute("errNewAdTitle");
    String newAdPurpose = (String) session.getAttribute("newAdPurpose");
    String errNewAdPurpose = (String) session.getAttribute("errNewAdPurpose");
    String newPropertyType = (String) session.getAttribute("newPropertyType");
    String errNewPropertyType = (String) session.getAttribute("errNewPropertyType");
    String newPropertySize = (String) session.getAttribute("newPropertySize");
    String errNewPropertySize = (String) session.getAttribute("errNewPropertySize");
    String newPropertyPrice = (String) session.getAttribute("newPropertyPrice");
    String errNewPropertyPrice = (String) session.getAttribute("errNewPropertyPrice");
    String newPropertyAddress = (String) session.getAttribute("newPropertyAddress");
    String errNewPropertyAddress = (String) session.getAttribute("errNewPropertyAddress");
    String newPropertySuburb = (String) session.getAttribute("newPropertySuburb");
    String errNewPropertySuburb = (String) session.getAttribute("errNewPropertySuburb");
    String newPropertyState = (String) session.getAttribute("newPropertyState");
    String errNewPropertyState = (String) session.getAttribute("errNewPropertyState");
    String newPropertyPostcode = (String) session.getAttribute("newPropertyPostcode");
    String errNewPropertyPostcode = (String) session.getAttribute("errNewPropertyPostcode");
    String newPropertyBedrooms = (String) session.getAttribute("newPropertyBedrooms");
    String errNewPropertyBedrooms = (String) session.getAttribute("errNewPropertyBedrooms");
    String newPropertyBathrooms = (String) session.getAttribute("newPropertyBathrooms");
    String errNewPropertyBathrooms = (String) session.getAttribute("errNewPropertyBathrooms");
    String newPropertyCarSpaces = (String) session.getAttribute("newPropertyCarSpaces");
    String errNewPropertyCarSpaces = (String) session.getAttribute("errNewPropertyCarSpaces");
    String newPropertyDescription = (String) session.getAttribute("newPropertyDescription");
    String errNewPropertyDescription = (String) session.getAttribute("errNewPropertyDescription");

    ArrayList<Property> propertiesList = (ArrayList<Property>) session.getAttribute("propertiesList");
    ArrayList<OwnerMessage> ownerMessagesList = (ArrayList<OwnerMessage>) session.getAttribute("ownerMessagesList");
    ArrayList<Inspection> inspectionsList = (ArrayList<Inspection>) session.getAttribute("inspectionsList");

    String editOwnerError = (String) session.getAttribute("editOwnerError");
    String deleteOwnerWarn = (String) session.getAttribute("deleteOwnerWarn");
    String chOwnerPassError = (String) session.getAttribute("chOwnerPassError");
    String createAdError = (String) session.getAttribute("createAdError");
    String editAdError = (String) session.getAttribute("editAdError");
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
        <title>SSX Real Estate</title>
        <link rel="icon" href="images/favicon.ico">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/bootstrap-theme.css" rel="stylesheet">
        <script src="js/ie-emulation-modes-warning.js"></script>
        <script src="js/ie10-viewport-bug-workaround.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <style type="text/css">
            small {
                color: red;

            }
            .modal-dialog {
                width: 900px;
                margin: 30px auto;
            }

            .header {

                color: #36A0FF;
                height: 70px;
                font-size: 27px;
                padding: 10px;
            }
        </style>
        <script>
            $(function () {
                $('[data-toggle="popover"]').popover();
                $('[data-toggle="tooltip"]').tooltip();
            });
            var editOwnerError = "<%=editOwnerError%>";
            if (editOwnerError == "true") {
                $(function () {
                    $('#editOwnerDetails').modal();
                });
            }
            var chOwnerPassError = "<%=chOwnerPassError%>";
            if (chOwnerPassError == "true") {
                $(function () {
                    $('#chOwnerPassword').modal();
                });
            }
            var deleteOwnerWarn = "<%=deleteOwnerWarn%>";
            if (deleteOwnerWarn == "true") {
                $(function () {
                    $('#deleteOwner').modal();
                });
            }
            var createAdError = "<%=createAdError%>";
            if (createAdError == "true") {
                $(function () {
                    $('#createAd').modal();
                });
            }
            var editAdError = "<%=editAdError%>";
            if (editAdError == "true") {
                $(function () {
                    $('#editAd').modal();
                });
            }
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

            <!-- Logo -->
            <div style="width: 400px; margin: auto;">
                <a href="index.jsp" data-toggle="tooltip" data-placement="bottom" title="Go to Home page">
                    <img src="images/SSX_logo_Blue.png" alt="SSX Real Estate"/></a>
            </div>

            <!--Navigation Bar-->
            <nav class="navbar navbar-default" style="background-image: linear-gradient(to bottom,#8897BB 0,#3D4C70 100%)">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <div class="navbar-brand" style="color: white; font-size: 26px">
                            <a style="color: white; font-size: 22px" href="index.jsp"
                               data-toggle="tooltip" data-placement="bottom" title="Go to Home page">
                                <span class="glyphicon glyphicon-home"></span></a>
                            &nbsp; <jsp:getProperty name="owner" property="ownerID"/>'s Dashboard</div>
                    </div>
                    <div class="collapse navbar-collapse" id="navbar">
                        <form class="navbar-form navbar-right" role="form">
                            <a class="btn btn-danger" href="servlet/SignOut">Sign out</a>
                        </form>
                    </div>
                </div>
            </nav>

            <!--Bread crumb-->
            <ol class="breadcrumb">
                <li> <a href="index.jsp"> <strong> Home </strong> </a> </li>
                <li class="active"> Owner's Dashboard </li>
            </ol>

            <!--Main Content-->
            <div class="row">

                <!--Left Panel-->
                <div class="col-sm-8">

                    <!--Properties List Header-->
                    <div class="page-header">
                        <h3>Properties List</h3>
                    </div>

                    <!--Properties List-->
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <div style="float: right">
                                <button class="btn btn-lg btn-link" type="button" data-toggle="modal" data-target="#createAd">
                                    Create Ad &nbsp; <span class="glyphicon glyphicon-plus"> </span> </button>
                            </div>
                        </div>
                        <table class="table">
                            <tr>
                                <th> ID </th>
                                <th> Address </th>
                                <th> Ad Purpose </th>
                                <th> Ad Type </th>
                                <th> Expire Date </th>
                                <th>  </th>
                            </tr>
                            <%for (int i = 0; i < propertiesList.size(); i++) {%>
                            <tr>
                                <td> <%=(propertiesList.get(i)).getPropertyID()%> </td>
                                <td> <%=(propertiesList.get(i)).getPropertyAddress()%> </td>
                                <td> <%=(propertiesList.get(i)).getAdPurpose()%> </td>
                                <td> <%=(propertiesList.get(i)).getAdType()%> </td>
                                <td> <%=(propertiesList.get(i)).getExpireDate()%> </td>
                                <td style="text-align: right">
                                    <%if (((propertiesList.get(i)).getAdType()).equals("Basic")) {%>

                                    <button type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#upgradepremium"
                                            data-property="<%=(propertiesList.get(i)).getPropertyID()%>">Upgrade Premium</button>

                                    <%}%>
                                    <a class="btn btn-sm btn-warning"
                                       href="servlet/EditPropertyDetails?loadPropertyDetails=true&propertyID=
                                       <%=(propertiesList.get(i)).getPropertyID()%>"
                                       data-toggle="tooltip" data-placement="bottom"title="Edit property details">
                                        Edit
                                    </a>
                                </td>
                            </tr>
                            <%}%>
                        </table>
                    </div>

                    <!--Next Inspections Header-->
                    <div class="page-header">
                        <h3>Next Inspections</h3>
                    </div>

                    <!--Next Inspections List-->
                    <div class="panel panel-primary">
                        <table class="table">
                            <tr>
                                <th> ID </th>
                                <th> Customer </th>
                                <th> email </th>
                                <th> Date </th>
                                <th> Time </th>
                                <th>  </th>
                            </tr>
                            <%for (int i = 0; i < inspectionsList.size(); i++) {%>
                            <tr>
                                <td><%=(inspectionsList.get(i)).getPropertyID()%></td>
                                <td><%=(inspectionsList.get(i)).getCustomerName()%></td>
                                <td><%=(inspectionsList.get(i)).getCustomerEmail()%></td>
                                <td><%=(inspectionsList.get(i)).getInspectionDate()%></td>
                                <td><%=(inspectionsList.get(i)).getInspectionTime()%></td>
                                <td style="text-align: right"><a class="btn btn-sm btn-warning"
                                                                 href="servlet/DismissInspection?inspectionID=
                                                                 <%=(inspectionsList.get(i)).getInspectionID()%>">Dismiss</a></td>

                            </tr>
                            <%}%>
                        </table>
                    </div>
                </div>

                <!--Right Panel-->
                <div class="col-sm-4">

                    <!--Owner Details Header-->
                    <div class="page-header">
                        <h3>Owner Details</h3>
                    </div>

                    <!--Owner Details-->
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <p><img class="img-rounded" style="width: 80px" src="servlet/LoadOwnerPicture?ownerID=<%=ownerID%>"
                                    onError="this.onerror=null; this.src='images/owner-placeholder.png';"/></p>
                            <table>
                                <tr style="height: 20px;">
                                    <td style="width: 120px"> First name: </td>
                                    <td class="text-primary"> <jsp:getProperty name="owner" property="firstName"/> </td>
                                </tr>
                                <tr style="height: 20px;">
                                    <td> Last name: </td>
                                    <td class="text-primary"> <jsp:getProperty name="owner" property="lastName"/> </td>
                                </tr>
                                <tr style="height: 20px;">
                                    <td> Email: </td>
                                    <td class="text-primary"> <jsp:getProperty name="owner" property="email"/> </td>
                                </tr>
                                <tr style="height: 20px;">
                                    <td> Phone number: </td>
                                    <td class="text-primary"> <jsp:getProperty name="owner" property="phone"/> </td>
                                </tr>
                                <tr style="height: 20px;">
                                    <td> Address: </td>
                                    <td class="text-primary"> <jsp:getProperty name="owner" property="address"/> </td>
                                </tr>
                                <tr style="height: 20px;">
                                    <td> Suburb: </td>
                                    <td class="text-primary"> <jsp:getProperty name="owner" property="suburb"/> </td>
                                </tr>
                                <tr style="height: 20px;">
                                    <td> State: </td>
                                    <td class="text-primary"> <jsp:getProperty name="owner" property="state"/> </td>
                                </tr>
                                <tr style="height: 20px;">
                                    <td> Postcode: </td>
                                    <td class="text-primary"> <jsp:getProperty name="owner" property="postcode"/> </td>
                                </tr>
                            </table>
                            <br/>
                            <div class="btn-group btn-group-sm pull-right">
                                <a class="btn btn-default" href="servlet/EditOwnerDetails?ownerID=
                                   <%=ownerID%>&loadOwnerDetails=true">Edit Details</a>
                                <button type="button" class="btn btn-default" data-toggle="modal"
                                        data-target="#chOwnerPassword">Change password</button>
                                <button type="button" class="btn btn-default" data-toggle="modal"
                                        data-target="#chOwnerPicture">Change picture</button>
                            </div>
                        </div>
                    </div>

                    <!--Messages header-->
                    <div class="page-header">
                        <h3>Messages</h3>
                    </div>

                    <!--Messages-->
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <%for (int i = 0; i < ownerMessagesList.size(); i++) {%>
                            <div class="panel panel-default">
                                <div class="panel-heading"> <strong><%=(ownerMessagesList.get(i)).getSenderName()%></strong>
                                    <span class="pull-right"><%=(ownerMessagesList.get(i)).getMessageDate()%></span>
                                    <strong>email:&nbsp;&nbsp;</strong><%=(ownerMessagesList.get(i)).getSenderEmail()%>
                                </div>
                                <div class="panel-body">
                                    <p><%=(ownerMessagesList.get(i)).getMessage()%></p>                            
                                    <div class="pull-right"><a class="btn btn-xs btn-default"
                                                               href="servlet/DismissOwnerMessage?ownerMessageID=<%=(ownerMessagesList.get(i)).getOwnerMessageID()%>">Dismiss</a>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>


            <!--Footer-->
            <div class="panel panel-default" style="background: linear-gradient(to bottom, #8897BB 0, #3D4C70 100%)">
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

        <!--Edit Owner Details Modal-->
        <div class="modal" id="editOwnerDetails" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-lg" style="margin-top: 10%">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Edit Details</h4>
                    </div>
                    <form class="form-horizontal" action="servlet/EditOwnerDetails" method="post" id="editOwnerDetailsForm">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newFirstName">First name</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newFirstName" name="newFirstName"
                                                       <%if (newFirstName != null) {%> value="<%=newFirstName%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#editOwnerDetails"
                                                            data-content="Your first name (only letters)">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewFirstName != null) {%>  <small> <%=errNewFirstName%> </small> <%}%>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newLastName">Last&nbsp;name</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newLastName" name="newLastName"
                                                       <%if (newLastName != null) {%> value="<%=newLastName%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#editOwnerDetails"
                                                            data-content="Your last name (only letters)">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewLastName != null) {%>  <small> <%=errNewLastName%> </small> <%}%>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newEmail">email</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newEmail" name="newEmail"
                                                       <%if (newEmail != null) {%> value="<%=newEmail%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#editOwnerDetails"
                                                            data-content="Format must be: email@server.com">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewEmail != null) {%>  <small> <%=errNewEmail%> </small> <%}%>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newPhone">Phone number</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newPhone" name="newPhone"
                                                       <%if (newPhone != null) {%> value="<%=newPhone%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#editOwnerDetails"
                                                            data-content="Only numbers">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewPhone != null) {%>  <small> <%=errNewPhone%> </small> <%}%>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newAddress">Address</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newAddress" name="newAddress"
                                                       <%if (newAddress != null) {%> value="<%=newAddress%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#editOwnerDetails"
                                                            data-content="Your street address">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewAddress != null) {%>  <small> <%=errNewAddress%> </small> <%}%>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newSuburb">Suburb</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newSuburb" name="newSuburb"
                                                       <%if (newSuburb != null) {%> value="<%=newSuburb%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#editOwnerDetails"
                                                            data-content="Your suburb">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewSuburb != null) {%>  <small> <%=errNewSuburb%> </small> <%}%>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newPostcode">Postcode</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newPostcode" name="newPostcode"
                                                       <%if (newPostcode != null) {%> value="<%=newPostcode%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#editOwnerDetails"
                                                            data-content="Your postcode (4 numbers)">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewPostcode != null) {%>  <small> <%=errNewPostcode%> </small> <%}%>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newState">State</label>
                                        <div class="col-sm-8">
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
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="btn-group btn-group-sm" style="float: left">
                                <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteOwner">Delete account</button>
                                <!--<input type="submit" class="btn btn-danger" id="editOwnerDelete" name="editOwnerDelete" value="Delete account"/>-->
                            </div>
                            <div class="btn-group btn-group-sm">
                                <input type="submit" class="btn btn-default" id="editOwnerCancel" name="editOwnerCancel" value="Cancel"/>
                                <input type="submit" class="btn btn-primary" id="editOwnerSubmit" name="editOwnerSubmit" value="Submit"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--Edit Owner Password Modal-->
        <div class="modal" id="chOwnerPassword" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog" style="margin-top: 10%">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Change Password</h4>
                    </div>
                    <form class="form-horizontal" action="servlet/ChangeOwnerPassword" method="post">
                        <div class="modal-body">
                            <div class="form-group">
                                <label class="col-sm-4 control-label" for="password">Current Password</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <input type="password" class="form-control" id="password" name="password"
                                               <%if (password != null) {%> value="<%=password%>" <%}%>/>
                                        <span class="input-group-btn">
                                            <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                    data-trigger="focus" data-placement="bottom" data-container="#chOwnerPassword"
                                                    data-content="Enter your current password">
                                                <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                            </button>
                                        </span>
                                    </div>
                                    <%if (errPassword != null) {%> <small> <%=errPassword%> </small> <%}%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label" for="newPassword">New password</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <input type="password" class="form-control" id="newPassword" name="newPassword"
                                               <%if (newPassword != null) {%> value="<%=newPassword%>" <%}%>/>
                                        <span class="input-group-btn">
                                            <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                    data-trigger="focus" data-placement="bottom" data-container="#chOwnerPassword"
                                                    data-content="Must be 6 to 10 characters long">
                                                <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                            </button>
                                        </span>
                                    </div>
                                    <%if (errNewPassword != null) {%>  <small> <%=errNewPassword%> </small> <%}%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label" for="cfmNewPassword">Confirm password</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <input type="password" class="form-control" id="cfmNewPassword" name="cfmNewPassword"
                                               <%if (cfmNewPassword != null) {%> value="<%=cfmNewPassword%>" <%}%>/>
                                        <span class="input-group-btn">
                                            <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                    data-trigger="focus" data-placement="bottom" data-container="#chOwnerPassword"
                                                    data-content="Must match password field">
                                                <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                            </button>
                                        </span>
                                    </div>
                                    <%if (errCfmNewPassword != null) {%>  <small> <%=errCfmNewPassword%> </small> <%}%>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="btn-group btn-group-sm">
                                <input type="submit" class="btn btn-default" id="chOwnerPassCancel" name="chOwnerPassCancel" value="Cancel"/>
                                <input type="submit" class="btn btn-primary" id="chOwnerPassSubmit" name="chOwnerPassSubmit" value="Submit"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--Edit Owner Picture Modal-->
        <div class="modal" id="chOwnerPicture" tabindex="-1" role="dialog">
            <div class="modal-dialog" style="margin-top: 10%">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Change Profile Picture</h4>
                    </div>
                    <form class="form-horizontal" action="servlet/ChangeOwnerPicture" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <!-- Owner Picture -->
                            <div class="form-group">
                                <div class="col-sm-10">
                                    <label for="newPicture">Select the new picture</label>
                                    <br/>
                                    <input type="file" id="newPicture" name="newPicture"/>
                                </div>
                                <br/>
                                <div class="col-sm-2">
                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                            data-trigger="focus" data-placement="bottom" data-container="#chOwnerPicture"
                                            data-content="Upload a picture for your profile (max. size: 1MB)">
                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="btn-group btn-group-sm">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                <input type="submit" class="btn btn-primary" value="Submit"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--Delete Owner Warning Modal-->
        <div class="modal" id="deleteOwner" tabindex="-1" role="dialog">
            <div class="modal-dialog" style="margin-top: 12%">
                <div class="modal-content alert alert-danger" role="alert">
                    <div class="modal-body alert alert-danger" role="alert" style="text-align: center">
                        <h3>Are you sure you want to delete your account?</h3><br/>
                        <h4>All your property ads and messages will also be deleted and you will not de able to restore them!</h4><br/>
                    </div>
                    <div class="modal-footer" style="text-align: center">
                        <div class="btn-group btn-group-sm">
                            <button type="button" class="btn btn-default" style="width: 100px" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-danger" style="width: 100px" href="servlet/EditOwnerDetails?deleteOwnerConfirm=CONFIRM">CONFIRM</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>        

        <!--Create Property Ad Modal-->
        <div class="modal" id="createAd" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-lg" style="margin-top: 5%">
                <div class="modal-content">
                    <!--Create Property Ad Header-->
                    <div class="modal-header">
                        <h4 class="modal-title">Create Property Ad</h4>
                    </div>
                    <!--Create Property Ad Form-->
                    <form class="form-horizontal" action="servlet/CreatePropertyAd" method="post" enctype="multipart/form-data">
                        <!--Create Property Ad Body-->
                        <div class="modal-body">
                            <div class="row">
                                <!--Left Session-->
                                <div class="col-sm-6">
                                    <!-- Title -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newAdTitle">Ad Title</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newAdTitle" name="newAdTitle"
                                                       <%if (newAdTitle != null) {%> value="<%=newAdTitle%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#createAd"
                                                            data-content="The ad's header (up to 20 characters)">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewAdTitle != null) {%>  <small> <%=errNewAdTitle%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- Purpose -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newAdPurpose">Ad Purpose</label>
                                        <div class="col-sm-8">
                                            <select class="form-control" id="newState" name="newAdPurpose">
                                                <option></option>
                                                <option value="For sale" <%if (newAdPurpose != null) {
                                                        if (newAdPurpose.equals("For sale")) {%> <%="selected"%> <%}
                                                            }%>>For sale</option>
                                                <option value="For rent" <%if (newAdPurpose != null) {
                                                        if (newAdPurpose.equals("For rent")) {%> <%="selected"%> <%}
                                                            }%>>For rent</option>
                                            </select>
                                            <%if (errNewAdPurpose != null) {%>  <small> <%=errNewAdPurpose%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- Price -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newPropertyPrice">Price $</label>
                                        <div class="col-sm-6">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newPropertyPrice" name="newPropertyPrice"
                                                       <%if (newPropertyPrice != null) {%> value="<%=newPropertyPrice%>" <%}%>/>
                                                <span class="input-group-addon">.00</span>
                                            </div>
                                            <%if (errNewPropertyPrice != null) {%>  <small> <%=errNewPropertyPrice%> </small> <%}%>
                                        </div>
                                        <div class="col-sm-2">
                                            <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                    data-trigger="focus" data-placement="bottom" data-container="#createAd"
                                                    data-content="The sale or rental price (numbers only)">
                                                <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                            </button>
                                        </div>
                                    </div>
                                    <!-- Property type -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newPropertyType">Property type</label>
                                        <div class="col-sm-8">
                                            <select class="form-control" id="newPropertyType" name="newPropertyType">
                                                <option></option>
                                                <option value="House" <%if (newPropertyType != null) {
                                                        if (newPropertyType.equals("House")) {%> <%="selected"%> <%}
                                                            }%>>House</option>
                                                <option value="Apartment" <%if (newPropertyType != null) {
                                                        if (newPropertyType.equals("Apartment")) {%> <%="selected"%> <%}
                                                            }%>>Apartment</option>
                                                <option value="Unit" <%if (newPropertyType != null) {
                                                        if (newPropertyType.equals("Unit")) {%> <%="selected"%> <%}
                                                            }%>>Unit</option>
                                                <option value="Townhouse" <%if (newPropertyType != null) {
                                                        if (newPropertyType.equals("Townhouse")) {%> <%="selected"%> <%}
                                                            }%>>Townhouse</option>
                                                <option value="Villa" <%if (newPropertyType != null) {
                                                        if (newPropertyType.equals("Villa")) {%> <%="selected"%> <%}
                                                            }%>>Villa</option>
                                                <option value="Land" <%if (newPropertyType != null) {
                                                        if (newPropertyType.equals("Land")) {%> <%="selected"%> <%}
                                                            }%>>Land</option>
                                                <option value="Rural" <%if (newPropertyType != null) {
                                                        if (newPropertyType.equals("Rural")) {%> <%="selected"%> <%}
                                                            }%>>Rural</option>
                                                <option value="Block of Units" <%if (newPropertyType != null) {
                                                        if (newPropertyType.equals("Block of Units")) {%> <%="selected"%> <%}
                                                            }%>>Block of Units</option>
                                            </select>
                                            <%if (errNewPropertyType != null) {%>  <small> <%=errNewPropertyType%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- Size -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newPropertySize">Size</label>
                                        <div class="col-sm-6">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newPropertySize" name="newPropertySize"
                                                       <%if (newPropertySize != null) {%> value="<%=newPropertySize%>" <%}%>/>
                                                <span class="input-group-addon">m&sup2;</span>
                                            </div>
                                            <%if (errNewPropertySize != null) {%>  <small> <%=errNewPropertySize%> </small> <%}%>
                                        </div>
                                        <div class="col-sm-2">
                                            <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                    data-trigger="focus" data-placement="bottom" data-container="#createAd"
                                                    data-content="The property's size (numbers only)">
                                                <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                            </button>
                                        </div>
                                    </div>
                                    <!-- bedrooms -->
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label" for="newPropertyBedrooms">Number of bedrooms</label>
                                        <div class="col-sm-7">
                                            <select class="form-control" id="newPropertyBedrooms" name="newPropertyBedrooms" style="width: 100px">
                                                <option></option>
                                                <option value="1" <%if (newPropertyBedrooms != null) {
                                                        if (newPropertyBedrooms.equals("1")) {%> <%="selected"%> <%}
                                                            }%>>1</option>
                                                <option value="2" <%if (newPropertyBedrooms != null) {
                                                        if (newPropertyBedrooms.equals("2")) {%> <%="selected"%> <%}
                                                            }%>>2</option>
                                                <option value="3" <%if (newPropertyBedrooms != null) {
                                                        if (newPropertyBedrooms.equals("3")) {%> <%="selected"%> <%}
                                                            }%>>3</option>
                                                <option value="4" <%if (newPropertyBedrooms != null) {
                                                        if (newPropertyBedrooms.equals("4")) {%> <%="selected"%> <%}
                                                            }%>>4</option>
                                                <option value="5+" <%if (newPropertyBedrooms != null) {
                                                        if (newPropertyBedrooms.equals("5+")) {%> <%="selected"%> <%}
                                                            }%>>5+</option>
                                            </select>
                                            <%if (errNewPropertyBedrooms != null) {%>  <small> <%=errNewPropertyBedrooms%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- bathrooms -->
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label" for="newPropertyBathrooms">Number of bathrooms</label>
                                        <div class="col-sm-7">
                                            <select class="form-control" id="newPropertyBathrooms" name="newPropertyBathrooms" style="width: 100px">
                                                <option></option>
                                                <option value="1" <%if (newPropertyBathrooms != null) {
                                                        if (newPropertyBathrooms.equals("1")) {%> <%="selected"%> <%}
                                                            }%>>1</option>
                                                <option value="2" <%if (newPropertyBathrooms != null) {
                                                        if (newPropertyBathrooms.equals("2")) {%> <%="selected"%> <%}
                                                            }%>>2</option>
                                                <option value="3" <%if (newPropertyBathrooms != null) {
                                                        if (newPropertyBathrooms.equals("3")) {%> <%="selected"%> <%}
                                                            }%>>3</option>
                                                <option value="4" <%if (newPropertyBathrooms != null) {
                                                        if (newPropertyBathrooms.equals("4")) {%> <%="selected"%> <%}
                                                            }%>>4</option>
                                                <option value="5+" <%if (newPropertyBathrooms != null) {
                                                        if (newPropertyBathrooms.equals("5+")) {%> <%="selected"%> <%}
                                                            }%>>5+</option>
                                            </select>
                                            <%if (errNewPropertyBathrooms != null) {%>  <small> <%=errNewPropertyBathrooms%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- car spaces -->
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label" for="newPropertyCarSpaces">Number of car spaces</label>
                                        <div class="col-sm-7">
                                            <select class="form-control" id="newPropertyCarSpaces" name="newPropertyCarSpaces" style="width: 100px">
                                                <option></option>
                                                <option value="1" <%if (newPropertyCarSpaces != null) {
                                                        if (newPropertyCarSpaces.equals("1")) {%> <%="selected"%> <%}
                                                            }%>>1</option>
                                                <option value="2" <%if (newPropertyCarSpaces != null) {
                                                        if (newPropertyCarSpaces.equals("2")) {%> <%="selected"%> <%}
                                                            }%>>2</option>
                                                <option value="3" <%if (newPropertyCarSpaces != null) {
                                                        if (newPropertyCarSpaces.equals("3")) {%> <%="selected"%> <%}
                                                            }%>>3</option>
                                                <option value="4" <%if (newPropertyCarSpaces != null) {
                                                        if (newPropertyCarSpaces.equals("4")) {%> <%="selected"%> <%}
                                                            }%>>4</option>
                                                <option value="5+" <%if (newPropertyCarSpaces != null) {
                                                        if (newPropertyCarSpaces.equals("newPropertyCarSpaces+")) {%> <%="selected"%> <%}
                                                            }%>>5+</option>
                                            </select>
                                            <%if (errNewPropertyCarSpaces != null) {%>  <small> <%=errNewPropertyCarSpaces%> </small> <%}%>
                                        </div>
                                    </div>
                                </div>
                                <!--Right Session-->
                                <div class="col-sm-6">
                                    <!-- Street address -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newPropertyAddress ">Street address</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newPropertyAddress" name="newPropertyAddress"
                                                       <%if (newPropertyAddress != null) {%> value="<%=newPropertyAddress%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#createAd"
                                                            data-content="The property's street address (up to 30 characters)">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewPropertyAddress != null) {%>  <small> <%=errNewPropertyAddress%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- Suburb -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newPropertySuburb">Suburb</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newPropertySuburb" name="newPropertySuburb"
                                                       <%if (newPropertySuburb != null) {%> value="<%=newPropertySuburb%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#createAd"
                                                            data-content="The property's suburb (up to 20 characters)">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewPropertySuburb != null) {%>  <small> <%=errNewPropertySuburb%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- Postcode -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newPropertyPostcode">Postcode</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newPropertyPostcode " name="newPropertyPostcode"
                                                       <%if (newPropertyPostcode != null) {%> value="<%=newPropertyPostcode%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#createAd"
                                                            data-content="The property's postcode (4 digits only)">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewPropertyPostcode != null) {%>  <small> <%=errNewPropertyPostcode%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- State -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newPropertyState">State</label>
                                        <div class="col-sm-8">
                                            <select class="form-control" id="newPropertyState" name="newPropertyState" style="width: 100px">
                                                <option></option>
                                                <option value="ACT" <%if (newPropertyState != null) {
                                                        if (newPropertyState.equals("ACT")) {%> <%="selected"%> <%}
                                                            }%>>ACT</option>
                                                <option value="NSW" <%if (newPropertyState != null) {
                                                        if (newPropertyState.equals("NSW")) {%> <%="selected"%> <%}
                                                            }%>>NSW</option>
                                                <option value="NT" <%if (newPropertyState != null) {
                                                        if (newPropertyState.equals("NT")) {%> <%="selected"%> <%}
                                                            }%>>NT</option>
                                                <option value="QLD" <%if (newPropertyState != null) {
                                                        if (newPropertyState.equals("QLD")) {%> <%="selected"%> <%}
                                                            }%>>QLD</option>
                                                <option value="SA" <%if (newPropertyState != null) {
                                                        if (newPropertyState.equals("SA")) {%> <%="selected"%> <%}
                                                            }%>>SA</option>
                                                <option value="TAS" <%if (newPropertyState != null) {
                                                        if (newPropertyState.equals("TAS")) {%> <%="selected"%> <%}
                                                            }%>>TAS</option>
                                                <option value="VIC" <%if (newPropertyState != null) {
                                                        if (newPropertyState.equals("VIC")) {%> <%="selected"%> <%}
                                                            }%>>VIC</option>
                                                <option value="WA" <%if (newPropertyState != null) {
                                                        if (newPropertyState.equals("WA")) {%> <%="selected"%> <%}
                                                            }%>>WA</option>
                                            </select>
                                            <%if (errNewPropertyState != null) {%>  <small> <%=errNewPropertyState%> </small> <%}%>
                                        </div>
                                    </div>
                                    <br/>
                                    <!-- Property Picture -->
                                    <div class="form-group">
                                        <div class="col-sm-10">
                                            <label for="newPropertyPicture">Picture (optional)</label>
                                            <input type="file" id="newPropertyPicture" name="newPropertyPicture"/>
                                        </div>
                                        <br/>
                                        <div class="col-sm-2">
                                            <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                    data-trigger="focus" data-placement="bottom" data-container="#signUp"
                                                    data-content="Upload a picture for your property (max. size: 1MB)">
                                                <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                            </button>
                                        </div>
                                    </div>
                                    <br/>
                                    <!-- description -->
                                    <div class="form-group">
                                        <label class="col-sm-12 control-label" for="newPropertyDescription" style="text-align: left">
                                            Brief description of the property (max 500 characters)
                                        </label>
                                        <div class="col-sm-12">
                                            <textarea class="form-control" name="newPropertyDescription" rows="3"><%if (newPropertyDescription != null) {%><%=newPropertyDescription%><%}%></textarea>
                                            <%if (errNewPropertyDescription != null) {%>  <small> <%=errNewPropertyDescription%> </small> <%}%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="btn-group btn-group-sm">
                                <input type="submit" class="btn btn-default" id="createAdCancel" name="createAdCancel" value="Cancel"/>
                                <input type="submit" class="btn btn-warning" id="createAdReset" name="createAdReset" value="Clear form"/>
                                <input type="submit" class="btn btn-primary" id="createAdSubmit" name="createAdSubmit" value="Submit"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--Edit Property Ad Modal-->
        <div class="modal" id="editAd" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-lg" style="margin-top: 5%">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Create Property Ad</h4>
                    </div>
                    <form class="form-horizontal" action="servlet/EditPropertyDetails" method="post">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <!-- Title -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newAdTitle">Ad Title</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newAdTitle" name="newAdTitle"
                                                       <%if (newAdTitle != null) {%> value="<%=newAdTitle%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#createAd"
                                                            data-content="The ad's header (up to 20 characters)">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewAdTitle != null) {%>  <small> <%=errNewAdTitle%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- Purpose -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newAdPurpose">Ad Purpose</label>
                                        <div class="col-sm-8">
                                            <select class="form-control" id="newState" name="newAdPurpose">
                                                <option></option>
                                                <option value="For sale" <%if (newAdPurpose != null) {
                                                        if (newAdPurpose.equals("For sale")) {%> <%="selected"%> <%}
                                                            }%>>For sale</option>
                                                <option value="For rent" <%if (newAdPurpose != null) {
                                                        if (newAdPurpose.equals("For rent")) {%> <%="selected"%> <%}
                                                            }%>>For rent</option>
                                            </select>
                                            <%if (errNewAdPurpose != null) {%>  <small> <%=errNewAdPurpose%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- Price -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newPropertyPrice">Price $</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newPropertyPrice" name="newPropertyPrice"
                                                       <%if (newPropertyPrice != null) {%> value="<%=newPropertyPrice%>" <%}%>/>
                                                <span class="input-group-addon">.00</span>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#createAd"
                                                            data-content="The sale or rental price (numbers only)">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewPropertyPrice != null) {%>  <small> <%=errNewPropertyPrice%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- Property type -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newPropertyType">Property type</label>
                                        <div class="col-sm-8">
                                            <select class="form-control" id="newPropertyType" name="newPropertyType">
                                                <option></option>
                                                <option value="House" <%if (newPropertyType != null) {
                                                        if (newPropertyType.equals("House")) {%> <%="selected"%> <%}
                                                            }%>>House</option>
                                                <option value="Apartment" <%if (newPropertyType != null) {
                                                        if (newPropertyType.equals("Apartment")) {%> <%="selected"%> <%}
                                                            }%>>Apartment</option>
                                                <option value="Unit" <%if (newPropertyType != null) {
                                                        if (newPropertyType.equals("Unit")) {%> <%="selected"%> <%}
                                                            }%>>Unit</option>
                                                <option value="Townhouse" <%if (newPropertyType != null) {
                                                        if (newPropertyType.equals("Townhouse")) {%> <%="selected"%> <%}
                                                            }%>>Townhouse</option>
                                                <option value="Villa" <%if (newPropertyType != null) {
                                                        if (newPropertyType.equals("Villa")) {%> <%="selected"%> <%}
                                                            }%>>Villa</option>
                                                <option value="Land" <%if (newPropertyType != null) {
                                                        if (newPropertyType.equals("Land")) {%> <%="selected"%> <%}
                                                            }%>>Land</option>
                                                <option value="Rural" <%if (newPropertyType != null) {
                                                        if (newPropertyType.equals("Rural")) {%> <%="selected"%> <%}
                                                            }%>>Rural</option>
                                                <option value="Block of Units" <%if (newPropertyType != null) {
                                                        if (newPropertyType.equals("Block of Units")) {%> <%="selected"%> <%}
                                                            }%>>Block of Units</option>
                                            </select>
                                            <%if (errNewPropertyType != null) {%>  <small> <%=errNewPropertyType%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- Size -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newPropertySize">Size</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newPropertySize" name="newPropertySize"
                                                       <%if (newPropertySize != null) {%> value="<%=newPropertySize%>" <%}%>/>
                                                <span class="input-group-addon">m&sup2;</span>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#createAd"
                                                            data-content="The property's size (numbers only)">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewPropertySize != null) {%>  <small> <%=errNewPropertySize%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- bedrooms -->
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label" for="newPropertyBedrooms">Number of bedrooms</label>
                                        <div class="col-sm-7">
                                            <select class="form-control" id="newPropertyBedrooms" name="newPropertyBedrooms" style="width: 100px">
                                                <option></option>
                                                <option value="1" <%if (newPropertyBedrooms != null) {
                                                        if (newPropertyBedrooms.equals("1")) {%> <%="selected"%> <%}
                                                            }%>>1</option>
                                                <option value="2" <%if (newPropertyBedrooms != null) {
                                                        if (newPropertyBedrooms.equals("2")) {%> <%="selected"%> <%}
                                                            }%>>2</option>
                                                <option value="3" <%if (newPropertyBedrooms != null) {
                                                        if (newPropertyBedrooms.equals("3")) {%> <%="selected"%> <%}
                                                            }%>>3</option>
                                                <option value="4" <%if (newPropertyBedrooms != null) {
                                                        if (newPropertyBedrooms.equals("4")) {%> <%="selected"%> <%}
                                                            }%>>4</option>
                                                <option value="5+" <%if (newPropertyBedrooms != null) {
                                                        if (newPropertyBedrooms.equals("5+")) {%> <%="selected"%> <%}
                                                            }%>>5+</option>
                                            </select>
                                            <%if (errNewPropertyBedrooms != null) {%>  <small> <%=errNewPropertyBedrooms%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- bathrooms -->
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label" for="newPropertyBathrooms">Number of bathrooms</label>
                                        <div class="col-sm-7">
                                            <select class="form-control" id="newPropertyBathrooms" name="newPropertyBathrooms" style="width: 100px">
                                                <option></option>
                                                <option value="1" <%if (newPropertyBathrooms != null) {
                                                        if (newPropertyBathrooms.equals("1")) {%> <%="selected"%> <%}
                                                            }%>>1</option>
                                                <option value="2" <%if (newPropertyBathrooms != null) {
                                                        if (newPropertyBathrooms.equals("2")) {%> <%="selected"%> <%}
                                                            }%>>2</option>
                                                <option value="3" <%if (newPropertyBathrooms != null) {
                                                        if (newPropertyBathrooms.equals("3")) {%> <%="selected"%> <%}
                                                            }%>>3</option>
                                                <option value="4" <%if (newPropertyBathrooms != null) {
                                                        if (newPropertyBathrooms.equals("4")) {%> <%="selected"%> <%}
                                                            }%>>4</option>
                                                <option value="5+" <%if (newPropertyBathrooms != null) {
                                                        if (newPropertyBathrooms.equals("5+")) {%> <%="selected"%> <%}
                                                            }%>>5+</option>
                                            </select>
                                            <%if (errNewPropertyBathrooms != null) {%>  <small> <%=errNewPropertyBathrooms%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- car spaces -->
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label" for="newPropertyCarSpaces">Number of car spaces</label>
                                        <div class="col-sm-7">
                                            <select class="form-control" id="newPropertyCarSpaces" name="newPropertyCarSpaces" style="width: 100px">
                                                <option></option>
                                                <option value="1" <%if (newPropertyCarSpaces != null) {
                                                        if (newPropertyCarSpaces.equals("1")) {%> <%="selected"%> <%}
                                                            }%>>1</option>
                                                <option value="2" <%if (newPropertyCarSpaces != null) {
                                                        if (newPropertyCarSpaces.equals("2")) {%> <%="selected"%> <%}
                                                            }%>>2</option>
                                                <option value="3" <%if (newPropertyCarSpaces != null) {
                                                        if (newPropertyCarSpaces.equals("3")) {%> <%="selected"%> <%}
                                                            }%>>3</option>
                                                <option value="4" <%if (newPropertyCarSpaces != null) {
                                                        if (newPropertyCarSpaces.equals("4")) {%> <%="selected"%> <%}
                                                            }%>>4</option>
                                                <option value="5+" <%if (newPropertyCarSpaces != null) {
                                                        if (newPropertyCarSpaces.equals("5+")) {%> <%="selected"%> <%}
                                                            }%>>5+</option>
                                            </select>
                                            <%if (errNewPropertyCarSpaces != null) {%>  <small> <%=errNewPropertyCarSpaces%> </small> <%}%>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <!-- Street address -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newPropertyAddress">Street address</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newPropertyAddress" name="newPropertyAddress"
                                                       <%if (newPropertyAddress != null) {%> value="<%=newPropertyAddress%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#createAd"
                                                            data-content="The property's street address (up to 30 characters)">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewPropertyAddress != null) {%>  <small> <%=errNewPropertyAddress%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- Suburb -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newPropertySuburb">Suburb</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newPropertySuburb" name="newPropertySuburb"
                                                       <%if (newPropertySuburb != null) {%> value="<%=newPropertySuburb%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#createAd"
                                                            data-content="The property's suburb (up to 20 characters)">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewPropertySuburb != null) {%>  <small> <%=errNewPropertySuburb%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- Postcode -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newPropertyPostcode">Postcode</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="newPropertyPostcode " name="newPropertyPostcode"
                                                       <%if (newPropertyPostcode != null) {%> value="<%=newPropertyPostcode%>" <%}%>/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-link" type="button" tabindex="-1" data-toggle="popover"
                                                            data-trigger="focus" data-placement="bottom" data-container="#createAd"
                                                            data-content="The property's postcode (4 digits only)">
                                                        <span class="glyphicon glyphicon-question-sign" style="font-size: 20px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                            <%if (errNewPropertyPostcode != null) {%>  <small> <%=errNewPropertyPostcode%> </small> <%}%>
                                        </div>
                                    </div>
                                    <!-- State -->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="newPropertyState">State</label>
                                        <div class="col-sm-8">
                                            <select class="form-control" id="newPropertyState" name="newPropertyState" style="width: 100px">
                                                <option></option>
                                                <option value="ACT" <%if (newPropertyState != null) {
                                                        if (newPropertyState.equals("ACT")) {%> <%="selected"%> <%}
                                                            }%>>ACT</option>
                                                <option value="NSW" <%if (newPropertyState != null) {
                                                        if (newPropertyState.equals("NSW")) {%> <%="selected"%> <%}
                                                            }%>>NSW</option>
                                                <option value="NT" <%if (newPropertyState != null) {
                                                        if (newPropertyState.equals("NT")) {%> <%="selected"%> <%}
                                                            }%>>NT</option>
                                                <option value="QLD" <%if (newPropertyState != null) {
                                                        if (newPropertyState.equals("QLD")) {%> <%="selected"%> <%}
                                                            }%>>QLD</option>
                                                <option value="SA" <%if (newPropertyState != null) {
                                                        if (newPropertyState.equals("SA")) {%> <%="selected"%> <%}
                                                            }%>>SA</option>
                                                <option value="TAS" <%if (newPropertyState != null) {
                                                        if (newPropertyState.equals("TAS")) {%> <%="selected"%> <%}
                                                            }%>>TAS</option>
                                                <option value="VIC" <%if (newPropertyState != null) {
                                                        if (newPropertyState.equals("VIC")) {%> <%="selected"%> <%}
                                                            }%>>VIC</option>
                                                <option value="WA" <%if (newPropertyState != null) {
                                                        if (newPropertyState.equals("WA")) {%> <%="selected"%> <%}
                                                            }%>>WA</option>
                                            </select>
                                            <%if (errNewPropertyState != null) {%>  <small> <%=errNewPropertyState%> </small> <%}%>
                                        </div>
                                    </div>
                                    <br/>

                                    <!-- description -->
                                    <div class="form-group">
                                        <label class="col-sm-12 control-label" for="newPropertyDescription" style="text-align: left">
                                            Brief description of the property (max 500 characters)
                                        </label>
                                        <div class="col-sm-12">
                                            <textarea class="form-control" name="newPropertyDescription" rows="3"><%if (newPropertyDescription != null) {%><%=newPropertyDescription%><%}%></textarea>
                                            <%if (errNewPropertyDescription != null) {%>  <small> <%=errNewPropertyDescription%> </small> <%}%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="btn-group btn-group-sm" style="float: left">
                                <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteProperty">Delete Ad</button>
                                <!--<input type="submit" class="btn btn-danger" id="editOwnerDelete" name="editOwnerDelete" value="Delete account"/>-->
                            </div>
                            <div class="btn-group btn-group-sm">
                                <input type="submit" class="btn btn-default" id="editAdCancel" name="editAdCancel" value="Cancel"/>
                                <input type="submit" class="btn btn-primary" id="editAdSubmit" name="editAdSubmit" value="Submit"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--Delete Property Warning Modal-->
        <div class="modal" id="deleteProperty" tabindex="-1" role="dialog">
            <div class="modal-dialog" style="margin-top: 15%">
                <div class="modal-content alert alert-danger" role="alert">
                    <div class="modal-body alert alert-danger" role="alert" style="text-align: center">
                        <h3>Are you sure you want to delete this property ad?</h3><br/>
                        <h4>You will not de able to restore it anymore!</h4><br/>
                    </div>
                    <div class="modal-footer" style="text-align: center">
                        <div class="btn-group btn-group-sm">
                            <button type="button" class="btn btn-default" style="width: 100px" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-danger"  style="width: 100px" href="servlet/EditPropertyDetails?deletePropertyConfirm=CONFIRM">CONFIRM</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
        <!--Modal upgradepremium-->
        <div class="modal" id="upgradepremium" tabindex="-1" role="dialog">
            <div class="modal-dialog" style="margin-top: 10%">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span>
                        </button>
                        <center>
                            <legend class="text-center header">Please choose one of the following plans:</legend>
                        </center>
                    </div>
                    <div class="modal-body">
                        <table class="table" >
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
                                        <a role="button" class="btn btn-warning" style="width: 150" href="upgrade-premium.jsp?propertyID=0000&premiumType=Special&amountPaid=25">Upgrade to Top</a>
                                    </td>
                                    <td style="text-align: center">
                                        <a role="button" class="btn btn-warning" style="width: 150" href="upgrade-premium.jsp?propertyID=0000&premiumType=Sponsored&amountPaid=35">Upgrade to Sponsored</a>
                                    </td>
                                    <td style="text-align: center">

                                        <a role="button" class="btn btn-warning" style="width: 150" href="upgrade-premium.jsp?propertyID=0000&premiumType=Top&amountPaid=50">Upgrade to Top</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>




                </div>
            </div>
        </div>
        <!--end modal-->
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
        <script>
            $('#upgradepremium').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget) // Button that triggered the modal
                var property = button.data('property') // Extract info from data-* attributes
                var str = document.getElementById("upgradepremium").innerHTML;
                var res = str.replace(/0000/gi, property);
                document.getElementById("upgradepremium").innerHTML = res;
            })
        </script>
    </body>
</html>

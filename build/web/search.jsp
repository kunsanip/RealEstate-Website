<!DOCTYPE html>

<%@page import="java.util.ArrayList"%>
<%@page import="beans.Owner"%>
<%@page import="beans.Property"%>

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
    
    
    String searchCriteria = (String) session.getAttribute("searchCriteria");
    String newAdPurpose = (String) session.getAttribute("newAdPurpose");
    String newPropertyType = (String) session.getAttribute("newPropertyType");
    String newPropertySuburb = (String) session.getAttribute("newPropertySuburb");
    String newPropertyBedrooms = (String) session.getAttribute("newPropertyBedrooms");
    String newPropertyBathrooms = (String) session.getAttribute("newPropertyBathrooms");
    String newPropertyCarSpaces = (String) session.getAttribute("newPropertyCarSpaces");
    
    ArrayList<Property> propertiesList = (ArrayList<Property>) session.getAttribute("propertiesList");
    ArrayList<Owner> ownersList = (ArrayList<Owner>) session.getAttribute("ownersList");
    ArrayList<String> suburbsList = (ArrayList<String>) session.getAttribute("suburbsList");
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
                            <span class="glyphicon glyphicon-home"></span></a> &nbsp; Advanced Search
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
                <li class="active"> Advanced Search </li>
            </ol>

            <!--Main Content-->
            <div class="row">

                <!--Left Panel-->
                <div class="col-sm-8">

                    <!-- Search criteria bar-->
                    <form action="servlet/SearchProperties" method="post">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <input type="text" class="form-control input-lg" name="searchCriteria" placeholder="Enter any keyword..."
                                                   <%if (searchCriteria != null) {%> value="<%=searchCriteria%>" <%}%>/>
                                            <span class="input-group-btn">
                                                <button class="btn btn-warning btn-lg" type="submit" name="search" value="search">
                                                    <span class="glyphicon glyphicon-search" style="width: 40px"></span></button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    <!-- Refine search criteria bar-->
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <h4>Refine your search</h4>
                                <div class="row">
                                    <!--Ad type-->
                                    <div class="col-sm-3">
                                        <select class="form-control" name="newAdPurpose">
                                            <option value="%%">Ad Type</option>
                                            <option value="%%" <%if (newAdPurpose != null) {
                                                if (newAdPurpose.equals("%%")) {%> <%="selected"%> <%}}%>>Any</option>
                                            <option value="For sale" <%if (newAdPurpose != null) {
                                                if (newAdPurpose.equals("For sale")) {%> <%="selected"%> <%}}%>>For sale</option>
                                            <option value="For rent" <%if (newAdPurpose != null) {
                                                if (newAdPurpose.equals("For rent")) {%> <%="selected"%> <%}}%>>For rent</option>
                                        </select>
                                    </div>
                                    <!--Property type-->
                                    <div class="col-sm-4">
                                        <select class="form-control" id="newPropertyType" name="newPropertyType">
                                            <option value="%%">Property Type</option>
                                            <option value="%%" <%if (newPropertyType != null) {
                                                if (newPropertyType.equals("%%")) {%> <%="selected"%> <%}}%>>Any</option>
                                            <option value="House" <%if (newPropertyType != null) {
                                                if (newPropertyType.equals("House")) {%> <%="selected"%> <%}}%>>House</option>
                                            <option value="Apartment" <%if (newPropertyType != null) {
                                                if (newPropertyType.equals("Apartment")) {%> <%="selected"%> <%}}%>>Apartment</option>
                                            <option value="Unit" <%if (newPropertyType != null) {
                                                if (newPropertyType.equals("Unit")) {%> <%="selected"%> <%}}%>>Unit</option>
                                            <option value="Townhouse" <%if (newPropertyType != null) {
                                                if (newPropertyType.equals("Townhouse")) {%> <%="selected"%> <%}}%>>Townhouse</option>
                                            <option value="Villa" <%if (newPropertyType != null) {
                                                if (newPropertyType.equals("Villa")) {%> <%="selected"%> <%}}%>>Villa</option>
                                            <option value="Land" <%if (newPropertyType != null) {
                                                if (newPropertyType.equals("Land")) {%> <%="selected"%> <%}}%>>Land</option>
                                            <option value="Rural" <%if (newPropertyType != null) {
                                                if (newPropertyType.equals("Rural")) {%> <%="selected"%> <%}}%>>Rural</option>
                                            <option value="Block of Units" <%if (newPropertyType != null) {
                                                if (newPropertyType.equals("Block of Units")) {%> <%="selected"%> <%}}%>>Block of Units</option>
                                        </select>
                                    </div>
                                    <!--Suburb-->
                                    <div class="col-sm-5">
                                        <select class="form-control" name="newPropertySuburb">
                                            <option value="%%">Suburb</option>
                                            <option value="%%" <%if (newPropertySuburb != null) {
                                                if (newPropertySuburb.equals("%%")) {%> <%="selected"%> <%}}%>>Any</option>
                                            <%for (int i = 0; i < suburbsList.size(); i++) {%>
                                            <option value="<%=suburbsList.get(i)%>"<%if (newPropertySuburb != null) {
                                                if (newPropertySuburb.equals(suburbsList.get(i))) {%> <%="selected"%> <%}}%>
                                                    ><%=suburbsList.get(i)%></option><%}%>
                                        </select>
                                    </div>
                                </div>
                                <br/>
                                <div class="row">
                                        <!--Bedrooms-->
                                    <div class="col-sm-3">
                                        <select class="form-control" name="newPropertyBedrooms">
                                            <option value="-1">Bedrooms</option>
                                            <option value="-1" <%if (newPropertyBedrooms != null) {
                                                if (newPropertyBedrooms.equals("-1")) {%> <%="selected"%> <%}}%>>Any</option>
                                            <option value="0" <%if (newPropertyBedrooms != null) {
                                                if (newPropertyBedrooms.equals("0")) {%> <%="selected"%> <%}}%>>1+</option>
                                            <option value="1" <%if (newPropertyBedrooms != null) {
                                                if (newPropertyBedrooms.equals("1")) {%> <%="selected"%> <%}}%>>2+</option>
                                            <option value="2" <%if (newPropertyBedrooms != null) {
                                                if (newPropertyBedrooms.equals("2")) {%> <%="selected"%> <%}}%>>3+</option>
                                            <option value="3" <%if (newPropertyBedrooms != null) {
                                                if (newPropertyBedrooms.equals("3")) {%> <%="selected"%> <%}}%>>4+</option>
                                            <option value="4" <%if (newPropertyBedrooms != null) {
                                                if (newPropertyBedrooms.equals("4")) {%> <%="selected"%> <%}}%>>5+</option>
                                        </select>
                                    </div>
                                        <!--Bathrooms-->
                                    <div class="col-sm-3">
                                        <select class="form-control" name="newPropertyBathrooms">
                                            <option value="-1">Bathrooms</option>
                                            <option value="-1" <%if (newPropertyBathrooms != null) {
                                                if (newPropertyBathrooms.equals("-1")) {%> <%="selected"%> <%}}%>>Any</option>
                                            <option value="0" <%if (newPropertyBathrooms != null) {
                                                if (newPropertyBathrooms.equals("0")) {%> <%="selected"%> <%}}%>>1+</option>
                                            <option value="1" <%if (newPropertyBathrooms != null) {
                                                if (newPropertyBathrooms.equals("1")) {%> <%="selected"%> <%}}%>>2+</option>
                                            <option value="2" <%if (newPropertyBathrooms != null) {
                                                if (newPropertyBathrooms.equals("2")) {%> <%="selected"%> <%}}%>>3+</option>
                                            <option value="3" <%if (newPropertyBathrooms != null) {
                                                if (newPropertyBathrooms.equals("3")) {%> <%="selected"%> <%}}%>>4+</option>
                                            <option value="4" <%if (newPropertyBathrooms != null) {
                                                if (newPropertyBathrooms.equals("4")) {%> <%="selected"%> <%}}%>>5+</option>
                                        </select>
                                    </div>
                                        <!--Car spaces-->
                                    <div class="col-sm-3">
                                        <select class="form-control" name="newPropertyCarSpaces">
                                            <option value="-1">Car spaces</option>
                                            <option value="-1" <%if (newPropertyCarSpaces != null) {
                                                if (newPropertyCarSpaces.equals("-1")) {%> <%="selected"%> <%}}%>>Any</option>
                                            <option value="0" <%if (newPropertyCarSpaces != null) {
                                                if (newPropertyCarSpaces.equals("0")) {%> <%="selected"%> <%}}%>>1+</option>
                                            <option value="1" <%if (newPropertyCarSpaces != null) {
                                                if (newPropertyCarSpaces.equals("1")) {%> <%="selected"%> <%}}%>>2+</option>
                                            <option value="2" <%if (newPropertyCarSpaces != null) {
                                                if (newPropertyCarSpaces.equals("2")) {%> <%="selected"%> <%}}%>>3+</option>
                                            <option value="3" <%if (newPropertyCarSpaces != null) {
                                                if (newPropertyCarSpaces.equals("3")) {%> <%="selected"%> <%}}%>>4+</option>
                                            <option value="4" <%if (newPropertyCarSpaces != null) {
                                                if (newPropertyCarSpaces.equals("4")) {%> <%="selected"%> <%}}%>>5+</option>
                                        </select>
                                    </div>
                                    <!--Control buttons-->
                                    <div class="col-sm-3">
                                        <div class="btn-group btn-group-justified" role="group">
                                            <div class="btn-group" role="group">
                                                <input type="submit" class="btn btn-default" name="reset" value="Reset"/>
                                            </div>
                                            <div class="btn-group" role="group">
                                                <input type="submit" class="btn btn-warning" name="refine" value="Update"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                    <!-- Properties Display Area-->
                    <div class="page-header">
                        <h3>Search Results</h3>
                    </div>                    

                    <!-- Property Box-->
                    <%for (int i = 0; i < propertiesList.size(); i++) {%>
                    <%if (((propertiesList.get(i)).getAdType()).equals("Premium")) {%>
                    <div class="panel panel-warning">
                    <%} else {%>
                    <div class="panel panel-primary">
                    <%}%>
                    <!-- Property Box Heading-->
                    <div class="panel-heading">
                        <div class="row">
                            <%if (((propertiesList.get(i)).getAdType()).equals("Premium")) {%>
                            <div class="col-xs-1">
                                <img src="images/premium-badge.png" style="width: 50px"/>
                            </div>
                            <div class="col-xs-7">
                            <%} else {%>
                            <div class="col-xs-8">
                            <%}%>
                                <h3 class="panel-title">
                                    <%=(propertiesList.get(i)).getPropertyAddress()%>, 
                                    <%=(propertiesList.get(i)).getPropertySuburb()%>, 
                                    <%=(propertiesList.get(i)).getPropertyState()%>, 
                                    <%=(propertiesList.get(i)).getPropertyPostcode()%>
                                </h3>
                            </div>
                            <div class="col-xs-4">
                                <h3 class="panel-title text-right"> $<%=(propertiesList.get(i)).getPropertyPrice()%> </h3>
                            </div>
                        </div>
                    </div>
                    <!-- Property Box Body-->
                    <div class="panel-body">
                        <!-- Left Panel -->
                        <div class="col-md-6">
                        <!-- Picture -->
                            <div id="property_pictures" class=" thumbnail">
                                <img class="img-rounded" src="servlet/LoadPropertyPicture?propertyID=<%=(propertiesList.get(i)).getPropertyID()%>"
                                     onError="this.onerror=null; this.src='images/property-placeholder.png';"/>
                            </div>
                        </div>
                        <!-- Right Panel -->
                        <div class="col-md-6">
                            <div style="float: right">
                                <%if (((propertiesList.get(i)).getAdPurpose()).equals("For sale")) {%>
                                <img style="width: 120px" src="images/for_sale.png"/>
                                <%} else {%>
                                <img style="width: 120px" src="images/for_rent.png"/>
                                 <%}%>
                            </div>
                            <h4> <strong> <%=(propertiesList.get(i)).getPropertyType()%> </strong> </h4>
                            <p>
                                <img src="images/beds.png" title="Bedrooms"/>
                                <%=(propertiesList.get(i)).getPropertyBedrooms()%>
                                <img src="images/baths.png" title="Bathrooms"/>
                                <%=(propertiesList.get(i)).getPropertyBathrooms()%>
                                <img src="images/parking_spaces.png" title="Parking Spaces"/>
                                <%=(propertiesList.get(i)).getPropertyCarSpaces()%>
                            </p>
                            <br/>
                            <p>
                                <strong> <%=(propertiesList.get(i)).getAdTitle()%> </strong> <br/>
                                <span style="font-size: 12px"> <%=(propertiesList.get(i)).getPropertyDescription()%> </span>
                            </p>
                            <p> <strong> Owner: </strong><%=(propertiesList.get(i)).getOwnerFirstName()%> <%=(propertiesList.get(i)).getOwnerLastName()%><br/>
                                <strong> Published in: </strong> <%=(propertiesList.get(i)).getDateCreated()%> </p>
                            <br/>
                            <div class="pull-right">
                                <% if(favoritesList != null){
                                    for (int j = 0; j < favoritesList.size(); j++){
                                        if((favoritesList.get(j)).equals((propertiesList.get(i)).getPropertyID())){
                                        favorite = true;
                                        }
                                    }
                                }
                                if(comparisonList != null){
                                    for (int j = 0; j < comparisonList.size(); j++){
                                        if((comparisonList.get(j)).equals((propertiesList.get(i)).getPropertyID())){
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
                                       href="servlet/ManageFavorites?propertyID=<%=(propertiesList.get(i)).getPropertyID()%>&from=/servlet/SearchProperties&favorite=remove"
                                       data-toggle="tooltip" data-placement="bottom" title="Remove from favorites">
                                        <span class="glyphicon glyphicon-star" style="color: orange"></span></a>
                                    <%}else{%>
                                    <a class="btn btn-lg btn-default"
                                       href="servlet/ManageFavorites?propertyID=<%=(propertiesList.get(i)).getPropertyID()%>&from=/servlet/SearchProperties&favorite=add"
                                       data-toggle="tooltip" data-placement="bottom" title="Save to favorites">
                                       <span class="glyphicon glyphicon-star"></span></a>
                                    <%}favorite = false;%>

                                    <%if(comparator){%>
                                    <a class="btn btn-lg btn-default"
                                       href="servlet/ManageComparisonList?propertyID=<%=(propertiesList.get(i)).getPropertyID()%>&from=/servlet/SearchProperties&comparator=remove"
                                       data-toggle="tooltip" data-placement="bottom" title="Remove from comparison list">
                                        <span class="glyphicon glyphicon-stats" style="color: green"></span></a>
                                    <%}else{%>
                                    <a class="btn btn-lg btn-default"
                                       href="servlet/ManageComparisonList?propertyID=<%=(propertiesList.get(i)).getPropertyID()%>&from=/servlet/SearchProperties&comparator=add"
                                       data-toggle="tooltip" data-placement="bottom" title="Add to comparison list">
                                       <span class="glyphicon glyphicon-stats"></span></a>
                                    <%}comparator = false;%>

                                    <a class="btn btn-lg btn-default"
                                       href="servlet/LoadPropertyDetails?propertyID=<%=(propertiesList.get(i)).getPropertyID()%>"
                                       data-toggle="tooltip" data-placement="bottom"title="View details">
                                       <span class="glyphicon glyphicon-list-alt"></span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    <%}%>
                </div>

                <!--Right Panel-->
                <div class="col-sm-4">
                    <!-- Best Owners Display Area-->
                    <div class="panel panel-primary">
                        <!-- Best Owners Header-->
                        <div class="panel-heading">
                            <h3 class="panel-title">Best Owners</h3>
                        </div>
                        <!--Best Owners Box-->
                        <div class="panel-body">
                            <!--Best Owner-->
                            <%for (int i = 0; i < ownersList.size(); i++) {%>
                            <div class="thumbnail">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="thumbnail" style="width: 90px">
                                            <a href="#" data-toggle="modal" data-target="#contactOwner"
                                                data-owner="<%=(ownersList.get(i)).getOwnerID()%>">
                                            <img class="img-rounded" data-toggle="tooltip" data-placement="bottom"title="Contact owner"
                                                src="servlet/LoadOwnerPicture?ownerID=<%=(ownersList.get(i)).getOwnerID()%>"
                                                onError="this.onerror=null; this.src='images/owner-placeholder.png';"/>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-xs-8">
                                        <div class="caption">
                                            <h4> <%=(ownersList.get(i)).getFirstName()%> <%=(ownersList.get(i)).getLastName()%> </h4>
                                            <table>
                                                <tr>
                                                    <th style="width: 110px">Member since:</th>
                                                    <td><span class="text-primary"><%=(ownersList.get(i)).getMemberSince()%></span></td>
                                                </tr>
                                                <tr>
                                                    <th>Properties:</th>
                                                    <td><span class="text-primary">
                                                        <%=(ownersList.get(i)).getTotalProperties()%></span></td>
                                                </tr>
                                            </table>
                                                <br/>
                                            <div class="btn-group pull-right">
                                                <button type="button" class="btn btn-link" 
                                                    data-toggle="tooltip" data-placement="bottom"title="View properties">
                                                    <span class="glyphicon glyphicon-folder-open"></span></button>
                                                <button type="button" class="btn btn-link" data-toggle="modal"
                                                    data-target="#contactOwner" data-owner="<%=(ownersList.get(i)).getOwnerID()%>">
                                                    <span data-toggle="tooltip" data-placement="bottom"title="Contact owner">
                                                    <span class="glyphicon glyphicon-envelope"></span></span></button>
                                            </div>
                                            <br/>
                                        </div>
                                    </div>
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
                                    <input type="text" class="form-control" name="senderEmail">
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

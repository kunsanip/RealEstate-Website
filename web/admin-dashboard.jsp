<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.Owner"%>
<%@page import="beans.Property"%>
<%@page import="beans.AdminMessage"%>
<%@page import="beans.DeletedOwner"%>

<%
    session = request.getSession(true);

    ArrayList<Owner> ownersList = (ArrayList<Owner>) session.getAttribute("ownersList");
    ArrayList<Property> propertiesList = (ArrayList<Property>) session.getAttribute("propertiesList");
    ArrayList<AdminMessage> adminMessagesList = (ArrayList<AdminMessage>) session.getAttribute("adminMessagesList");
    ArrayList<DeletedOwner> deletedOwnersList = (ArrayList<DeletedOwner>) session.getAttribute("deletedOwnersList");
    
    String totalOwners = (String) session.getAttribute("totalOwners");
    String totalProperties = (String) session.getAttribute("totalProperties");
    String totalMessages = (String) session.getAttribute("totalMessages");
    
    String reason = (String) session.getAttribute("reason");
    String errReason = (String) session.getAttribute("errReason");
    String deleteOwnerID = (String) session.getAttribute("deleteOwnerID");
    
    String loadDeleteOwner = (String) session.getAttribute("loadDeleteOwner");
    String loadDeleteOwnerConfirm = (String) session.getAttribute("loadDeleteOwnerConfirm");
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
            small {color: red}
            th, td{text-align: center}
        </style>
        <script>
            $(function () {
                $('[data-toggle="popover"]').popover();
                $('[data-toggle="tooltip"]').tooltip();
            });
            var loadDeleteOwner = "<%=loadDeleteOwner%>";
            if (loadDeleteOwner == "true") {
                $(function () {
                    $('#deleteOwner').modal();
                });
            }
            var loadDeleteOwnerConfirm = "<%=loadDeleteOwnerConfirm%>";
            if (loadDeleteOwnerConfirm == "true") {
                $(function () {
                    $('#deleteOwnerConfirm').modal();
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
            <nav class="navbar navbar-default" style="background: #505585">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <div class="navbar-brand" style="color: white; font-size: 26px">
                            <a style="color: turquoise; font-size: 22px" href="index.jsp"
                            onmouseover="this.style.color = 'cyan'" onmouseout="this.style.color = 'turquoise'"
                            data-toggle="tooltip" data-placement="bottom" title="Go to Home page">
                            <span class="glyphicon glyphicon-home"></span></a> &nbsp; Admin Dashboard
                        </div>
                    </div>
                    <div class="collapse navbar-collapse" id="navbar">
                        <form class="navbar-form navbar-right" role="form">
                            <a class="btn btn-link" style="color: orange" onmouseover="this.style.color = '#ffcc33'"
                               onmouseout="this.style.color = 'orange'" href="servlet/LoadAdminDashboard"
                                data-toggle="tooltip" data-placement="bottom" title="Sign out">
                            <span class="glyphicon glyphicon-log-out" style="font-size: 18px"></span></a>
                        </form>
                    </div>
                </div>
            </nav>
<!--
                               onmouseout="this.style.color = 'orange'" href="servlet/SignOut"
-->

            <!--Bread crumb-->
            <ol class="breadcrumb">
                <li> <a href="index.jsp"> <strong> Home </strong> </a> </li>
                <li class="active"> Admin Dashboard </li>
            </ol>
            
            <!--Gauges-->
            <div class="row">

                <!--Messages Gauge-->
                <div class="col-sm-4">
                    <div class="panel panel-success">
                        <div class="panel-heading text-center"  style="font-size: 20px">Messages</div>
                        <div class="panel-body text-center" style="font-size: 30px">
                            <strong><%=totalMessages%></strong><br/>
                            <button class="btn btn-link center-block"
                                onclick="document.getElementById('messages').style.display = 'block';
                                         document.getElementById('properties').style.display = 'none';
                                         document.getElementById('deletedOwners').style.display = 'none';
                                         document.getElementById('owners').style.display = 'none';">
                                View Messages
                            </button>
                        </div>
                    </div>
                </div>

                <!--Owners Gauge-->
                <div class="col-sm-4">
                    <div class="panel panel-info">
                        <div class="panel-heading text-center"  style="font-size: 20px">Owners</div>
                        <div class="panel-body text-center" style="font-size: 30px">
                            <strong><%=totalOwners%></strong><br/>
                            <button class="btn btn-link center-block"
                                onclick="document.getElementById('messages').style.display = 'none';
                                         document.getElementById('properties').style.display = 'none';
                                         document.getElementById('deletedOwners').style.display = 'none';
                                         document.getElementById('owners').style.display = 'block';">
                                View Owners
                            </button>
                        </div>
                    </div>
                </div>
            
                <!--Properties Gauge-->
                <div class="col-sm-4">
                    <div class="panel panel-warning">
                        <div class="panel-heading text-center"  style="font-size: 20px">Properties</div>
                        <div class="panel-body text-center" style="font-size: 30px">
                            <strong><%=totalProperties%></strong><br/>
                            <button class="btn btn-link center-block"
                                onclick="document.getElementById('messages').style.display = 'none';
                                         document.getElementById('properties').style.display = 'block';
                                         document.getElementById('deletedOwners').style.display = 'none';
                                         document.getElementById('owners').style.display = 'none';">
                                View Properties
                            </button>
                        </div>
                    </div>
                </div>

            </div>

            <!--Main Content-->
            <div style="min-height: 300px">

            <!--Messages-->
            <div id="messages" style="display: block">
                <!--Messages header-->
                <div class="page-header">
                    <h3>Messages</h3>
                </div>
                <!--Messages-->
                <div class="panel panel-success">
                    <div class="panel-body">
                        <%if (adminMessagesList.size() == 0){%>
                            <h3>No new messages</h3>
                        <%} else {
                        for (int i = 0; i < adminMessagesList.size(); i++) {%>
                        <div class="panel panel-success">
                            <div class="panel-body bg-success">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <strong>From: </strong><%=(adminMessagesList.get(i)).getSenderName()%><br/>
                                        <strong>email: </strong><%=(adminMessagesList.get(i)).getSenderEmail()%><br/>
                                        <strong>Sent: </strong><%=(adminMessagesList.get(i)).getMessageDate()%>
                                    </div>
                                    <div class="col-sm-8 thumbnail" style="min-height: 60px">
                                        <%=(adminMessagesList.get(i)).getMessage()%>
                                    </div>                            
                                    <div class="col-sm-1">
                                        <br/>
                                        <a class="btn btn-lg btn-link center-block" data-toggle="tooltip" data-placement="bottom"title="Dismiss"
                                            href="servlet/DismissAdminMessage?adminMessageID=<%=(adminMessagesList.get(i)).getAdminMessageID()%>">
                                            <span class="glyphicon glyphicon-trash"></span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}}%>
                    </div>
                </div>
            </div>
            
            <!--Properties-->
            <div id="properties" style="display: none">
                <!--Properties Header-->
                <div class="page-header">
                    <h3>Properties List</h3>
                </div>
                <!--Properties List-->
                <div class="panel panel-warning" style="overflow-x: auto">
                        <table class="table  bg-warning">
                            <tr class="text-warning" style="background-color: #ffcc33">
                                <th></th>
                                <th>ID</th>
                                <th>Owner</th>
                                <th>Title</th>
                                <th>Type</th>
                                <th>Purpose</th>
                                <th>Size</th>
                                <th>Price</th>
                                <th>Address</th>
                                <th>Suburb</th>
                                <th>State</th>
                                <th>Postcode</th>
                                <th><img src="images/beds.png"  data-toggle="tooltip" data-placement="bottom" title="Bedrooms"/></th>
                                <th><img src="images/baths.png"  data-toggle="tooltip" data-placement="bottom" title="Bedrooms"/></th>
                                <th><img src="images/parking_spaces.png"  data-toggle="tooltip" data-placement="bottom" title="Bedrooms"/></th>
                                <th>Ad Type</th>
                                <th>Published</th>
                                <th>Expire</th>
                                <th>Description</th>
                            </tr>
                            <%for (int i = 0; i < propertiesList.size(); i++) {%>
                            <tr>
                                <td>
                                    <div class="img-rounded" style="width: 100px; height: 50px; background-size: cover; background-repeat: no-repeat; background-position: 50% 50%;
                                        margin:auto; background-image: url('servlet/LoadPropertyPicture?propertyID=<%=(propertiesList.get(i)).getPropertyID()%>')">
                                    </div>
                                </td>
                                <td> <%=(propertiesList.get(i)).getPropertyID()%> </td>
                                <td> <%=(propertiesList.get(i)).getOwnerID()%> </td>
                                <td> <%=(propertiesList.get(i)).getAdTitle()%> </td>
                                <td> <%=(propertiesList.get(i)).getPropertyType()%> </td>
                                <td> <%=(propertiesList.get(i)).getAdPurpose()%> </td>
                                <td> <%=(propertiesList.get(i)).getPropertySize()%> </td>
                                <td> <%=(propertiesList.get(i)).getPropertyPrice()%> </td>
                                <td> <%=(propertiesList.get(i)).getPropertyAddress()%> </td>
                                <td> <%=(propertiesList.get(i)).getPropertySuburb()%> </td>
                                <td> <%=(propertiesList.get(i)).getPropertyState()%> </td>
                                <td> <%=(propertiesList.get(i)).getPropertyPostcode()%> </td>
                                <td> <%=(propertiesList.get(i)).getPropertyBedrooms()%> </td>
                                <td> <%=(propertiesList.get(i)).getPropertyBathrooms()%> </td>
                                <td> <%=(propertiesList.get(i)).getPropertyCarSpaces()%> </td>
                                <td> <%=(propertiesList.get(i)).getAdType()%> </td>
                                <td> <%=(propertiesList.get(i)).getDateCreated()%> </td>
                                <td> <%=(propertiesList.get(i)).getExpireDate()%> </td>
                                <td style="text-align: left; min-width: 400px"> <%=(propertiesList.get(i)).getPropertyDescription()%> </td>
                            </tr>
                            <%}%>
                        </table>
                </div>
            </div>
            
            <!--Owners-->
            <div id="owners" style="display: none">
                <!--Owners Header-->
                <div class="page-header">
                    <h3>Owners List &nbsp;
                        <span style="font-size: 14">
                            <button class="btn btn-link"
                                onclick="document.getElementById('deletedOwners').style.display = 'block';
                                         document.getElementById('owners').style.display = 'none';">
                                View Deleted Owners
                            </button>
                        </span>
                    </h3>
                </div>
                <!--Owners List-->
                <div class="panel panel-info" style="overflow-x: auto">
                        <table class="table  bg-info">
                            <tr class="text-info" style="background-color: turquoise">
                                <th></th>
                                <th>ID</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>email</th>
                                <th>Phone</th>
                                <th>Address</th>
                                <th>Suburb</th>
                                <th>State</th>
                                <th>Postcode</th>
                                <th>Member Since</th>
                                <th>
                                    <span class="glyphicon glyphicon-home" data-toggle="tooltip" data-placement="bottom" title="Published Ads"></span></a>
                                </th>
                                <th>
                                    <span class="glyphicon glyphicon-trash" data-toggle="tooltip" data-placement="bottom" title="Delete Account"></span>
                                </th>
                            </tr>
                            <%for (int i = 0; i < ownersList.size(); i++) {%>
                            <tr>
                                <td>
                                    <div class="img-circle" style="width: 75px; height: 75px; background-size: cover; background-repeat: no-repeat; background-position: 50% 50%;
                                        margin:auto; background-image: url('servlet/LoadOwnerPicture?ownerID=<%=(ownersList.get(i)).getOwnerID()%>')">
                                    </div>
                                </td>
                                <td> <%=(ownersList.get(i)).getOwnerID()%> </td>
                                <td> <%=(ownersList.get(i)).getFirstName()%> </td>
                                <td> <%=(ownersList.get(i)).getLastName()%> </td>
                                <td> <%=(ownersList.get(i)).getEmail()%> </td>
                                <td> <%=(ownersList.get(i)).getPhone()%> </td>
                                <td> <%=(ownersList.get(i)).getAddress()%> </td>
                                <td> <%=(ownersList.get(i)).getSuburb()%> </td>
                                <td> <%=(ownersList.get(i)).getState()%> </td>
                                <td> <%=(ownersList.get(i)).getPostcode()%> </td>
                                <td> <%=(ownersList.get(i)).getMemberSince()%> </td>
                                <td> <%=(ownersList.get(i)).getTotalProperties()%> </td>
                                <td>
                                    <a class="btn btn-danger" href="servlet/DeleteAccountByAdmin?deleteOwnerID=<%=(ownersList.get(i)).getOwnerID()%>&loadDeleteOwner=true">
                                        <span class="glyphicon glyphicon-trash" data-toggle="tooltip" data-placement="bottom" title="Delete this account"></span>
                                    </a>
                                </td>
                            </tr>
                            <%}%>
                        </table>
                </div>
            </div>
            
            <!--Deleted Owners-->
            <div id="deletedOwners" style="display: none">
                <!--Deleted Owners Header-->
                <div class="page-header">
                    <h3>Deleted Owners List &nbsp;
                        <span style="font-size: 14">
                            <button class="btn btn-link"
                                onclick="document.getElementById('deletedOwners').style.display = 'none';
                                         document.getElementById('owners').style.display = 'block';">
                                View Owners
                            </button>
                        </span>
                    </h3>
                </div>
                <!--Deleted Owners List-->
                <div class="panel panel-info" style="overflow: auto">
                        <table class="table  bg-info">
                            <tr class="text-info" style="background-color: turquoise">
                                <th>ID</th>
                                <th>Deletion Date</th>
                                <th>Reason</th>
                            </tr>
                            <%for (int i = 0; i < deletedOwnersList.size(); i++) {%>
                            <tr>
                                <td> <%=(deletedOwnersList.get(i)).getOwnerID()%> </td>
                                <td> <%=(deletedOwnersList.get(i)).getDeletionDate()%> </td>
                                <td> <%=(deletedOwnersList.get(i)).getReason()%> </td>
                            </tr>
                            <%}%>
                        </table>
                </div>
            </div>
                    
            </div><!--Main Content-->

            <!--Footer-->
            <div class="panel panel-default" style="background: #505585">
                <div class="panel-body">
                    <p style="color: white; text-align: center; font-size: 12px;">
                        © Copyright 2014 by SSX Real Estate Australia Pty Ltd - All rights reserved
                    </p>
                </div>
            </div>
        </div>

        <!--Delete Owner Account Modal-->
        <form action="servlet/DeleteAccountByAdmin" method="post">
            <div class="modal" id="deleteOwner" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog" style="margin-top: 10%">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Delete Owner Account</h4>
                        </div>
                        <div class="modal-body text-center">
                            <h4> You selected to remove from the system the account and all registered property ads of:</h4>
                            <h3 class=" text-primary"><%=deleteOwnerID%></h3>
                            <br/>
                            <div class="form-group">
                                <label for="reason">Please enter a reason for the deletion:</label>
                                <textarea class="form-control"name="reason"><%if(reason != null){%><%=reason%><%}%></textarea>
                                <%if (errReason != null) {%><small><%=errReason%></small><%}%>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="btn-group">
                                <input type="submit" class="btn btn-default" name="deleteOwnerCancel" value="Cancel"/>
                                <input type="submit" class="btn btn-primary" name="deleteOwnerSubmit" value="Submit"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--Delete Owner Confirm Modal-->
            <div class="modal" id="deleteOwnerConfirm" tabindex="-1" role="dialog" role="dialog" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog" style="margin-top: 12%">
                    <div class="modal-content alert alert-danger">
                        <div class="modal-body alert alert-danger">
                            <h4>The following account will be removed from the system:</h4>
                            <h4 class="text-primary"><%=deleteOwnerID%></h4>
                            <br/>
                            <h4>For the reason:</h4>
                            <h4 class=" text-primary"><%=reason%></h4>
                        </div>
                        <div class="modal-footer" style="text-align: center">
                            <div class="btn-group btn-group-sm">
                                <input type="submit" class="btn btn-default" style="width: 100px" name="deleteOwnerConfirmCancel" value="Cancel"/>
                                <input type="submit" class="btn btn-danger" style="width: 100px" name="deleteOwnerConfirmCONFIRM" value="CONFIRM"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>        
        </form>

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

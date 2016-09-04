<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="ITC303 201460 Project">
    <meta name="author" content="SSX Team">
    <link rel="icon" href="images/favicon.ico">
    <title>SSX Real Estate - Payment Confirm</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <!--<link href="css/navbar.css" rel="stylesheet">-->
    <!--<link href="css/grid.css" rel="stylesheet">-->
    <!--<link href="css/theme.css" rel="stylesheet">-->
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
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
        <nav class="navbar navbar-default" role="navigation" style="margin: 0px;">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!--<a class="navbar-brand" href="#">Brand</a>-->
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Enter suburb or postcode">
                        </div>
                        <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span>
                        </button>
                        <button type="submit" class="btn btn-default">Advanced Search</button>
                    </form>
                    <form class="navbar-form navbar-right" role="form">
                        <div class="form-group">
                            <input type="text" placeholder="Email" class="form-control">
                            <input type="password" placeholder="Password" class="form-control">
                        </div>
                        <div class="btn-group">
                            <button type="submit" class="btn btn-primary">Sign in</button>
                            <button type="submit" class="btn btn-warning">Sign up</button>
                        </div>
                    </form>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
        <!-- Main component for a primary marketing message or call to action -->
        <div class="row">
            <div class="col-md-8" style="margin-top: 15px">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a>
                    </li>
                    <li class="active">Payment Confirm</li>
                </ol>
                <div class="alert alert-info alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                    </button>
                    Hi there. This is <strong>payment confirm</strong> page.
                </div>
                <div class="panel panel-default">
                    <!--Payment confirm body-->
                    <div class="panle-body" style="margin:15px">
                        <legend>Payment Confirm</legend>
                        <table class="table table-hover">
                            <tbody>
                                <!--Property ID-->
                                <tr>
                                    <td>
                                        <div class="form-group" style="float: right">

                                            <label for="inputEmail3" class="col-sm-4 control-label">Property&nbsp;ID:</label>
                                        </div>
                                    </td>
                                    <td>013456</td>
                                </tr>
                                <!--Property Exprie date-->
                                <tr>
                                    <td>
                                        <div class="form-group" style="float: right">

                                            <label for="inputEmail3" class="col-sm-4 control-label">Premium&nbsp;Exprie&nbsp;Date:</label>
                                        </div>
                                    </td>
                                    <td>10/10/2014</td>
                                </tr>
                                <!--Property Plan-->
                                <tr>
                                    <td>
                                        <div class="form-group" style="float: right">

                                            <label for="inputEmail3" class="col-sm-4 control-label">Premium&nbsp;Plan:</label>
                                        </div>
                                    </td>
                                    <td>Premium plan 1</td>
                                </tr>
                                <!--Property plan price-->
                                <tr>
                                    <td>
                                        <div class="form-group" style="float: right">

                                            <label for="inputEmail3" class="col-sm-4 control-label">Premium&nbsp;Plan&nbsp;Price:</label>
                                        </div>
                                    </td>
                                    <td>$59.00</td>
                                </tr>
                                <!--Property url-->
                                <tr>
                                    <td>
                                        <div class="form-group" style="float: right">

                                            <label for="inputEmail3" class="col-sm-4 control-label">Property&nbsp;URL:</label>
                                        </div>
                                    </td>
                                    <td>http://www.ssxrealstate.com/premium/1231</td>
                                </tr>
                                <tr>
                                    <td colspan="2"><center>
                                        <a class="btn btn-primary" type="button" href="index.jsp">HOME</a></center>
                                    </td>
                                </tr>
                            </tbody>
                        </table>




                    </div>
                </div>


            </div>
            <div class="col-md-4" style=" margin-top: 15px">
                <div class="alert alert-warning alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                    </button>
                    <strong>SSX</strong> Better Real Estate.
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Premium Owners</h3>
                    </div>
                    <div class="panel-body">
                        <div class="thumbnail" style="width: 90%; margin: auto">
                            <div style="float: left; margin-right: 15px">
                                <img src="images/contact_001.jpg" height="100" width="70" alt="Daniel Ungar">
                            </div>
                            <div class="caption">
                                <h4>Daniel Ungar</h4>
                                <p><span style="font-weight: bold">Member since:</span> 01/01/2001
                                    <br/>
                                    <span style="font-weight: bold">Published properties:</span> 03
                                    <br/>
                                </p>
                                <div class="btn-group" style="text-align: right">
                                    <button type="button" class="btn btn-xs btn-default">View Properties</button>
                                    <button type="button" class="btn btn-xs btn-default">Contact Owner</button>
                                </div>
                            </div>
                        </div>
                        <br/>
                        <div class="thumbnail" style="width: 90%; margin: auto">
                            <div style="float: left; margin-right: 15px">
                                <img src="images/contact_002.png" height="100" width="70" alt="Monica Shor">
                            </div>
                            <div class="caption">
                                <h4>Monica Shor</h4>
                                <p><span style="font-weight: bold">Member since:</span> 01/01/2001
                                    <br/>
                                    <span style="font-weight: bold">Published properties:</span> 03
                                    <br/>
                                </p>
                                <div class="btn-group" style="text-align: right">
                                    <button type="button" class="btn btn-xs btn-default">View Properties</button>
                                    <button type="button" class="btn btn-xs btn-default">Contact Owner</button>
                                </div>
                            </div>
                        </div>
                        <br/>
                        <div class="thumbnail" style="width: 90%; margin: auto">
                            <div style="float: left; margin-right: 15px">
                                <img src="images/contact_003.png" height="100" width="70" alt="Daniel Gillespie">
                            </div>
                            <div class="caption">
                                <h4>Daniel Gillespie</h4>
                                <p><span style="font-weight: bold">Member since:</span> 01/01/2001
                                    <br/>
                                    <span style="font-weight: bold">Published properties:</span> 03
                                    <br/>
                                </p>
                                <div class="btn-group" style="text-align: right">
                                    <button type="button" class="btn btn-xs btn-default">View Properties</button>
                                    <button type="button" class="btn btn-xs btn-default">Contact Owner</button>
                                </div>
                            </div>
                        </div>
                        <br/>
                        <div class="thumbnail" style="width: 90%; margin: auto">
                            <div style="float: left; margin-right: 15px">
                                <img src="images/contact_004.jpg" height="100" width="70" alt="George Savva">
                            </div>
                            <div class="caption">
                                <h4>George Savva</h4>
                                <p><span style="font-weight: bold">Member since:</span> 01/01/2001
                                    <br/>
                                    <span style="font-weight: bold">Published properties:</span> 03
                                    <br/>
                                </p>
                                <div class="btn-group" style="text-align: right">
                                    <button type="button" class="btn btn-xs btn-default">View Properties</button>
                                    <button type="button" class="btn btn-xs btn-default">Contact Owner</button>
                                </div>
                            </div>
                        </div>
                        <br/>
                        <div class="thumbnail" style="width: 90%; margin: auto">
                            <div style="float: left; margin-right: 15px">
                                <img src="images/contact_005.png" height="100" width="70" alt="Damon Anasta">
                            </div>
                            <div class="caption">
                                <h4>Damon Anasta</h4>
                                <p><span style="font-weight: bold">Member since:</span> 01/01/2001
                                    <br/>
                                    <span style="font-weight: bold">Published properties:</span> 03
                                    <br/>
                                </p>
                                <div class="btn-group" style="text-align: right">
                                    <button type="button" class="btn btn-xs btn-default">View Properties</button>
                                    <button type="button" class="btn btn-xs btn-default">Contact Owner</button>
                                </div>
                            </div>
                        </div>
                        <br/>
                        <div class="thumbnail" style="width: 90%; margin: auto">
                            <div style="float: left; margin-right: 15px">
                                <img src="images/contact_001.jpg" height="100" width="70" alt="Daniel Ungar">
                            </div>
                            <div class="caption">
                                <h4>Daniel Ungar</h4>
                                <p><span style="font-weight: bold">Member since:</span> 01/01/2001
                                    <br/>
                                    <span style="font-weight: bold">Published properties:</span> 03
                                    <br/>
                                </p>
                                <div class="btn-group" style="text-align: right">
                                    <button type="button" class="btn btn-xs btn-default">View Properties</button>
                                    <button type="button" class="btn btn-xs btn-default">Contact Owner</button>
                                </div>
                            </div>
                        </div>
                        <br/>
                    </div>
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

    <!-- /container -->
    <!-- Bootstrap core JavaScript
        ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>

</html>

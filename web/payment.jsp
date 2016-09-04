<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="ITC303 201460 Project">
        <meta name="author" content="SSX Team">
        <link rel="icon" href="images/favicon.ico">
        <title>SSX Real Estate - Payment</title>
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
                    <img src="images/SSX_logo_Blue.png" alt="SSX Real Estate"/>
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
                            <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                            <button type="submit" class="btn btn-default">Advanced Search</button>
                        </form>
                        <form class="navbar-form navbar-right" role="form">
                            <div class="form-group">
                                <input type="text" placeholder="Email" class="form-control">
                                <input type="password" placeholder="Password" class="form-control">
                            </div>
                            <div class="btn-group">
                            <button type="submit" class="btn btn-primary"> Sign in</button>
                            <button type="submit" class="btn btn-warning">Sign up</button>
                            </div>
                        </form>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
            <!-- Main component for a primary marketing message or call to action -->
            <div class="row">
                <div class="col-md-8"style="margin-top: 15px">
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li class="active">Payment</li>
                    </ol>
                    <div class="alert alert-info alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>Hi there.</strong> This is payment page.
</div>
                    <div class="panel panel-default">
                        <div class="panle-body"style="margin:15px">
                            <legend>Plans</legend>
                            <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#sectionA">Plan A</a></li>
        <li><a data-toggle="tab" href="#sectionB">Plan B</a></li>
    </ul>
    <div class="tab-content">
        <div id="sectionA" class="tab-pane fade in active">
            
            <p>Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui. Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth.</p>
        </div>
        <div id="sectionB" class="tab-pane fade">
            
            <p>Vestibulum nec erat eu nulla rhoncus fringilla ut non neque. Vivamus nibh urna, ornare id gravida ut, mollis a magna. Aliquam porttitor condimentum nisi, eu viverra ipsum porta ut. Nam hendrerit bibendum turpis, sed molestie mi fermentum id. Aenean volutpat velit sem. Sed consequat ante in rutrum convallis. Nunc facilisis leo at faucibus adipiscing.</p>
        </div>       
    </div>
                        
                          <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Pay by Credit Card</a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in">
                <div class="panel-body">
                    <div class="container">
  <form class="form-horizontal" role="form">
    
      <legend>Payment</legend>
      <div class="form-group">
        <label class="col-sm-2 control-label" for="card-holder-name">Name on Card</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" name="card-holder-name" id="card-holder-name" placeholder="Card Holder's Name">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-2 control-label" for="card-number">Card Number</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" name="card-number" id="card-number" placeholder="Debit/Credit Card Number">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-2 control-label" for="expiry-month">Expiration Date</label>
        <div class="col-sm-4">
          <div class="row">
            <div class="col-xs-4">
              <select class="form-control col-sm-4" name="expiry-month" id="expiry-month">
                <option>Month</option>
                <option value="01">Jan (01)</option>
                <option value="02">Feb (02)</option>
                <option value="03">Mar (03)</option>
                <option value="04">Apr (04)</option>
                <option value="05">May (05)</option>
                <option value="06">June (06)</option>
                <option value="07">July (07)</option>
                <option value="08">Aug (08)</option>
                <option value="09">Sep (09)</option>
                <option value="10">Oct (10)</option>
                <option value="11">Nov (11)</option>
                <option value="12">Dec (12)</option>
              </select>
            </div>
            <div class="col-xs-4">
              <select class="form-control" name="expiry-year">
                <option value="13">2013</option>
                <option value="14">2014</option>
                <option value="15">2015</option>
                <option value="16">2016</option>
                <option value="17">2017</option>
                <option value="18">2018</option>
                <option value="19">2019</option>
                <option value="20">2020</option>
                <option value="21">2021</option>
                <option value="22">2022</option>
                <option value="23">2023</option>
              </select>
            </div>
          </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-2 control-label" for="cvv">Card CVV</label>
        <div class="col-sm-2">
          <input type="text" class="form-control" name="cvv" id="cvv" placeholder="Security Code">
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-9">
          <button type="button" class="btn btn-success">Pay Now</button>
        </div>
      </div>
   
  </form>
</div>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Pay by Paypal</a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse">
                <div class="panel-body">
                    <div class="col-sm-offset-5 col-sm-9">
          <button type="button" class="btn btn-success">Pay by Paypal</button>
        </div>
                </div>
            </div>
        </div>
        
    </div>
                                

                        </div>
                    </div>

                    
                </div>
                <div class="col-md-4" style=" margin-top: 15px">
                    <div class="alert alert-warning alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>SSX</strong> Better Real Estate.
</div>
                    <div class="panel panel-primary" >
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
                                <p><span style="font-weight: bold">Member since:</span> 01/01/2001<br/>
                                    <span style="font-weight: bold">Published properties:</span> 03<br/>
                                </p>
                                <div class="btn-group" style="text-align: right">
                                    <button type="button" class="btn btn-xs btn-default" >View Properties</button>
                                    <button type="button" class="btn btn-xs btn-default" >Contact Owner</button>
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
                                <p><span style="font-weight: bold">Member since:</span> 01/01/2001<br/>
                                    <span style="font-weight: bold">Published properties:</span> 03<br/>
                                </p>
                                <div class="btn-group" style="text-align: right">
                                    <button type="button" class="btn btn-xs btn-default" >View Properties</button>
                                    <button type="button" class="btn btn-xs btn-default" >Contact Owner</button>
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
                                <p><span style="font-weight: bold">Member since:</span> 01/01/2001<br/>
                                    <span style="font-weight: bold">Published properties:</span> 03<br/>
                                </p>
                                <div class="btn-group" style="text-align: right">
                                    <button type="button" class="btn btn-xs btn-default" >View Properties</button>
                                    <button type="button" class="btn btn-xs btn-default" >Contact Owner</button>
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
                                <p><span style="font-weight: bold">Member since:</span> 01/01/2001<br/>
                                    <span style="font-weight: bold">Published properties:</span> 03<br/>
                                </p>
                                <div class="btn-group" style="text-align: right" >
                                    <button type="button" class="btn btn-xs btn-default" >View Properties</button>
                                    <button type="button" class="btn btn-xs btn-default" >Contact Owner</button>
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
                                <p><span style="font-weight: bold">Member since:</span> 01/01/2001<br/>
                                    <span style="font-weight: bold">Published properties:</span> 03<br/>
                                </p>
                                <div class="btn-group" style="text-align: right">
                                    <button type="button" class="btn btn-xs btn-default" >View Properties</button>
                                    <button type="button" class="btn btn-xs btn-default" >Contact Owner</button>
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
                                <p><span style="font-weight: bold">Member since:</span> 01/01/2001<br/>
                                    <span style="font-weight: bold">Published properties:</span> 03<br/>
                                </p>
                                <div class="btn-group" style="text-align: right">
                                    <button type="button" class="btn btn-xs btn-default" >View Properties</button>
                                    <button type="button" class="btn btn-xs btn-default" >Contact Owner</button>
                                </div>
                            </div>
                        </div>
                        <br/>
                        </div></div>
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
    </body>
</html>

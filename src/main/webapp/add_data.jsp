<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Employee</title>
    
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="images/fevicon.ico.png" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">
    
    <!-- The core Firebase JS SDK is always required and must be listed first -->
	<script src="https://www.gstatic.com/firebasejs/7.15.5/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/7.15.5/firebase-database.js"></script>
    <script src="https://www.gstatic.com/firebasejs/7.15.5/firebase-firestore.js"></script>
<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
<script src="https://www.gstatic.com/firebasejs/7.15.5/firebase-analytics.js"></script>

<script>
  // Your web app's Firebase configuration
  var firebaseConfig = {
  	    apiKey: "api_key",
	    authDomain: "auth_domain",
	    databaseURL: "databaseURL",
	    projectId: "projectID",
	    storageBucket: "storageBucket",
	    messagingSenderId: "messaginSenderId",
	    appId: "appId",
	    measurementId: "measurementId"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  firebase.analytics();
</script>

</head>

<body id="page-top" ng-app="validationApp" ng-controller="mainController">
    <!-- Page Wrapper -->
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <div class="topbar-divider d-none d-sm-block"></div>
                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Administrator</span>
                                <img class="img-profile rounded-circle" src="images/down.png" alt="#">
                            </a>
                            
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                    </ul>
                </nav>

                <div class="heading">
                    <span class="icon-logo"><img src="images/logo3.png" alt="#"></span>

					<h1 class="h3 mb-4 text-gray-800">Add Employee</h1>
                </div>
                <!-- End of Topbar -->
                
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <form name="userForm" onsubmit="return(validate());" ng-submit="submitForm(userForm.$valid)" novalidate>
                        <div class="form-group" ng-class="{ 'has-error' : userForm.name.$invalid && !userForm.name.$pristine }">
                            <input type="text" class="form-control form-control-user" id="name" ng-model="userForm.name"
                                ng-pattern="/^[a-zA-Z]*$/" placeholder="Name" value="" required>
                            <p ng-show="userForm.name.$invalid && !userForm.name.$pristine"
                                class="help-block">Your name is
                                required.</p>
                        </div>
                        
                        <div class="form-group" ng-class="{ 'has-error' : userForm.email.$invalid && !userForm.email.$pristine }">
                            <input type="email" class="form-control form-control-user" id="email" ng-model="userForm.email" placeholder="Email"
                            required>
                        <p ng-show="userForm.email.$invalid && !userForm.email.$pristine" class="help-block">Enter a
                            valid email.</p>
                        </div>
                        
                        <div class="form-group" ng-class="{ 'has-error' : userForm.phone.$invalid && !userForm.phone.$pristine }">
                            <input type="number" class="form-control form-control-user" id="phone" ng-model="userForm.phone" ng-pattern="/^[0-9]*$/" 
                            ng-minlength="6" ng-maxlength="12" placeholder="Phone Number"
                                required>
                            <p ng-show="userForm.phone.$error.minlength" class="help-block">Min 5 length</p>
                        	<p ng-show="userForm.phone.$error.maxlength" class="help-block">Max 12 length</p>
                        </div>
                        
                        <div class="form-group" ng-class="{ 'has-error' : userForm.address.$invalid && !userForm.address.$pristine }">
                            <input type="text" class="form-control form-control-user" id="address" ng-model="userForm.address" placeholder="Address"
                            required>
                        <p ng-show="userForm.address.$invalid && !userForm.address.$pristine" class="help-block">Enter a
                            valid address.</p>
                        </div>
                        
                        <div class="form-group" ng-class="{ 'has-error' : userForm.jobdesk.$invalid && !userForm.jobdesk.$pristine }">
                            <input type="text" class="form-control form-control-user" id="jobdesk" ng-model="userForm.jobdesk" placeholder="Jobdesk"
                            required>
                        <p ng-show="userForm.jobdesk.$invalid && !userForm.jobdesk.$pristine" class="help-block">Enter a
                            job desk.</p>
                        </div>
                        <button type="submit" class="btn btn-success btn-user btn-block" id='addbtn'>Save</button>
                        <hr>
                        <input type="button" value="Data List" class="btn btn-success btn-user" onclick="window.location.href='adm.jsp'"/>
                    </form>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
            
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
    
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    
    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">

        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your
                    current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="loginadm.jsp">Logout</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
	<script src="https://code.angularjs.org/1.2.6/angular.js"></script>
    <script src="js/jsform.js"></script>   
</body>

</html>
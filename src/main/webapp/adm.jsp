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
    <title>Admin</title>
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- The core Firebase JS SDK is always required and must be listed first -->
    <script src="https://www.gstatic.com/firebasejs/7.15.5/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/7.15.5/firebase-database.js"></script>
    <script src="https://www.gstatic.com/firebasejs/7.15.5/firebase-firestore.js"></script>

    <!-- TODO: Add SDKs for Firebase products that you want to use
	https://firebase.google.com/docs/web/setup#available-libraries -->
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
    <link rel="shortcut icon" href="images/fevicon.ico.png" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

</head>

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Sidebar -->

        <!-- End of Sidebar -->
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
                    <h2></h2>
                </div>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">Employee <a href="add_data.jsp"
                            class="btn btn-success btn-user">Add New</a></h1>
                    <hr />
                    <form class="user">
                        <div class="form-group">
                            <input type="text" class="form-control form-control-user" id="uid" placeholder="ID"
                                readonly>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <input type="text" class="form-control form-control-user" id="name" placeholder="Name">
                            </div>
                            <div class="col-sm-6">
                                <input type="email" class="form-control form-control-user" id="email"
                                    placeholder="Email">
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control form-control-user" id="phone"
                                placeholder="Phone Number">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control form-control-user" id="address"
                                placeholder="Address">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control form-control-user" id="jobdesk"
                                placeholder="Job desk">
                        </div>

                        <div class="form-group row">
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <input type="button" value="Update" onclick="update_user();"
                                    class="btn btn-warning btn-user" />
                            </div>
                            <div class="col-sm-6">
                                <input type="button" value="Delete" onclick="delete_user();"
                                    class="btn btn-danger btn-user" />
                            </div>
                        </div>
                        <hr>
                    </form>

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Information</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="tb_employee" class="table table-bordered" width="100%" cellspacing="0">
                                    <tr>
                                        <td>ID</td>
                                        <td>Name</td>
                                        <td>Email</td>
                                        <td>Phone Number</td>
                                        <td>Address</td>
                                        <td>Job Desk</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
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
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria- labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria- label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your
                    current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data- dismiss="modal">Cancel</button>
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
    <script>
        var tbEmployee = document.getElementById('tb_employee');
        var databaseRef = firebase.database().ref('employee/');
        var rowIndex = 1;

        databaseRef.once('value', function (snapshot) {
            snapshot.forEach(function (childSnapshot) {
                var childKey = childSnapshot.key;
                var childData = childSnapshot.val();

                var row = tbEmployee.insertRow(rowIndex);
                var cellId = row.insertCell(0);
                var cellName = row.insertCell(1);
                var cellEmail = row.insertCell(2);
                var cellPhone = row.insertCell(3);
                var cellAddress = row.insertCell(4);
                var cellJobdesk = row.insertCell(5);

                cellId.appendChild(document.createTextNode(childKey));
                cellName.appendChild(document.createTextNode(childData.name));
                cellEmail.appendChild(document.createTextNode(childData.email));
                cellPhone.appendChild(document.createTextNode(childData.phone));
                cellAddress.appendChild(document.createTextNode(childData.address));
                cellJobdesk.appendChild(document.createTextNode(childData.jobdesk));
                rowIndex = rowIndex + 1;
            });

            var table = document.getElementById("tb_employee");
            var rows = table.getElementsByTagName("tr");
            for (i = 0; i < rows.length; i++) {
                var currentRow = table.rows[i];
                var createClickHandler = function (row) {
                    return function () {
                        var cell1 = row.getElementsByTagName("td")[0];
                        var cell2 = row.getElementsByTagName("td")[1];
                        var cell3 = row.getElementsByTagName("td")[2];
                        var cell4 = row.getElementsByTagName("td")[3];
                        var cell5 = row.getElementsByTagName("td")[4];
                        var cell6 = row.getElementsByTagName("td")[5];

                        var uid = cell1.innerHTML;
                        var name = cell2.innerHTML;
                        var email = cell3.innerHTML;
                        var phone = cell4.innerHTML;
                        var address = cell5.innerHTML;
                        var jobdesk = cell6.innerHTML;

                        document.getElementById('uid').value = uid;
                        document.getElementById('name').value = name;
                        document.getElementById('email').value = email;
                        document.getElementById('phone').value = phone;
                        document.getElementById('address').value = address;
                        document.getElementById('jobdesk').value = jobdesk;
                    };
                };
                currentRow.onclick = createClickHandler(currentRow);
            }
        });

        function update_user() {
            var uid = document.getElementById('uid').value;
            var name = document.getElementById('name').value;
            var email = document.getElementById('email').value;
            var phone = document.getElementById('phone').value;
            var address = document.getElementById('address').value;
            var jobdesk = document.getElementById('jobdesk').value;
            
            var proceedUpd = confirm("Are you sure want to update the table\nContinue to proceed data update?");
            if (proceedUpd == true) {
            	//proceed
	            var data = {
	           		name: name,
	                email: email,
	                phone: phone,
	                address: address,
	                jobdesk: jobdesk
            	}
            	var updates = {};
            	updates['/employee/' + uid] = data;
            	firebase.database().ref().update(updates);
            	alert('data employee updated successfully!');
            	reload_page();
            }
            else {
			    //don't proceed
			    alert('gada perubahan bro!');
			    reload_page();
			    }
        }

        function delete_user() {
        	var proceedDel = confirm("Are you sure want to delete the data table\nContinue to proceed data deletion?");
        	if (proceedDel == true) {
        		//proceed
        		var uid = document.getElementById('uid').value;
                firebase.database().ref().child('/employee/' + uid).remove();
                alert('data deleted successfully!');
                reload_page();
            }
        	else {
        		//don't proceed
        		  alert('gada perubahan bro!');
        		  reload_page();
        	  }
        }
        	
        function reload_page() {
            window.location.reload();
        }
    </script>
</body>

</html>
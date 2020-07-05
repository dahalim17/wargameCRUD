<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<!-- Mobile Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Site Metas -->
	<title>Waroeng Games</title>
	<meta name="keywords" content="">
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- Site Icons -->
	<link rel="shortcut icon" href="images/icon1.png" type="image/x-icon">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- Site CSS -->
	<link rel="stylesheet" href="css/style.css">
	<!-- Responsive CSS -->
	<link rel="stylesheet" href="css/responsive.css">
	<!-- Custom CSS -->
	<link rel="stylesheet" href="css/custom.css">

	<link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css" />
	<script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"></script>
</head>

<body ng-app="validationApp" ng-controller="mainController">
	<!-- Start header -->
	<header class="top-navbar">
		<nav class="navbar navbar-expand-lg navbar-white bg-white">
			<div class="container">
				<a class="navbar-brand" href="index.jsp">
					<img src="images/logo3.png" alt="" width="250px" />
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-rs-food"
					aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon" style="background-image: url('images/bar.jpeg');"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbars-rs-food">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="gamelist.jsp">Game List</a></li>
						<li class="nav-item"><a class="nav-link" href="soongames.jsp">Coming Soon Games</a></li>
						<li class="nav-item"><a class="nav-link" href="about.jsp">About Us</a></li>
						<li class="nav-item active"><a class="nav-link" href="contact.jsp">Contact us</a></li>
				</div>
			</div>
		</nav>
	</header>
	<!-- End header -->
	<!-- Start All Pages -->
	<div class="all-page-title page-breadcrumb">
		<div class="container text-center">
			<div class="row">
				<div class="col-lg-12">
					<h1>Contact Us</h1><br>
					<h2>-- Contact us if you want to order/request Games
						or give us some criticism and suggestions --</h2>
				</div>
			</div>
		</div>
	</div>
	<!-- End All Pages -->

	<!-- Start Contact -->
	<div class="contact-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<form name="userForm" onsubmit="return(validate());" ng-submit="submitForm(userForm.$valid)"
						novalidate>
						<!-- NAME -->
						<div class="form-group"
							ng-class="{ 'has-error' : userForm.name.$invalid && !userForm.name.$pristine }">
							<label>Name</label>
							<input type="text" name="name" class="form-control" ng-model="user.name" required>
							<p ng-show="userForm.name.$invalid && !userForm.name.$pristine" class="help-block">You name
								is required.</p>
						</div>
						<!-- EMAIL -->
						<div class="form-group"
							ng-class="{ 'has-error' : userForm.email.$invalid && !userForm.email.$pristine }">
							<label>Email</label>
							<input type="email" name="email" class="form-control" ng-model="user.email" required>
							<p ng-show="userForm.email.$invalid && !userForm.email.$pristine" class="help-block">Enter a
								valid email.</p>
							<label>Message</label>
							<input type="Message" name="Message" class="form-control" ng-model="user.Message" required>
							<p ng-show="userForm.Message.$invalid && !userForm.Message.$pristine" class="help-block">
								Enter a valid Message.</p>

						</div>
						<button class="btn btn-primary" type="submit">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- End Contact -->

		<!-- Start Maps-->
		<div class="container text-center">
			<div class="mb-4 mt-4 ml-auto mr-auto">
				<h1>-- Our store location --</h1>
				<div id="map" style="width: 100%;height: 300px;">
					<br>
					<script>
						//koordinat dan zoom view peta
						//koordinat yang digunakan berupa latitude dan longitude
						//sebagai contoh saya menggunakan koordinat CCIT
						var map = L.map('map').setView([-6.227767, 106.798735], 17);
						L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
							attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
							subdomains: ['a', 'b', 'c'],
						}).addTo(map);
						//ini adalah koordinat marker
						L.marker([-6.227767, 106.798735]).addTo(map)
							.bindPopup("<b>Come meet us at</b> Waroeng Games!").openPopup();
						var popup = L.popup();
						function onMapClick(e) {
							popup
								.setLatLng(e.latlng)
								.setContent("Koordinat pada titik ini adalah " + e.latlng.toString())
								.openOn(map);
						}
						map.on('click', onMapClick);
					</script>
				</div>
			</div>
		</div>
		<br>
		<!-- End Maps-->

	<!-- Start Footer -->
	<footer class="footer-area bg-f">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<h3>About Us</h3>
					<p>Waroeng Games is a retail store for Playstation Games and was founded in 2015.
						#GamingIsMoreFunWithWaroengGames
					</p>
				</div>
				<div class="col-lg-3 col-md-6">
					<h3>Opening hours</h3>
					<p><span class="text-color">Sun-Wed :</span> 9:Am - 10PM</p>
					<p><span class="text-color">Thu-Fri :</span> 9:Am - 10PM</p>
					<p><span class="text-color">Sat-Sun :</span> 5:PM - 10PM</p>
				</div>
				<div class="col-lg-3 col-md-6">
					<h3>Address</h3>
					<p class="lead">Senayan Trade Center (STC), GF, Jl. Asia Afrika No.27, RT.1/RW.3,
						Gelora, Kecamatan Tanah Abang, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10270</p>

				</div>
				<div class="col-lg-3 col-md-6">
					<h3>Contact Us</h3>
					<div class="list-inline f-social">
						<p> <a href="#">WA: +628 12 1000 2000</a> </p>
						<p><a href="#">Email: waroeng-games@gmail.com</a></p>
						<p><a href="#">Instagram: @waroeng-games</a></p>
						<p><a href="#">Line: @war.games</a></p>
						<div class="text-center">
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="copyright">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<p class="company-name">Waroeng Games &copy; 2020 <a href="#"></a></p>
					</div>
				</div>
			</div>
		</div>

	</footer>
	<!-- End Footer -->

	<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

	<!-- ALL JS FILES -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->

	<script src="js/jquery-2.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="https://code.angularjs.org/1.2.6/angular.js"></script>


	<script src="js/jquery.superslides.min.js"></script>
	<script src="js/images-loded.min.js"></script>
	<script src="js/isotope.min.js"></script>
	<script src="js/baguetteBox.min.js"></script>
	<script src="js/jquery.mapify.js"></script>
	<script src="js/form-validator.min.js"></script>
	<script src="js/contact-form-script.js"></script>
	<script src="js/custom.js"></script>
	<script>
		$('.map-full').mapify({
			points: [{
				lat: 40.7143528,
				lng: -74.0059731,
				marker: true,
				title: 'Marker title',
				infoWindow: 'Waroeng Games'
			}]
		});
	</script>
	<script>
		var validationApp = angular.module('validationApp', []);
		// create angular controller
		validationApp.controller('mainController', function ($scope) {
			// function to submit the form after all validation has occurred
			$scope.submitForm = function (isValid) {
				// check to make sure the form is completely valid
				if (isValid) {
					alert('Data Saved Successfully');
				}
			};
		});
	</script>
</body>

</html>
var validationApp = angular.module('validationApp', []);
// create angular controller
validationApp.controller('mainController', function ($scope) {
// function to submit the form after all validation has occurred
	$scope.submitForm = function (isValid) {
	    // check to make sure the form is completely valid
	    if (isValid) {
	    	const name = document.getElementById('name');
	        const email = document.getElementById('email');
	        const phone = document.getElementById('phone');
	        const address = document.getElementById('address');
	        const jobdesk= document.getElementById('jobdesk');
	        const addbtn = document.getElementById('addbtn');
	
	        const database = firebase.database();
	        const databaseRef = database.ref('employee/');
	
	        // Add Data
	        addbtn.addEventListener('click', e => {
	            e.preventDefault();
	            const uid = databaseRef.push().key
	            databaseRef.child(uid).set({
	                name: name.value,
	                email: email.value,
	                phone: phone.value,
	                address: address.value,
	                jobdesk: jobdesk.value
	            });
	            alert('Added Successfully, Thank you!'); 
	            reload_page();
	        });
	        function reload_page(){ 
	            window.location.reload(); 
	            }
	        
	    } else {
	    	alert('Fill this form with valid data!');
	        }
	    };
});
$(document).ready(function () {
	$('#google_login').click(function () {
		

// Initialize Firebase
	  var config = {
	    apiKey: "AIzaSyAyeSvNBvCVcHoezZujqorwz22WvkJTjZU",
	    authDomain: "myproject-6a179.firebaseapp.com",
	    databaseURL: "https://myproject-6a179.firebaseio.com",
	    projectId: "myproject-6a179",
	    storageBucket: "myproject-6a179.appspot.com",
	    messagingSenderId: "834093196101"
	  };
	  firebase.initializeApp(config);
	  
	  firebase.auth().signInWithPopup(provider).then(function(result) {
		  // This gives you a Google Access Token. You can use it to access the Google API.
		  var token = result.credential.accessToken;
		  // The signed-in user info.
		  var user = result.user;
		  // ...
		}).catch(function(error) {
		  // Handle Errors here.
		  var errorCode = error.code;
		  var errorMessage = error.message;
		  // The email of the user's account used.
		  var email = error.email;
		  // The firebase.auth.AuthCredential type that was used.
		  var credential = error.credential;
		  // ...
		});
	});
});	 
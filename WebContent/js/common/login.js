
//my login
$(document).ready(function() {
	$('.loginId').click(function(event) {
		$(location).attr("href", root + "/member/loginid.html");
	});
  
	$('#join').click(function () {
		$(location).attr("href", root + "/member/register.html");
	});
});


// Kakao talk login
$(document).ready(function() {
	
  Kakao.init('e7ca5d8e2c9d5c4f27b2965d6004e5d7');
  
  // 커스톰 로그인 버튼으로 카카오 로긴
  $('#kakao-login-btn').click(() => {
	  Kakao.Auth.login({

		  success: function(authObj) {
			  // 로그인 성공시, API를 호출합니다.
			  Kakao.API.request({
				  url: '/v1/user/me',
				  success: function(res) {
					  var obj = JSON.stringify(res);
					  alert('===>> ' + res.kaccount_email);
					  alert(JSON.stringify(res));
				  },
				  fail: function(error) {
					  alert(JSON.stringify(error));
				  }
			  });
			  
			  alert("1111111111" + JSON.stringify(authObj));
		  },
		  fail: function(err) {
			  alert(JSON.stringify(err));
		  }
	  });
	  
  });
  
  
  
  
  // 카카오 로그인 버튼을 생성합니다.
//  Kakao.Auth.createLoginButton({
//      container: '#kakao-login-btn',
//      success: function(authObj) {
//        
//    	  // 로그인 성공시, API를 호출합니다.
//        Kakao.API.request({
//          url: '/v1/user/me',
//          success: function(res) {
//        	  var obj = JSON.stringify(res);
//        	  alert('===>> ' + res.kaccount_email);
//        	  alert(JSON.stringify(res));
//          },
//          fail: function(error) {
//            alert(JSON.stringify(error));
//          }
//        });
//        
//        alert("1111111111" + JSON.stringify(authObj));
//        
//        
//      },
//      fail: function(err) {
//        alert(JSON.stringify(err));
//      }
//    });
  
});



// google firebase!
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
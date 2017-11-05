
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
  function loginWithKakao(res){
	  var emailConfirm;
	  if(res.kaccount_email_verified) {
		  emailConfirm = 1;
	  } else {
		  emailConfirm=0;
	  }
	  //console.log(res);
	  
	  var obj = { 
			  "email" : res.kaccount_email, 
			  "name" : res.properties.nickname, 
			  "emailConfirm" : emailConfirm,
			  "id" : res.id
	  	};
	  
	  $.ajax({
		url: root + "/member/loginWithKakao",
		type: 'GET',
		dataType: 'json',
		data: obj,
		contentType : 'application/json;charset=utf-8',
		mimeType : 'application/json'
	  }).done(function (result) {
		  //alert(result.status);
		  $('#login').modal("hide");
		  if(result.status == "1") {
			  alert("가입을 환영합니다. 내정보에서 비밀번호를 수정해 주세요!");
		  }
		  location.reload();
	  });
  }
  // 커스톰 로그인 버튼으로 카카오 로긴
  $('#kakao-login-btn').click(() => {
	  
	  Kakao.Auth.login({
		  success: function(authObj) {
			  // 로그인 성공시, API를 호출합니다.
			  Kakao.API.request({
				  url: '/v1/user/me',
				  success: function(res) {
					  loginWithKakao(res);
					  var obj = JSON.stringify(res);
					  //alert('===>> ' + res.kaccount_email);
					  //alert("res == " + JSON.stringify(res));
				  },
				  fail: function(error) {
					  alert(JSON.stringify(error));
				  }
			  });
			  
			  //alert("authObj == " + JSON.stringify(authObj));
		  },
		  fail: function(err) {
			  alert(JSON.stringify(err));
		  }
	  });
	  
  });
  
	Kakao.Auth.createLoginButton({
		  container: '#kakaopaylogin',
		  success: function(authObj) {
		    
			  // 로그인 성공시, API를 호출합니다.
		    Kakao.API.request({
		      url: '/v1/user/me',
		      success: function(res) {
		    	  var obj = JSON.stringify(res);
		    	  //alert(JSON.stringify(res));
		    	  showPersonInfo(res);
		      },
		      fail: function(error) {
		        alert(JSON.stringify(error));
		      }
		    });
		    
			  //alert(JSON.stringify(authObj));
			  var form_accessToken_input = $('#access_token');
			  form_accessToken_input.val(authObj.access_token);
		  	  showTokenInfo(authObj);
		    
		  },
		  fail: function(err) {
		    alert(JSON.stringify(err));
		  }
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



// google firebase Authentication! 아래에 집어넣어야 함!! 지금은 페이지 이동만 가능하게 해놓음
$(document).ready(function () {
	$('#google_login').click(function () {
		$(location).attr("href", "../common/google.jsp");
	});
});


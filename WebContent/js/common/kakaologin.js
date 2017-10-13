$(document).ready(function() {
  $('.loginId').click(function(event) {
    $(location).attr("href", root + "/member/loginid.html");
  });
  
  Kakao.init('e7ca5d8e2c9d5c4f27b2965d6004e5d7');
  // 카카오 로그인 버튼을 생성합니다.
  Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
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

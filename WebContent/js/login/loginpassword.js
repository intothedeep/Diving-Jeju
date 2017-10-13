$(document).ready(function() {
  $('#pw-text').hide();

  $('#pass').focusin(function(event) {
  	if ($('#pass').val().length ==0) {
	    $('#pass').css('color', 'black');
	    $('#pw-text').show();
  	}
  });

  $('#pass').focusout(function(event) {
 	if ($('#pass').val().length ==0) {
 		$('#pass').css("color","lightblue");
 		$('#pw-text').hide();
 	} 		
  });
  
  $('#passBtn').click(function(){
	  var pass = $('#pass').val();
	  if(pass.length == 0) {
		  alert('비밀번호를 입력해 주세요');
		  return;
	  } else {
		  $("#loginpasswordform").attr("action", "../member/loginpassword.html").attr("method", "post").submit();
	  }
  });
  
  $('#pass').keypress(function(e){
	  var keypress = e.which;
	  if (keypress == 13) {
		  var pass = $('#pass').val();
		  if(pass.length == 0) {
			  alert('비밀번호를 입력해 주세요');
			  return;
		  } else {
			  $("#loginpasswordform").attr("action", "../member/loginpassword.html").attr("method", "post").submit();
		  }		  
	  }
  });
});
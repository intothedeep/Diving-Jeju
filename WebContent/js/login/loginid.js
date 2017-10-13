	  //이메일 text css 컨트롤
    $(document).ready(function() {
        $('#id-text').hide();

        $('#id').focusin(function(event) {
        	if ($('#id').val().length ==0) {
        		$('#id').css('color', 'black');
        		$('#id-text').show();  
        	}
        });

        $('#id').focusout(function(event) {
        	if ($('#id').val().length ==0) {
        		
	          $('#id').css("color","lightblue");
	          $('#id-text').hide();
        	}
        });
        
	  //email 정규식 확인 후 로긴 password 이동
	  $('#idBtn').click(function () {
		  var emailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		  var idval = $('#id').val();
		  var isGood = false;
		  
		  if (idval.match(emailCheck) != null) {
		      isGood = true;
		  }
		  else {
		     isGood = false;
		  }
	
		  if (isGood) {
//나중에 이거는 post로 바꿔서 id검사를 하게 함			  
			 $("#loginidform").attr("action", "../member/loginid.html").attr("method", "post").submit();
		  }
		  else {
		     alert("잘못 된 이메일 주소입니다.");
		     return;
		  }
	  });
	  
	  $('#id').keypress(function (e) {
		  var emailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		  var keypress = e.which;
		  if (keypress === 13) {
			  var idval = $('#id').val();
			  var isGood = false;
			  
			  if (idval.match(emailCheck) != null) {
			      isGood = true;
			   }
			   else {
			      isGood = false;
			   }

			   if (isGood) {
				  $("#loginidform").attr("action", "../member/loginid.html").attr("method", "post").submit();
			   }
			   else {
			      alert("잘못 된 이메일 주소입니다.");
			      return;
			   }
		  }
	  });
    });

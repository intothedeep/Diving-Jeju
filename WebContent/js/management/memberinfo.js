
$(() => {
	$('#cancelBtn').click(function () {
		window.location.replace(root + "/admin/main.html");
	});

	$('#modifyBtn').click(() => { 
	  var email = $('#email').val();
	  var pass = $('#pw').val();
	  var passcheck = $('#pwcheck').val();
	  
	  var zipcode = $('#zipcode').val();
	  var addr1 =  $('#address').val();
	  var addr2 = $('#address-detail').val();

	  $('#jemail').val(email);
	  $('#jpass').val(pass);
	  $('#jaddr1').val(addr1);
	  $('#jaddr2').val(addr2);
	  $('#jzipcode').val(zipcode);
	  
	  $('#modifyForm').attr('action', "../member/modify.html").submit();
  });
  
//  이메일 인증
	  $('.email_auth').on('click', function () {
		var email = $('#email').val();
		var obj = {"email": email};
		
		$.ajax({
			type: "get",
			dataType: "json",
			url: root + "/mail/emailTokenSend",
			data: obj,
			contentType : 'application/json;charset=utf-8',
			mimeType : 'application/json',
			success: function (data) {
				if(data.status == 1){
					alert("인증메일이 발송되었습니다.");
				} else {
					alert("인증실패. 인증메일을 다시 보내주세요.");
				}
			},
			error: function (err, status, data) {
				console.log(err);
				console.log(status);
				alert("인증실패. 인증메일을 다시 보내주세요.");
			}
		});
		
	  });
});
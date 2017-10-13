
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
  
  
});
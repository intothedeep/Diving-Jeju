//이메일 정규식 검사
$(document).ready(function() {
////////////////////////////////////
  $('.check').focusout(function() {
    //alert($(this).val().length);
    if($(this).val().length == 0) {

      $(this).parent().addClass('has-error');
      $(this).parentsUntil('.form-group').find('.errormsg').css('display', 'block');
      // console.log($(this).parentsUntil('.form-group').parent());
    } else {

      if ($(this).is('#firstname') || $(this).is('#lastname')) {

        if($('#firstname').val().length != 0 && $('#lastname').val().length) {
          $(this).parent().removeClass('has-error');
          $(this).parentsUntil('.form-group').find('.errormsg').css('display', 'none');
        }

      } else {
        $(this).parent().removeClass('has-error');
        $(this).parentsUntil('.form-group').find('.errormsg').css('display', 'none');
      }
    }

  });
  
  //가입취소 메인이동
  $('#cancelBtn').click(function () {
	  window.location.replace("../admin/main.html");
  });

////////////////////////////////////////
  $('.check').focusin(function(event) {
    $(this).parent().removeClass('has-error');
  });

/////////////////////////////////////// pw check
  $('.pw').blur(function(event) {

    if($('#pwcheck').val() != $('#pw').val()) {

      $('.errormatch').show();
      $('#pwcheck').parent().addClass('has-error');
      if($('#pw').val().length != 0) {
        $('.errormsg').hide();
      }

    } else {
      $('.errormatch').hide();
      if($('#pwcheck').val().length != 0) {
        $('#pwcheck').parent().removeClass('has-error');
      }
    }
  });
////////////////////////////////////// 이메일 정규식 검사
  $('#email').focusout(function () {
	  
	  var emailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	  var idval = $('#email').val();
	  var isGood = false;
	  
	  if (idval.match(emailCheck) != null) {
	      isGood = true;
	  }
	  else {
	     isGood = false;
	  }
	
	  if (isGood) {
		  $(this).parent().removeClass('has-error');
		  $(this).parent().parent().find('.errormsg').hide();
	  }
	  else {
		  $(this).parent().addClass('has-error');
		  $(this).parent().parent().find('.errormsg').show();
		  alert("잘못 된 이메일 주소입니다.");
	  }  
  });
  
//////////////////////////////////////member join
  $('#joinBtn').click(function () {
	  var firstname = $('#firstname').val();
	  var lastname = $('#lastname').val();
	  var name = lastname + firstname;
	  
	  var email = $('#email').val();
	  var pass = $('#pw').val();
	  var passcheck = $('#pwcheck').val();
	  
	  var zipcode = $('#zipcode').val();
	  var addr1 =  $('#address').val();
	  var addr2 = $('#address-detail').val();
	  
	  var byear = $('#byear').val();
	  var bmonth = $('#bmonth').val();
//	  $("#bmonth option:selected").val();
//	  alert(bmonth);
//	  alert($("#bmonth option:selected").val());
	  
	  var bday = $('#bday').val();
	  var birth = byear + "/" + bmonth + "/" + bday;
	  
	  var gender = $("input[type=radio][name=gender]:checked").val();
	  if (gender == 1)
		  gender = '남';
	  else
		  gender = '여';
	  
	  var memberType = $("input[type=radio][name=memberType]:checked").val();
	  var idarr = email.split('@');
	  var id = idarr[0];

//	  if(firstname.length == 0){
//		  alert('이름을 입력해 주세요.');
//		  return;
//	  } else if (lastname.length == 0){
//		  alert('성을 입력해 주세요.');
//		  return;
//	  } else if (email.length == 0) {
//		  alert("이메일을 입력해 주세요.");
//		  return;
//	  } else if (pass.length == 0){
//		  alert("비밀번호를 입력해 주세요.");
//		  return;
//	  } else if (pass != passcheck) {
//		  alert("비밀번호가 일치하지 않습니다.");
//		  return;
//	  } //else if (byear < 1910 || byear > 2017) {
//		  alert("생년월일 년도 잘못 입력!");
//		  return;
//	  }	else if (bday < 1 || bday > 31) {
//		  alert("생년월일 일 잘못 입력!");
//		  return;
//	  }
///////////////////////////////////	  
//	  alert(name);
//	  alert(email);
//	  alert(pass);
//	  alert(passcheck);
//	  alert(zipcode);
//	  alert(addr1);
//	  alert(addr2);
//	  alert(birth);
///////////////////////////////////	  
	  
	  $('#jname').val(name);
	  $('#jemail').val(email);
	  $('#jpass').val(pass);
	  $('#jaddr1').val(addr1);
	  $('#jaddr2').val(addr2);
	  $('#jzipcode').val(zipcode);
	  $('#jbirth').val(birth);
	  $('#jgender').val(gender);
	  $('#jmemberType').val(memberType);
	  $('#jid').val(id);
	  
	  $('#joinForm').attr('action', "../member/register.html").submit();
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


	

//내가 만든 주소 검색 창
//현재는 다음 api 주소 이용 중 여껀이 되면 다시 이용
function openZip(){
  window.open("./searchaddress.html","주소검색","top=200, left=1600, width=400, height=300, menubar=no, status=no, toolbar=no, location=no, scrollbars=yes ");
}


  //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
  function addressSearch() {
      new daum.Postcode({
          oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

          // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
          var extraRoadAddr = ''; // 도로명 조합형 주소 변수

          // 법정동명이 있을 경우 추가한다. (법정리는 제외)
          // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
          if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
              extraRoadAddr += data.bname;
          }
          // 건물명이 있고, 공동주택일 경우 추가한다.
          if(data.buildingName !== '' && data.apartment === 'Y'){
             extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
          }
          // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
          if(extraRoadAddr !== ''){
              extraRoadAddr = ' (' + extraRoadAddr + ')';
          }
          // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
          if(fullRoadAddr !== ''){
              fullRoadAddr += extraRoadAddr;
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
          document.getElementById('address').value = fullRoadAddr;
          //document.getElementById('address-detail').value = data.jibunAddress;

          // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
          if(data.autoRoadAddress) {
              //예상되는 도로명 주소에 조합형 주소를 추가한다.
              var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
              document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

          } else if(data.autoJibunAddress) {
              var expJibunAddr = data.autoJibunAddress;
              document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

          } else {
              document.getElementById('guide').innerHTML = '';
              }
          }
      }).open();
  }

  
  
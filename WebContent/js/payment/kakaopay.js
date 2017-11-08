var windowReference;
var tid;
var item_name;

$(document).ready(function() {
    if(! /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
        $('#mobile').attr('disabled', 'disabled');
        $('#mobile').removeClass('btn_pay_hover');
        $('#mobile').css('cursor','no-drop');
    }
	
    $('.payStart').on("click", function () {
    	//radio payType이 4면 카카오로 결제 그때 로긴이 안되어 있으면 리턴
    	var payType = $(":input:radio[name=payType]:checked").val();
    	if(payType == 4) {
    		var partner_user_id = $('p.kaccount_email').attr('data-kaccount_email');
    		
    		if (!partner_user_id) {
    			alert("카카오 로긴을 해주세요!");
    			return;
    		}    		
    	}
    	
    	//bookInfoForm을 날려서 book테이블에 예약정보 저장
    	var bookInfoInsertStatus = insertBookInfo();
    	
    	//카카오 결제 시작
    	var storeName = $(this).attr('data-storeName');
    	initKakaoPay(storeName, partner_user_id);
    	
    });
});

function initKakaoPay(storeName, partner_user_id){
	var access_token = $('.atoken').attr('data-atoken');
	var token_type = $('.tokenType').attr('data-tokenType');
	console.log(token_type);
	var authorization = access_token;
	
	
	var data = {
			"authorization": authorization,
			"storeName":storeName,
			"partner_user_id":partner_user_id
	};
	
	//카카오페이 컨트롤러에 보내서 resttemplate를 사용 restapi 요청을 한다.
	var request = $.ajax({
		url: root + "/kakaopay/initpay.html",
		type: 'POST',
		dataType: 'json',
		data: data
	});
	
	request.done(function( data ) {
		//restapi 요청이 성공하면 거기서 받아온 정보를 가지고 결제 시작 페이지로 넘어간다.

		//결제준비를 승인 한 후 넘어온 데이터에 담긴 내용
//		tid	결제 고유 번호. 20자	String
//		next_redirect_app_url	요청한 클라이언트가 모바일 앱일 경우 해당 url을 통해 카카오톡 결제페이지를 띄움	String
//		next_redirect_mobile_url	요청한 클라이언트가 모바일 웹일 경우 해당 url을 통해 카카오톡 결제페이지를 띄움	String
//		next_redirect_pc_url	요청한 클라이언트가 pc 웹일 경우 redirect. 카카오톡으로 TMS를 보내기 위한 사용자입력화면이으로 redirect	String
//		android_app_scheme	카카오페이 결제화면으로 이동하는 안드로이드 앱스킴	String
//		ios_app_scheme	카카오페이 결제화면으로 이동하는 iOS 앱스킴	String
//		created_at	결제 준비 요청 시간	Datetime
		
		//문제가 어떻게 결제 정보를 넘겨주냐이다. tid와 사용자의 access_token을 이용해서
		location.href = data.next_redirect_pc_url;
		
	});
	
	request.fail(function( jqXHR, textStatus ) {
		console.log( "Request failed: " + textStatus );
	});
	
}

function insertBookInfo() {
	var bookedName = $(".bookedName").val();
	var bookedTel = $('.bookedTel').val();
	var bookedEmail = $('.bookedEmail').val();
	console.log(bookedEmail);
//	라디오버튼 값 가져오기!
//	var st = $(":input:radio[name=payType]:checked").val();
//	console.log(st);
	
	$('#bookedName').val(bookedName);
	$('#bookedTel').val(bookedTel);
	$('#bookedEmail').val(bookedEmail);
	
	var params = $(".bookInfoForm").serialize();
	
	console.log(params);
	var request = $.ajax({
		url: root + "/book/bookinfo",
		type: 'POST',
		dataType: 'json',
		data: params
	});
	
	request.done(function (data) {
		if(data.statusForBookInfo != "0" && data.statusForPayInfo != "0") {
			alert("성공");
		} else {
			alert("실패");
		}
	});
}


function showTokenInfo(authObj) {
	var body = $('#kakao_token');
	body.empty();
	var template = $('#loginInfo_template').html();
	body.append(Mustache.render(template, authObj));
}

function showPersonInfo(res) {
	var body = $('#person_info');
	body.empty();
	var template = $('#personInfo_template').html();
	body.append(Mustache.render(template, res));
}
  //]]>
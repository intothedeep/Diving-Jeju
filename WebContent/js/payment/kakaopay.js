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
    	var storeName = $(this).attr('data-storeName');
    	payment(storeName);
    	
    });
});

function payment(storeName){
	var access_token = $('.atoken').attr('data-atoken');
	var token_type = $('.tokenType').attr('data-tokenType');
	//var authorization = token_type + " " + access_token;
	var authorization = access_token;
	
	var data = {"authorization": authorization, "storeName":storeName };
	
	var request = $.ajax({
		url: root + "/kakaopay/initpay.html",
		type: 'POST',
		dataType: 'json',
		data: data
	});
	
	request.done(function( data ) {
		tid = data.tid;
		//alert(data.next_redirect_pc_url);
		location.href = data.next_redirect_pc_url;
		//windowReference = window.open(data.next_redirect_pc_url, 'payment_popup', 'width=426,height=510,toolbar=no,location=no');
		//windowReference.$('#tid').val(tid);
	});
	
	request.fail(function( jqXHR, textStatus ) {
		console.log( "Request failed: " + textStatus );
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
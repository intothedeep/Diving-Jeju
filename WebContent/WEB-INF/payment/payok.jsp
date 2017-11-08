<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
String root = request.getContextPath();
String tid = (String) session.getAttribute("tid");
%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="root" value="${pageContext.request.contextPath}"/>  

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.min.js"></script>
		
	<title>결제 성공</title>

</head>
<body>
	<div class="container">
		<div class="container-fluid" style="text-align: center; margin-top: 150px;">
			<button class="btn btn-warning" id="approveBtn"> 결제승인</button>
			<button class="btn btn-danger" id="cancel_kakao_pay"> 취소</button>
		</div>
	</div>
	
	<div class="container" style="margin-top: 200px;">
		<p>결제 성공</p>
		<a href="${root}/index.jsp" class="btn btn-default">홈으로</a>
		<p>${pg_token}</p>
		<input type="text" id="tid" disabled value="<%=tid%>"/>
	</div>

	<script>

//cid	가맹점 코드. 10자.	O	String
//tid	결제 고유번호. 결제준비 API의 응답에서 얻을 수 있음	O	String
//partner_order_id	가맹점 주문번호. 결제준비 API에서 요청한 값과 일치해야 함	O	String
//partner_user_id	가맹점 회원 id. 결제준비 API에서 요청한 값과 일치해야 함	O	String
//pg_token	결제승인 요청을 인증하는 토큰. 사용자가 결제수단 선택 완료시 approval_url로 redirection해줄 때 pg_token을 query string으로 넘겨줌	O	String
//payload	해당 Request와 매핑해서 저장하고 싶은 값. 최대 200자	X	String

//승인 요청 시 위 값들을 보내줘야 한다.

	var root = '<%=root%>';
	$(document).ready(function () {
		$('#approveBtn').click(function (){
			var approveConfirm = confirm("결제를 승인 하시겠습니까?");
			if(approveConfirm) {
				alert(root);
				//alert("결제를 승인합니다.");
				var data = {"pg_token": "${pg_token}"};
				var request = $.ajax({
		            url: root + "/kakaopay/approvepay.html",
		            type: 'POST',
		            data: data,
		            dataType: 'json'
		        });
				
				request.done(function (result) {
	            	insertKakaopayFinishInfo(result);
	            });
				
				request.fail(function (textStatus) {
	            	alert("결제실패. 결제를 다시 해주세요.");
	            });
				
			} else {
				alert("결제를 취소합니다!");
				return;
			}
		});
		
	});
	
	function insertKakaopayFinishInfo(result) {
		alert("저장!");
	}
	</script>

</body>
</html>
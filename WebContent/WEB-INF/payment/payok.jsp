<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String root = request.getContextPath();%>
    
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
<div class="container-fluid col-sm-10" style="text-align: center; top: 100px;">
	<p>결제 성공</p>
	<p>${pg_token}</p>
	<a href="${root}/index.jsp" class="btn btn-default">홈으로</a>
	<button class="btn btn-warning" id="approveBtn"> 결제를 승인 하시겠습니까?</button>
	<input type="text" id="tid" disabled value="${tid}"/>
</div>

<script>
var root = '<%=root%>';
$(document).ready(function () {
	$('#approveBtn').click(function (){
		var approveConfirm = confirm("결제를 승인 하시겠습니까?");
		if(approveConfirm) {
			alert(root);
			//alert("결제를 승인합니다.");
			$.ajax({
	            url: root + "/kakao/approvepay.html",
	            type: 'POST',
	            dataType: 'json',
	            success: function (obj) {
	            	alert("성공!!!");
	            }
	        });
		} else {
			alert("결제를 취소합니다!");
			window.close();
		}
	});
});
</script>

</body>
</html>
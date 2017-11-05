<%@page import="com.free.member.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/common/root.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="root" value="${pageContext.request.contextPath}"/> 

<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script src="${root}/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${root}/css/bootstrap readable.min.css">
	    <link rel="stylesheet" href="${root}/css/bootstrap readable.css">
		
		<link rel="stylesheet" href="${root}/fonts/font-awesome.min.css">
		<link rel="stylesheet" href="${root}/css/join/join.css">
	<title>예약현황</title>

</head>
<script>
$(document).ready(function () {
	var request = $.ajax({
		//멤버의 예약현황을 가져오자!
	});
	
	request.done(function (data) {
		//데이터 조작
	});
});
</script>
<body>
	<%@ include file="/WEB-INF/management/managementnav.jsp"%>

	<div class="container col-xs-offset-2 col-xs-8" style="margin-top: 100px; border: 3px solid gray; padding: 15px;">
	
		<h3 style="margin-left: 20px; color: gray;"> - 구매내역 </h3>
		<table class="table table-bordered">
			<thead >
				<tr class="active" style="border-bottom: thick solid lightblue; text-weight: bold;">
					<th style=" text-align: center;"> 구매번호 </th>
					<th style=" text-align: center;"> 구입일 </th>
					<th style=" text-align: center;"> 예약날짜 </th>
					<th style=" text-align: center;"> 상품 </th>
					<th style=" text-align: center;"> 금액 </th>
					<th style=" text-align: center;"> 기타 </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="col-sm-2" style=" text-align: center;"> 123421 </td>
					<td class="col-sm-1" style=" text-align: center;"> 날짜 </td>
					<td class="col-sm-2" style=" text-align: center;"> 날짜 ~ 날짜 </td>
					<td class="col-sm-3"> 내역 </td>
					<td class="col-sm-2" style=" text-align: right;"> 금액 </td>
					<td class="col-sm-2" style=" text-align: center;">
						<button class="btn btn-xs btn-warning" value="">변경</button>
						<button class="btn btn-xs btn-danger" value="">반품</button>
					</td>
				</tr>
			</tbody>
		</table>
		
	</div>
	
	
	
</body>
</html>
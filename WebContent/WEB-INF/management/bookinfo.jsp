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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.min.js"></script>
			
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
					<th style=" text-align: center;"> # </th>
					<th style=" text-align: center;"> 구입일 </th>
					<th style=" text-align: center;"> 예약날짜 </th>
					<th style=" text-align: center;"> 상품 </th>
					<th style=" text-align: center;"> 금액 </th>
					<th style=" text-align: center;"> 기타 </th>
				</tr>
			</thead>
			<tbody id="book_info_body">

			</tbody>
		</table>
		
	</div>
	<template id="book_info_body_template">
		<tr>
			<td class="col-sm-1" style=" text-align: center;"> {{bookSeq}} </td>
			<td class="col-sm-2" style=" text-align: center;"> {{whenBook}} </td>
			<td class="col-sm-3" style=" text-align: center;"> {{startBookDate}}~{{endBookDate}} ({{nights}}박) </td>
			<td class="col-sm-2"> {{payContent}} </td>
			<td class="col-sm-2" style=" text-align: right;"> {{totalPrice}}원</td>
			<td class="col-sm-2" style=" text-align: center;">
				<button class="btn btn-xs btn-warning" value="">변경</button>
				<button class="btn btn-xs btn-danger" value="">환불</button>
			</td>
		</tr>	
	</template>
	
	<script type="text/javascript">
	$(document).ready(function () {
		var data = { "email":"${loginInfo.email}" };
		getBookInfoList(data);
	});
	
	function getBookInfoList(data) {
		var book_info_body = $('#book_info_body');
		book_info_body.empty();
		
		var template = $('#book_info_body_template').html();
		
		var request = $.ajax({
			url: root + "/book/list",
			type: 'get',
			dataType: 'json',
			data: data
		});
		
		request.done(function (data) {
			console.log(data);
			$.each(data, function(i, bookInfo) {
				book_info_body.append(Mustache.render(template, bookInfo));
			});
		});
	}
	</script>
</body>
</html>
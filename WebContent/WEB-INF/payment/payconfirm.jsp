<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String root = request.getContextPath();%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="root" value="${pageContext.request.contextPath}"/>  

<%
response.addHeader( "Access-Control-Allow-Origin", "*" ); 
response.addHeader( "Access-Control-Allow-Methods", "POST" ); 
response.addHeader( "Access-Control-Max-Age", "1000" ); 
%>


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
	
	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.min.js"></script>
	
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
		
	<title>결제 확인</title>

<script>
var root = '<%=root%>';
</script>
<style>
body {
    font-family: "Roboto";

}
</style>
</head>
<body>
<%@ include file="/common/loginmodal.jsp"%>
    <nav class="navbar navbar-default navbar-static-top main_nav">
      <div class="container"
    		style="padding: 2px; margin-top: auto; margin-bottom: auto;">

          <div class="navbar-header">
            <a class="navbar-brand" href="${root}/admin/main.html">Freedive</a>
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>

          <div class="navbar-collapse collapse" id="navbar-main">
            <ul class="nav navbar-nav">
<!--               <li class="dropdown">
                <a class="dropdown-toggle" id="themes" href="#" data-toggle="dropdown">바다정보 <span class="caret"></span></a>
                <ul class="dropdown-menu" aria-labelledby="themes">
                  <li><a href="">동</a></li>
                  <li><a href="">서</a></li>
                  <li><a href="">남</a></li>
                  <li><a href="">북</a></li>
                </ul>
              </li> -->
              <li>
                <a href="${root}/map/map.html">지도</a>
              </li>
              <li>
                <a href="#" class="tour">투어</a>
              </li>
              <li>
                <a href="#" class="guesthouse" id="guesthouse">게스트하우스</a>
              </li>
              <li>
              	<a href="#" onclick="return false" class="freeboardlist">자유게시판</a>
              </li>
         
            </ul>
            
            <ul class="nav navbar-nav navbar-right">
              <li>
                <form id="main_nav_searchForm" class="navbar-form navbar-right" role="search" method="get">
					<div class="form-group">
					  <div class="input-group">
					    <input type="text" class="form-control" id="main_keyword" name="keyword">
					    <span class="input-group-btn">
					      <button class="btn btn-default" type="button" id="main_searchBtn">
					      	<span class="glyphicon glyphicon-search"></span> 검색
					      </button>
					    </span>
					  </div>
					</div>
                </form>
              </li>
            </ul>

			<%@ include file="/common/loginnav.jsp"%>
            
        </div>
      </div>
    </nav>
    
<template id="loginInfo_template">

		<p class="atoken" data-atoken="{{access_token}}">access_token: {{access_token}}</p>
		<p class="tokenType" data-tokenType="{{token_type}}">token_type: {{token_type}}</p>
		<p>refresh_token: {{refresh_token}}</p>
	</form>
</template>

<template id="personInfo_template">
		<p>kaccount_email: {{kaccount_email}}</p>
		<p>id: {{id}}</p>
		
		<p>profile_image: {{properties.profile_image}}</p>
		<div>
			<img src="{{properties.profile_image}}" width="200">
		</div>
		
		<p>nickname: {{properties.nickname}}</p>
		
		<p>thumbnail_image: {{properties.thumbnail_image}}</p>
		<div>
			<img src="{{properties.thumbnail_image}}">
		</div>
</template>

<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 col-sm-12" style="border: 3px gray solid;">
	<div style="border-bottom: 2px gray solid; text-align: center;">
		<h3 class="storeName"> ${storeDto.name} </h3>
	</div>
	
	<h4>내역</h4>	
	<table class="table table-bordered" style="text-align: right;">
		<thead>
			<tr>
				<th style="text-align: center;">기간</th>
				<th style="text-align: right;">방정보</th>
				<th style="text-align: right;">숙박일수</th>
				<th style="text-align: right;">인원</th>
				<th style="text-align: right;">결제금액</th>
			</tr>
		</thead>
		<tbody>
			<tr class="warning">
				<td style="text-align: center;">${bookDto.startBookDate}~${bookDto.endBookDate}</td>
				<td>${bookDto.roomType}</td>
				<td>${bookDto.nights}박</td>
				<td>${bookDto.numOfPersons}명</td>
				<td>100,000원</td>
			</tr>
		</tbody>
	</table>
	
	<h4>결제방식</h4>
	<form class="payInfoform">
		<input type="radio" name="payType" value="kako" checked> KakaoPay &nbsp;
		<input type="radio" name="payType" value="bank"> 무통장 &nbsp;
		<input type="radio" name="payType" value="card"> 신용카드
	</form>
	
	
 	<div id="kakao_token">

	</div>
	
	<div id="person_info">
	
	</div>
	
	
	<div class="container-fluid" style="text-align: right; margin-top: 20px;">
		<button type="button" data-storeName="${storeDto.name}" class="payStart btn btn-warning">
			결제
		</button>
	</div>
	
	<div>
		<form id="kakaoPay_form" method="post" action="">
			<div class="form-group">
				<label for="access_token" class="control-label">접속토큰 : </label>
				<input type="text" disabled class="form-control" id="access_token" name="access_token" value="" placeholder="로긴 하세요!">
			</div>
			<div class="form-group">
				<label for="item_name" class="control-label">상품명 : </label>
				<input type="text" class="form-control" id="item_name" name="item_name" value="${storeDto.name }">
			</div>
		</form>
	</div>
	
	<div class="container-fluid" style="text-align: center; margin-top: 20px;">
	  <button class="btn btn-default" id="kakaopaylogin" type="button"></button>
	</div>
</div>
	
<!-- 카카오 -->
<script src="${root}/js/payment/kakaopay.js"></script>

</body>
</html>
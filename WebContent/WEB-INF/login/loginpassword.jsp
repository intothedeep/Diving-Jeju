<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	    <link rel="stylesheet" href="${root}/css/login/login.css">
	    <script src="${root}/js/login/login.js"></script> 
		<script src="${root}/js/login/loginpassword.js"></script> 
		
		<title>로그인-password</title>
	
	</head>
  <body>
    <section class="col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 col-xs-8 col-xs-offset-2">
        <div class="">
          <img src="${root}/img/freedive.jpg" alt="로고" width="130px" height="40px">
        </div>

        <div class="" style="padding-left: 3px;">
          <p><h3> ${loginInfo.name}</h3></p>
          <p><h6> ${loginInfo.email} </h6></p>
        </div>

        <form id="loginpasswordform" class="form-group" style="margin-top: 50px;">
        	<input type="hidden" id="email" name="email" value="${loginInfo.email}">
        
			<h6><p id="pw-text" class="text-info" style="margin-top: 30px; padding-left:3px; font-size: 12px;">Password</p></h6>
			<div class="">
			  <h6><input class="form-control" id="pass" name="pass" type="password" value="" placeholder="비밀번호"></h6>
			</div>
			<h6><label class="control-label" for="focusedInput" style="margin-top: 10px; padding-left: 3px; font-size: 13px; color:red; display: none;"> 올바른 이메일 또는 전화번호를 입력하세요.</label></h6>
			<h6><p class="text-danger" style="font-size: 13px; padding-left: 3px; display:none;">비밀번호가 틀렸습니다.</p></h6>

        <div class="" style="text-align: right;">
          <div class="col-md-12" style="margin-top: 20px; display:inline-block;">
            <a id="passBtn" class="btn btn-primary" href="#">다음</a>
          </div>
			</div>
			
        </form>

        <div class="col-md-12" style="margin-top: 15px;">
          <h6><a class="btn">비밀번호를 잊으셨나요?</a></h6>
        </div>

    </section>
  </body>
</html>
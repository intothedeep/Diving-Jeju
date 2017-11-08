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
		
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
        
		<script src="${root}/js/management/memberinfo.js" charset="utf-8"></script>
		<link rel="stylesheet" href="${root}/css/join/join.css">
		
		<title>회원 정보</title>

</head>
<body>
	<%@ include file="/WEB-INF/management/managementnav.jsp"%>


    <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-8 col-xs-offset-2 content" style="margin-top: 100px;">
		<form name="modifyForm" id="modifyForm" method="post" action="">
		  <input type="hidden" name="email" id="jemail" value="">
		  <input type="hidden" name="pass" id="jpass" value="">
		  <input type="hidden" name="addr1" id="jaddr1" value="">
		  <input type="hidden" name="addr2" id="jaddr2" value="">
		  <input type="hidden" name="zipcode" id="jzipcode" value="">		  
		</form>

        <div class="form-group" id="gmail-address-form-element">
          <label id="gmail-address-label">
            <strong> 사용자 ID </strong>
          </label>
          <div class="">
            <input value="${memberInfo.email}" class="form-control check" id="email" aria-invalid="true" disabled spellcheck="false" type="text" maxlength="30" autocomplete="off" placeholder="email-address" maxlength="">
          </div>
	<c:if test="${memberInfo.emailConfirm == 0}">
          <div id="username-errormsg-and-suggestions" style="text-align: right; padding:3px;">
            <a href="#" class="email_auth">
	            <span style="color: #FF0000; font-weight: bold;">메일 인증하기</span>
            </a>
          </div>
	</c:if>          
        </div>

        <div class="form-group" id="password-form-element">
            <label id="pw-label">
              <strong>새 비밀번호</strong>
            </label>
            <div class="">
              <input class="form-control check pw" id="pw" aria-invalid="true" type="password" placeholder="Password" maxlength="16">
              <span class="errormsg" id="errormsg_0_Passwd" role="alert">필수 입력란입니다.</span>
            </div>
        </div>

        <div class="form-group" id="confirm-password-form-element">
            <label id="confirm-password-label">
              <strong>비밀번호 확인</strong>
            </label>
            <div class="">
              <input class="form-control check pw" id="pwcheck" aria-invalid="true" type="password" placeholder="Password Check" maxlength="16">
              <span class="errormsg" id="errormsg_0_PasswdAgain" role="alert">필수 입력란입니다.</span>
              <span class="errormatch" id="errormsg_1_PasswdAgain" role="alert">비밀 번호가 일치하지 않습니다.</span>
            </div>
        </div>

        <div class="">
          <label for="zipcode">우편번호</label>
        </div>
        <label class="zipcode" id="zipcode-search">
          <input value="${memberInfo.zipcode }" id="zipcode" disabled class="form-control" aria-invalid="true" spellcheck="false" type="text" placeholder="우편번호">
        </label>
        <button id="zipBtn" class="btn btn-success" onclick="addressSearch(); return false;">
          <!-- javascript: openZip();  -->
          <span class="glyphicon glyphicon-search"></span> 주소 검색
        </button>

        <div class="form-group">
            <label id="address-label">
              <strong>주소</strong>
            </label>
            <input value="${memberInfo.addr1 }" id="address" disabled class="form-control" aria-invalid="true" type="text" placeholder="주소">
        </div>

        <div class="form-group">
            <label id="address-detail-label">
              <strong>상세주소</strong>
            </label>
            <input value="${memberInfo.addr2 }" id="address-detail" class="form-control" aria-invalid="true" type="text" placeholder="상세주소">
        </div>

        <span id="guide" style="color:#999"></span>

        <div class="form-group text-center">
          <button type="submit" id="modifyBtn" class="btn btn-info">수정<i class="fa fa-check spaceLeft"></i></button>
          <button type="submit" id="cancelBtn" class="btn btn-warning">취소<i class="fa fa-times spaceLeft"></i></button>
        </div>

    </div>
  </body>
</html>
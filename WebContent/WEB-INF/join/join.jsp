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
		
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

		<link rel="stylesheet" href="${root}/fonts/font-awesome.min.css">
		
		<link rel="stylesheet" href="${root}/css/join/join.css">
		<script src="${root}/js/join/join.js" charset="utf-8"></script>
	
		<title>회원가입</title>
	
	</head>
	<body>
	<%@ include file="/common/loginmodal.jsp"%>

    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="">

        <div class="navbar-header">
          <a class="navbar-brand" href="${root}/admin/main.html">Freediver</a>
          <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>

        <div class="navbar-collapse collapse" id="navbar-main">
			<%@ include file="/common/loginnav.jsp"%>
        </div>

      </div>
    </nav>

    <div class="page-header" style="margin-top: 100px; text-align: center;">
      <h1>회원가입</h1>
    </div>

    <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-8 col-xs-offset-2 content">
		<form name="joinForm" id="joinForm" method="post" action="">
		  <input type="hidden" name="name" id="jname" value="">
		  <input type="hidden" name="email" id="jemail" value="">
		  <input type="hidden" name="pass" id="jpass" value="">
		  <input type="hidden" name="addr1" id="jaddr1" value="">
		  <input type="hidden" name="addr2" id="jaddr2" value="">
		  <input type="hidden" name="zipcode" id="jzipcode" value="">		  
		  <input type="hidden" name="tel" id="jtel" value="01025101804">
		  <input type="hidden" name="gender" id="jgender" value="">
		  <input type="hidden" name="birth" id="jbirth" value="">
		  <input type="hidden" name="memberType" id="jmemberType" value="">
		  <input type="hidden" name="joinType" id="jjoinType" value="1">
		  <input type="hidden" name="id" id="jid" value="">
		</form>
		
        <div class="form-group">
          <fieldset>
            <div class="">
              <label for="username">이름</label>
            </div>

            <label class="col-md-6 col-sm-6 lastname" id="lastname-label" style="padding-left: 0;">
              <input class="form-control name check" id="lastname" aria-invalid="true" spellcheck="false" type="text" value="" placeholder="성" maxlength="8">
            </label>

            <label class="col-md-6 col-sm-6 firstname" id="firstname-label" style="padding-left: 0;">
              <input class="form-control name check" id="firstname" aria-invalid="true" spellcheck="false" type="text" value="" placeholder="이름" maxlength="8">
            </label>

            <div class="">
              <span class="errormsg" id="errormsg_0_name" role="alert"><strong>필수 입력란입니다.</strong></span>
            </div>

          </fieldset>
        </div>

        <div class="form-group" id="gmail-address-form-element">
          <label id="gmail-address-label">
            <strong> 사용자 이름 </strong>
          </label>
          <div class="input-group">
            <input class="form-control check" id="email" aria-invalid="true" spellcheck="false" type="text" maxlength="30" value="" autocomplete="off" placeholder="email-address" maxlength="">
            <span class="input-group-btn">
              <button class="btn btn-success email_auth"> 이메일 인증 <i class="fa fa-mail-forward spaceLeft"></i></button>
            </span>
          </div>
          <div id="username-errormsg-and-suggestions" class="">
            <span class="errormsg" id="errormsg_0_email" role="alert">필수 입력란입니다.</span>
            <div id="EmailAddressExistsError" style="display: none;">
              이 이메일 주소는 이미 계정으로 등록되었습니다. <a href="#">로그인</a>하거나,
              또는 비밀번호를 잊은 경우 비밀번호를 <a href="#">재설정</a>하세요.
            </div>
          </div>
        </div>

        <div class="form-group" id="password-form-element">
            <label id="pw-label">
              <strong>비밀번호 만들기</strong>
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
          <input id="zipcode" disabled class="form-control" aria-invalid="true" spellcheck="false" type="text" placeholder="우편번호">
        </label>
        <button id="zipBtn" class="btn btn-success" onclick="addressSearch(); return false;">
          <!-- javascript: openZip();  -->
          <span class="glyphicon glyphicon-search"></span> 주소 검색
        </button>

        <div class="form-group">
            <label id="address-label">
              <strong>주소</strong>
            </label>
            <input id="address" disabled class="form-control" aria-invalid="true" type="text" placeholder="주소">
        </div>

        <div class="form-group">
            <label id="address-detail-label">
              <strong>상세주소</strong>
            </label>
            <input id="address-detail" class="form-control" aria-invalid="true" type="text" placeholder="상세주소">
        </div>

        <span id="guide" style="color:#999"></span>


        <div class="">
          <label for="birthday">생년월일</label>
        </div>
        <div class="form-group">
          <div class="col-md-4">
            <input name="byear" id="byear" class="form-control" type="text" value="" placeholder="Year">
          </div>

          <div class="col-md-4">
            <select class="btn btn-default form-control" name="bmonth" id="bmonth">
              <option value="" selected>Month</option>
              <option value="1">1월</option>
              <option value="2">2월</option>
              <option value="3">3월</option>
              <option value="4">4월</option>
              <option value="5">5월</option>
              <option value="6">6월</option>
              <option value="7">7월</option>
              <option value="8">8월</option>
              <option value="9">9월</option>
              <option value="10">10월</option>
              <option value="11">11월</option>
              <option value="12">12월</option>
            </select>
          </div>

          <div class="col-md-4">
            <input name="bday" id="bday" class="form-control" type="text" value="" placeholder="Day">
          </div>
        </div>

        <div class="form-group">
          <label id="gender-choice">
            <strong>성별</strong>
          </label>
          <div class="radio">
            <label class="radio-inline">
              <input type="radio" name="gender" id="man" value="1" checked> 남
            </label>
            <label class="radio-inline">
              <input type="radio" name="gender" id="woman" value="2"> 여
            </label>
          </div>
        </div>

<!-- memberType -->
        <div class="form-group">
          <label id="gender-choice">
            <strong>가입타입</strong>
          </label>
          <div class="radio">
            <label class="radio-inline">
              <input type="radio" name="memberType" id="userType" value="3" checked> 개인회원
            </label>            
            <label class="radio-inline">
              <input type="radio" name="memberType" id="storeType" value="2"> 사업자
            </label>
          </div>
        </div>
        
<!-- 
        <div class="form-group">
          <label for="username">휴대폰 인증</label>
          <div class="input-group">
            <input type="tel" class="form-control check" id="username" placeholder="- 없이 입력해 주세요">
            <span class="input-group-btn">
              <button class="btn btn-success">인증번호 전송<i class="fa fa-mail-forward spaceLeft"></i></button>
            </span>
          </div>
        </div>

        <div class="form-group">
          <label for="username">인증번호 입력</label>
          <div class="input-group">
            <input type="text" class="form-control check" id="username" placeholder="인증번호">
            <span class="input-group-btn">
              <button class="btn btn-success">인증번호 입력<i class="fa fa-edit spaceLeft"></i></button>
            </span>
          </div>
        </div>
 -->
 
        <div class="form-group">
            <label>약관 동의</label>
          <div data-toggle="buttons">
          <label class="">
              <span class="fa fa-check"></span>
              <input class="" id="agree" type="checkbox" checked>
          </label>
          <a href="#">이용약관</a>에 동의합니다.
          </div>
        </div>

        <div class="form-group text-center">
          <button type="submit" id="joinBtn" class="btn btn-info">회원가입<i class="fa fa-check spaceLeft"></i></button>
          <button type="submit" id="cancelBtn" class="btn btn-warning">가입취소<i class="fa fa-times spaceLeft"></i></button>
        </div>

    </div>
  </body>
</html>
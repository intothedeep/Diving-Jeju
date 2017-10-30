<%@page import="com.free.member.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/common/root.jsp"%>
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

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<link rel="stylesheet" href="${root}/css/bootstrap readable.min.css">
    <link rel="stylesheet" href="${root}/css/bootstrap readable.css">
    <script src="${root}/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="${root}/css/main/main.css">
    <link rel="stylesheet" href="${root}/css/main/nav.css">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.min.js"></script>

    <script src="${root}/js/main/main.js"></script>
    
 	<title>제주도 여행!</title>

</head>
<body>
<body>
<%@ include file="/common/loginmodal.jsp"%>
<%@ include file="/common/commonform.jsp"%>

<div class="">

    <div class="">
    <header class="main_header" style="height: 80px; text-align: center;">
      <h1>Jeju Diving & GuestHouse</h1>
    </header>

    <nav class="navbar navbar-default navbar-static-top main_nav" data-spy="affix" data-offset-top="78">
      <div class="container"
    		style="padding: 2px; margin-top: auto; margin-bottom: auto;">

          <div class="navbar-header">
            <a class="navbar-brand" href="${root}/">Freedive</a>
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
                <a href="#" class="guesthouse" id="guesthouse">게스트하우스</a>
              </li>
              <li>
                <a href="#" class="tour">투어</a>
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
  </div>
  
  
  
<!-- <style>
  div {
  	border: 1px green solid;
  }
</style> -->
	<template id="hotList_template">
			
		<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="padding: 0px;">
			<div class="panel panel-default" style=" margin-right: 3%; margin-left: 3%;">
			
				<a class="blog" data-storeType="{{STORETYPESEQ}}" data-guestSeq="{{GUESTSEQ}}" data-storeSeq="{{STORESEQ}}" href="#">
					<div class="panel-heading" style="padding: 0px;">
						<img src="<%=root%>/upload/{{STOREDFILENAME}}" style="width: 100%; height: 180px;">
					</div>
				</a>
				<div class="panel-body" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
					<div style="">   
						<h4><span class="glyphicon glyphicon-home"></span> {{NAME}} </h4>
					</div>
					<p> 
						<span class="glyphicon glyphicon-apple"></span> {{MORE}}
					</p> 
				</div>
				
				<div class="panel-footer" style="height: 50px; padding: 5px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
					<div style="display: inline-block; margin-left: 15px; margin-top: 3px; float: left;"> 평점 |</div>
					<div class="star2 col-xs-8 col-xs-offset-1">
						<p class="star1" style="width: {{EVALUATION}}%;"></p>
						<span class="evaluation" style="display: none;">{{EVALUATION}}</span>
					</div>
				</div>
				
			</div>
		</div>
	</template>
  
  
	<div id="hotbody" class="container" style="margin-top: 30px;">

	</div>

	<div class="container main-footer main-footer--white" style="margin-top: 50px;">
		<article class="menubox col-sm-offset-11">
		  <p class="tit">
		    <a href="#top"> Back to top </a><span class="glyphicon glyphicon-arrow-up" style="color: #459ce7"></span>
		  </p>
		
		</article>
		
		<footer class="main-footer container-fluid">
		  <div class="container-fluid" id="wrapfooter">
		
		    <div class="copy col-md-7 col-sm-12 col-xs-12" style="display: inline-block;">
			  <a href="" target="_blank"><span class="glyphicon glyphicon-heart"></span></a>
			  Copyright 2017 victor. All rights reserved. 대표: 임택 <br>
			    Made by Victor Lim. Contact him at victor.taek.lim@gmail.com.<br>
			    Based on Bootstrap. Icons from Font Awesome. Web fonts from Google.
			</div>
			
			<div class="linkbox col-md-5 col-sm-12 col-xs-12">
				<ul class="link foot">
					<li class="link_text"><a onclick="policyPopOpen('fpolicy1','/policy/devcenter-inner/');return false;" href="#none">사이트 이용약관</a></li>
					<li class="link_text"><a class="highlight" onclick="policyPopOpen('fpolicy2','/policy/personal-inner/');return false;" href="#none">개인정보처리방침</a></li>
					<li class="link_text"><a onclick="policyPopOpen('fpolicy3','/policy/openapi-inner/');return false;" href="#none">mail</a></li>
		    	</ul>
		    </div>
		  </div>
		</footer>
	</div>
</div>

<script>
$(document).ready(function (){
	$('.main_guesthouse_img').click(function () {
	var guestSeq = $(this).attr('data-guestSeq');
		$(location).attr("href", root + "/guesthouse/blog_guesthouse.html?guestSeq=15");
	});
	$('.guesthouse').click(function(){
		hotList("hotGuesthouseList");
	});
	$('.tour').click(function (){
		hotList("hotTourList");
	});

//인기 게스트하우스 리스트 뿌리기
	$.ajax({
		url: root + "/guesthouse/hotGuesthouseList",
		type: "get",
		dataType: "json",
		contentType : 'application/json;charset=utf-8',
		mimeType : 'application/json',
		success: hotGuestList
	});
//	게스트하우스 사진 클릭하면 블로그로 이동
	$(document).on("click", ".blog", function () {
		var type = $(this).attr('data-storeType');
		if(type == 1) {
			
			var guestSeq = $(this).attr('data-guestSeq');
			$(location).attr("href", root + "/guesthouse/blog_guesthouse.html?guestSeq=" + guestSeq);
		}
		else {
			var storeSeq = $(this).attr('data-storeSeq');
			$(location).attr("href", root + "/store/blog_tour.html?storeSeq=" + storeSeq);			
		}
		
	});
	
});

function hotList(type) {
	$.ajax({
		url: root + "/guesthouse/" + type,
		type: "get",
		dataType: "json",
		success: type
	});
}

function hotGuestList(lists) {
	//리스트 바디에 템블릿 붙이는 법
	var hotbody = $('#hotbody');
	hotbody.empty();
	var template = $('#hotList_template').html();
	
  	for(x in lists[0]) {
		console.log(x);
		console.log(lists[0][x]);
	}
/*	
	for (x in lists) {
		hotbody.append(Mustache.render(template, lists[x]));					
	} */
	$.each(lists, function(i, map) {
		hotbody.append(Mustache.render(template, map));
	});
}

function hotTourList(lists) {
	//리스트 바디에 템블릿 붙이는 법
	var hotbody = $('#hotbody');
	hotbody.empty();
	var template = $('#hotList_template').html();

	$.each(lists, function(i, map) {
		hotbody.append(Mustache.render(template, map));
	});
}
</script>

</body>
</html>
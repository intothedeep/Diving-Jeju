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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


	<link rel="stylesheet" href="${root}/fullcalendar/fullcalendar.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>	
	<script src="${root}/fullcalendar/lib/moment.min.js"></script>
	<script src="${root}/fullcalendar/fullcalendar.min.js"></script>
	
	<script src="${root}/js/bootstrap.min.js"></script>	
	<link rel="stylesheet" href="${root}/css/bootstrap readable.min.css">
	<link rel="stylesheet" href="${root}/css/bootstrap readable.css">
	<link rel="stylesheet" href="${root}/fonts/font-awesome.min.css">
	
	<script src="${root}/js/guesthouse/guesthouse.js"></script>		
	<link rel="stylesheet" href="${root}/css/guesthouse/guesthouse.css">
		
 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e7ca5d8e2c9d5c4f27b2965d6004e5d7&&libraries=services,clusterer,drawing"></script>

	<title>게스트하우스 </title>
	
</head>
<body>
<%@ include file="/guesthouse/book.jsp"%>
<%@ include file="/common/commonform.jsp"%>
<%@ include file="/common/writemodal.jsp"%>

	<!-- side login -->
	<div class="login_side">
		<a href="#top" class="booking rrr"><span class="glyphicon glyphicon-user"></span> 예약</a>
<%-- <c:if test="${loginInfo == null }">
		<a href="#top" class="rrr" id="guesthouse_login"><span class="glyphicon glyphicon-user"></span> LOGIN</a>
</c:if>
<c:if test="${loginInfo != null }">
		<%@ include file="/common/loginnav.jsp"%>
</c:if> --%>
	</div>
	
	<!-- navbar top-none-fixed -->
	<nav class="row navbar navbar-default navvar1">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand main" href="#" style="margin-left: 2%;">Freedive</a>
	    </div>
	
	    <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
	      <form class="navbar-form navbar-left" role="search" id="blog_searchForm" method="get">
	        <div class="form-group">
	          <input type="text" class="form-control" name="keyword" id="guest_keyword" placeholder="Search">
	        </div>
	        <button type="submit"  id="guest_searchBtn" class="btn btn-default" onsubmit="javascript: return false;">
	        	<span class="glyphicon glyphicon-search"></span> 검색</button>
	      </form>
	    </div>
	    
	  </div>
	</nav>
	
	<!-- navbar top-fixed -->
	<nav class="navbar navbar-inverse navbar2">
	  <div class="container-fluid">
	    
	   <!--  <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand main" href="#">Freedive</a>
	    </div> -->
		<div class="row">
			<div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-12">
				<div class="blog_title">
				<h3>${guesthouseDto.name}</h3>				
				</div>
			</div>
		</div>
	    
	  </div>
	</nav>

	<!-- blog Title -->	
	<div class="row" style="clear: both;">
		<div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-12">
			<div class="blog_title">		
				<h1>${guesthouseDto.name}</h1>
				<input type="hidden" id="guestName" data-name="${guesthouseDto.name}">	
				
			</div>
			<div class="container-fluid line">
			
			</div>
		</div>
	</div>
	

	<header class="container" style="background-color:white;">
		<!-- content header -->
	  	<div id="myCarousel" class="carousel slide col-sm-6 col-sm-offset-3" data-ride="carousel" style="background-color:white;">
	    	<!-- Indicators -->
	    	<ol class="carousel-indicators">
		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		      <li data-target="#myCarousel" data-slide-to="1"></li>
		      <li data-target="#myCarousel" data-slide-to="2"></li>
		      <li data-target="#myCarousel" data-slide-to="3"></li>
		      <li data-target="#myCarousel" data-slide-to="4"></li>
	    	</ol>
	
		    <!-- Wrapper for slides -->
		    <div class="carousel-inner" style="background-color:white;">
				<div class="item active" style="background-color:white;">
		        	<img src="${root }/upload/${pics[0]}" alt="Los Angeles" style="width: 100%;">
				</div>
				<c:forEach items="${pics}" var="pic" begin="1">
		    	<div class="item">
		    	    <img src="${root }/upload/${pic}" alt="Los Angeles" style="width: 100%;">
		      	</div>
				</c:forEach>
	    	</div>
	
		    <!-- Left and right controls -->
		    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
		      <span class="glyphicon glyphicon-chevron-left"></span>
		      <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" data-slide="next">
		      <span class="glyphicon glyphicon-chevron-right"></span>
		      <span class="sr-only">Next</span>
			</a>
		</div>
	</header>
	
	<!-- content section 1 -->
	<section class="content row">
	
		<div class="content_head col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-12">
			<h3> | 상세설명 </h3>
		</div>
		<div class="content_body1 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-12">
			<p>
				<span class="glyphicon glyphicon-home"> </span>
				${guesthouseDto.addr1} ${guesthouseDto.addr2} ${guesthouseDto.zipcode }
			</p>
			<p>
				<span class="glyphicon glyphicon-earphone"> </span>
				${guesthouseDto.tel}
			</p>
			<p>
				<span class="glyphicon glyphicon-comment"> </span>
				${guesthouseDto.more}
			</p>
			<p>
				<span class="glyphicon glyphicon-time"> </span>
				${guesthouseDto.checkin} 체크인
			</p>	
			<p>
				<span class="glyphicon glyphicon-star"> </span>
				${guesthouseDto.evaluation} Rating
			</p>			
		</div>

	</section>
	
	<!-- content section 2 -->
	<div class="content row">
	
		<div class="content_head col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-12">
			<h3> | 위치 </h3> ${guesthouseDto.addr1} ${guesthouseDto.addr2}
		</div>
		<div class="content_body2 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-12">
			<div id="guestMap" data-address="${guesthouseDto.addr1} ${guesthouseDto.addr2}"></div>
		</div>
		
	</div>	
	
	<!-- content section 3 -->
<%-- 	<section class="content row">
		<div class="content_head col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-12">
			<div class="image-upload">
			    <h3> | 앨범  </h3> 
			    <label for="file-input">
			   다운로드 href>> 설정방법 with c taglib <c:url value='/board/download/${article.id}'/>
			      
			    <a href="javascript:return false;"> <span class="glyphicon glyphicon-camera"></span>
			       	 사진등록
			    </a>
			    </label>
				<input id="file-input" class="btn btn-default" type="file" name="data">
			</div>			
		</div>	
		<div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-12">
			<%@ include file="/common/lightbox.jsp"%>
		</div>
	</section> --%>

	<!-- content section 4 -->
	<section class="content row">
	
		<div class="content_head col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-12">
			<div class="image-upload">
			    <h3> | 리뷰  </h3> 

			    <a href="javascript:return false;"> <span class="glyphicon glyphicon-pencil"></span>
			       	 리뷰작성
			    </a>			
			</div>						
		</div>	
		
		<div class="content_body4 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-12">
		
			<div class="list-group col-md-4 col-sm-4 col-xs-12">
			  <a href="#" class="list-group-item">
			    <h3 class="list-group-item-heading">리뷰</h3>
			    <p class="list-group-item-text">
			    	여기 좋아요!
			    </p>
			  </a>
			</div>
			
			<div class="list-group col-md-4 col-sm-4 col-xs-12">
			  <a href="#" class="list-group-item">
			    <h3 class="list-group-item-heading">리뷰</h3>
			    <p class="list-group-item-text">
			    	최고야!!!
			    </p>
			  </a>
			</div>
			
			<div class="list-group col-md-4 col-sm-4 col-xs-12">
			  <a href="#" class="list-group-item">
			    <h3 class="list-group-item-heading">리뷰</h3>
			    <p class="list-group-item-text">
			    	조용하고 혼자서 쉬기에 좋은 장소입니다.
			    </p>
			  </a>
			</div>
									
		</div>
	</section>
</body>
</html>
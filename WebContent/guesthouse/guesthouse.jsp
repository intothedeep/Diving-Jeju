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
	
	<script src="${root}/js/guesthouse/guesthouse.js"></script>		
	<link rel="stylesheet" href="${root}/css/guesthouse/guesthouse.css">
	
	<script type="text/javascript" src="${root}/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript" src="${root}/se2/sample/js/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
	
 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e7ca5d8e2c9d5c4f27b2965d6004e5d7&&libraries=services,clusterer,drawing"></script>

	<title>게스트하우스 </title>
	
	<style>
		html, body {
		  height:100%;
		  margin:0;
		  padding:0;
		  font-size:14px;
		  font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
		}
		
		.rrr {
			text-decoration: none;
			font-weight: bold;
			color: lightblue;
		}
		.rrr:hover {
			text-decoration: none;
			font-weight: bold;
			font-size: 18px;
			color: lightblue;		
		}

		div {
/*   			border: 1px solid green;
 */  		}
		.navbar {
/* 			border-bottom: 2px solid black !important;
 */			box-shadow: 0 0 6px rgba(35, 173, 278, 1);
			
		}
		section, header {
			margin-top: 30px;
		}
		

		.navbar2 {
			display: none;
		}
		.blog_title {
			text-align: center;
		}
		.line {
			border-top: 1px solid lightblue;
		}
		
		/* 사이드 로긴 */
		.login_side {
			position: fixed;
			top: 100px;
			right: 50px;
			z-index: 1000;
			background-color: white;
			
		}
		.login_side:hover {
			box-shadow: 0 0 6px rgba(35, 173, 278, 1);
		}
		
		/* 사진  */
	    .gpic-img {
			display: inline-block;
			position: absolute;
			left: 50%;
			top: 50%;
			transform: translate(-50%, -50%);
	    }
	    .gpic {
			position: relative;
			vertical-align: middle;
			height: 400px;
	    	
	    }
	    .gpic-wrapper {
	    	text-align: center;
	    }
	    
	    /* section */
	    .content {
	    	 clear: both;
	    }
	    .content_head {
	    	margin-top: 15px;
	    	padding-left: 30px;
	    }
	    .content_body1 {
	    	margin-top: 5px;
	    	padding-left: 70px;
			font-size: 15px;
	    }
	    .content_body2 {
	    	margin-top: 10px;
	    	margin-bottom: 10px;	    
			text-align:center;    
	    }
	    .content_body4 {
	    	margin-top: 10px;
	    	padding-left: 30px;
	    	padding-right: 30px;
	    }
	    #guestMap {
	    	margin-top: 10px;	    
			width:90%;
			height:350px;
			display:inline-block;	    
	    }
	    
	    /* 리뷰  */
	    .list-group .list-group-item-text{
	    	height: 120px;
	    }
	    
	    /* 사진등록버튼  */
	    .image-upload > input
		{
		    display: none;
		}
		.image-upload a:hover {
			cursor: pointer;
			text-decoration: none;
			color: lightblue;
			font-weight: bold;
			font-size: 15px;
		}
	    
	</style>
	
	<script type="text/javascript">
	
		$(document).ready(function(){
		
			$(window).scroll(function() {
			    if ($(document).scrollTop() > 300) {
			    	$('.navbar1').css("display", "none");
			      	$('.navbar2').addClass("navbar-fixed-top");
			      	$('.navbar2').css("display", "block");
			    } else {
			    	$('.navbar1').css("display", "");
			      	$('.navbar2').removeClass("navbar-fixed-top");
			      	$('.navbar2').css("display", "none");
			    }
			});
			
			$('.main').click(function () {
				$(location).attr("href", root +"/admin/main.html");
			});
			
			$('#guest_keyword').keypress(function (e) {
				var keypress = e.which;
			    var keyword = document.getElementById('guest_keyword').value;
			    
				if(keypress === 13) {
				    if (!keyword.replace(/^\s+|\s+$/g, '')) {
				        alert('키워드를 입력해주세요!');
				        return false;
				    } else {
						$('#blog_searchForm').attr("action", root + "/map/search.html").submit();			    	
				    }
				}
			});
			$('#guest_searchBtn').click(function () {
			    var keyword = document.getElementById('guest_keyword').value;

			    if (!keyword.replace(/^\s+|\s+$/g, '')) {
			        alert('키워드를 입력해주세요!');
			        return false;
			    } else {
					$('#blog_searchForm').attr("action", root + "/map/search.html").submit();			    	
			    } 
			});
			
			$('#guesthouse_login').click(function () {
				$(location).attr("href", root + "/member/loginid.html")
			});
			
			/* 사이드 로긴 버튼 가로 사이즈에 맞춰서 크기 조절 */
			$(window).scroll(function() {
			    var width = $(document).innerWidth();
			    var height = $(document).scrollTop();
			    if(height > 301 || width< 700) {
			    	$('.login_side').hide();
			    } else {
			    	$('.login_side').show();
			    }
			});
		    $(window).resize(function(){
/* 			    var w = window.innerWidth;
			    var h = window.innerHeight; */
			    var width = $(document).innerWidth();
			    var height = $(document).scrollTop();
/* 			    console.log(width);
 */			    if(width < 700) {
			    	$('.login_side').hide();
			    } else {
			    	$('.login_side').show();
			    }
		    });
		    
		    /* 사진등록 */
			$('#pic_upload').click(function () {
				alert('123');

			});
		    
		});
		  
	</script>
	

</head>
<body>
<%@ include file="/common/commonform.jsp"%>
<%@ include file="/common/writemodal.jsp"%>

	<!-- side login -->
	<div class="login_side">
<c:if test="${loginInfo == null }">
		<a href="#top" class="rrr" id="guesthouse_login"><span class="glyphicon glyphicon-user"></span> LOGIN</a>
</c:if>
<c:if test="${loginInfo != null }">
		<%@ include file="/common/loginnav.jsp"%>
</c:if>
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
	
	<!-- content header -->
	<header class="row">
		<div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-12">
			<div class="container-fluid gpic-wrapper">
				<div class="gpic">
					<div class="gpic-img">
						<img src="${root}/img/gpic-nubville.jpg" style="height: 400px;">
					</div>
				</div>
			</div>
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
	<section class="content row">
		<div class="content_head col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-12">
			<div class="image-upload">
			    <h3> | 앨범  </h3> 
			    <label for="file-input">
			   <%-- 다운로드 href>> 설정방법 with c taglib <c:url value='/board/download/${article.id}'/>
			    --%>   
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
	</section>

							
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
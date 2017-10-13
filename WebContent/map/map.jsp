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
	
	<link rel="stylesheet" href="${root}/css/main/myproject.css">
    <link rel="stylesheet" href="${root}/css/map/sidenav.css">

    <script src="${root}/js/map/sidenav.js" charset="utf-8"></script>

<!--     <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9a20f452457ec78c49fefb900ba9ac98&libraries=services,clusterer,drawing"></script>
 -->    
 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e7ca5d8e2c9d5c4f27b2965d6004e5d7&&libraries=services,clusterer,drawing"></script>
 	
 	<link rel="stylesheet" href="${root}/css/map/searchdaum.css">
    <link rel="stylesheet" href="${root}/css/map/addStyledDrawingPolyline.css">
    <link rel="stylesheet" href="${root}/css/map/searchKeywordByCategory.css">
    <!-- <link rel="stylesheet" href="${root}/css/map/customInfoWindow.css"> -->

    <script src="${root}/js/map/searchdaum.js"></script>
    <script src="${root}/js/map/addStyledDrawingPolyline.js" charset="utf-8"></script>
    <script src="${root}/js/map/searchKeywordByCategory.js" charset="utf-8"></script>
    <script src="${root}/js/map/searchByKeyword.js" charset="utf-8"></script>
    <script src="${root}/js/map/mapTypeChange.js" charset="utf-8"></script>
    <script src="${root}/js/map/getMyPosition.js" charset="utf-8"></script>
    <script src="${root}/js/map/zoomInOutMap.js" charset="utf-8"></script>
	<script src="${root}/js/map/showGuesthouseList.js" charset="utf-8"></script>
    
    
	<title>제주도</title>
	
    <script type="text/javascript">
	    $(document).ready(function() {
			if('${keyword}' != null) {
				function searchPlacesbyKeywordFromGuestHouse(keyword) {	
					
					//장소 검색 객체를 생성합니다
					psByKeyword = new daum.maps.services.Places();  

					//검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
					infowindow = new daum.maps.InfoWindow({
						zIndex:1
					});

				    //키워드 검색 마커 지우기	
					removeMarkersByKeyword();		

				    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
				    psByKeyword.keywordSearch( keyword, placesSearchCBByKeyword); 
				}
				
				searchPlacesbyKeywordFromGuestHouse('${keyword}');
			}
			
	    	$('#home').click(function(event) {
	       		document.location.href = "${root}/admin/main.html";
	      	});
	    	
	    });
    </script>
    
</head>
<body>
<%@ include file="/common/loginmodal.jsp"%>

        <div id="mySidenav" class="sidenav">

          <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
          <a href="#">About</a>

        </div>

        <div class="map_wrap">
          <div id="map" style="width: 100%; height: 100%;"></div>

<!--category  -->
          <ul id="category">
            <li id="BK9" data-order="0">
              <span class="category_bg bank"></span>
             	 은행
            </li>
            <li id="MT1" data-order="1">
              <span class="category_bg mart"></span>
            	 마트
            </li>
            <li id="PM9" data-order="2">
              <span class="category_bg pharmacy"></span>
             	 약국
            </li>
            <li id="OL7" data-order="3">
              <span class="category_bg oil"></span>
              	주유소
            </li>
            <li id="CE7" data-order="4">
              <span class="category_bg cafe"></span>
              	카페
            </li>
            <li id="CS2" data-order="5">
              <span class="category_bg store"></span>
              	편의점
            </li>
          </ul>
        </div>
        
<!-- 검색 -->
        <div id="search_container">
          <div id="button-wrap" class="col-sm-2 col-xs-2" style="margin:0; padding:0; text-align: right;">
            <button type="button" id="sidenavbtn" class="btn btn-default" name="button" title="사이드메뉴버튼">
              <span class="glyphicon glyphicon-menu-hamburger"></span>
            </button>
          </div>

          <div class="col-sm-5 col-xs-5" style="margin:0; padding:0; height: 20px;">
            <input id="keyword" type="text" class="form-control" placeholder="검색" value=""/>
          </div>

          <div class="col-sm-2 col-xs-2" style="margin:0; padding:0;">
            <span class="input-group">
              <button id="keywordbtn" type="button" class="btn btn-info">
                <span class="glyphicon glyphicon-search"></span></button>
              </span>
          </div>
        </div>

<!-- map menu -->
        <div id="mapMenu" class="">

          <div class="">
            <button id="home" type="button" class="btn btn-default" name="button"><span class="glyphicon glyphicon-home"></span></button>
          </div>

          <div class="">
            <button class="btn btn-dfault"  data-toggle="modal" data-target="#login"  data-backdrop="static" title="로그인">
              <span class="glyphicon glyphicon-user"></span>
            </button>
          </div>

<!-- zoomin zoom out -->
          <div class="">
            <button type="button" id="zoomIn" class="btn btn-default zoomBtn" name="zoomin" title="확대">
              <span class="glyphicon glyphicon-plus"></span></button>
          </div>

          <div class="">
            <button type="button" id="zoomOut" class="btn btn-default zoomBtn" name="zoomout" title="축소">
              <span class="glyphicon glyphicon-minus"></span></button>
          </div>

          <div class="">
            <button type="button" id="normalMap" class="btn btn-info baseMap" name="ROADMAP" title="일반뷰">
              <span class="glyphicon glyphicon-screenshot"></span></button>
          </div>

          <div id="button-wrap" class="">
            <button type="button" id="skyMap" class="btn btn-default baseMap" name="SKYVIEW" title="스카이뷰">
              <span class="glyphicon glyphicon-plane"></span></button>
          </div>

          <!-- <span class="" style="display:inline-block;">
            <button id="sidenavbtn" class="btn btn-default" href="javascript:openNav();">&#9776;</button>
          </span> -->

          <div id="button-wrap" class="">
            <button type="button" id="road" class="btn btn-default" name="button" title="로드 뷰">
              <span class="glyphicon glyphicon-sunglasses"></span></button>
          </div>

          <div id="button-wrap" class="">
            <button type="button" id="mySpot" class="btn btn-default" name="button" title="현 위치">
              <span class="glyphicon glyphicon-record"></span></button>
          </div>

          <div id="button-wrap" class="">
            <button type="button" id="bicycle" class="btn btn-default overlayMap" name="button" title="자전거">
              <img src="${root}/img/glyphicons/png/glyphicons-307-bicycle.png" alt="교통" style="width: 15px;"></button>
          </div>

          <button type="button" id="traffic" class="btn btn-default overlayMap" name="button" title="교통">
            <img src="${root}/img/glyphicons/png/glyphicons-6-car.png" alt="교통" style="width: 15px;"></button>
          <!-- <div class="">
            <input type="checkbox" name="autorefresh" id="autorefresh" value="" checked>
            <span>실시간 업데이트</span>
          </div> -->
          <div id="button-wrap" class="">
            <button type="button" id="polyline" class="btn btn-default" name="button" title="선그리기">
              <img src="${root}/img/glyphicons/png/glyphicons-10-magic.png" alt="선그리기" style="width: 15px;"></button>
          </div>
          <div id="button-wrap" class="">
            <button type="button" id="guesthouse" class="btn btn-default" name="button" title="게스트하우스">
              <span class="glyphicon glyphicon-pushpin"></span></button>
          </div>         
          
        </div>
        
  </body>
  </html>
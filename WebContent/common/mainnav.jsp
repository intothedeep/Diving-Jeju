<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
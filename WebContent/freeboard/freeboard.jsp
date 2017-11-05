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
	
	<link rel="stylesheet" href="${root}/css/freeboard/freeboard.css">
	<script src="${root}/js/freeboard/freeboard.js"></script>
	<script src="${root}/js/freeboard/hotlist.js"></script>	
	
	<script src="${root}/js/common/writemodal.js"></script>

	<title>자유게시판</title>
<script>
$(document).ready(function (){
    //글보기
    $('.view').click(function() {
		$('#bcode').val('${qs.bcode}');
		$('#pg').val('${qs.pg}');
		$('#key').val('${qs.key}');
		$('#word').val('${qs.word}');
		$('#hot').val('${qs.hot}');
		$('#seq').val($(this).attr('data-seq'));
		$('#commonForm').attr('action', root + '/freeboard/view.html').submit();
    });
    
	$('.recent').click(function() {
		$('#bcode').val('${qs.bcode}');
		$('#pg').val('1');
		$('#commonForm').attr('action', root+'/freeboard/list.html').submit();
	});
	
	$('.list').click(function() {
		$('#bcode').val('${qs.bcode}');
		$('#pg').val($(this).attr('data-page'));
		$('#key').val('${qs.key}');
		$('#word').val('${qs.word}');
		$('#hot').val('${qs.hot}');
		$('#commonForm').attr('action', root + '/freeboard/list.html').submit();
	});
	
	$('#searchBtn').click(function (){
/* 		alert("키" + $('#searchKey').val() + "                word" + $('#searchWord').val());
 */		
 		$('#bcode').val('${qs.bcode}');
		$('#pg').val('${qs.pg}');
		$('#key').val($('#searchKey').val());
		$('#word').val($('#searchWord').val());
		$('#commonForm').attr('action', root + '/freeboard/list.html').submit();	
	});
	
	$('#searchWord').keypress(function (e) {
		var keypress = e.which;
		//alert(keypress);
		if (keypress === 13) {
/* 	 		alert('${qs.pg}' + "    " + "${qs.bcode}");
 */			$('#bcode').val('${qs.bcode}');
			$('#pg').val('${qs.pg}');
			$('#key').val($('#searchKey').val());
			$('#word').val($('#searchWord').val());
			$('#commonForm').attr('action', root + '/freeboard/list.html').submit();			
		}
	});
	
	$('.hotBoard').click(function () {
		$('#bcode').val('1');
		$('#pg').val('1');
		$('#key').val('');
		$('#word').val('');
		$('#hot').val('hot');
		$('#commonForm').attr('action', root + '/freeboard/list.html').submit();	
	});
	
	//hot에 글 보기
	$(document).on('click', '.wow', function () {
	 	$('#bcode').val('1');
		$('#pg').val('${qs.pg}');
		$('#key').val('${qs.key}');
		$('#word').val('${qs.word}');
		$('#seq').val($(this).attr('data-seq'));
 		$('#commonForm').attr('action', root + '/freeboard/view.html').submit();
	});
	
	//메인으로
	$('.mvmain').click(function () {
		$(location).attr("href", root + "/admin/main.html");
	});
	
	//검색
	$('#main_keyword').keypress(function (e) {
		var keypress = e.which;
	    var keyword = document.getElementById('main_keyword').value;
	    
		if(keypress === 13) {
		    if (!keyword.replace(/^\s+|\s+$/g, '')) {
		        alert('키워드를 입력해주세요!');
		        return false;
		    } else {
				$('#main_nav_searchForm').attr("action", root + "/map/search.html").submit();			    	
		    }
		}
	});
	
	$('#main_searchBtn').click(function () {
	    var keyword = document.getElementById('main_keyword').value;

	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    } else {
			$('#main_nav_searchForm').attr("action", root + "/map/search.html").submit();			    	
	    } 
	});
	
});
</script>
<style type="text/css">
div{
/* 	border: 1px solid red;
 */}
</style>
</head>
<body>
<%@ include file="/common/commonform.jsp"%>
<%@ include file="/common/writemodal.jsp"%>
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
  
<!--freeboard header -->
			<header class="container">
				<h1><strong>자유게시판</strong></h1>
			</header>
<!--freeboard content-->
			<div class="content">
				<section class="col-md-9">
					<article class="">
						<div class="board">
<!-- top ad page -->						
							<div class="container-fluid" style="margin-top: 1%; margin-bottom: 2%;">
								<div class="row" style="text-align: center;">
									<div class="hotchoice col-md-2">
										<div class="">
											<button class="btn btn-default recent" type="button">기본</button>
										</div>
										<div class="">
											<button class="btn btn-default hotBoard" type="button">HOT</button>
										</div>
										<div class="">
											<button class="btn btn-default mvmain" type="button">메인</button>
										</div>
									</div>
									<div class="col-md-10" style="border:2px solid black;">
										<div style="font-size: 5.1em;">
											광고입니다.!!!
										</div>
									</div>
								</div>
							</div>

<!-- board list -->
							<div class="boardlist">
								<form name="listForm" method="post" style="margin: 0px">
									<table class="table" style="table-layout: fixed;">
	
<!-- board list head -->
										<thead class="">
											<tr>
												<th class="centercolumn" width="11%">#</th>
												<th nowrap class="board_bar">|</th>
												<th></th>								
												<th class="subject" width="54%">&nbsp;&nbsp;&nbsp;제목</th>
												<th nowrap class="board_bar">|</th>												
												<th class="centercolumn" width="11%">글쓴이</th>
												<th nowrap class="board_bar">|</th>												
												<th class="centercolumn" width="10%">날짜</th>
												<th nowrap class="board_bar">|</th>								
												<th class="centercolumn" width="7%">조회</th>
												<th nowrap class="board_bar">|</th>
												<th class="centercolumn" width="8%">추천</th>
											</tr>
											<tr>
												<th class="bg_board_title_02" height="1" colspan="12" style="overflow: hidden; padding: 0px"></th>
											</tr>
										</thead>
	
<!-- board body -->
										<tbody>
<c:forEach var="article" items="${articleList}">
											<tr>
												<td class="centercolumn">${article.seq}</td>
												<td></td>
												<td nowrap class="onetext" style="padding-right: 5px"></td>												
												<td class="subject" style="word-break: break-all; overflow:hidden; text-overflow:ellipsis">
<!-- 들여쓰기 부분 	-->
										<c:if test="${article.lev != 0}">
											<c:forEach begin="1" end="${article.lev}">
												&nbsp;
											</c:forEach>
												<img src="${root}/img/indent.JPG" width="17" height="17" >
										</c:if>
													<a class="memo-article view" href="#" data-seq="${article.seq}">													
														<nobr>${article.subject}&nbsp;&nbsp;</nobr>
													</a>
												</td>
												<td></td>												
												<th class="centercolumn" style="word-break: break-all;">${article.id}</th>	
														<td></td>
																															
												<td align="center" class="centercolumn">${article.logtime}</td>
														<td></td>
												
												<td align="center" class="centercolumn">${article.hit}</td>
														<td></td>												
												<td align="center" class="centercolumn">
													<span class="glyphicon glyphicon-thumbs-up" style="color: red;"></span>
													<span id="up-count">${article.up}</span>
												</td>
											</tr>
											<tr>
												<td bgcolor="#ededed" height="1" colspan="12" style="overflow: hidden; padding: 0px"></td>
											</tr>											
</c:forEach>

<!-- if there is no article searched -->
<c:if test="${articleList.size() == 0}">
											<tr>
												<td  align="center" class="text_gray" colspan="11">
												<br/>
													게시글이 없습니다.
												<br/>
												</td>
											</tr>
											<tr>
												<td bgcolor="#ededed" height="1" colspan="12"
													style="overflow: hidden; padding: 0px"></td>
											</tr>
</c:if>
										</tbody>
									</table>
								</form>
<!-- paging navigation -->
								<div class="container-fluid">
									<div class="row" style="text-align: center;">
										<div class="col-md-12">
											<ul class="pagination">
												${pageNation.navigator}
												<li>
													<a>
														${pageNation.pageNo}/${pageNation.totalPageCount}
													</a>
												</li>
											</ul>
										</div>
									</div>
								</div>				
							</div>
						</div>
					</article>
<!-- search -->
					<div class="">
						<form name="searchForm" method="get" action="" onsubmit="return false">
							<input type="hidden" value=""/>
														
							<div class="search-container" id="bs-example-navbar-collapse-1">
								<div class="search-wrapper">
									<div class="inner">
										<select id="searchKey" name="searchKey" class="form-control">
											<option value='id'>아이디</option>
											<option value='seq'>글번호</option>											
											<option value='subject' selected>제목</option>
											<option value='content'>내용</option>
											<option value='subject||content'>제목+내용</option>
										</select>
									</div>
									<div class="inner word">
										<input class="form-control find" type="text" id="searchWord" name="searchWord"/>
									</div>
									<div class="inner">
										<button type="button" class="btn btn-info find" id="searchBtn">
											<span class="glyphicon glyphicon-search"></span> Search
										</button>
									</div>
								</div>
							</div>
						</form>
<!-- write button for modal-->

						<c:if test="${loginInfo != null}">
							<div class="writebtn-containter">
								<div class="writebtn-wrapper">
									<button data-backdrop="static" id="writebtn-modal" type="button" class="btn btn-info" data-toggle="modal" data-target="#writemodal">글쓰기</button>
								</div>
							</div>
						</c:if>
					</div>
				</section>
								
<!-- aside hot content-->
				<div class="col-md-3 col-sm-4 col-xs-12" style="position: relative;">
					<aside class="col-md-12">
						<div class="ads">
							<div style="overflow:hidden;">
								<div style="*zoom:1;padding:0px 0px 0px 0px !important; padding:none !important;">
									<div class="mydocWrap" id="mydocDocuments">
							   			<div class="w-header">
							        		<div class="w-title">
							    				<h4><a href="">내 글 반응</a></h4>
							    			</div>
								       		<div class="w-barWrap">
								           		<div class="w-bar">
								           		</div>
								        	</div>
							    		</div>
										<div class="non_action" style="display:block;">
							        		새 반응이 없습니다
							    		</div>    
									</div>
								</div>
							</div>
							<div style="overflow:hidden;">
								<div style="*zoom:1;padding:0px 0px 0px 0px !important; padding:none !important;">
									<div class="mydocWrap" id="mydocComments">
						    			<div class="w-header">
						       				<div class="w-title">
						    					<h4><a href="">내 댓글 반응</a></h4>
						    				</div>
						        			<div class="w-barWrap">
						            			<div class="w-bar"></div>
						        			</div>
						    			</div>
						            	<div class="non_action" style="display:block;">
						        			새 반응이 없습니다
						    			</div>   
						    		</div>
								</div>
							</div>
					
						</div>
					</aside>
				</div>
				<div class="col-md-3 col-sm-4 col-xs-12">
					<aside class="col-md-12">
						<div style="overflow:hidden;">
							<div style="*zoom:1; padding:0px 0px 0px 0px !important; padding:none !important;">
								<div class="newslatestWrap">
							    	<div class="w-header">
							        	<div class="w-title">
							    			<h4><a href="#" class="hotBoard">HOT</a></h4>
							    		</div>
							        	<div class="w-barWrap">
							            	<div class="w-bar">
							            	</div>
							        	</div>
							    	</div>
							    	<ul id ="hotlist">
	
									</ul>
								</div>
							</div>
						</div>					
					</aside>
				</div>
			</div>

</body>
</html>
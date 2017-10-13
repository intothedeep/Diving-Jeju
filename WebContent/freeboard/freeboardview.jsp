<%@page import="com.free.board.all.model.ReboardDto"%>
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
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.js"></script>	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.min.js"></script>
	
	<script src="${root}/summernote.js"></script>
	<script src="${root}/summernote.min.js"></script>	
	<link rel="stylesheet" href="${root}/summernote.css">
	
	<link rel="stylesheet" href="${root}/css/freeboard/freeboard.css">
	<script src="${root}/js/freeboard/hotlist.js"></script>
	<script src="${root}/js/freeboard/plusUpDown.js"></script>	
	
	<title>자유게시판</title>
	<style>
		.article_subject {
			border-bottom: 1px solid rgb(240, 240, 240);
		}
	</style>
	<script>
	$(document).ready(function() {
		$('.newListArticle').click(function() {
			$('#bcode').val('${qs.bcode}');
			$('#pg').val('1');
			$('#commonForm').attr('action', '${root}/reboard/list.html').submit();
		});
		
		$('.list').click(function() {
			$('#bcode').val('${qs.bcode}');
			$('#pg').val($(this).attr('data-page'));
			$('#key').val('${qs.key}');
			$('#word').val('${qs.word}');
			$('#hot').val('${qs.hot}');
			$('#commonForm').attr('action', root + '/freeboard/list.html').submit();
		});
		
		$('.recent').click(function() {
			$('#bcode').val('${qs.bcode}');
			$('#pg').val('1');
			$('#commonForm').attr('action', root+'/freeboard/list.html').submit();
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
		
		//수정하기
		$('#view-modifyBtn').click(function (){
			var content = '${article.content}';
			$('#modifySummernote').summernote('code', content);

			$("#modifyModal").modal({
				backdrop : "static"
			});
			
			$('#modifyModal').modal("show");
		});
		$('#modal-modifyBtn').click(function () {
			var content = $('#modifySummernote').summernote('code');
			$('#modifyContent').val(content);
	 		$('#modifyForm').attr("method", "POST").attr('action', root + '/freeboard/modify.html').submit();
		});
		
		//답글 작성하기
		$('#view-replyBtn').click(function () {
			$('#replySummernote').summernote('code', '');

			$("#replyModal").modal({
				backdrop : "static"
			});
			
			$('#replyModal').modal("show");
		});
 		$('#modal-replyBtn').click(function () {
			var content = $('#replySummernote').summernote('code');
			$('#replyContent').val(content);
	 		$('#replyForm').attr("method", "POST").attr('action', root + '/freeboard/reply.html').submit();

		});
		
 		//삭제하기
 		$('#deleteBtn').click(function () {
 			var seq = $(this).attr('data-seq');
 			var reply = $(this).attr('data-reply');
 			var queryString = 
 				'?bcode=${article.bcode}&pg=${qs.pg}&key=${qs.key}&word=${qs.word}&hot=${qs.hot}&seq=' + seq + "&reply=" + reply;
 			$(location).attr('href', root + '/freeboard/delete.html' + queryString);
 		});

		//메인으로
		$('.mvmain').click(function () {
			$(location).attr("href", root + "/admin/main.html");
			
		});
		
		
		
		//메모 글쓰기
		$('#memo_writeBtn').click(function () {
			var content = $.trim($('#memo_write_content').val());
			if(content != '') {
				$.ajax({
					type : 'POST',
					dataType : 'json',
					url : root + '/memo/write.html',
					data : {'seq' : '${article.seq}', 'mcontent' : content},
					success : function(data) {
						$('#memo_write_content').val('');
						makeMemoList(data);
					}
				});
			} else {
				alert('내용을 입력해 주세요!');
			}		
		});
		
		//메모 리스트 뿌리기 페이지 로딩 된 후에
 		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : root + '/memo/list',
			data : {'seq' : '${article.seq}'},
			success : function(data) {
				createMemoList(data);
			}
		});
		
		//메모 수정
		
		//메모 삭제
		$(document).on('click', '.memo_deleteBtn', function() {
			var mseq = $(this).attr('data-mseq');
			$.ajax({
				type : 'GET',
				dataType : 'json',
				url : root + '/memo/delete.html',
				data : {'mseq' : mseq, 'seq' : '${article.seq}'},
				success : function(data) {
					makeMemoList(data);
				}
			});
		});		
		//메모 새로고침
		$('#memo_refresh').click(function () {
	 		$.ajax({
				type : 'GET',
				dataType : 'json',
				url : root + '/memo/list',
				data : {'seq' : '${article.seq}'},
				success : function(data) {
					createMemoList(data);
				}
			});	
		});
		//메모 좋아요 올리기
		$(document).on('click', '.memo_plusUp', function() {
			var mseq = $(this).attr('data-mseq');
			$.ajax({
				type : 'GET',
				dataType : 'json',
				url : root + '/memo/plusup.html',
				data : {'mseq' : mseq, 'seq' : '${article.seq}'},
				success : function(data) {
					makeMemoList(data);
				}
			});
		});
	});
	
	//자바스크립트를 이용한 메모 추가
	//JSONObject를 쓸 때!!! jaxson이랑 같이 쓰면 인코딩이 이상해져서 jsonobject쓸 때는 인코딩을 따로 해줘야 함!
	function makeMemoList(data) {
		var output = '';
		var $memoBody = $('#memo_body');

//		정규식을 이용한 +를 공백으로 바꾸는 법
//		var Ca = /\+/g;
//		decodeURIComponent(con.replace(Ca, " ") );
		
		var len = data.memolist.length;
		for(var i=0;i<len;i++) {
			output += '		<div class="memo_content container" style="margin-top: 10px;">';
			output += '			<p>' + decodeURIComponent(data.memolist[i].mcontent) + '</p>';					
			output += '		</div>';
			output += '		<div class="memo_items" style="text-align: right; border-bottom: 2px solid rgb(240, 240, 240);">';
			output += '			<span class="glyphicon glyphicon-thumbs-up" style="font-weight: bold; color: red;"></span>';
			output += '			<a href="#" onclick="return false;" class="memo_plusUp" data-mseq="' + data.memolist[i].mseq + '"><span>좋아요</span></a>';
			output += '			<span>' + data.memolist[i].mup + '</span>';
			output += '			<span style="font-weight: bold;"> | </span>';
			output += '			<span>' + data.memolist[i].id + '</span>';
			output += '			<span style="font-weight: bold;"> | </span>';												
			output += '			<span>' + decodeURIComponent(data.memolist[i].mtime) + '</span>';
			if('${loginInfo.id}' == data.memolist[i].id) {
				output += '			<span style="font-weight: bold;"> | </span>';
				output += '			<a href="#" onclick="return false;" class="memo_view_modifyMemoBtn" data-mseq="' + data.memolist[i].mseq + '"><span> 수정 </span></a>';
				output += '			<span style="font-weight: bold;"> | </span>';
				output += '			<a href="#" onclick="return false;" class="memo_deleteBtn" data-mseq="' + data.memolist[i].mseq + '"><span> 삭제 </span></a>';
			}
			output += '		</div>';
		}
		$memoBody.empty();
		$memoBody.append(output);
	}
	
	//머스타쉬를 이용한 메모 추가
	//jackson을 쓸 때!!!
	function createMemoList(data) {
		//var obj = JSON.stringify(data);
		var $memoBody = $('#memo_body');
		var memo_template = $('#memo_template').html();

		var memo_template_ex = $('#memo_template_ex').html();
		var memolist = data.memolist;
		
		$memoBody.empty();
		$.each(data, function(i, memo) {
			if('${loginInfo.id}' == memo.id) {
				$memoBody.append(Mustache.render(memo_template_ex, memo));			
			}
			$memoBody.append(Mustache.render(memo_template, memo));			
		});
	}

	</script>

</head>
<body>
<%@ include file="/common/commonform.jsp"%>
<%@ include file="/common/modifymodal.jsp"%>
<%@ include file="/common/replymodal.jsp"%>

<!-- machtache 
	스크립트를 그냥 템플레이트로 만드려면 이렇게 하면 된다.
<script type="text/template" id="memo_templat">
</script>

-->
<template id="memo_template">
			<div class="memo_content container" style="margin-top: 10px; clear:both;">
				<p>{{{mcontent}}}</p>					
			</div>
			<div class="memo_items" style="text-align: right; border-bottom: 2px solid rgb(240, 240, 240);">
				<span class="glyphicon glyphicon-thumbs-up" style="font-weight: bold; color: red;"></span>
				<a href="#" onclick="return false;" class="memo_plusUp" data-mseq="{{mseq}}"><span>좋아요</span></a>
				<span>{{mup}}</span>
				<span style="font-weight: bold;"> | </span>
				<span>{{id}}</span>
				<span style="font-weight: bold;"> | </span>												
				<span>{{mtime}}</span>
			</div>
</template>

<template id="memo_template_ex">
			<div class="" style="text-align: right; margin-top: 10px;">
<!--  					<span style="font-weight: bold;" class="checkid" data-mid="{{id}}"> | </span>
 --> 					<a href="#" onclick="return false;" data-mid="{{id}}" class="memo_view_modifyMemoBtn checkid" data-mseq="{{mseq}}"><span> 수정 </span></a>
					<span style="font-weight: bold;" data-mid="{{id}}" class="checkid"> | </span>
					<a href="#" onclick="return false;" data-mid="{{id}}" class="memo_deleteBtn checkid" data-mseq="{{mseq}}"><span> 삭제 </span></a>
			</div>
</template>
<!--freeboard header -->
			<header>
				<h1>자유게시판</h1>
			</header>
<!--freeboard content-->
			<div class="content">
				<section class="col-md-9 col-sm-8 col-xs-12">
<!-- top ad page -->						
					<div class="container-fluid" style="text-align: center;">
						<div class="col-md-2 col-sm-2 col-xs-2">
							<button class="btn btn-default recent" type="button">기본</button>
							<button class="btn btn-default hotBoard" type="button">HOT</button>
							<button class="btn btn-default mvmain" type="button">메인</button>
						</div>
						<div class="col-md-10 col-sm-10 col-xs-10" style="border:2px solid rgb(240, 240, 240);">
								광고입니다.!!!
						</div>
					</div>
							
					<div class="container-fluid article_subject" style="margin-bottom: 7px;">
						<h3>
							${article.subject}
						</h3>
					</div>
					
					<div class="col-sm-4 col-xs-12">
						<strong>${article.id}</strong>
					</div>
					
					<div class="col-sm-8 col-xs-12" style="margin: auto; text-align: right; ">
						<strong>Hit :&nbsp;${article.hit} | </strong>
					
						<strong>
						<span>추천: </span>
						<a href="#" class="plusUp" data-seq="${article.seq}">
							<span class="glyphicon glyphicon-thumbs-up" style="color: red;"></span>
						</a> 
						<span id="view-up">
							${article.up}
						</span>
						/
						<a href="#" class="plusDown" data-seq="${article.seq}">
							<span class="glyphicon glyphicon-thumbs-down"  style="color: blue;"></span> 
						</a>
						<span id="view-down">
							${article.down}
						</span>
						</strong>
					</div>
					
					<div class="container-fluid" style=" text-align: right; border-bottom: 2px solid rgb(240, 240, 240);">
						${article.logtime}
					</div>								
					
					<div class="col-sm-10 col-sm-offset-1 form-group" style=" padding: 5px;">
							${article.content}
					</div>
							
						
					<div class="container-fluid col-sm-12" style="text-align: center; margin-top: 20px; margin-bottom:20px; border-bottom: 1px solid rgb(240, 240, 240); padding: 20px;">
						<a type="button" class="btn btn-xs btn-default plusUp" data-seq="${article.seq}">
							<strong>
								<span class="glyphicon glyphicon-thumbs-up" style="color: red;"></span>
								추천
							</strong>
						</a> 
						<a	type="button" class="btn btn-xs btn-default plusDown" data-seq="${article.seq}">
							<strong>
								<span class="glyphicon glyphicon-thumbs-down"  style="color: blue;"></span>
								 반대
							 </strong>
						</a>
					</div>
					
<!-- modify -->
<c:if test="${loginInfo !=null }">
	<c:if test="${loginInfo.id == article.id}">
					<div class="container-fluid col-sm-12" style="text-align: right; margin-bottom: 5px;">
						<button id="view-modifyBtn" data-seq="${article.seq}" type="button" class="btn btn-xs btn-default find"><span class="glyphicon glyphicon-share-alt"></span> 수정
						</button>
						<button id="deleteBtn" data-seq="${article.seq}" data-reply="${article.reply}" 
								data-backdrop="static" type="button" class="btn btn-xs btn-default find" ><span class="glyphicon glyphicon-remove-circle"></span> 삭제
						</button>														
					</div>	
	</c:if>
	<c:if test="${loginInfo.id != article.id }">
					<div class="container-fluid col-sm-12" style="text-align: right; margin-top: 10px; margin-bottom: 10px;">
						<button id="view-replyBtn" data-seq="${article.seq}"
								type="button" class="btn btn-xs btn-default find" ><span class="glyphicon glyphicon-pencil"></span> 답글
						</button>							
					</div>							
	</c:if>
</c:if>
	

<!-- back to list button-->
					<div class="container-fluid col-sm-12" style="text-align: right; margin-bottom: 5px;">
						<button type="button" class="btn btn-xs btn-info list" data-page="${qs.pg}">목록</button>
					</div>
						
						
<!-- memo! -->


<!-- memo write btn -->			
<c:if test="${loginInfo != null }">
					<div class="container-fluid col-sm-12" id="memo_write_body" style="margin-bottom: 5px;">
						<textarea style="width: 100%; height: 75px;" id="memo_write_content" name="mcontent"></textarea>
					</div>
					<div class="container-fluid col-sm-12" style="text-align:right; margin-bottom: 5px;">
						<Button id="memo_writeBtn" data-seq="${article.seq}" class="regBtn btn btn-xs btn-default" type="button" value="" >
							<span class="glyphicon glyphicon-ok"></span> 댓글
						</Button>
					</div>
</c:if>
				
					<div class="container col-sm-12" style="margin-bottom: 10px; border-bottom: 2px solid rgb(240, 240, 240);">
						<strong>댓글</strong>
					</div>
					
					<div class="container-fluid col-sm-12" id="memo_body" style="">
						<div class="memo_content container">
							<p> 메모를 작성했습니다.</p>					
						</div>
						<div class="memo_items" style="text-align: right; border-bottom: 2px solid rgb(240, 240, 240); padding: 10px;">
							<span class="glyphicon glyphicon-thumbs-up" style="font-weight: bold; color: red;"></span> 
							<span data-mseq="">좋아요</span>
							<span> 0 </span>
							<span style="font-weight: bold;"> | </span>
							<span> id </span>
							<span style="font-weight: bold;"> | </span>												
							<span> 2017.08.08 </span>
							<span style="font-weight: bold;" data-mseq=""> | </span>
							<span> 수정 </span>
							<span style="font-weight: bold;" data-mseq=""> | </span>
							<span> 삭제 </span>							
						</div>
					</div>					
					
					<div class="container-fluid col-sm-12" style="text-align: right; margin-bottom: 5px; margin-top: 10px;">
						<a id="memo_refresh" class="btn btn-xs btn-default">
							<span class="glyphicon glyphicon-refresh"></span> 댓글 새로고침
						</a>
					</div>
	
<!-- back to list button-->
					<div class="container-fluid col-sm-12" style="text-align: right; margin-top: 10px; margin-bottom: 20px;">
						<button type="button" class="btn btn-xs btn-info list" data-page="${qs.pg}">목록</button>
					</div>
				</section>		
				
				
						
<!-- aside hot content-->
				<div class="col-md-3 col-sm-4 col-xs-12">
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
							<div style="*zoom:1;padding:0px 0px 0px 0px !important; padding:none !important;">
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

<!-- 메모 쓸 때 필요한 벨류 -->
	<input type="hidden" id="memoseq" value="${article.seq}"/> 
	<input type="hidden" id="memoid" value="${loginInfo.id}"/>

</body>
</html>

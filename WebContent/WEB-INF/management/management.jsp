<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String root = request.getContextPath();
%>
    
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
	
	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.min.js"></script>
	
	<link rel="stylesheet" href="${root}/css/join/join.css">
	
	<title>관리</title>

<style>
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
</head>
<body>
	<%@ include file="/WEB-INF/management/managementnav.jsp"%>
	<template id="list_template">
		<tr>
		  
		  <td>{{originalFileAseq}}</td>
		  
		  <td>
		  	<button type="button" class="btn btn-success download" data-fileSeq="{{originalFileAseq}}"> 다운</button>
		  	<button type="button" class="btn btn-warning modify" data-fileSeq="{{originalFileAseq}}"> 수정</button>
		  	<button type="button" class="btn btn-danger delete" data-fileSeq="{{originalFileAseq}}"> 삭제</button>
		  </td>
		  
		  <td>
		  	{{originalFileName}}
		  </td>
		  
		  <td>
		  	<img src="<%=root%>/upload/{{storedFileName}}" alt="" width="300px;">		  
		  </td>
		  
		  <td>
		  	<img src="<%=root%>/upload/thumb/{{thumbStoredFileName}}">
		  </td>
		  
		  <td>{{email}}</td>
		  
		</tr>		
	</template>
	
	
	
	<div class="container" style="margin-top: 100px;">
		<div>
			로그인 이메일 : ${loginInfo.email}
		</div>
		<form id="fileForm" method="post" enctype="multipart/form-data" action="">
			<input id="modify_fileSeq" type="hidden" name="fileSeq" value="">
			<input type="hidden" name="content" id="content" value="">
			<div id="summernote"></div>
			
			<div class="image-upload">
			    <label for="file_input">
			       <a><span class="glyphicon glyphicon-camera"></span>
			       	 사진등록
			       </a>
			    </label>
				<label id="showFileName"></label>
				<input id="file_input" class="btn btn-default form-control" type="file" name="file">
			</div>
		</form>
		
		<div style="margin-top: 10px;">
			<button id="uploadBtn" class="btn btn-info"> 업로드</button>
			<button id="downloadBtn" class="btn btn-alert"> 다운로드 </button>		
		</div>
		
	</div>
	
	<div class="container" style="margin-top: 30px; border-top: 3px solid gray;">
	  <table class="table">
	    <thead>
	      <tr>
	        <th> | #</th>
	        <th> | 액션</th>
	        <th> | 파일명</th>
	        <th> | 이미지</th>
	        <th> | 썸네일</th>
	        <th> | email</th>
	      </tr>
	    </thead>
	    <tbody id="listBody">
	
	    </tbody>
	  </table>
	</div>
	
<script>
	
$(document).ready(function () {
	//수정
	$(document).on("click", '.modify', function (e) {
		e.preventDefault();
		var fileSeq = $(this).attr('data-fileSeq');
		$('#modify_fileSeq').val(fileSeq);
		$('#file_input').click();
 		inputFile.change(function(e) {
 			modifyFile();
		});
		
	});
	
	//새 파일 업로드시 호출하는 함수!
	function modifyFile () {
		if (inputFile.val() == 0) {
			alert("파일을 먼저 선택해 주세요!");
			return false;
		}
		var uploadFileNamePath = inputFile.val() + " ";
		var uploadFileName = uploadFileNamePath.slice(uploadFileNamePath.lastIndexOf('\\')+1);
		
	    var uploadConfirm = confirm(uploadFileName + "을 수정 하시겠습니까?");
	    
	    if (uploadConfirm == true) {
			$('#fileForm').attr("action", "${root}/album/modify.html").submit();
	    } 
	    else {
	    	inputFile.val('');
	        alert("수정을 취소했습니다.");
	        return false;
	    }
	}
	
	//삭제
	$(document).on("click", '.delete', function (e) {
		e.preventDefault();
		var fileSeq = $(this).attr("data-fileSeq");
		var seqObj = {"fileSeq": fileSeq};
	    $.ajax({
	    	type:"get",
	    	dataType: "json",
	    	url: "${root}/album/deleteupdatetoone",
	    	data: seqObj,
			contentType : 'application/json',
			mimeType : 'application/json',
	    	success: function (data) {
	    		callFileList(data);
	    	}
	    });
		
	});
	
	//새 파일 업로드
	var inputFile = $('#file_input');
    
	//파일을 선택했을 때 나오는 함수
	inputFile.change(function(e) {
		var uploadFileNamePath = inputFile.val();
		var uploadFileName = uploadFileNamePath.slice(uploadFileNamePath.lastIndexOf('\\')+1);
		//uploadFile();
	    $.ajax({
	    	type:"get",
	    	dataType: "json",
	    	url: "${root}/album/returnfilename",
	    	data: {"fileName": uploadFileName},
	    	success: function (data) {
	    		$('#showFileName').text(" | " + data.fileName);
	    	}
	    });
	});
	
	//업로드 버튼을 눌렀을 때 나오는 함수
	$('#uploadBtn').click(function () {
		uploadFile();
	});

	//새 파일 업로드시 호출하는 함수!
	function uploadFile () {
		if (inputFile.val() == 0) {
			alert("파일을 먼저 선택해 주세요!");
			return false;
		}
		var uploadFileNamePath = inputFile.val() + " ";
		var uploadFileName = uploadFileNamePath.slice(uploadFileNamePath.lastIndexOf('\\')+1);
		
	    var uploadConfirm = confirm(uploadFileName + "을 업로드 하시겠습니까?");
	    
	    if (uploadConfirm == true) {
			$('#fileForm').attr("action", "${root}/album/upload.html").submit();
	    } 
	    else {
	    	inputFile.val('');
	        alert("업로드를 취소했습니다.");
	        return false;
	    }
	}
	
	$('#summernote').summernote({
		  height: 300,                 // set editor height
		  minHeight: null,             // set minimum height of editor
		  maxHeight: null,             // set maximum height of editor
		  focus: true                  // set focus to editable area after initializing summernote
	});
	var summernoteContent = $('#summernote').summernote('code');
	
	var bcodeObj = {bcode:4};
	$.ajax({
		type: "get",
		dataType: "json",
		url: "${root}/album/list",
		data: bcodeObj,
		contentType : 'application/json;charset=utf-8',
		mimeType : 'application/json',
		success: function (data) {
			fileList(data);
		}
	});
	

	
	//download 기능 구현
	$(document).on("click", ".download", function () {
		var seq = $(this).attr("data-fileseq");
/* 		alert(seq);
		var fileseq = {fileSeq:seq};
		$.ajax({
			type: "get",
			dataType: "json",
			url: "${root}/file/download",
			data: fileseq,
			contentType : 'application/json;charset=utf-8',
			mimeType : 'application/json',
			success: function () {
				alert("성공");
			},
			error: function () {
				alert("실패야!");
			}
		}); */
		$(location).attr("href", "${root}/album/download.html?fileSeq=" + seq);
	});
});

//list를 부르는 함수
function callFileList (data) {
	$.ajax({
		type: "get",
		dataType: "json",
		url: "${root}/album/list",
		data: data,
		contentType : 'application/json;charset=utf-8',
		mimeType : 'application/json',
		success: function (data) {
			fileList(data);
		}
	});
}

//리스트 바디에 템블릿 붙이는 법
var listBody = $('#listBody');
function fileList(lists) {
	var template = $('#list_template').html();
	listBody.empty();
	$.each(lists, function(i, fileInfo) {
		listBody.append(Mustache.render(template, fileInfo));
	});
}
</script>
</body>
</html>
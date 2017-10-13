<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="root" value="${pageContext.request.contextPath}"/> 

<!-- modify modal -->
			<div class="modal fade" id="modifyModal" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
<!-- modify modal header -->
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">글수정</h4>
						</div>
<!-- modify modal body -->
						<div class="modal-body">
							<form name="modifyForm" id="modifyForm" method="post" action="">
								<input type="hidden" name="bcode" value="${qs.bcode}">
								<input type="hidden" name="pg" value="${qs.pg}"/>
								<input type="hidden" name="key" value="${qs.key}"/>
								<input type="hidden" name="word" value="${qs.word}"/>
								<input type="hidden" name="hot" value="${qs.hot}"/>
								<input type="hidden" name="seq" value="${article.seq}"/>	
								<input type="hidden" id="modifyContent" name="content" value=""/>
								<input type="hidden" id="pseq" name="pseq" value="${article.seq}"/>	
								
								<div class="form-group">
									<label for="usr">제목</label>
									<input type="text" class="form-control" name="subject" value="${article.subject}"/>
								</div>						
								<label for="usr">내용</label>
								<div id="modifySummernote"></div>
							</form>
							
<!-- modify modal footer -->
							<div class="modal-footer">
								<button data-seq="${article.seq}"
									type="button" class="btn btn-default" id="modal-modifyBtn" value="">수정</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
	<script src="${root}/summernote.js"></script>
	<script src="${root}/summernote.min.js"></script>	
	<link rel="stylesheet" href="${root}/summernote.css">
	
	<script src="${root}/js/common/modalsummernote.js"></script>
		
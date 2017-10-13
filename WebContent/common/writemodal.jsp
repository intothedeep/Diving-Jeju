<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="root" value="${pageContext.request.contextPath}"/>  

<!-- write modal -->
			<div class="modal fade" id="writemodal" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
<!-- write modal header -->
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">글쓰기</h4>
						</div>
<!-- write modal body -->
						<div class="modal-body">
							<form name="writeForm" id="writeForm" method="post" action="">
								<input type="hidden" id="bcode" name="bcode" value="1"/>
								<input type="hidden" id="pg" name="pg" value="1"/>
								<input type="hidden" id="key" name="key" value=""/>
								<input type="hidden" id="word" name="word" value=""/>
								<input type="hidden" id="hot" name="hot">	
								<input type="hidden" id="content" name="content" value=""/>
								
								<div class="form-group" style="vertical-align: bottom;">
									<label for="usr">제목</label>
									<input type="text" class="form-control" id="subject" name="subject" value=""/>
								</div>
								<label for="usr">내용</label>
								<div id="summernote">내용을 작성하세요!</div>
							</form>
<!-- write modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-default" id="writeBtn" name="writeBtn">Write</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>

	<script src="${root}/summernote.js"></script>
	<script src="${root}/summernote.min.js"></script>	
	<link rel="stylesheet" href="${root}/summernote.css">
	
	<script src="${root}/js/common/modalsummernote.js"></script>
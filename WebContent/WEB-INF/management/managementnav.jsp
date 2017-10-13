<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="root" value="${pageContext.request.contextPath}"/>

<%@ include file="/common/root.jsp"%>
<style>
nav ul a:hover {
  text-decoration: none;
  font-weight: bold;
  font-size: 20px;
}
</style>
	<nav class="navbar navbar-default navbar-fixed-top">
      <div class="">

        <div class="navbar-header">
          <a class="navbar-brand" href="${root}/admin/main.html">Freediver</a>
          <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>

        <div class="navbar-collapse collapse" id="navbar-main">
        	<ul class="nav navbar-nav">
				<li>
				  <a href="#">활동정보</a>
				</li>
				<li>
                  <a href="#" class="bookinfo">예약내역</a>
				</li>
				<li>
				  <a href="${root}/member/memberinfo.html">회원정보수정</a>
				</li>
<c:if test="${loginInfo.memberType == 1 or loginInfo.memberType == 2}">
				<li><a href="#" class="stat">통계</a></li>
				<li><a href="${root}/admin/management.html" class="manage">관리</a></li>
</c:if>
				
			
        	</ul>
			<%@ include file="/common/loginnav.jsp"%>
        </div>
               

      </div>
    </nav>
    	<script src="${root}/js/common/loginnav.js"></script>
    
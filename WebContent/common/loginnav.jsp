<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="root" value="${pageContext.request.contextPath}"/>

<c:if test="${loginInfo == null}">
            <ul class="nav navbar-nav navbar-right rrr">
              <li>
              	<a href="#" data-toggle="modal" data-target="#login"  data-backdrop="static" title="로그인">LOGIN</a>
              </li>
            </ul>
</c:if>
<c:if test="${loginInfo !=null}">
            <ul class="nav navbar-nav navbar-right rrr">

              <li class="dropdown" style="display: ;">
                <a class="dropdown-toggle rrr" id="userinfo" aria-expanded="false" href="#" onclick="return false;" data-toggle="dropdown">${loginInfo.id}<span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="#" class="bookinfo">예약내역</a></li>
                  <li><a href="${root}/member/memberinfo.html" class="memberInfo">내 정보</a></li>

	<c:if test="${loginInfo.memberType == 1 or loginInfo.memberType == 2}">
                  <li class="divider"></li>
	              <li><a href="#" class="stat">통계</a></li>
	              <li><a href="${root}/admin/management.html" class="manage">관리</a></li>
	</c:if>

                  <li class="divider"></li>                  
                  <li><a href="${root}/member/logout.html">로그아웃</a></li>
                </ul>
              </li>
            </ul>
</c:if>

	<script src="${root}/js/common/loginnav.js"></script>

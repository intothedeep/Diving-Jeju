<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="root" value="${pageContext.request.contextPath}"/>  

        <!--login Modal -->
        <div class="modal fade" id="login" role="dialog">
          <div class="modal-dialog modal-sm">
            <div class="modal-content" style="border-radius: 0;">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">로그인</h4>
              </div>

              <div class="modal-body">
                <div class="container-fluid" style="text-align: center;">
                  <button class="btn btn-default loginId" type="button" name="button">
                  	<h3>Freedive</h3>
<%--                     <img src="${root}/img/freedive.jpg" alt="프리다이브 로그인">
 --%>             </button>
                </div>
                <div class="" style="border:1px solid lightblue;"></div>
                <div class="container-fluid" style="text-align: center;">
                  <button class="btn btn-default" id="kakao-login-btn" type="button" name="kakao" style="padding:0;"></button>
                </div>
                <a href="#" id="google_login">Google sign-in using Popup</a>
              </div>
              <div>
				<a href="http://developers.kakao.com/logout">카카오 로그아웃</a>
				<h6><a class="" href="${root}/member/register.html">회원 가입</a></h6>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
        
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="${root}/js/common/kakaologin.js" charset="utf-8"></script>
    
	<script src="https://www.gstatic.com/firebasejs/4.2.0/firebase.js"></script>
	<script src="https://www.gstatic.com/firebasejs/3.8.0/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/3.8.0/firebase-auth.js"></script>
	<script src="https://www.gstatic.com/firebasejs/3.8.0/firebase-database.js"></script>
	<script src="https://www.gstatic.com/firebasejs/3.8.0/firebase-messaging.js"></script>

	<script src="${root}/js/common/firebase.js"></script>
	
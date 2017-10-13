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
              
                <div class="container-fluid" style="text-align: center; margin-bottom: 7px;">
                  <button class="btn btn-warning" id="kakao-login-btn" type="button" 
                  style="padding: 0; width: 225px;">
					<h6>KakaoTalk Login</h6>
                  </button>
                </div>
                
                <div class="container-fluid" style="text-align: center; margin-bottom: 7px;">
                  <button class="btn btn-danger" id="google_login" type="button"
                  style="padding: 0; width: 225px;">
					<h6>Google Login</h6>
		           </button>
                </div>
                
                <div class="container-fluid" style="text-align: center; margin-bottom: 7px;">
                  <button class="btn btn-info loginId" type="button"
                  style="padding: 0; width: 225px;">
                  	<h6>Diving & Jeju Login</h6>
		           </button>
                </div>

				<div class="container-fluid"  style="text-align: center;">
                  <button class="btn btn-default" id="join" type="button"
                  style="padding: 0; width: 225px;">
					<h6>회원 가입</h6>
		           </button>
				</div>
				
              </div>
              
              
              <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
              </div>
              
            </div>
          </div>
        </div>
        
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="${root}/js/common/login.js" charset="utf-8"></script>
    
	<script src="https://www.gstatic.com/firebasejs/4.2.0/firebase.js"></script>
	<script src="https://www.gstatic.com/firebasejs/3.8.0/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/3.8.0/firebase-auth.js"></script>
	<script src="https://www.gstatic.com/firebasejs/3.8.0/firebase-database.js"></script>
	<script src="https://www.gstatic.com/firebasejs/3.8.0/firebase-messaging.js"></script>

	<script src="${root}/js/common/firebase.js"></script>
	
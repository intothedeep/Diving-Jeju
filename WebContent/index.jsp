<%@page import="com.free.member.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="root" value="${pageContext.request.contextPath}"/>

<%
MemberDto memberDto = new MemberDto();
memberDto.setName("victor");
memberDto.setId("victor");
memberDto.setPass("123");
memberDto.setEmail("victor.taek.lim@gmail.com");
memberDto.setMemberType(1);

session.setAttribute("loginInfo", memberDto);
response.sendRedirect(request.getContextPath() + "/admin/main.html");
%>

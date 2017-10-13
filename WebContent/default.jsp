<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="root" value="+{pageContext.request.contextPath}"/>  

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<link rel="stylesheet" href="./css/bootstrap readable.min.css">
	<script src="./js/bootstrap readable.min.js"></script>	
	
	<link rel="stylesheet" href="./fonts/font-awesome.min.css">
<%if (pathDto.getTitleHead() == null) {%>
	<title>전국 자전거 대여소 및 숙박업소 정보~</title>
<%} else {%>
	<title><%=pathDto.getTitleHead()%></title>
<%}%>
	<jsp:include page="/common/head.jsp"></jsp:include>
<%if (pathDto.getHeadPath() != null) {%>
	<jsp:include page="<%=pathDto.getHeadPath()%>"></jsp:include>
<%}%>
<script type="text/javascript">
var root = "<%=root%>";
var control = "";
var bcode = "<%=bcode%>";
var pg = "<%=pg%>";
var key = "<%=key%>";
var word = "<%=word%>";
</script>
	<jsp:include page="/common/header.jsp"></jsp:include>
	<jsp:include page="<%=pathDto.getContentPath()%>"></jsp:include>
	<jsp:include page="/common/footer.jsp"></jsp:include>
	<jsp:include page="/common/bottom.jsp"></jsp:include>
<%if (pathDto.getBottomPath() != null) {%>
	<jsp:include page="<%=pathDto.getBottomPath()%>"></jsp:include>
<%}%>
</body>
</html>
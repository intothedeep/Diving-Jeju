<%@ page language="java" contentType="text/plain; charset=euc-kr"
    pageEncoding="euc-kr"
    import="com.kitri.freeboard.model.FreeBoardDto"%>
<%
FreeBoardDto dto = (FreeBoardDto) request.getAttribute("article");
%>
Re: <%=dto.getSubject()%> ### ----- [����] ----- <br/><br/><%=dto.getContent()%>

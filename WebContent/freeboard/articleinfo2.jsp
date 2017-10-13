<?xml version="1.0" encoding="euc-kr"?>

<%@ page language="java" contentType="text/xml; charset=euc-kr"
    pageEncoding="euc-kr"
    import="com.kitri.freeboard.model.FreeBoardDto"%>

<!--
여기서 form을 만들고 가져가면
그만큼 큰 data를 넘겨주기 때문에 data양이 너무커서 돈 많이 나온다.
xml을 이용하면 편하다.
-->
<%
FreeBoardDto dto = (FreeBoardDto) request.getAttribute("article");
%>
<article>
	<info>
		<subject>
			<%=dto.getSubject()%>
		</subject>
		<content>
			<![CDATA[<%=dto.getContent()%>]]>
		</content>
	</info>
</article>
<?xml version="1.0" encoding="euc-kr"?>

<%@ page language="java" contentType="text/xml; charset=euc-kr"
    pageEncoding="euc-kr"
    import="com.kitri.freeboard.model.FreeBoardDto"%>

<!--
���⼭ form�� ����� ��������
�׸�ŭ ū data�� �Ѱ��ֱ� ������ data���� �ʹ�Ŀ�� �� ���� ���´�.
xml�� �̿��ϸ� ���ϴ�.
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
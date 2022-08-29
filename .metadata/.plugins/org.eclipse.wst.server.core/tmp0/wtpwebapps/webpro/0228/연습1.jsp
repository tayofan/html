<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		String mail = request.getParameter("mail");
		String content = request.getParameter("content");
		
		content = content.replaceAll("\r","")
				.replaceAll("\n","<br>");
		
	%>
	<p>이름 : <%= name %></p>
	<p>이메일: <%= mail %></p>
	<p>내용</p>
	<p><%= content %></p>
	
</body>
</html>
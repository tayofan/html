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
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String mail = request.getParameter("mail");
		String add = request.getParameter("add");
		String gender = request.getParameter("gender");
		
	%>
	<p>이름 : <%= name %></p>
	<p>이메일: <%= mail %></p>
	<p>주소 : <%= add %></p>
	<p>성별 : <%= gender%></p>
</body>
</html>
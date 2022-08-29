<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h1{
		color: red;
	}
	span{
		font-size: 2.0em;
		color: blue;
	}
</style>
</head>
<body>
	<h1>JSP : Java Server Page</h1>
	<p>html을 기본으로 하는 내용에
	자바코드를 기술할 수 있다</p>
	
	<p>서버내에서 실행되는 script프로그램</p>
	
	<p>Html태그안에 자바코드를 기술할때는
	&lt;% %> 기호 사이에 기술한다.</p>
	
	<%
		//클라이언트 전송시 입력한 id와 pass를
		//받는다 - request라는 내장객체를 이용한다. response
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		//모든처리가 끝난 후 응답데이터를 출력
		//out객체가 필요하다.
		//response.setCharacterEncoding("utf-8"); //아래처럼 쓰면 생략가능
// 		response.setContentType("text/html; charset=UTF-8");
// 		PrintWriter out = response.getWriter();

		out.print("아이디 " + id + "<br>");
		out.print("비밀번호 : " + pass + "<br><br>");
		
		out.print("<span>" + id + "님 환영합니다. </span>");
	
	%>
	
</body>
</html>
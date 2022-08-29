<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//서블릿에서 공유데이터
	String res = (String)request.getAttribute("res");
	//String id = (String)request.getAttribute("id");
	//if(res.equals(id))
	
	if(res != null){
%>
		{
			"flag" : "<%= res %>님 가입 성공!!!"
		}
<%	}else{ %>
		{
			"flag" : "가입 실패!!!"
		}		
<%	}  %>
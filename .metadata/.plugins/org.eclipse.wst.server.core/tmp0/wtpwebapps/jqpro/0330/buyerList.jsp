<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.ibatis.config.SqlMapClientFactory"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	List<BuyerVO> list = (List<BuyerVO>)request.getAttribute("listvalue");	

%>

[
	<% 
	for(int i = 0; i < list.size(); i++){
		BuyerVO vo = list.get(i);
		if(i > 0) out.print(",");
	%>
		{
			"id"   : "<%= vo.getBuyer_id() %>",	
			"name" : "<%= vo.getBuyer_name() %>"	
		}
	<%	
	}
	%>


]
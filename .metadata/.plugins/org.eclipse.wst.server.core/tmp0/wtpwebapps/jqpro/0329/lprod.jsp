<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.ibatis.config.SqlMapClientFactory"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//db를 통해서 crud처리
	//mapper-xml파일에 접근 - db수행
	//mapper-xml파일에 접근할 수 있는 객체가 필요 - SqlMapClient
	
	SqlMapClient client = SqlMapClientFactory.getSqlMapClient();
	
	//mapper실행
	List<LprodVO> list = client.queryForList("lprod.selectAll");	
	
	//결과를 가지고 응답데이터(text,json,xml)를 생성한다.
%>

[
	<%
	for(int i=0; i<list.size();i++){
		LprodVO vo = list.get(i);
		if(i > 0) out.print(",");
	%>
	{
		"id" : "<%= vo.getLprod_id() %>",
		"gu" : "<%= vo.getLprod_gu() %>",
		"nm" : "<%= vo.getLprod_nm() %>"
	}
	<%	
	}
	
	%>
]

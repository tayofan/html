<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@page import="kr.or.ddit.ibatis.config.SqlMapClientFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//db를 통해서 crud처리
// 	mapper-xml파일에 접근 - db수행
// 	mapper-xml파일에 접근할 수 있는 객체가 필요 - SqlMapClient

	SqlMapClient client = SqlMapClientFactory.getSqlMapClient();
 	
 	//mapper를 실행-결과를 얻는다 
	List<MemberVO> list = client.queryForList("member.selectAll"); 	
 	
	//처리후 집계를 얻는다.
	
	
	//결과를 가지고 응답데이터(text,json,xml)를 생성한다.
%>

[
	<%
	for(int i=0;i<list.size();i++){
		MemberVO vo = list.get(i);
		if(i > 0) out.print(",");
	%>	
	
	{
		"id"   : "<%= vo.getMem_id() %>",
		"name" : "<%= vo.getMem_name() %>",
		"addr" : "<%= vo.getMem_add1() %>",
		"hp"   : "<%= vo.getMem_hp() %>",
		"mail" : "<%= vo.getMem_mail() %>"
	}
	
	<%	
	}
	%>
]
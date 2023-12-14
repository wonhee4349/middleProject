<%@page import="com.google.gson.Gson"%>
<%@page import="vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	//서블릿에서 저장한 데이터 꺼내기 (NoticeDetail 서블릿)

	NoticeVO vo = (NoticeVO)request.getAttribute("RES");

	response.setContentType("application/json; charset=utf-8");
	
	Gson gson = new Gson();
	
	String result = gson.toJson(vo);
	
	out.print(result);
	out.flush();




%>
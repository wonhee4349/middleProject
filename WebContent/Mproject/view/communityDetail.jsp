<%@page import="vo.CommunityVO"%>
<%@page import="com.google.gson.Gson"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CommunityVO vo = (CommunityVO)request.getAttribute("cmtNo");
	
	response.setContentType("application/json; charset=utf-8");
	
	Gson gson = new Gson();
	
	String result = gson.toJson(vo);
	
	out.print(result);
	
	out.flush();
%>
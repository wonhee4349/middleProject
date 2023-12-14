<%@page import="vo.MypageVO"%>
<%@page import="com.google.gson.Gson"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MypageVO vo = (MypageVO)request.getAttribute("usersNo");

	response.setContentType("application/json; charset=utf-8");

	Gson gson = new Gson();
	
	String result = gson.toJson(vo);
	
	out.print(result);
	
	out.flush();
%>
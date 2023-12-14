<%@page import="com.google.gson.Gson"%>
<%@page import="vo.RestaurantVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 서블릿에 저장한 결과값 가져오기
	RestaurantVO vo = (RestaurantVO)request.getAttribute("rsNo");

	response.setContentType("application/json; charset=utf-8");
	
	Gson gson = new Gson();
	
	String result = gson.toJson(vo);
	
	out.print(result);
	
	out.flush();
%>
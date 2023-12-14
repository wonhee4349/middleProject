<%@page import="com.google.gson.Gson"%>
<%@page import="vo.RestaurantVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	RestaurantVO vo = (RestaurantVO)request.getAttribute("rsNo");

	response.setContentType("application/json; utf-8");
	
	Gson gson = new Gson();
	
	String result = gson.toJson(vo);
	
	out.print(result);
	
	out.flush();
%>
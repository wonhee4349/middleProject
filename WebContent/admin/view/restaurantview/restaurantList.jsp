<%@page import="com.google.gson.Gson"%>
<%@page import="vo.RestaurantVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<RestaurantVO> list = (List<RestaurantVO>)request.getAttribute("restaurantList");

	Gson gson = new Gson();
	
	String jsondata = gson.toJson(list);
	
	out.print(jsondata);
%>
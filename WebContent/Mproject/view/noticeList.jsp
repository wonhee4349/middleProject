<%@page import="com.google.gson.Gson"%>
<%@page import="vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<NoticeVO>list= (List<NoticeVO>)request.getAttribute("LIST");




Gson gson = new Gson();

String jsondata = gson.toJson(list);


out.print(jsondata);






%>
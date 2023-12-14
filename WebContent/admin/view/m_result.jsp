<%@page import="vo.NoticeVO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%



	NoticeVO res =(NoticeVO)request.getAttribute("RES");



	
    if(res==null){
    	//실패
 %>  

 
 {
 
 
 	"ss" : "전송실패"

 
 }

  	
 <%
 
    }else{
    	
%>
 
  {
 
 
 	"ss" : "전송성공"

 
 }
 
 
 
 
 
 		
 <%  
 
    }
 %>
  
    	
    	
    	
   
    	
    	
	


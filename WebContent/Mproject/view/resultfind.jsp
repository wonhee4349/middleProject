<%@page import="java.io.PrintWriter"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%



	String email =(String)request.getAttribute("FIND");
	//System.out.print("이메일!!!!!"+email);

	
    if(email==null){
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
  
    	
    	
    	
   
    	
    	
	


	


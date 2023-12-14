
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%


	int res =(Integer)session.getAttribute("SIGNUP");
     

    if(res<0){
    	//가입실패
 %>  
 
 {
 
 	"so" : "가입실패"

 
 }

  	
 <%
 
    }else{
    	
 %>   	
   {
 
 	"so" : "가입성공"

 
 }
    	


 <% 
    }
    %> 
 
    	
    	
	


	


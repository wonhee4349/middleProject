<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<%


	String id =(String)session.getAttribute("LOGINID");
    
    System.out.println("아이디:"+id);
  

    if(id==null){
    	//불일치
    	System.out.println("불일치");
 %>  
 
 {
 
 
 	"so" : "불일치"

 
 }

  	
 <%
 System.out.println("넘어왔어");
    }else{
    	if(id.equals("manager1")){
    		 %> 
    		 {
    		  
    		  
    		  	"so" : "일치",
    		  	"admin" : "ok"

    	 	  }	
 <%
    	}else{
    	
 %> 
{
 
 
 	"so" : "일치",
 	"admin" : "user"
 	

 }
 		
 <% 
    }
 
    }
    System.out.println("다넘어ㄹ왔어");
 %>
  
    	
    	
    	
   
    	
    	
	


	


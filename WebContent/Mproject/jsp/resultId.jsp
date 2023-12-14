<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//서블릿에서 저장한 데이터 꺼내기 
	
	String res = (String)request.getAttribute("USERID");

	if(res==null){
		
%>	
	
	{
	
	"sw" : "●사용가능한 아이디입니다."
	
	}

		
<%	
	}else{
		
%>	
	{
	
	"sw" : "●사용불가능한 아이디입니다."
	
	}

		
<%		
	}

%>
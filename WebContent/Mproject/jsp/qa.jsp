

<%@page import="vo.QaVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1">
<meta name="format-detection" content="telephone=no">
<title>대전전시관</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/base.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/fullpage.css">
 <%--<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/jquery-ui.css"> --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/layout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/swiper.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/content.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/board.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/detail.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/coupon.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/main.css?ver=1.2">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/jquery-1.12.2.min.js"></script>
 <%--<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/swiper-min.js"></script> --%>
<%--<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/slide.js"></script> --%>
<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/scroll.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/main.js"></script>



<%

	
	String inputId = (String)session.getAttribute("LOGINID");

%>


<script>
$(function(){
	const userId = "<%= inputId %>";

	//로그아웃
	$('#logout').on('click',function(){
		$.ajax({
			url:"<%=request.getContextPath()%>/logoutMember.do",
			type:'post',
			success: function(res) {
				alert("로그아웃 완료!")
				 location.href = "<%=request.getContextPath()%>/Mproject/jsp/main.jsp";
			},
			error:function(xhr){
				  alert("상태: " + xhr.status);
			}
		});//ajax
	});//온클릭	
})

</script>
</head>

<body class="main">
	<ul id="skip_navi">
		<li><a href="#content">본문 바로가기</a></li>
		<li><a href="#gnb">메인메뉴 바로가기</a></li>
	</ul>

	<div id="wrap">
		<!-- S. header -->
		<header id="header"  class="mob on"> <!-- !!!!!!!!!! -->
			<div class="inner wrap">
				<h1 class="logo">
					<a href="<%=request.getContextPath()%>/Mproject/jsp/main.jsp" title="">NORI Daejeon</a>
				</h1>
				<a href="#" class="btn_menu" data-util="menu">메뉴 열기</a>
				<nav id="gnb">
					<ul class="gnb">
						<li><a href="<%=request.getContextPath()%>/Mproject/jsp/tourism.jsp" >관광정보</a></li>
						<li><a href="<%=request.getContextPath()%>/Mproject/jsp/restaurant.jsp" >맛집정보</a></li>						
						<li><a href="<%=request.getContextPath()%>/Mproject/jsp/communityList.jsp" >커뮤니티</a>
						<li><a href="<%=request.getContextPath()%>/Mproject/jsp/noticelist.jsp" class="board_notice">공지사항</a></li>
						<li><a href="<%=request.getContextPath()%>/qaList.do" class="board_Dgallery">Q&A</a></li>
					</ul>
				</nav>
				<div class="util_member">
<%

	
	if(inputId!=null){
		
	

%>
<a href="#"><%=inputId %>님</a>
	<a href="#" id="logout">로그아웃</a>
	<a href="<%=request.getContextPath()%>/Mproject/jsp/mypageMain.jsp">마이페이지</a>
<%
	}else{
		
	
%>
<a href="<%=request.getContextPath()%>/Mproject/jsp/login.jsp">로그인</a>
<a href="<%=request.getContextPath()%>/Mproject/jsp/join.jsp">회원가입</a>
<%
	}

%>

					
				</div>
				
			</div>
		</header>
		<div class="area_subVisual">
			<div style="background-image: url(<%=request.getContextPath()%>/Mproject/images/m01.jpg);"></div>
			<div class="subTit">
				<div>
					<h2 data-aos="fade-up">Q&A</h2>
				</div>
				<div>
					<i data-aos="fade-up" data-aos-delay="350">궁금한점이 있으시면 언제든 물어보세요.</i>
				</div>
			</div>
		</div>

		<!--container -->

		
		<section id="container">
		
		<%
		List<QaVO> qaList  = (List<QaVO>)request.getAttribute("qaList");
		
		
		%>
		
		
			
			<div id="content">
				
				<article class="area_photo">
				
					<div class="wrap">
					<ul class="qaList" id="result">
						  <%--   <% if (qaList != null) { %>
						        <% for (QaVO qa : qaList) { %>
						            <li><%= qa.getQa_title() %></li>
						            <li><%= qa.getQa_con() %></li>
						        <% } %>
						    <% } else { %>
						        <li>No Q&A data available</li>
						    <% } %> --%>
						    
							<% for (QaVO qa : qaList) { %>
							    <a href="<%= request.getContextPath() %>/qadetail.do?qaId=<%= qa.getQa_no() %>">
							    
							        <li data-qa-id="<%= qa.getQa_no() %>"> <!-- 수정: data-qa-id 속성 추가 -->
							        	<span style="dislpay:none"><%= qa.getQa_no()%></span>
							            <span class="tit"><%= qa.getQa_title() %></span>
							            <span class="date"><%= qa.getQa_date() %></span>
							            <span class="date"><%= qa.getUsers_name() %></span>
		            
							        </li>
							    </a>
							<% } %>
								
						    
						</ul>

						<a href="<%=request.getContextPath()%>/Mproject/jsp/qboardinsert.jsp"><div class="button green" style="margin-top:50px; float:right;">글쓰기</div></a>	
							
					

					</div>
				</article>

			</div>
		</section>
		
		<br>
		<div id="pageList"></div>


		<!-- // container -->





		<!-- footer -->
		<footer id="footer">
			<div id="dokdo_bg" class="dokdo_area">
				<div id="dokdo_inn" class="wrap">
				

					<p>“ 아름다운 대전 ”</p>
					<div class="circle1"></div>
					<div class="circle1_1"></div>
					<div class="circle2"></div>
					<div class="circle2_1"></div>
					<i class="tx1">성심당</i>

				</div>
			</div>
			<div class="footer_inn">
				<div class="wrap">
					<address>
						<p class="copyright">© 2023 All rights reserved .</p>
					</address>
					
				</div>
			</div>
		</footer>
		<!-- //footer -->
		<!-- //footer -->
	</div>


</body>
<script>
var ele = document.querySelector("#content");
var qaListItems = ele.querySelectorAll(".qaList li"); // 수정: qaList 클래스 하위의 li 태그 선택

for (var i = 0; i < qaListItems.length; i += 2) { 
    qaListItems[i].addEventListener("click", function (event) {
        var qaId = event.currentTarget.getAttribute("data-qa-id"); 
        window.location.href = "<%=request.getContextPath()%>/qadetail.do?qaId=" + qaId; // 수정: 페이지 이동
        
        
        $.ajax({
            url: "<%=request.getContextPath()%>/qaList.do",
            type: "GET", // 수정: GET 방식으로 요청
            data: {
                qaTitle: qaTitle,
                userId: userId
            },
            success: function (response) {
                // 서버 응답 처리
                console.log(response);

                // 메시지 다이얼로그 보여주기
                alert("클릭한 Q&A 항목: " + qaTitle);
            },
            error: function (error) {
                console.log(error); // 에러 처리
            }
        });
        
        
      
        
        
    });
}



</script>
</html>


<%@page import="vo.ChatVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1">
<meta name="format-detection" content="telephone=no">
<title>대전전시관</title>
<link rel="stylesheet" type="text/css" href="Mproject/css/base.css">
<link rel="stylesheet" type="text/css" href="Mproject/css/common.css">
<link rel="stylesheet" type="text/css" href="Mproject/css/fullpage.css">
<link rel="stylesheet" type="text/css" href="Mproject/css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="Mproject/css/layout.css">
<link rel="stylesheet" type="text/css" href="Mproject/css/swiper.css">
<link rel="stylesheet" type="text/css" href="Mproject/css/content.css">
<link rel="stylesheet" type="text/css" href="Mproject/css/board.css">
<link rel="stylesheet" type="text/css" href="Mproject/js/custom.css">
<link rel="stylesheet" type="text/css" href="Mproject/css/chat.css">

<link rel="stylesheet" type="text/css" href="Mproject/css/main.css?ver=1.2">
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<script type="text/javascript" src="Mproject/js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="Mproject/js/swiper-min.js"></script>
<script type="text/javascript" src="Mproject/js/slide.js"></script>
<script type="text/javascript" src="Mproject/js/scroll.js"></script>
<script type="text/javascript" src="Mproject/js/main.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
   // 스와이퍼 객체 생성과 슬라이더 초기화
</script>

<%

   
   String inputId = (String)session.getAttribute("LOGINID");

%>

</head>
 
<body class="main">

<ul id="skip_navi">
      <li><a href="#content">본문 바로가기</a></li>
      <li><a href="#gnb">메인메뉴 바로가기</a></li>
   </ul>
   
   <div id="wrap">
      <!-- S. header -->
      <header id="header" class="slidedown">
         <div class="inner wrap">
            <h1 class="logo">
               <a href="<%=request.getContextPath()%>/Mproject/jsp/main.jsp" title="">NORI Daejeon</a>
            </h1>
            <a href="#" class="btn_menu" data-util="menu">메뉴 열기</a>
            <nav id="gnb">
               <ul class="gnb">
                  <li><a href="<%=request.getContextPath()%>/Mproject/jsp/tourism.jsp">관광정보</a></li>
                  <li><a href="<%=request.getContextPath()%>/Mproject/jsp/restaurant.jsp">맛집정보</a></li>
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
<%
   }else{
      
   
%>
<a href="<%=request.getContextPath()%>/Mproject/jsp/login.jsp">로그인</a>
<a href="<%=request.getContextPath()%>/Mproject/jsp/login.jsp">회원가입</a>      
<%
   }

%>            
               <a href="<%=request.getContextPath()%>/Mproject/jsp/mypageMain.jsp">마이페이지</a>
            </div>

         </div>
      </header>
      
      <div class="area_subVisual">
         <div style="background-image: url(Mproject/images/m01.jpg);"></div>
         <div class="subTit">
            <div>
               <h2 data-aos="fade-up">챗봇 Q&A</h2>
            </div>
            <div>
               <i data-aos="fade-up" data-aos-delay="350">자주묻는 질문을 확인하세요</i>
            </div>
         </div>
      </div>
      
      <!--container -->

      <section id="container">
         <div id="content">
            <article class="area_photo"></article>
         </div>
      </section>

      <!-- // container -->
      
      
<%
   List<ChatVO> chatList = (List<ChatVO>)request.getAttribute("chatbot");
%>


<h2>자주 묻는 질문</h2>   

<%
   for(ChatVO ch : chatList){
%>
      <div id="Accordion_wrap" class="wrap">
     <div class="que">
     
      <span><%=ch.getCb_con() %></span>
       <div class="arrow-wrap">
         <span class="arrow-top">↑</span>
        <span class="arrow-bottom">↓</span>
       </div>
      
     </div>
     <div class="anw">
     
      <span><%=ch.getCb_rp() %></span>
     </div>
     
     
    
</div>
<%
   }
%>
      
<script>
$(".que").click(function() {
      $(this).next(".anw").stop().slideToggle(300);
     $(this).toggleClass('on').siblings().removeClass('on');
     $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
   });
</script>


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
   
   <script>
      AOS.init();
   </script>
</body>
</html>

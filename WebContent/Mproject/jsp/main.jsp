<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page isELIgnored="true" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1">
<meta name="format-detection" content="telephone=no">
<title>대전전시관</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/base.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/fullpage.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/layout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/swiper.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/js/custom.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/main.css?ver=1.2">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">


<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/swiper-min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/slide.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/scroll.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/main.js"></script>
<script src="<%=request.getContextPath()%>/Mproject/js/jquery.serializejson.min.js"  ></script>
<script src="<%=request.getContextPath()%>/Mproject/js/jquery-1.12.2.min.js"></script>
<%

	
	String inputId = (String)session.getAttribute("LOGINID");

%>	
</style>
<script>
//로그아웃
$(function(){
	
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

});//$function




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
	</div>
		<!-- //E. header -->

		<!-- S. visual -->
		<section class="area_visual">
			<div class="swiper-container">
				
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div class="slide-inner slide-bg-image" style="background-image: url(<%=request.getContextPath()%>/Mproject/images/m02.jpg);">
							<div class="container">
								<div class="slogan">
									<p data-swiper-parallax="300" class="slide-title">볼수록 빠져드는 대전여행 이야기</p>
									<i data-swiper-parallax="400" class="slide-text">반짝반짝 빛나는 이 도시를 조금은 사랑하게 될지도<br></i>
								</div>
							</div>
						</div>
					</div>
					<div class="swiper-slide swiper-slide-active" data-swiper-slide-index="0" style="width: 1903px;">
						<div class="slide-inner slide-bg-image" style="background-image: url(<%=request.getContextPath()%>/Mproject/images/m01.jpg); transform: translate3d(0px, 0px, 0px); transition: all 0ms ease 0s;">
							<div class="container">
								<div class="slogan">
									<p data-swiper-parallax="300" class="slide-title" style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;"><img src="/images/main/visual_tx.svg" alt="대한민국 독도 세종에서 만나다"></p>
									<i data-swiper-parallax="400" class="slide-text" style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">특별한 대전 바로여기</i>
								</div>
								<a href="celebration.html" data-swiper-parallax="500" class="btn" style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">이벤트 보기</a>
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-pagination"></div>
			</div>
			<div class="scroll">
				<span><i>Scroll</i></span>
			</div>

<%	
	if(inputId!=null){
%>
			<a href="<%=request.getContextPath()%>/Mproject/jsp/schedule.jsp" class="btn_cicle">
				<i class="fa fa-calendar"></i>나만의 일정등록
			</a>
<%
	}else{
	
	}
%>

			

		</section>
		<!-- //E. visual -->

		<section id="container">
			<!-- 본문 -->
			<div id="content">
				<article class="area_info mb50">
					<div class="wrap">
						<div class="dokdo_sect" data-aos="fade-up">
							<h3>대전 어디갈까?</h3>
							<p>
								대전 관광지를 소개합니다.<br> 
							</p>
						</div>
												<div class="viewinfo_sect" data-aos="fade-up" data-aos-delay="300">
							<h3>대전시티투어</h3>
							<div>
								<i class="fa fa-bus"></i> <strong>(042)861-1330</strong> <a href="http://www.daejeoncitytour.co.kr/kor/images/file/2023-Schedule.pdf">일정표다운로드</a>
							</div>
							<ul class="list_bullet">
								<li><strong>버스투어</strong>
									<p>
										표한장으로 대전일주를!<br>이제 대전관광은 문화관광 해설사와 함께 즐겨요!</span>
									</p>
								</li>
								
							</ul>
						</div>
					</div>
				</article>
				<!-- //E. area_info -->

				<article class="area_notice" data-aos="fade-up">
					<div class="notice_inn">
						<div class="left_sect">
							<h3>맛집안내</h3>
							<p>대전의 다양한 맛집을 소개합니다.</p>
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
						</div>
						<div class="swiper mySwiper right_sect">
							<div class="swiper-wrapper swiper_50">
								<div class="swiper-slide mr10">
									<a href="<%=request.getContextPath()%>/restaurantDetail.do?rsNo=RS_23_036">
										<span class="img"><img src="<%=request.getContextPath()%>/Mproject/images/food01.jpg" alt=""></span>
										<i class="tag_news">Best</i>
										<strong> 오렌지블루스 </strong>
										<p>실내는 조용하고 전체적인 오렌지 조명이 따뜻한 느낌을 주는 감성 맛집</p>
									</a>
								</div>
								<div class="swiper-slide">
									<a href="<%=request.getContextPath()%>/restaurantDetail.do?rsNo=RS_23_035">
										<span class="img"><img src="<%=request.getContextPath()%>/Mproject/images/food02.jpg" alt=""></span>
										<i class="tag_news">Best</i>
										<strong> 버터 피 베이크샵 </strong>
										<p>휘낭시에, 파운드, 스콘, 타르트 등 구운 과자류를 판매하는 테이크아웃 베이크샵.</p>
									</a>
								</div>
							</div>
						</div>
						<div class="swiper-pagination"></div>
					</div>
				</article>
				<!-- //E. area_notice -->

				<article class="area_banner" data-aos="fade-up">
					<div class="banner wrap">
						<a href="<%=request.getContextPath()%>/Mproject/jsp/communityList.jsp">
							<h3>커뮤니티</h3>
							<p>
								자유롭게 말하고 여행하자!
							</p>
							<img src="images/main/icon_experience.svg" alt="">
						</a>
						<a href="<%=request.getContextPath()%>/couponInfo.do">
							<h3>쿠폰안내</h3>
							<p>
								대전 여행에서 필요한 쿠폰을 다운받으세요
							</p>
							<img src="images/main/icon_theater.svg" alt="">
						</a>
					</div>
				</article>
				<!-- //E. area_banner -->
			</div>
			<!-- //E. content -->
		</section>
		<!-- //E. container -->

		
		<!-- footer -->
		<footer id="footer">
		 <a href="<%=request.getContextPath()%>/chatbot.do" class="org qacircle mainqa" style="z-index: 999"> <i class="fa fa-pencil"></i> ChatBot</a>
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
</body>
</html>
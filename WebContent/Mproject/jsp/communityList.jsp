<%@page import="vo.CommunityVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1">
<meta name="format-detection" content="telephone=no">
<title>NORI 대전</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/base.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/fullpage.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/layout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/swiper.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/board.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/content.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/js/custom.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/commu_kw.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/main.css?ver=1.2">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<script src="<%=request.getContextPath()%>/Mproject/js/jquery-3.7.0.min.js"></script>
<!-- <script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script> -->
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/js/swiper-min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/slide.js"></script> --%>
<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/scroll.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/main.js"></script>
<script src="<%=request.getContextPath()%>/Mproject/js/community.js" type="text/javascript"></script>

<%

	String inputId = (String)session.getAttribute("LOGINID");
	String inputNo = (String)session.getAttribute("USERNUM");

%>
<script>
mypath = '<%=request.getContextPath()%>';
currentPage = 1;


$(function(){
    		
    $.listPageServer(1);
    
  //페이지버튼
	$(document).on('click','.pageno',function(){
		currentPage = $(this).text();
		$.listPageServer(currentPage);
	});	//.pageno 끝
	
	
	//검색버튼
	$(document).on('click','#sBtn',function(){
		currentPage = 1;
		$.listPageServer(currentPage);
	}); //sBtn 끝
	
	
	//다음버튼
	$(document).on('click','#nextBtn', function(){
		currentPage = parseInt($('.pageno').last().text())+1;
		$.listPageServer(currentPage);
	});//다음 끝
	
	
	//이전버튼
	$(document).on('click', '#prevBtn', function(){
		currentPage = parseInt($('.pageno').first().text())-1
		$.listPageServer(currentPage);
	});//이전 끝
	
	$(document).on("click","#logout",function() {
		//$('#logout').on('click',function(){
			
			
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
    
    
});
    	
</script>
<style>
.tit{background:#333; color:#fff;}
</style>
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
		<!-- //E. header -->
		
		
		<div class="area_subVisual">
			<div style="background-image: url(../images/m01.jpg);"></div>
			<div class="subTit">
				<div>
					<h2 data-aos="fade-up">커뮤니티</h2>
				</div>
				<div>
					<i data-aos="fade-up" data-aos-delay="350">자유롭게 정보 및 질문을 공유해보세요!</i>
				</div>
			</div>
		</div>

		<!--container -->

		<section id="container">
			<div id="content">
				<article class="area_">
					<div class="wrap">
						<script type="text/javascript" src="/js/board.js"></script>
						<script type='text/javascript'>
							document.title = '(목록) | 커뮤니티';
						</script>
						<!-- 검색 및 버튼 -->
						<div class="bbsSearch">
							<form >
								<input type="hidden" name="board_id" value="board_notice" /> <input
									type="hidden" name="start" value="0" />

								<!-- <div class="designSelect">
									<label for="searchType">검색</label> <select name="search_key"
										id="searchType" title="카테고리검색">
										<option value="">전체</option>
										<option value="title">제목</option>
										<option value="name">작성자</option>
									</select>
								</div> -->

								<input type="text" id="sword" 
								 placeholder="검색어를 입력하세요"> 
								 <button class="button" id="sBtn" type="button">Search</button>
								<!--  <input type="submit" id="sBtn" class="button" value="검색"> -->
							</form>
						</div>



						<!-- <script type="text/javascript">
							$("#searchType option[value='" + "" + "']").prop(
									"selected", true);
						</script> -->
						<div id="showlist"></div>
						<a href="<%=request.getContextPath()%>/Mproject/jsp/communityInsert.jsp" class="button green" style="margin-top:50px; float:right;"> 새글등록</a>	
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
</html>
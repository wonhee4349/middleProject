<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1">
<meta name="format-detection" content="telephone=no">
<title>대전전시관</title>
<link rel="stylesheet" type="text/css" href="../css/base.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<link rel="stylesheet" type="text/css" href="../css/fullpage.css">
<link rel="stylesheet" type="text/css" href="../css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="../css/layout.css">
<link rel="stylesheet" type="text/css" href="../css/swiper.css">
<link rel="stylesheet" type="text/css" href="../css/content.css">
<link rel="stylesheet" type="text/css" href="../css/board.css">
<link rel="stylesheet" type="text/css" href="../js/custom.css">

<link rel="stylesheet" type="text/css" href="../css/main.css?ver=1.2">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/swiper-min.js"></script>
<script type="text/javascript" src="../js/slide.js"></script>
<script type="text/javascript" src="../js/scroll.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script>
	// 스와이퍼 객체 생성과 슬라이더 초기화
</script>
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
					<a href="index.html" title="">NORI Daejeon</a>
				</h1>
				<a href="#" class="btn_menu" data-util="menu">메뉴 열기</a>
				<nav id="gnb">
					<ul class="gnb">
						<li><a href="tourisme.html">관광정보</a></li>
						<li><a href="food.html">맛집정보</a></li>
						<li><a href="event.html">이벤트</a></li>
						<li><a href="celebration.html">행사안내</a></li>
						<li><a href="community.html">커뮤니티</a>
							<ul>
								<li><a href="/html/notice.html" class="board_notice">공지사항</a></li>
								<li><a href="/html/qa.html" class="board_Dgallery">Q&A</a></li>
							</ul></li>
					</ul>
				</nav>
				<div class="util_member">
					<a href="login.html">로그인</a> <a href="join.html">회원가입</a> <a
						href=mypage.html">마이페이지</a>
				</div>

			</div>
		</header>
		<div class="area_subVisual">
			<div style="background-image: url(../images/m01.jpg);"></div>
			<div class="subTit">
				<div>
					<h2 data-aos="fade-up">맛집정보</h2>
				</div>
				<div>
					<i data-aos="fade-up" data-aos-delay="350">대전의 다양한 관광정보를 확인하세요</i>
				</div>
			</div>
		</div>

		<!--container -->

		<section id="container">
			<div id="content">
				<article class="area_photo">
					<div class="wrap">


						<div class="tab_container">
							<div id="tab1" class="tab_cnt" style="display: block;">
								<script type="text/javascript" src="/js/board.js"></script>
								<script type="text/javascript">
									document.title = '(목록) | 독도사진';
								</script>
								<ul class="photoList">
									<li>
										<a href="<%=request.getContextPath()%>/comment.do">
												<span class="img"> <i style="background-image: url('../images/food1.jpeg');"></i></span>
												<em>대전맛집</em> <span class="write"> <em>2023-02-15</em>
													<i>관리자</i>
											</span>
										</a>
									</li>
										<li>
										<a href="#">
												<span class="img"> <i style="background-image: url('../images/food1.jpeg');"></i></span>
												<em>대전맛집</em> <span class="write"> <em>2023-02-15</em>
													<i>관리자</i>
											</span>
										</a>
									</li>
										<li>
										<a href="#">
												<span class="img"> <i style="background-image: url('../images/food1.jpeg');"></i></span>
												<em>대전맛집</em> <span class="write"> <em>2023-02-15</em>
													<i>관리자</i>
											</span>
										</a>
									</li>
										<li>
										<a href="#">
												<span class="img"> <i style="background-image: url('../images/food1.jpeg');"></i></span>
												<em>대전맛집</em> <span class="write"> <em>2023-02-15</em>
													<i>관리자</i>
											</span>
										</a>
									</li>
										<li>
										<a href="#">
												<span class="img"> <i style="background-image: url('../images/food1.jpeg');"></i></span>
												<em>대전맛집</em> <span class="write"> <em>2023-02-15</em>
													<i>관리자</i>
											</span>
										</a>
									</li>
								</ul>


								<!-- page -->
								<div class="pagination">
    <div class="page_control_prev">
        <a href="#" class="btn_end first">
            <span>맨처음</span>
        </a>
    </div>
    <ol>
        <li class="on">
            <a href="javascript:void(0);">1</a>
        </li>
        <li>
            <a href="#">2</a>
        </li>
        <li>
             <a href="#">3</a>
        </li>
        <li>
             <a href="#">4</a>
        </li>
        <li>
           <a href="#">5</a>
        </li>
    </ol>
    <div class="page_control_next">
        <a href="#" class="btn_end last">
            <span>맨마지막</span>
        </a>
    </div>
</div>

								<!-- //page -->

							</div>
							<!-- //E. 봄 -->

							<div id="tab2" class="tab_cnt" style="display: none;">여름</div>
							<!-- //E. 여름 -->

							<div id="tab3" class="tab_cnt" style="display: none;">가을</div>
							<!-- //E. ㄱㅏ을 -->

							<div id="tab4" class="tab_cnt" style="display: none;">겨울</div>
							<!-- //E. 겨울 -->
						</div>


					</div>
				</article>
			</div>
		</section>

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
					<a href="#" class="org qacircle"> <i class="fa fa-pencil"></i> Q&A</a>
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
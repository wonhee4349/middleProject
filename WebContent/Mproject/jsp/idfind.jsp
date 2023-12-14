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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/base.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/common.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/fullpage.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/layout.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/member.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/swiper.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/contents.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/js/custom.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/main.css?ver=1.2" />
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">


<%-- <script src="<%=request.getContextPath()%>/Mproject/js/jquery-3.7.0.min.js"></script> --%>

<script src="<%=request.getContextPath()%>/Mproject/js/jquery-1.12.2.min.js"></script>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/slide.js"></script> --%>
<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/scroll.js"></script>
<script src="<%=request.getContextPath()%>/Mproject/js/jquery.serializejson.min.js"  ></script>

<script type="text/javascript">


$(function(){
	

	
	//아이디 찾기 버튼
	$('#btn_findid').on('click', function(){
		
		//alert("아이디 찾기")
		
		$('#spanid').text('');
		var inputNm =$('#name').val().trim();	
		var inputMail=$('#mail').val().trim();
		
		//console.log(inputNm, inputMail)

		//메일 전송 
		$.ajax({
			
			url:"<%=request.getContextPath()%>/idFindMember.do",
			data:{
				"name":inputNm,
				"mail":inputMail
			},
			type:'post',
			dataType:'json',
			success: function(res) {
				if(res.ss=="전송실패"){
					$('#spanid').text('● 전송실패!! 이름 또는 이메일을 잘못 입력했습니다.');
					$('#spanid').css('color','red');
				}else if(res.ss=="전송성공"){
					$('#spanid').text('● 전송성공!! 이메일을 확인해주세요!');
					$('#spanid').css('color','green');
				}

			},
			error: function(xhr){
				alert("상태:"+xhr.status)
			}
		});//ajax
		
		
	});//onclick
	

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
		<header id="header" class="mob on">
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
					<a href="<%=request.getContextPath()%>/Mproject/jsp/login.jsp">로그인</a>
					<a href="<%=request.getContextPath()%>/Mproject/jsp/join.jsp">회원가입</a>
						
				</div>

			</div>
		</header>
		<div class="area_subVisual">
			<div style="background-image: url(../images/m01.jpg);"></div>
			<div class="subTit">
				<div>
					<h2 data-aos="fade-up">아이디 찾기</h2>
				</div>
				<div>
					<i data-aos="fade-up" data-aos-delay="350">우리 도시 대전</i>
				</div>
			</div>
		</div>
		<!-- //area_subVisual -->


		<script type="text/javascript">
			$(".gnb > li > a").removeClass("on");
			$(".preview").addClass("on");
			$(".preview_" + "member").addClass("on");
			$(".preview_" + "membe").addClass("on");
			$(".preview_" + "membe").parent('li').addClass("active");

			if ("") {q	
				//게시판일경우
				$("." + "").addClass("on");
				$("." + "").parent('li').addClass("active");
			} else if ("") {
				$("." + "").addClass("on");
			} else {
				$(".preview_" + "membe").addClass("on");
			}
		</script>
		<section id="container">
			<div id="content">
				<article class="area_member area_reserve">
					<div class="wrap">
						<script type="text/javascript" src="/js/member.js"></script>
						<script type="text/javascript" src="/js/namecheck.js"></script>
						<script type='text/javascript'>
							document.title = '(목록)  ';
						</script>
						<script type='text/javascript'>
							document.title = '(로그인)  ';
						</script>

						<div class="join_area">
							<div class="box join">
								<p class="title">아이디 찾기</p>
								<form method='post' action="<%=request.getContextPath() %>/idFindMember.do">
									<input type="hidden" name="mode" value="login_proc" />
									<ul class="designValue">
										<li data-member-login="id" data-member-form="id">
										<label for="name">이름</label>
										<input type="text" id="name" name="name" class="inputFull required" title="name" placeholder="이름" /></li>
										
                                        <li data-member-login="mail" data-member-form="mail">
										<label for="mail">이메일</label>
										<input type="text" id="mail" name="mail" class="inputFull required" title="mail" placeholder="Email" /></li>
									</ul>
									
									<input type="button" value="아이디찾기" class="btn_login" id="btn_findid" />
								<span id="spanid"></span>
									

								</form>
							</div>
							<!-- 버튼 -->
							<div class="btn_area social">
								<a href="#">아이디 찾기</a>
								<a href="<%=request.getContextPath()%>/Mproject/jsp/pwfind.jsp">비밀번호 찾기</a>
							</div>
							<!-- //버튼 -->
						</div>



					</div>
				</article>
			</div>
		</section>


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

</body>

</html>





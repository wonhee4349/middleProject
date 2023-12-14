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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/layout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/swiper.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/content.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/board.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/detail.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/tourism.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/coupon.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/schedule.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/main.css?ver=1.2">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">


<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/jquery-1.12.2.min.js"></script>
 <%--<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/swiper-min.js"></script> --%>
<%--<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/slide.js"></script> --%>
<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/scroll.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/main.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/comment.js"></script>

<script src="<%=request.getContextPath()%>/Mproject/js/tourism.js"  type="text/javascript"></script>

<%
//	List<TourismVO> list = (List<TourismVO>)request.getAttribute("qaList");
%>

<%

	
	String inputId = (String)session.getAttribute("LOGINID");
	String inputNo = (String)session.getAttribute("USERNUM");
	String mgNo = (String)session.getAttribute("LOGINUM");

	QaVO qa  = (QaVO)request.getAttribute("qaDetail");

	
%>


<script>

$(function(){
	mypath = "<%=request.getContextPath()%>";
	userId = "<%= inputId %>";

    // URL에서 qaId 파라미터 값 가져오기
    var urlParams = new URLSearchParams(window.location.search);
    var qaId = urlParams.get('qaId');

//		댓글
	ntNo = "<%=qa.getQa_no()%>";
	//댓글 리스트 출력
	$.commentListMG(ntNo, "<%=inputNo%>");

	//댓글등록
	$('#submit-btn').on('click',function(){
		userId ="<%=inputId%>"=="null"?null:"userId"
		if(userId==null){
			alert("댓글 등록은 로그인한 회원만 가능합니다.")
		}else if("<%=mgNo%>"!="MG_23_001"){
			alert("문의게시판의 댓글은 관리자만 등록 가능합니다.")
		}else{
			$('#sendComment').submit();
		}
	})

	//댓글 삭제
	$(document).on('click','.comment-delete',function(){
		cmNo = $(this).attr('id');
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="<%=request.getContextPath()%>/deleteCommentQA.do?cmNo="+cmNo+"&&ntNo="+"<%=qa.getQa_no()%>";
		}else{
			return;
		}
	})
	
	// 목록
	$('#listBtn').on('click',function(){
		location.href="<%=request.getContextPath()%>/qaList.do";
	})
	
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

		
			
			<div id="content">
				
				<article class="area_photo">

					<div class="wrap">
						<div id="qaDetailContainer">
							<table class="qa_table">
								<%-- 							 <% for (QaVO qa : qaList) { %> --%>
								<tr style="display: none;">
									<th colspan="2" name="qaNo"><%= qa.getQa_no() %></th>
								</tr>
								<tr>
									<th class="gray">제목</th>
									<th><%= qa.getQa_title() %></th>
								</tr>
								<tr>
									<td colspan="2"><%= qa.getQa_con() %></td>
								</tr>
								<%-- 							  <% } %>	 --%>


							</table>
						</div>
						
					<button type="button" id="listBtn" class="right_blue">목록</button>
					<br>

							<!-- 댓글 -->
						<div class="comment-area">
							<div class="comment-list">
								<div class="comment-list-box">
									<!-- 댓글 리스트 출력되는 곳 -->
								</div>
								
								<%
								if(inputId.equals("admin")){
								%>
								<div class="comment-write">
									<div class="inner">
										
										<div class="title">댓글작성</div>
										<div class="comment-input-area">

											<div class="input-wrap">
												<div class="input-area height-auto">
												<form id="sendComment" action="<%=request.getContextPath()%>/insertCommentQA.do" method="post">
													<input type="hidden" name="ntNo" value="<%=qa.getQa_no()%>">
													<input type="hidden" name="userId" value="<%=inputId%>">
													<input type="hidden" name="userNo" value="<%=inputNo%>">
													<div class="input-inner">
														<textarea name="content" id="content"
															placeholder="내용을 입력해주세요."></textarea>
													</div>
												</form>
												</div>
											</div>
										</div>
										
										<div>
											<a href="javascript:void(0);"><p>
											<button class="submit-btn" id= "submit-btn" type="button">등록</button></p></a>
										</div>
									</div>
								</div>
								
								<%
								}
								%>
							</div>
						</div>




					</div>









				 
				<%--  <!-- 댓글 -->
						<div class="comment-area">

							<div class="comment-list">

								

								<div class="comment-list-box">
									<!-- 댓글 리스트 출력되는 곳 -->
								</div>

								<div class="comment-write">
									<div class="inner">
										
										<div class="title">댓글작성</div>
										<div class="comment-input-area">

											<div class="input-wrap">
												<div class="input-area height-auto">
												<form id="sendComment" action="<%=request.getContextPath()%>/insertComment.do" method="post">
													<input type="hidden" name="ntNo" value="<%=qa.getQa_no()%>">
													<input type="hidden" name="userId" value="<%=inputId%>">
													<input type="hidden" name="userNo" value="<%=inputNo%>">
													<div class="input-inner">
														<textarea name="content" id="content"
															placeholder="내용을 입력해주세요."></textarea>
													</div>
												</form>
												</div>
											</div>
										</div>
										
										<div>
											<a href="javascript:void(0);"><p>
											<button class="submit-btn" id= "submit-btn" type="button">등록</button></p></a>
										</div>
									</div>
								</div>
								




							</div>
						</div>
				  --%>
				 
				 
				 
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


<!-- qadetail.jsp -->

<!-- ... -->

</html>
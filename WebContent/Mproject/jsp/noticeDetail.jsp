<%@page import="com.google.gson.Gson"%>
<%@page import="vo.NoticeVO"%>
<%@page import="service.NoticeServiceImpl"%>
<%@page import="service.INoticeService"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1">
<meta name="format-detection" content="telephone=no">
<title>대전전시관</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Mproject/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Mproject/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Mproject/css/fullpage.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Mproject/css/jquery-ui.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Mproject/css/layout.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Mproject/css/board.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Mproject/css/member.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Mproject/css/swiper.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Mproject/css/contents.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Mproject/js/custom.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Mproject/css/main.css?ver=1.2" />
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">


<script
	src="<%=request.getContextPath()%>/Mproject/js/jquery-1.12.2.min.js"></script>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/slide.js"></script> --%>

<script
	src="<%=request.getContextPath()%>/Mproject/js/jquery.serializejson.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%

	
	String inputId = (String)session.getAttribute("LOGINID");

%>


<script>

     

$(function(){
	//alert("확인")

		var no = '<%=request.getParameter("no")%>';  /*noticedetail.jsp에서 받은 파라미터  */
		
	

	$.ajax({
    			url:"<%=request.getContextPath()%>/noticeDetail.do",
    			type:'get',
    			data:{
    				
    				"no":no
    			},
 
    			dataType:'json',
    			success: function(res){
    				
    				
    	            cont = `${res.not_con}`;
    	            cont = cont.replace(/\n/g, "<br>");
    				
    				
        				code=` <h3 class="bbsTitle">${res.not_title}</h3>
						<div class="bbsDate">
							<ul>
								<li>관리자</li>
								<li><i>작성일</i>${res.not_date}</li>
							</ul> 
						</div>
 						<div class="bbsContent" style="width: 50%; margin: 0 auto;  ">
							<div class="conts"  >
							${cont}
							</div> 
						</div> 
					
					</div>
	
						`
						
						
						
    					$('.bbsTitle_cont').html(code);
							
							
							
							
							
    				},
    				error : function(xhr){
    					alert("상태"+xhr.status); //200->파싱오류
    				},
		
    			
    		});//ajax
    		
    		
    		
    		
		<%-- $(document).on('click','.pager_list',function(){
	         //alert("버튼이 클릭되었습니다!");
	         
	     	 	location.href = "<%=request.getContextPath()%>/Mproject/jsp/noticelist.jsp" 
	     });
		 --%>
		 
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

});//$function



</script>

<style>
.pager_list span {
	padding-left: 25px;
	
}
</style>
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
	<a href="">마이페이지</a>
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
			<div style="background-image: url(../images/m01.jpg);"></div>
			<div class="subTit">
				<div>
					<h2 data-aos="fade-up">공지사항</h2>
				</div>
				<div>
					<i data-aos="fade-up" data-aos-delay="350">공지사항을 확인하세요</i>
				</div>
			</div>
		</div>

		<!--container -->

		<section id="container">
			<div id="content">
				<article class="area_photo">
					<div class="bbsTitle_cont">
						<h3 class="bbsTitle">임시 휴관(2023.7.22.~7.26.) 안내</h3>
						<div class="bbsDate">
							<ul>
								<li>관리자</li>
								<li><i>작성일</i>2023.07.21</li>
							</ul>
						</div>
						<div class="bbsContent">
							<div class="conts"></div>


						</div>
					</div>



					<!-- 신청하는 버튼(CUSTOM) 있을때 -->

					<div class="bbsFile" data-view="txt">
						<!-- <div class="file">
								<ul>
									<li><em></em>
									<p>첨부파일이 없습니다</p></li>

								</ul>
							</div> -->
					</div>
			</div>

			<div class="bbsPager ">
				<div class="inr_pager">
					<a href="<%=request.getContextPath()%>/Mproject/jsp/noticelist.jsp"
						class="pager_list"> <span>목록으로</span>
					</a>
				</div>
			</div>




			</table>




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
		<!-- <div class="footer_inn">
			<div class="wrap">
				<address>
					<p class="copyright">© 2023 All rights reserved .</p>
				</address>
				<a href="#" class="org qacircle"> <i class="fa fa-pencil"></i>
					Q&A
				</a>
			</div>
		</div> -->
	</footer>
	<!-- //footer -->
	<!-- //footer -->
	</div>
	<script>
		AOS.init();
	</script>
</body>

</html>
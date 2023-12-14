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
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/base.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/common.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/fullpage.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/layout.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/board.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/member.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/swiper.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/contents.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/js/custom.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/mypage.css">


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/main.css?ver=1.2">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<script src="<%=request.getContextPath()%>/Mproject/js/jquery-3.7.0.min.js"></script>
<!-- <script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script> -->
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/swiper-min.js"></script> --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/slide.js"></script> --%>
<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/scroll.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/main.js"></script>
<script src="<%=request.getContextPath()%>/Mproject/js/mypage.js" type="text/javascript"></script>

 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<%

	
	String inputId = (String)session.getAttribute("LOGINID");
	String inputNo = (String)session.getAttribute("USERNUM");
	String inputName = (String)session.getAttribute("USERNAME");

%>

<script>
	$(function() {
		mypath = '<%=request.getContextPath()%>';
		
		var no = '<%=inputNo%>';
		
		$.mypageUpdatePage(no);
		
	
    
    // 비밀번호 확인
    var result2 =false;
	$(document).on('click', '#pwbtn', function(){
		var inputPw= $('#password').val()
		var checkPw=$('#checkpw').val()
		
		if(inputPw.length < 1){
			alert("비밀번호를 입력하세요");
			return false;  //더이상 밑으로 안내려오고 함수끝냄 	
		}
		
		pwreg=/^[a-zA-Z0-9!@#$%^&*_+[\]?~]{5,20}$/;

		if(!pwreg.test(inputPw)) {
		    // 규칙과 입력문자가 맞지 않았다.
		    alert("비밀번호형식 오류입니다");
		    return false;
		}
	
		if(inputPw!=checkPw){
			alert("비밀번호가 다릅니다");
			return false;
		}else{
			alert("비밀번호가 맞습니다");
		}
		result2=true
		return result2;
	});//on click
	
	
	//@우편번호 검색 API
	$(document).on('click', '#zipsearch', function() {
		  new daum.Postcode({
		        oncomplete: function(data) {
		        	document.querySelector("#zip").value = data.zonecode;
		            document.querySelector("#addr1").value = data.address;
		        }
		    }).open();	
	});//onclick
	
	
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
		
		//실제 수정하기 위해서 Db 처리 
		$(document).on('click', '#updateMp', function() {
	    	
			if(result2!=true) {
				alert('비밀번호 형식이 맞지 않습니다. 다시 입력해주세요'); return false;
				}
			
	    	vusersNo ='<%=inputNo%>';
	    	vusersId = $('#id').val();
	    	vusersPw = $('#password').val();
	    	vusersName = $('#name').val();
	    	vusersMail = $('#email').val();
	    	vusersTel = $('#tel').val();
	    	vusersZip = $('#zip').val();
	    	vusersAddr1 = $('#addr1').val();
	    	vusersAddr2 = $('#addr2').val();
	   	
	    		
	    	var result = confirm("정말 수정하시겠습니까?");
	    		
	    	if(result) {
	    		$.memberUpdate(vusersNo);
	    	} else {
	    		return;
	    	}
	    })
})
</script>

<style>
.cp_tab_menu{height:500px; width:500px;}

 .cp_tab_menu{position:relative;}
  .cp_tab_menu .list{overflow:hidden;}
  .cp_tab_menu .list li{float:left; margin-right:14px;}
  .cp_tab_menu .list li.is_on .tbtn{font-weight:bold; color:green;}
  .cp_tab_menu .list .tbtn{font-size:13px;}
  .cp_tab_menu .cont_area{margin-top:10px;}
  .cp_tab_menu .cont_area .tcont{display:none; background:#555; color:#000; text-align:center; width:250px; height:100px; line-height:100px;}

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
		
		<div class="myarea_subVisual">
			<div style="background: #00000078 url(../images/qaimg.jpg) center; background-blend-mode: multiply; background-size: 100%;"></div>
			<div class="subTit">
				<div>
					<h2 data-aos="fade-up">mypage</h2>
				</div>
			</div>
				<nav class="lnb wrap">
					
					<div class="lnb_inn">
						<div class="my_user">
							<p>
								<em><%=inputName %>님 </em>반갑습니다.
							</p>
						</div>
						<ul class="inr">
							<li><a href="<%=request.getContextPath()%>/mycouponInfo.do">나의 쿠폰</a></li>
							<li><a href="<%=request.getContextPath()%>/Mproject/jsp/schedule.jsp">나의 일정계획</a></li>						
						</ul>
				</div>
				</nav>			

		</div>




		<!--container -->

		<section id="container">
			<div id="content" class="wrap">
				<article class="area_status test ">
					<div class="my_wrap">

						<div class="my_left_menu">
							<h3 class="lnb-title">MY페이지</h3>
							<ul>
								<li style="font-weight:bold">마이페이지</li>
								<li><a href="<%=request.getContextPath()%>/Mproject/jsp/mypageMain.jsp">- 내 정보</a></li>
								<br>
								<li style="font-weight:bold">쿠폰</li>
								<li><a href="<%=request.getContextPath()%>/mycouponInfo.do">- 나의 쿠폰</a></li>
								<br>
								<li style="font-weight:bold !important">일정</li>
								<li><a href="<%=request.getContextPath()%>/Mproject/jsp/schedule.jsp">- 나의 일정</a></li>		
								<br>					
								<li style="font-weight:bold">내가쓴글</li>
								<li><a href="<%=request.getContextPath()%>/Mproject/jsp/communityUserList.jsp">- 커뮤니티</a></li>
						
							</ul>
						</div>
						<!-- contents -->
						<div class="my_content_wrap">
							<div class="my_tit">나의 정보 수정</div>
							
						<div id="updatedetail"></div>
							
							
							<div class="bottom_btn_wrap">
							
								<input type="button" class="blue_btn btn" id="updateMp" value="수정하기">	
								<input type="button" class="blue_btn btn" value="취소하기" onClick="location.href='<%=request.getContextPath()%>/Mproject/jsp/mypageMain.jsp'">							
				
							</div>
							
							
						</div>
					</div>


				</article>
			</div>
		</section>
		<p class="clear"></p>







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
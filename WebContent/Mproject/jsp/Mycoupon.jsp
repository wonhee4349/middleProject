<%@page import="vo.CouponVO"%>
<%@page import="java.util.List"%>
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
const userId = "<%= inputId %>";

$(function(){
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
})

</script>


<style>



.cpused .cpbtn_bg{
  background: url(../images/cp_after.svg;) right repeat-y !important;
}
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
         <div
            style="background: #00000078 url(<%=request.getContextPath()%>/Mproject/images/qaimg.jpg) center; background-blend-mode: multiply; background-size: 100%;"></div>
         <div class="subTit">
            <div>
               <h2 data-aos="fade-up">COUPON</h2>
            </div>
            <div>
               <i data-aos="fade-up" data-aos-delay="350">쿠폰을 확인하세요</i>
            </div>
         </div>
         <nav class="lnb wrap">
            <div class="lnb_inn">
               <ul class="inr">
                  <li><a href="<%=request.getContextPath()%>/couponInfo.do" >쿠폰 다운로드</a></li>
                  <li  class="active"><a href="<%=request.getContextPath()%>/mycouponInfo.do" class="on">나의 쿠폰함</a></li>
               </ul>
            </div>
         </nav>

      </div>




      <!--container -->
      
      <section id="container">
      
      <%
      List<CouponVO> list = (List<CouponVO>)request.getAttribute("userCoupons");
      
   
      
      %>
      
      

      
         <div id="content" class="wrap">
            <article class="area_status test ">
            <form>
                <div class="coupon-feed__coupon-register">
                    <h3 class="coupon-feed__coupon-register__header">쿠폰등록</h3>
                    <div class="coupon-feed__coupon-register__input-group">
                        <input type="text" placeholder="쿠폰코드를 입력해주세요." class="form-control error" value="">
                        <button class="button button--color-blue button--size-50 button--shape-4" type="submit">등록</button>
                    </div>
                </div>
            </form>
                  <%
               List<CouponVO> userCoupons = (List<CouponVO>) request.getAttribute("userCoupons");
               
               if (userCoupons != null && !userCoupons.isEmpty()) {
                   for (CouponVO vo : userCoupons) {
               %>
               <!-- 쿠폰 정보 표시 부분 -->
               <div class="coupon_ticket">
                   <ul class="coupon_txt">
                       <li class="tit"><%= vo.getCp_name() %></li>
                       <li class="per"><%= vo.getCp_con() %></li>
                       <li class="date"><%= vo.getCp_edate() %>까지 사용 가능</li>
                   </ul>
               </div>
               <%
                   }
               } else {
               %>
               <p style="text-align:center; font-size:20px; padding:20px; border:1px solid #f2f2f2; color:#d3d3d3;">사용 가능한 쿠폰이 없습니다.</p>
               <%
               }
               %>


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
               
            </div>
         </div>
      </footer>
      <!-- //footer -->
      <!-- //footer -->
   </div>



</body>

</html>
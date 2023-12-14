<%@page import="vo.CommentVO"%>

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
<link rel="stylesheet" type="text/css" href="Mproject/css/base.css">
<link rel="stylesheet" type="text/css" href="Mproject/css/common.css">
<link rel="stylesheet" type="text/css" href="Mproject/css/fullpage.css">
<link rel="stylesheet" type="text/css" href="Mproject/css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="Mproject/css/layout.css">
<link rel="stylesheet" type="text/css" href="Mproject/css/swiper.css">
<link rel="stylesheet" type="text/css" href="Mproject/css/content.css">
<link rel="stylesheet" type="text/css" href="Mproject/css/board.css">
<link rel="stylesheet" type="text/css" href="Mproject/css/detail.css">
<link rel="stylesheet" type="text/css" href="Mproject/js/custom.css">

<link rel="stylesheet" type="text/css" href="Mproject/css/main.css?ver=1.2">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<script type="text/javascript" src="Mproject/js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="Mproject/js/swiper-min.js"></script>
<script type="text/javascript" src="Mproject/js/slide.js"></script>
<script type="text/javascript" src="Mproject/js/scroll.js"></script>
<script type="text/javascript" src="Mproject/js/main.js"></script>
<script>
	// 스와이퍼 객체 생성과 슬라이더 초기화
</script>

<%
	String inputId = (String)session.getAttribute("LOGINID");
	String inputNo = (String)session.getAttribute("USERNUM");
%>

</head>

<body class="main">
	

	<div id="wrap">
		<!-- S. header -->
		

		<!--container -->

		<section id="container">
			<div id="content">
				<article class="area_preview">
					<div class="wrap">
					
						

						<!-- 댓글 -->
						<div class="comment-area">

							<div class="comment-list">

				<form action="<%=request.getContextPath()%>/commentInsert.do" method="post" name="comment_form">
                        <div id="write_cmt">
                            <ul>
                          
                                 <li>
                                    <span class="col1">댓글내용 : </span>
                                    <span class="col2"><input type="text" name="content"/></span>
                                </li> 
                                
                                 
                            </ul>
                            <!-- 서밋버튼 -->
               				 <input type="submit" value="댓글등록">
                        </div>
                </form>

<%
	List<CommentVO> cmtList = (List<CommentVO>)request.getAttribute("comment");
%>			


<%
	for(CommentVO cmt : cmtList){
%>
<form name="commentForm" id="comment">
		 	<div class="comment-area">
				
					 		<div class="comment-list">   
								<div class="wrap">
								

								<div class="comment-list-box">
									<div class="list-top">
										<div class="write-info">
											<h1><%=inputId %></h1>
											<input type="hidden" id="cmtNO" name="cm_no" value="<%=cmt.getCm_no() %>">
											<input type="hidden" id="ntNO" name="nt_no" value="<%=cmt.getNt_no() %>">
											<div class="date"><%=cmt.getCm_date() %></div>
										</div>
										<div class="btn-box" style="text-align: right;">
											<input type="hidden" name="txt_Memo_Del_Seq" value="2">

											<!-- <div class="comment-delete"
												onclick="fnc_Memo_Del(document.frm_Send, '', 6);"> 
											 -->
											
											 <input class="comment-delete" type="button" value="X">
												
											</div>
										</div>
									</div>
									<div class="comment-contents"><%=cmt.getCm_con() %></div>
								</div>

							</div>
						</div>
					</form>
<%
	}
%>

<script>
$(".comment-delete").on("click", function(){
	var form = this.form;
	form.action = "<%=request.getContextPath()%>/commentDelete.do";
	form.submit();
});
</script>
							

				
							</div>
						</div>
				</article>
			</div>
		</section>

		<!-- // container -->






		
	</div>
	
	

	
	
	
</body>

</html>



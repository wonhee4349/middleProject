<%@page import="org.json.JSONObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<!-- Custom fonts for this template -->
<link
	href="<%=request.getContextPath()%>/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/admin/css/food_board.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/admin/css/layout.css"
	rel="stylesheet">

<script src="<%=request.getContextPath()%>/admin/js/jquery-3.7.0.min.js"></script>
<script src="<%=request.getContextPath()%>/admin/js/restaurantMG.js"
	type="text/javascript"></script>

<script>
<%

	NoticeVO vo = (NoticeVO)request.getAttribute("RES");
	String inputId = (String)session.getAttribute("LOGINID");
    	
%>
    $(function(){
    	//alert("확인")

			var urlParams = new URLSearchParams(window.location.search);
			var no = urlParams.get("no");
			var title = decodeURIComponent(urlParams.get("title"));
			var con = decodeURIComponent(urlParams.get("con")); 
			//m_noticelist.jsp에서 넘겨준 파라미터들!
			//m_noticedetail.jsp 파라미터 한글문자열이  url인코딩 되지 않음 
			//url디코딩을 통해 url파라미터 값을 가져와 decodeURIComponent()함수 사용하기
    		

    			//alert(title);
    		
    		
    	
		//공지사항 상세정보
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
        				
        				
        	            code =  `<style>
        	            .custom-table {
        	              width: 70%;
        	              margin: 0 auto;
        	              border-collapse: collapse;
        	              border: 1px solid #e0e0e0;
        	              border-radius: 8px;
        	              background-color: #f5f5f5;
        	            }
        	            
        	            .custom-table th, .custom-table td {
        	              border: 1px solid #e0e0e0;
        	              padding: 10px;
        	              text-align: center;
        	            }
        	            
        	            .custom-table th {
        	              font-weight: bold;
        	              background-color: #f0f0f0;
        	            }
        	          </style>
        	          <h3 class="bbsTitle" style="text-align: center; margin-bottom: 5%;">${res.not_title}</h3>
        	          <div class="bbsDate">
        	            <table class="custom-table">
        	              <tr>
    	               	 	<th>작성자</th>
    	                	<th>작성일</th>
    	             	  </tr>
        	              <tr>
        	                <td>관리자</td>
        	                <td>${res.not_date}</td>
        	              </tr>
        	              <tr>
        	                <td colspan="2" style="border-bottom: 1px solid #e0e0e0;"> ${cont}</td>
        	                
        	              </tr>
        	            </table>
        	          </div>
        	          <div class="bbsContent" style="text-align: center;">
        	            <div class="conts">
        	             
        	            </div>
        	          </div>`;
        			
        					$('.card-body').html(code);
    							
    							
    							
    							
    							
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
    		 
    		 //수정
    		 $('#update').on('click',function(){
    		
    			<%--  location.href = "<%=request.getContextPath()%>/admin/jsp/m_noticeupdate.jsp?no=<%=request.getParameter("no")%>"   --%>
    		
    			//m_noticeupdate.jsp로 파라미터 넘김

    			no = encodeURIComponent(no);
    		   con = encodeURIComponent(con);
    		   title = encodeURIComponent(title); 

    		   var redirectURL = '<%= request.getContextPath() %>/admin/jsp/m_noticeupdate.jsp?no=' + no + '&con=' + con + '&title=' + title;
    		   location.href = redirectURL;	
    		
    			 
    		 })//onclick
    		 
    		 
    		 //삭제
    		 $('#delete').on('click',function(){
    			
    			 
    			 
    	<%-- 	if(confirm("정말로 삭제하시겠습니까?")){
    				 window.location.href="<%=request.getContextPath() %>/deletenotice.do?no=no>" /*파라미터 전달...??  */
    				}else{
    					return false;
    				}
    			})
    			  --%>
    		 $.ajax({
    				 url: "<%=request.getContextPath()%>/deletenotice.do",
    				 data:{
    					 "no":no
    				 },
    				 type:'post',
    				 dataType:'json',
    				 success: function(res){
    					 if(res.ss=="전송성공"){
    						 
    						alert("삭제완료")
    						location.href = "<%=request.getContextPath()%>/admin/jsp/m_noticelist.jsp" 
    					 }
    					 
    				 },
    				 error: function(xhr){
    					 alert("상태:"+xhr.status)
    				 }
    			
    			 });//ajax 
   			 });//onclick
    
   					 //@로그아웃
    			    $('#btn_logout').on('click',function(e){
    					e.preventDefault();
    					
    					
    					$.ajax({
    						
    						url: "<%=request.getContextPath()%>/logoutmg.do",
    						type:'post',
    						success:function(res){
    							
    							alert("로그아웃 완료!")
    							 location.href="<%=request.getContextPath()%>/Mproject/jsp/main.jsp";
    						},
    						error:function(xhr){
    							alert("상태:"+xhr.status);
    						}

    					});//ajax
    					
    					
    				});//onclick
    		 

 });//$function
    
    
    
    
    
    </script>


</head>

<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">
            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center"  href="<%=request.getContextPath()%>/admin/jsp/usersMG.jsp">
                <div class="sidebar-brand-text mx-3">Nori Daejeon</div>
            </a>

           <!-- Divider -->
            <hr class="sidebar-divider my-0">
            <!-- Divider -->
            <hr class="sidebar-divider">

            <li class="nav-item">
                <a href="<%=request.getContextPath()%>/admin/jsp/usersMG.jsp"  class="nav-link collapsed">
                    <i class="fas fa-fw fa-user"></i>
                    <span>회원정보</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="<%=request.getContextPath()%>/admin/jsp/tourismMG.jsp"  class="nav-link collapsed">
                    <i class="fas fa-fw fa-rocket"></i>
                    <span>관광정보</span>
                </a>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a href="<%=request.getContextPath()%>/admin/jsp/food_board.jsp"  class="nav-link collapsed">
                    <i class="fas fa-fw fa-leaf"></i>
                    <span>맛집정보</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="<%=request.getContextPath()%>/admin/jsp/communityMG.jsp"  class="nav-link collapsed">
                    <i class="fas fa-fw fa-leaf"></i>
                    <span>커뮤니티</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="<%=request.getContextPath()%>/qaList.do">
                    <i class="fas fa-fw fa-desktop"></i>
                    <span>문의게시판</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed"  href="<%=request.getContextPath()%>/admin/jsp/m_noticelist.jsp">
                    <i class="fas fa-fw  fa-check"></i>
                    <span>공지사항</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" href="<%=request.getContextPath()%>/admin/jsp/couponMG.jsp">
                    <i class="fas fa-fw   fa-star"></i>
                    <span>쿠폰</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" href="<%=request.getContextPath()%>/admin/jsp/chatbotMG.jsp">
                    <i class="fas fa-fw  fa-comment"></i>
                    <span>챗봇</span>
                </a>
            </li>
        </ul>
         <!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					<!-- Sidebar Toggle (Topbar) -->
			<%

	
	if(inputId!=null){
		
	

%>

                     <a href="#" class="btn btn-primary  btn-icon-split  mr10" id="btn_logout">
											  <span class="text">로그아웃</span> </a>
<%
	}else{
		
	
%>

  <a href="<%=request.getContextPath() %>/admin/jsp/mglogin.jsp" class="btn btn-primary  btn-icon-split  mr10" id="write">
											  <span class="text">로그인</span> </a>

<%
	}

%>		
					
					
					
					
					
					
					
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>



					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">
						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>

						<!-- Nav Item - Alerts -->
						<!-- <li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> Counter - Alerts
								<span class="badge badge-danger badge-counter">3+</span>
						</a>  --><!-- Dropdown - Alerts -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">Alerts Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-primary">
											<i class="fas fa-file-alt text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 12, 2019</div>
										<span class="font-weight-bold">A new monthly report is
											ready to download!</span>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-success">
											<i class="fas fa-donate text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 7, 2019</div>
										$290.29 has been deposited into your account!
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-warning">
											<i class="fas fa-exclamation-triangle text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 2, 2019</div>
										Spending Alert: We've noticed unusually high spending for your
										account.
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Show All Alerts</a>
							</div></li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						 <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                         
  <%

	if(inputId!=null){

%>
          			    <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=inputId %>님</span>
<%
	}else{
		
	
%>
						  <span class="mr-2 d-none d-lg-inline text-gray-600 small">로그인을해주세요</span>
<%
	}                       
                         
%>                        
                            <img class="img-profile rounded-circle" src="<%=request.getContextPath()%>/admin/img/undraw_profile_3.svg">
                        </a>
						
						 <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 관리자정보수정
								</a>

								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>
					</ul>
				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">공지사항</h1>
					<p class="mb-4">공지사항 관리 페이지입니다.</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">
								noticeList</h6>
						</div>

						<div class="card-body">

							<!--테이블  -->
							<!-- <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                       <a href="write_board">
                                       <tr>
                                            <th>작성일</th>
                                            <th>공지사항제목</th>
                                            
                                        </tr>
                                        </a>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            
                                        </tr>
                                    </tfoot>
                               
                                </table>
								
								                                		
                            </div>
                        </div>
                        <div class="row">
								    <div class="col-sm-12 col-md-6">
								        <div class="dataTables_paginate paging_simple_numbers f-right" id="dataTable_paginate">
								            <ul class="pagination">
								                <li class="paginate_button page-item previous disabled" id="dataTable_previous">
								                    <a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
								                </li>
								                <li class="paginate_button page-item active">
								                    <a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">1</a>
								                </li>
								                <li class="paginate_button page-item ">
								                    <a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">2</a>
								                </li>
								    
								                <li class="paginate_button page-item next" id="dataTable_next">
								                    <a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
								                </li>
								            </ul>
								        </div>
								    </div>
								    
								    
							
								     
						 </div>
						
                    </div>
                  
                    	<a href="<%=request.getContextPath() %>/insertnotice.do" class="btn btn-primary  btn-icon-split  mr10 f-right mb50" id="write">
										  <span class="text">글쓰기</span>
		               </a>
		            
						 

                </div>
                <!-- /.container-fluid -->

						</div>
						<!-- End of Main Content -->

						<!-- Footer -->
						<footer class="sticky-footer bg-white">
							<div class="container my-auto">
								<span>Copyright &copy; Your Website 2023</span>
							</div>
							<div class="btn_wrap">
								<a href="#" class="btn btn-gray  btn-icon-split  mr10"
									id="update"> <span class="text">수정</span>
								</a> <a href="#" class="btn btn-danger btn-icon-split mr10"
									id="delete"> <span class="text">삭제</span>
								</a> <a
									href="<%=request.getContextPath()%>/admin/jsp/m_noticelist.jsp"
									class="btn btn-primary  btn-icon-split  mr10"> <span
									class="text">목록</span>
								</a>
							</div>
						</footer>
						<!-- End of Footer -->
					</div>
					<!-- End of Content Wrapper -->
				</div>
				<!-- End of Page Wrapper -->

				<!-- Scroll to Top Button -->
				<a class="scroll-to-top rounded" href="#page-top"> <i
					class="fas fa-angle-up"></i>
				</a>

				<!-- Logout Modal -->
				<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Ready to
									Leave?</h5>
								<button class="close" type="button" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">Select "Logout" below if you are
								ready to end your current session.</div>
							<div class="modal-footer">
								<button class="btn btn-secondary" type="button"
									data-dismiss="modal">Cancel</button>
								<a class="btn btn-primary" href="login.html">Logout</a>
							</div>
						</div>
					</div>
				</div>

				<!-- Bootstrap core JavaScript -->
				<script src="vendor/jquery/jquery.min.js"></script>
				<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

				<!-- Core plugin JavaScript -->
				<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

				<!-- Custom scripts for all pages -->
				<script src="js/sb-admin-2.min.js"></script>

				<!-- Page level plugins -->
				<script src="vendor/chart.js/Chart.min.js"></script>

				<!-- Page level custom scripts -->
				<script src="js/demo/chart-area-demo.js"></script>
				<script src="js/demo/chart-pie-demo.js"></script>
</body>

</html>


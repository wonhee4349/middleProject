<%@page import="vo.TourismVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>food_board_details</title>

<!-- Custom fonts for this template -->
<link href="<%=request.getContextPath() %>/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath() %>/admin/css/food_board_detail.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/admin/css/layout.css" rel="stylesheet">

<script src="<%=request.getContextPath() %>/admin/js/jquery-3.7.0.min.js"></script>
<script src="<%=request.getContextPath()%>/admin/js/restaurantMG.js"  type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery.serializejson.min.js"  type="text/javascript"></script>
<script>
<%
	TourismVO vo = (TourismVO)request.getAttribute("tourismDetail");

	String inputId = (String)session.getAttribute("LOGINID");

%>
	con = <%=vo.getTr_con()%>.trim();
	
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
                
                
                
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
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
                    
                    
                    
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                   

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                                                    </div>
                            </form>
                        </div>
                    </li>

                    <!-- Nav Item - Alerts -->
              
                            <!-- Counter - Alerts -->
                   
                        </a>
                        <!-- Dropdown - Alerts -->
                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                            <h6 class="dropdown-header">Alerts Center</h6>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-primary">
                                        <i class="fas fa-file-alt text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 12, 2019</div>
                                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-success">
                                        <i class="fas fa-donate text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 7, 2019</div>
                                    $290.29 has been deposited into your account!
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-warning">
                                        <i class="fas fa-exclamation-triangle text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 2, 2019</div>
                                    Spending Alert: We've noticed unusually high spending for your account.
                                </div>
                            </a>
                            <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                        </div>
                    </li>

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
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                	관리자정보수정
                            </a>
                          
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                        </div>
                    </li>
                </ul>
            </nav>
            <!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
				
				<form action="<%=request.getContextPath()%>/updateTourism.do" method="post" enctype="multipart/form-data">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">관광정보</h1>
					<p class="mb-4">관광정보 관리 페이지입니다.</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Tourism Information</h6>
						</div>

						<div class="card-body">
							
							<div class="table-responsive" id="showdetails">
									<table class="table table-bordered sytable" id="dataTable" cellspacing="0">
										<tbody>
										<tr style="display:none;">
											<td class="tds">
												<input type="hidden" name="trNo" value=<%=vo.getTr_no()%>>
											</td>					
										</tr>
										<tr>
											<th class="syths">이름</th>
											<td class="tds">
												<input type="text" name="trName" value=<%=vo.getTr_name() %>>
											</td>					
										</tr>
										<tr>
											<th class="syths">주소</th>
											<td class="tds">
												<input type="text" name="trAddr" value="<%=vo.getTr_addr()%>">
											</td>						
										</tr>
										<tr>
											<th class="syths">전화번호</th>
											<td class="tds">
												<input type="text" name="trTel" value="<%=vo.getTr_tel()%>">
											</td>							
										</tr>
										<tr>
											<th class="syths">위도</th>
											<td class="tds">
												<input type="text" name="trLat" value="<%=vo.getTr_lat()%>">
											</td>							
										</tr>
										<tr>
											<th class="syths">경도</th>
											<td class="tds">
												<input type="text" name="trLong" value="<%=vo.getTr_long()%>">
											</td>					
										</tr>
										<tr>
											<th class="syths">첨부파일</th>
											<td class="tds">
												<input type="file" name="tr_save_file_name" value="<%=vo.getSave_file_name()%>">
											</td>
										</tr>
										<tr>
											<th class="syths">내용</th>
											<td><textarea class="sytext" name="trCon"><%=vo.getTr_con()%></textarea></td>												
										</tr>
										</tbody>
										</table>
							</div>
						
						</div>


					</div>

					<a href="<%=request.getContextPath() %>/admin/jsp/tourismMG.jsp"
						class="btn btn-primary  btn-icon-split  mr10 f-right mb50">
						<span class="text">목록</span>
					</a>
					
					<a href="#">
						<span class="text"><input class="btn btn-primary  btn-icon-split  mr10 f-right mb50 btpd" type="submit" value="저장"></span>
					</a>
					</form>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<span>Copyright &copy; Your Website 2023</span>
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
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript -->
	<script src="<%=request.getContextPath() %>/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript -->
	<script src="<%=request.getContextPath() %>/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages -->
	<script src="<%=request.getContextPath() %>/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="<%=request.getContextPath() %>/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="<%=request.getContextPath() %>/js/demo/chart-area-demo.js"></script>
	<script src="<%=request.getContextPath() %>/js/demo/chart-pie-demo.js"></script>
</body>

</html>


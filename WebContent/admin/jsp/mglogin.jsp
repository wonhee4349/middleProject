<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Login</title>

    <!-- Custom fonts for this template-->
    <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<%=request.getContextPath()%>/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/admin/css/food_board.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/admin/css/layout.css" rel="stylesheet">
    
    <script src="<%=request.getContextPath()%>/admin/js/jquery-3.7.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/admin/js/restaurantMG.js"  type="text/javascript"></script>
    
    <script>
    $(function(){
    	
  
    
    $('#btn_login').on('click',function(e){
    	e.preventDefault(); //a태그 페이지이동 중단  : e.preventDefault() or href="#"해주기
    	

    	
    	
    	$('#spanid').text('')
    	var inputId =$('#id').val().trim();
		var inputPw =$('#password').val().trim();
		
		//불일치 글씨
		$.ajax({
			url:"<%=request.getContextPath()%>/loginMg.do",
			data:{
				"id" : inputId,   
			  	"pw" : inputPw
					},
			type: 'post',
			dataType:'json',
			
			success: function(res){		
				//alert("성공");
				if(res.so=="불일치"){
					//alert("sdfsdf")
					 
					$('#spanid').text(' 아이디 또는 비밀번호를 잘못 입력했습니다.');
					$('#spanid').css('color','red');
					
					
				}else{
					
					window.location.href = "<%=request.getContextPath()%>/admin/jsp/usersMG.jsp"; 
				}
				
				
			},
			error: function(xhr){
				alert("상태:"+xhr.status)
			}
			
		});//ajax 
   
    	});//onclick
    });//$function
    
    
    
    
    
    
    
    
    </script>

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-lg-8 col-md-2">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">로그인</h1>
                                        <p class="mb-4">아이디, 비밀번호 입력하세요</p>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user" style="margin-bottom:10px"
                                                id="id" aria-describedby="emailHelp"
                                                placeholder="아이디">
                                                <input type="password" class="form-control form-control-user"
                                                id="password" aria-describedby="emailHelp"
                                                placeholder="비밀번호">
                                        </div>
                                        <a href="#" id="btn_login" class="btn btn-primary btn-user btn-block"> 로그인
                                        </a>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                      
                                    </div>
                                  <div class="text-center">
                                        <a class="small" href="<%=request.getContextPath() %>/admin/jsp/main_mg.jsp">HOME</a>
                                      
                                    </div> 
                                      <span id="spanid"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>

</html>
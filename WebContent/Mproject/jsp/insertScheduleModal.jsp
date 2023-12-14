<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>일정 추가</title>

<!-- Custom fonts for this template -->
<link href="<%=request.getContextPath() %>/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath() %>/admin/css/food_board_detail.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/admin/css/layout.css" rel="stylesheet">

<script src="<%=request.getContextPath() %>/admin/js/jquery-3.7.0.min.js"></script>
<script src="<%=request.getContextPath()%>/Mproject/js/schedule.js"  type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery.serializejson.min.js"  type="text/javascript"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>



<script>
	
	$(function(){
	  $('.datepicker').datepicker();	
	  
	  $('.datepicker').datepicker({
          dateFormat: 'yy-mm-dd' //Input Display Format 변경
          ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
          ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
          ,changeYear: true //콤보박스에서 년 선택 가능
          ,changeMonth: true //콤보박스에서 월 선택 가능                
          ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
          ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
          ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
          ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
          ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
          ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
          ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
          ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
          ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
          ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
          ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
      });    
	  
	  $('.datepicker').datepicker('setDate', 'today');

	});
	
</script>



</head>
<body id="page-top">
	
	
	<div id="wModal">
		<!-- Page Wrapper -->
		<div id="wrapper">
		
			<!-- Content -->
			<div id="content" class="d-flex flex-column">
		
				<!-- header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">x</button>			
				</div>
				<div class="modal-header">
					<h3 class="modal-title">새 일정</h4>
				</div>
				
				<!-- body -->
				<div class="modal-body">
					<form name="mform" id="mform">
						<input type="hidden" id="scNum" name="scNum">
						
						<label>제목</label>
						<input type="text" class="txt" id="scName" name="scName" placeholder="제목"><br>
						
						<label>날짜</label>
						<input class="datepicker startDate txt" id="sDate" name="sDate"> ~ 
						<input class="datepicker endDate txt" id="eDate" name="eDate">
					</form>
				</div>
				
				<!-- footer -->
				<div class="modal-footer">
					<input type="button" class="" value="만들기">
				</div>
		
			</div>
		</div>
	</div>	

</body>
</html>
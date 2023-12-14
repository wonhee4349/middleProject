/**
 * 
 */

// 커뮤니티 리스트 출력

$.listPageServer = function(cpage) {
	
	vtype = $('#stype option:selected').val();
	vword = $('#sword').val();
	
	sword = $('#sword').val();
	$.ajax({
		url : `${mypath}/communityList.do`,
		type : 'post',
		data : {
			    "cpage" : cpage,
				"sword" : vword
		  },
		success : function(res) {
			code = "";
				code += `<table class="kw_table">`;
            code += `<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="15%">
					<col width="20%">
					</colgroup>
					<tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th></tr>`;
        
         	$.each(res.list, function(i, v){
				code += `<tr><td>${(i+1)}</td><td><a href='/Mproject/jsp/communityDetail.jsp?no=${v.cmt_no}'>${v.cmt_title}</a></td><td>${v.users_name}</td><td>${v.cmt_date}</td><td>${v.cmt_hit}</td></tr>`;
         	});
            
            code += `</table>`;			
            
            $('#showlist').html(code);

			pager = $.pageList(res.sp, res.ep, res.tp, res.size);
			$('#pageList').html(pager);
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	});
}

//페이지 출력
$.pageList = function(sp, ep, tp, size){
	pager = `<div class="pagination">`;
	
	if(sp>size) pager +=`<div class="page_control_prev">
       						 <a href="#" class="btn_end first" id="prevBtn"></a>
   						 </div>`;
	
	pager += `<ol>`;
	for(i=sp; i<=ep; i++){
		if(i==currentPage){
			pager += ` <li class="on">
            			<a href="#" class="pageno">${i}</a>
      					  </li>`;
		}else{
			pager += `<li>
            			<a href="#" class="pageno">${i}</a>
      				  </li>`;
		}
	}
	pager += `</ol>`;
	
	if(ep<tp) pager += `<div class="page_control_next">
     					   <a href="#" class="btn_end last" id="nextBtn"></a>
  						  </div>`;
	pager += `</div>`;
	
	return pager;
}


// 상세 정보 출력

$.communityDetail = function(no) {
	
	$.ajax({
		url : `${mypath}/communityDetail.do`,
		type : 'get',
		data : {
			"no" : no,
		},
		dataType : 'json',
		success : function(res) {
			code = "";
			code +=`<table class="kw_table02" id="ctable">`;
			code += `<colgroup>
					<col width="25%">
					<col width="25%">
					<col width="25%">
					<col width="25%">
					</colgroup>
					<tr><th class="bg_gray">제목</th><th id="cmtTitle">${res.cmt_title}</th><th class="bg_gray">등록일</th><th id="cmtDate">${res.cmt_date}</th></tr>
					<tr><th class="bg_gray">이름</th><th id="usersName">${res.users_name}</th><th class="bg_gray">조회수</th><th id="cmtHit">${res.cmt_hit}</th></tr>
					<tr><th class="bg_gray">내용</th><td colspan="3" class="bg_gray2" id="cmtCon">${res.cmt_con}</td></tr>`;
			code +=`</table>`;
			
			$('#showdetail').html(code);
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		}
	});
}

// 커뮤니티글 삭제

$.communityDelete = function(no) {
	
	$.ajax ({
		url : `${mypath}/communityDelete.do`,
		type : 'get',
		data : {
			"no" : no,
		},
		dataType : 'json',
		success : function(res) {
			if(res.sw == "성공") {
				location.href="/Mproject/jsp/communityList.jsp";
			}
		},
		error : function(xhr) {
			alert(xhr.status);
		}
			
	});
}

// 수정 페이지

$.communityUpdatePage = function(no) {
	
	$.ajax({
		url : `${mypath}/communityDetail.do`,
		type : 'get',
		data : {
			"no" : no,
		},
		dataType : 'json',
		success : function(res) {
			code = "";
			code +=`<table class="kw_table02" id="ctable">`;
			code += `<colgroup>
					<col width="25%">
					<col width="25%">
					<col width="25%">
					<col width="25%">
					</colgroup>
					<tr><th class="bg_gray">제목</th><th><input id="cmtTitle" value="${res.cmt_title}"></th>
					<th class="bg_gray">등록일</th><th id="cmtDate">${res.cmt_date}</th></tr>
					<tr><th class="bg_gray">이름</th><th id="usersName">${res.users_name}</th>
					<th class="bg_gray">조회수</th><th id="cmtHit">${res.cmt_hit}</th></tr>
					<tr><th class="bg_gray">내용</th>
					<td colspan="3" class="bg_gray2"><textarea id="cmtCon" class="con_input">${res.cmt_con}</textarea></td></tr>`;
			code +=`</table>`;
			
			$('#updatedetail').html(code);
		},
		error : function(xhr) {
			alert("상태" + xhr.status);
		}
	});
}

$.communityUpdate = function(no) {
	$.ajax ({
		url : `${mypath}/communityUpdate.do`,
		type : 'post',
		data : {"cmtNo" : no,
				"cmtTitle" : vcmtTitle,
				"cmtCon" : vcmtCon  //,
//				"cmtDate" : vcmtDate,
//				"cmtHit" : vcmtHit,
//				"usersName" : usersName
		},
		dataType : 'json',
		success : function(res) {
			if(res.sw == "성공") {
				
				location.href = "/Mproject/jsp/communityList.jsp"
			}else{
				alert("실패");
			}
		},
		error : function(xhr) {
			alert(xhr.status);
		}
			
	});
}

$.UserlistPageServer = function(cpage, no) {
	
	vtype = $('#stype option:selected').val();
	vword = $('#sword').val();
	
	sword = $('#sword').val();
	$.ajax({
		url : `${mypath}/communityUserList.do`,
		type : 'post',
		data : {
			    "page" : cpage,
				"stype" : vtype,
				"sword" : vword,
				"no" : no
		  },
		success : function(res) {
			code = "";
				code += `<table class="kw_table">`;
            code += `<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="15%">
					<col width="20%">
					</colgroup>
					<tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th></tr>`;
         	
         	$.each(res.datas, function(i, v){
				code += `<tr><td>${(i+1)}</td><td><a href='/Mproject/jsp/communityDetail.jsp?no=${v.cmt_no}'>${v.cmt_title}</a></td><td>${v.users_name}</td><td>${v.cmt_date}</td><td>${v.cmt_hit}</td></tr>`;
         	});
            
            code += `</table>`;			
            
            $('#showUserlist').html(code);

			pager = pageList(res.sp, res.ep, res.tp);
			$('#pageList').html(pager);
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	});
}


/*$.pageList = function(sp, ep, tp, size){
	pager = `<div class="pagination">`;
	
	if(sp>size) pager +=`<div class="page_control_prev">
       						 <a href="#" class="btn_end first" id="prevBtn"></a>
   						 </div>`;
	
	pager += `<ol>`;
	for(i=sp; i<=ep; i++){
		if(i==currentPage){
			pager += ` <li class="on">
            			<a href="#" class="pageno">${i}</a>
      					  </li>`;
		}else{
			pager += `<li>
            			<a href="#" class="pageno">${i}</a>
      				  </li>`;
		}
	}
	pager += `</ol>`;
	
	if(ep<tp) pager += `<div class="page_control_next">
     					   <a href="#" class="btn_end last" id="nextBtn"></a>
  						  </div>`;
	pager += `</div>`;
	
	return pager;
}*/
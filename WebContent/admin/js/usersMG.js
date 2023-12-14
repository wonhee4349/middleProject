/**
 * 
 */

$.usersDetail = function(usersNo){
	
	$.ajax({
		url : `${mypath}/usersDetail.do`,
		type : 'get',
		data : {"usersNo" : usersNo},
		
		dataType : 'json',
		success : function(res){
			code = "";
			
		},// success 끝
		error : function(xhr){
			alert("상태 : "+xhr.status)
		}// error 끝
	})// ajax 끝
}

// ------------------------------------------------------------------------------------
// 회원 리스트 모두 출력하기
$.listPageServer = function(cpage){

	 sword = $('#sword').val();
	
	$.ajax({
		url : `${mypath}/usersMG.do`,
		type : 'get',
		data : {
			"sword" : sword,
			"cpage" : cpage
				},		  
		dataType : 'json',
		success : function(res){
			code = `<table class='table table-bordered' id='dataTable' width='100%' cellspacing='0'>`;
            code += `<thead><a href='write_board'><tr>
                    <th width='10%' style='text-align:center;'>번호</th>
                    <th width='88%' style='text-align:center;'>회원 번호</th></tr></a></thead>
                 	<tbody>`;
         	
         	$.each(res.list, function(i, v){
         		code += `
         			<tr><td style='text-align:center;'>${(i+1)}</td><td ><a href='#' class="usersMG" id=${v.users_no}>${v.users_name}</a></td></tr>
         			`;
         	});
            
            code += `</tbody></table></div>`;

			pager = $.pageList(res.sp, res.ep, res.tp, res.size);
            
            $('#result').html(code);
			$('#pageList').html(pager);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	});
}

// ------------------------------------------------------------------------------------

// 페이지 처리

$.pageList = function(sp, ep, tp, size){
   pager = `<div class="row">
            <div class="col-sm-12 col-md-6">
               <div class="dataTables_paginate paging_simple_numbers f-right" id="dataTable_paginate">
                  <ul class="pagination">`;
   
   if(sp>size){
      pager +=`<li class="paginate_button page-item previous" id="dataTable_previous">
                <a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                   </li>`;
   }
   
   for(i=sp; i<=ep; i++){
      if(i==currentPage){
         pager += ` <li class="paginate_button page-item active pageno">
                     <a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">${i}</a>
                        </li>`;
      }else{
         pager += `<li class="paginate_button page-item pageno">
                     <a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">${i}</a>
                        </li>`;
      }
   }

   if(ep<tp){
      pager +=`<li class="paginate_button page-item next" id="dataTable_next">
                      <a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
                         </li>`;

   }
   
   
   pager += `</ul>
         </div>
         </div>
         </div>`;
   
   return pager;
}


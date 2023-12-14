/**
 * 
 */

$.restaurantDetail = function(trNo){
	
	$.ajax({
		url : `${mypath}/restaurantDetail.do`,
		type : 'get',
		data : {"rsNo" : rsNo},
		
		dataType : 'json',
		success : function(res){
			code = "";
			
		},// success 끝
		error : function(xhr){
			alert("상태 : "+xhr.status)
		}// error 끝
	})// ajax 끝
}

// 맛집 리스트 모두 출력하기 (맛집 정보 첫 페이지)
$.listPageServer = function(cpage){

	 sword = $('#sword').val();
	
	$.ajax({
		url : `${mypath}/restaurantMG.do`,
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
                    <th width='88%' style='text-align:center;'>맛집 이름</th></tr></a></thead>
                 	<tbody>`;
         	
         	$.each(res.list, function(i, v){
         		code += `<tr><td style='text-align:center;'>${(i+1)}</td><td ><a href='${mypath}/admin/jsp/food_board_details.jsp?no=${v.rs_no}' class="restaurantDetailMG">${v.rs_name}</a></td> </tr>`;
         	});
            
            code += `</tbody></table></div>`;

			pager = $.pageList(res.sp, res.ep, res.tp, res.size);
            
            $('#showlist').html(code);
			$('#pageList').html(pager);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	});
}
// 여기서 리스트 목록을 클릭하면 해당하는 맛집의 상세 정보 페이지가 열린다.

// ------------------------------------------------------------------------------------

// 맛집 상세 정보 출력

$.restaurantDetails = function(no){

	$.ajax({
		url : `${mypath}/restaurantDetails.do`,
		type : 'get',
		data : {
			"no" : no
		},
		dataType : 'json',
		success : function(res){
			
			imgcode = `<img src="${mypath}/imageView.do?saveFileName=${res.save_file_name}">`;
			
			code = `<table class="table table-bordered sytable" id="dataTable" cellspacing="0">
					<tbody>
					<tr>
						<th class="syths">맛집 번호</th>
						<td class="tds rsno" id="rsno">${res.rs_no}</td>								
					</tr>
					<tr>
						<th class="syths">이름</th>
						<td class="tds rsname">${res.rs_name}</td>								
					</tr>
					<tr>
						<th class="syths">주소</th>
						<td class="tds rsaddr">${res.rs_addr}</td>								
					</tr>
					<tr>
						<th class="syths">전화번호</th>
						<td class="tds rstel">${res.rs_tel}</td>								
					</tr>
					<tr>
						<th class="syths">위도</th>
						<td class="tds rslat">${res.rs_lat}</td>								
					</tr>
					<tr>
						<th class="syths">경도</th>
						<td class="tds rslong">${res.rs_long}</td>								
					</tr>
					<tr>
						<th class="syths">내용</th>	
						<td><textarea readonly class="sytext rscont">${res.rs_con}</textarea></td>													
					</tr>
					</tbody>
					</table>`;
					
			$('#showdetails').html(code);
			
			$('#rsimage').html(imgcode);
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
		
	});
	
}

// ------------------------------------------------------------------------------------

// 맛집 삭제하기

$.restaurantDelete = function(no){
	
	$.ajax({
		url : `${mypath}/restaurantDelete.do`,
		type : 'get',
		data : {
			"no" : no
		},
		dataType : 'json',
		success : function(res){
			if(res.sw == "성공"){
				/*currentPage = 1;
				$.listPageServer(currentPage);*/
				
				location.href = "../jsp/food_board.jsp";
			}
		},
		error : function(xhr){
			alert(xhr.status);
		}
	});
}

// ------------------------------------------------------------------------------------

// 맛집 수정하기 페이지 -> 수정하기 버튼 누르면 updateRestaurant이 실행된다.

$.restaurantUpdatePage = function(no){
	
	$.ajax({
		url : `${mypath}/restaurantDetails.do`,
		type : 'get',
		data : {
			"no" : no
		},
		dataType : 'json',
		success : function(res){
			
			code = `<table class="table table-bordered sytable" id="dataTable" cellspacing="0">
					<tbody id="mtable">
					<tr style="display:none">
						<th class="syths" style="display:none">맛집 번호</th>
						<td class="tds rsno" id="rsno">${res.rs_no}</td>								
					</tr>
					<tr>
						<th class="syths">이름</th>
						<td class="tds"><input id="rsname" name="rsname" value="${res.rs_name}"></td>								
					</tr>
					<tr>
						<th class="syths">주소</th>
						<td class="tds"><input id="rsaddr" name="rsaddr" value="${res.rs_addr}"></td>						
					</tr>
					<tr>
						<th class="syths">전화번호</th>
						<td class="tds"><input id="rstel" name="rstel" value="${res.rs_tel}"></td>							
					</tr>
					<tr>
						<th class="syths">위도</th>
						<td class="tds"><input id="rslat" name="rslat" value="${res.rs_lat}"></td>							
					</tr>
					<tr>
						<th class="syths">경도</th>
						<td class="tds"><input id="rslong" name="rslong" value="${res.rs_long}"></td>								
					</tr>
					<tr>
						<th class="syths">내용</th>	
						<td class="tds"><textarea id="rscon" name="rscon" >${res.rs_con}</textarea></td>													
					</tr>
					<tr>
						<th class="syths">첨부파일</th>	
						<td class="tds"><input type="file" id="rsimage"></td>													
					</tr>
					</tbody>
					</table>`;
					
			$('#modify').html(code);
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
		
	});
	
}

// ------------------------------------------------------------------------------------

// 맛집 수정 실행
$.updateRestaurant = function(no){
	
	$.ajax({
		url : `${mypath}/restaurantUpdate.do`,
		type : 'post',
		data : {
			"rsno" : vrsno,
			"rsname" : vrsname,
			"rsaddr" : vrsaddr,
			"rstel" : vrstel,
			"rslat" : vrslat,
			"rslong" : vrslong,
			"rscont" : vrscont
		},
		dataType : 'json',
		success : function(res){
			console.log(res)
			if(res.sw == "성공"){
				// 성공이면 본문의 내용으로 수정하기				
				
				
				alert('성공');
				
				location.href = "../jsp/food_board.jsp";
				
			}
		},
		effor : function(xhr){
			alert("상태 : " + xhr.status)
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



























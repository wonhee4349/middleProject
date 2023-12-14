/**
 * 
 */

// 회원정보 출력

$.memberListPage = function(no) {
	$.ajax({
		url : `${mypath}/mypageList.do`,
		type : 'get',
		data : {
			"no" : no
		},
		dataType : 'json',
		success : function(res) {
			code = "";
			code +=`<table class="bbsView kwtable">`;
			code +=`<caption>회원정보</caption>
			<colgroup>
				<col data-member-form="th" style="width: 20%;">
				<col data-member-form="td" style="width: 80%;">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row"><label for="id">회원아이디</label></th>
					<td data-member-form="id" id="id">${res.users_id}
					 <input type="hidden" id="no" value="${res.users_no}">
					
					</td>
					
				</tr>										
				
				<tr>
					<th scope="row"><label for="name">이름</label></th>
					<td class=""data-member-form="name" id="name">${res.users_name}</td>
				</tr>
				<tr>
					<th scope="row"><label for="email">이메일</label></th>
					<td data-member-form="email">${res.users_mail}</td>
				</tr>
				<tr>
					<th scope="row"><label for="gender">성별</label></th>
					<td data-member-form="gender">${res.users_gen}</td>
				</tr>
				<tr>
					<th scope="row"><label for="phone1">연락처</label></th>
					<td data-member-form="phone">${res.users_tel}</td>
				</tr>
				<tr>
					<th scope="row"><label for="addr">주소</label></th>
					<td data-member-form="zip">(${res.users_zip})
					<span data-member-form="addr">${res.users_addr1} ${res.users_addr2}</span></td>`;
					
		code +=`</tr>							
			</tbody>
		</table>`;
			
			$('#showMember').html(code);
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		}
	});
}


// 수정 페이지

$.mypageUpdatePage = function(no) {
	
	$.ajax({
		url : `${mypath}/mypageList.do`,
		type : 'get',
		data : {
			"no" : no,
		},
		dataType : 'json',
		success : function(res) {
			code = "";
			code += `<table class="bbsView">`;
			code += `<caption>정보수정</caption>
			<colgroup>
										<col data-member-form="th" style="width: 20%;" />
										<col data-member-form="td" style="width: 80%;" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><span class="marking">필수항목</span><label
												for="id">회원아이디</label></th>
											<td data-member-form="id">
											<input type="text" id="id" name="users_id" value="${res.users_id}" class="required" title="아이디" readonly/> 
											 <input type="hidden" id="no" value="${res.users_no}">											
												</td>
										</tr>
										<tr>
											<th scope="row"><span class="marking">필수항목</span><label
												for="password">비밀번호</label></th>
											<td data-member-form="pw1">
											<input type="password" id="password" name="users_pw" title="비밀번호" class='required' />
												<em>비밀번호는 5~20자 사이의 영문과 숫자 조합 형태로 입력해 주세요.</em></td>
										</tr>
										<tr>
											<th scope="row"><span class="marking">필수항목</span> <label
												for="password2">비밀번호확인</label></th>
											<td data-member-form="pw" class='required' >
											<input type="password" id="checkpw" name="checkpw"
												title="비밀번호 확인" class="required">
												 <input type="button" id="pwbtn" value="확인" class="button green">
											</td>
										</tr> 
										<tr>
											<th scope="row"><span class="marking">필수항목</span><label
												for="name">이름</label></th>
											<td data-member-form="name">
											<input type="text" id="name" name="users_name" value="${res.users_name}" title="이름" class="required" /></td>
										</tr>
										

										
										<tr>
											<th scope="row"><span class="marking">필수항목</span><label
												for="email">이메일</label></th>
											<td data-member-form="email"><input type="text"
												name="email1" id="email" value="${res.users_mail}" title="이메일 아이디 입력" /> 
												
												</td>
										</tr>
												
										
										
										<tr>
											<th scope="row"><span class="marking">필수항목</span><label
												for="phone1">연락처</label></th>
											<td data-member-form="phone">
											<input type="text" name="users_tel" id="tel" value="${res.users_tel}"
												 maxlength="20"
												title="연락처" />
												<em> 예) 010-1234-1234</em> 
												</td> 	
										</tr>
										
										<tr>
											<th>주소</th>
											<td data-member-form="addr"><span> <input
													type="text" name="users_zip" id="zip" value="${res.users_zip}" title="우편번호" readonly/> <!-- <a
													href="javascript:execDaumPostcode()" class="button green"
													title="클릭시 우편번호 검색 팝업창">우편번호검색</a> -->
													
													<input type="button" id="zipsearch" class="button green" title="클릭시 우편번호 검색 팝업창" 
													onclick="kakaopost()" value="우편번호검색"/> 
													
											</span> <input type="text" name="users_addr1" id="addr1"
												class="inputFull" value="${res.users_addr1}" title="주소" /> 
												
												<input type="text"name="users_addr2" id="addr2" class="inputFull" value="${res.users_addr2}"
												title="상세주소" /></td>
										</tr>`;
			
			
			code += `</tbody></table>`;
			
			$('#updatedetail').html(code);
		},
		error : function(xhr) {
			alert("상태" + xhr.status);
		}
	});
}

$.memberUpdate = function(no) {
	$.ajax ({
		url : `${mypath}/mypageUpdate.do`,
		type : 'post',
		data : {"usersNo" : no,
				"usersId" : vusersId,
				"usersPw" : vusersPw,
				"usersName" : vusersName,
				"usersMail" : vusersMail,
				"usersTel" : vusersTel,
				"usersZip" : vusersZip,
				"usersAddr1" : vusersAddr1,
				"usersAddr2" : vusersAddr2			
		},
		dataType : 'json',
		success : function(res) {
			if(res.sw == "성공") {
				
				location.href = "/Mproject/jsp/mypageMain.jsp"
			}else{
				alert("실패");
			}
		},
		error : function(xhr) {
			alert(xhr.status);
		}
			
	});
}

// 회원 삭제

$.memberDelete = function(no) {
	
	$.ajax ({
		url : `${mypath}/mypageDelete.do`,
		type : 'get',
		data : {
			"no" : no,
		},
		dataType : 'json',
		success : function(res) {
			if(res.sw == "성공") {
				location.href="/Mproject/jsp/main.jsp";
			}
		},
		error : function(xhr) {
			alert(xhr.status);
		}
			
	});
}


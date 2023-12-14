<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page isELIgnored="true" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1">
<meta name="format-detection" content="telephone=no">
<title>대전전시관</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/base.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/common.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/fullpage.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/layout.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/board.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/member.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/swiper.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/contents.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/js/custom.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/main.css?ver=1.2" />
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/slide.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/scroll.js"></script>
<script src="<%=request.getContextPath()%>/Mproject/js/jquery-1.12.2.min.js"></script>
<script src="<%=request.getContextPath()%>/Mproject/js/jquery.serializejson.min.js"  ></script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



<script>

//이메일 체크
function mail_check(){ 
   if($("#tmp_mail").val() == "other"){
      $("#email2").val("");
      $("#email2").prop("disabled", "");
   } else {
      $("#email2").val("");
      $("#email2").val($("#tmp_mail").val());
      $("#email2").prop("disabled", "disabled");
   }
      $("#email3").val($("#email2").val());
}   

$(function(){



   // email1   tmp_mail    email2
   //@아이디 중복검사
   var result1 =false;
   $('#checkid').on('click',function(){
      //입력한 아이디 값을 가져온다 .val
      var inputId= $('#id').val().trim();
      
      
      //입력 했는지 안했는지 비교 
      if(inputId.length < 1){
         alert("id를 입력하세요");
         return false;  //더이상 밑으로 안내려오고 함수끝냄    
      }
      
      //아이디 형식
      if(inputId)
      idreg=/^[a-zA-Z0-9]{5,20}$/
      if(!(idreg.test(inputId))) {
         //규칙과 입력문자가 맞지 않았다.
         alert("id형식 오류입니다");
         return false;  //더이상 밑으로 안내려오고 함수끝냄 
      }
      
      $.ajax({
         url: "<%=request.getContextPath()%>/selectIById.do", 
         data: {"id": inputId} ,    
         type: 'get',
         dataType: 'json',
         success: function(res){
            if(res.sw=="●사용가능한 아이디입니다."){
               $('#spanid').html(res.sw).css('color','green');   
            }else{
               $('#spanid').html(res.sw).css('color','red');
            }            
         },
         error: function(xhr){
            alert("상태: "+xhr.status)
         }
      });//ajax
      
      result1=true
      return result1;
   });//onclick 
   
   
   
   //@비밀번호 확인
   var result2 =false;
   $('#pwbtn').on('click',function(){
      var inputPw= $('#password').val()
      var checkPw=$('#checkpw').val()
      
      if(inputPw.length < 1){
         alert("비밀번호를 입력하세요");
         return false; 
      }
      
      //비밀번호 형식
      /* if(inputPw)
         pwreg=/^[a-zA-Z0-9!@#$%^&*_+[\]?~]{5,20}$/
         
         
      if(!(pwreg.test(inputPw))) {
               //규칙과 입력문자가 맞지 않았다.
         alert("비밀번호형식 오류입니다");
         return false;  //더이상 밑으로 안내려오고 함수끝냄 
      } */
      
      pwreg=/^[a-zA-Z0-9!@#$%^&*_+[\]?~]{5,20}$/;

      if(!pwreg.test(inputPw)) {
          // 규칙과 입력문자가 맞지 않았다.
          alert("비밀번호형식 오류입니다");
          return false;
      }
   
      if(inputPw!=checkPw){
         alert("비밀번호가 다릅니다");
         return false;
      }else{
         alert("비밀번호가 맞습니다");
      }
      result2=true
      return result2;
   });//on click
   
   
   //@우편번호 검색 API
   $('#zipsearch').on('click',function(){
      
        new daum.Postcode({
              oncomplete: function(data) {
                 document.querySelector("#zip").value = data.zonecode;
                  document.querySelector("#addr1").value = data.address;
              }
          }).open();   
   });//onclick
   
   
   
   $('#send').on('click',function(){
      if(result1!=true) {
         alert('아이디 형식이 맞지 않습니다. 다시 입력해주세요'); 
         return false;
         }
      if(result2!=true) {
         alert('비밀번호 형식이 맞지 않습니다. 다시 입력해주세요'); 
         return false;
         }
      //alert("sfds")

      users_id =$('#id').val();
      users_pw =$('#password').val();
      checkPw=$('#checkpw').val();
      users_name =$('#name').val();
      users_bir =$('#bir').val();
      email1 =$('#email1').val();
      email2 =$('#email2').val();
      tmp_mail =$('option:selected',this).val();  //선택메일 
      users_gender =$('input[name="gender"]:checked').val();
      users_tel =$('#tel').val();
      users_zip =$('#zip').val();
      users_addr1 =$('#addr1').val();
      users_addr2 =$('#addr2').val();

      if(users_name.length < 1){
          alert("이름를 입력하세요");
          return false; 
       }

       if(users_bir.length < 1){
          alert("생일을 입력하세요");
          return false;  
       }
       if(email1.length < 1){
          alert("이메일을 입력하세요");
          return false;  
       }

       if (!users_gender) {
           alert("성별을 입력하세요");
           return false;
       }
       if(users_tel.length < 1){
          alert("연락처를 입력하세요");
          return false;  
       }
       if(users_zip.length < 1){
          alert("우편번호를 입력하세요");
          return false;     
       }
       if(users_addr1.length < 1){
          alert("주소를 입력하세요");
          return false;  
       }
       if(users_addr2.length < 1){
          alert("주소를 입력하세요");
          return false;  
       }


      
      
      
      //alert(users_gender);
      $.ajax({
         url:"<%=request.getContextPath()%>/joinMember.do",
         data: 
            {
             "users_id" : users_id,
              "users_pw":users_pw,
              "users_name":users_name,
               "users_bir":users_bir,
               "email1":email1,
               "email2":email2,
               "tmp_mail":tmp_mail,
               "users_gender":users_gender,
                "users_tel":users_tel,
                "users_zip":users_zip,
                "users_addr1":users_addr1,
               "users_addr2":users_addr2
            },   
         type: 'post',
         dataType:'json',
         success: function (res) {
            
            if(res.so=="가입실패"){
               
               $('#spanid2').text('●가입실패! 다시 작성해주세요');
               $('#spanid2').css('color','red');
               
            }else{
            	   alert("회원가입 완료!");
                   window.location.href="<%=request.getContextPath()%>/Mproject/jsp/main.jsp"
            }

         },
         error: function(xhr){
            alert("상태:"+xhr.status)
            
         }        
      });//ajax
   });//onclick
   

   
})
  </script>
</head>

<body class="main">
   <ul id="skip_navi">
      <li><a href="#content">본문 바로가기</a></li>
      <li><a href="#gnb">메인메뉴 바로가기</a></li>
   </ul>
   <div id="wrap">
      <header id="header" class="mob on">
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
               <a href="<%=request.getContextPath()%>/Mproject/jsp/login.jsp">로그인</a> 
               <a href="<%=request.getContextPath()%>/Mproject/jsp/join.jsp">회원가입</a> 
               
            </div>

         </div>
      </header>
      <div class="area_subVisual">
         <div style="background-image: url(../images/m01.jpg);"></div>
         <div class="subTit">
            <div>
               <h2 data-aos="fade-up">회원가입</h2>
            </div>
            <div>
               <i data-aos="fade-up" data-aos-delay="350">우리 도시 대전</i>
            </div>
         </div>
      </div>
      <section id="container">
         <div id="content">
            <article class="area_member area_reserve">
               <div class="wrap">
               
                  <form method='post'  name="join"  onsubmit="" action="<%=request.getContextPath()%>/joinMember.do">
                     <input type="hidden" name="mode" value="join_proc" /> <input
                        type="hidden" name="no" value="" /> <input type="hidden"
                        name="email3" value="" id="email3" /> <input type="hidden"
                        name="step" value="3" id="step" />
                     <div class="join_area">
                        <h2>
                           <i>회원가입</i>
                        </h2>
                        <p>회원가입에 필요한 정보를 입력해주세요.</p>
                        <table class="bbsView">
                           <caption>회원가입</caption>
                           <colgroup>
                              <col data-member-form="th" style="width: 20%;" />
                              <col data-member-form="td" style="width: 80%;" />
                           </colgroup>
                           <tbody>
                              <tr>
                                 <th scope="row"><span class="marking">필수항목</span><label
                                    for="id">회원아이디</label></th>
                                 <td data-member-form="id">
                                 <input type="text" id="id" name="users_id" value="" class="required" title="아이디" /> 
                                  
                                  <input type="button" id="checkid" name="users_id" value="중복검사" class="button green">
                                    <em>한글, 특수문자를 제외한 5~20자까지의 영문 또는 숫자로 입력해주세요.</em>            
                                     <span id="spanid"></span>
                                    </td>
                              </tr>
                              <tr>
                                 <th scope="row"><span class="marking">필수항목</span><label
                                    for="password">비밀번호</label></th>
                                 <td data-member-form="pw1">
                                 <input type="password" id="password" name="users_pw" title="비밀번호" class='required' />
                                    <em>비밀번호는 5~20자 사이의 영문 또는 숫자 조합 형태로 입력해 주세요.</em></td>
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
                                 <input type="text" id="name" name="users_name" value="" title="이름" class="required" /></td>
                              </tr>
                              
                              
                              <tr>
                                 <th scope="row"><span class="marking">필수항목</span><label
                                    for="name">생일</label></th>
                                 <td data-member-form="name">
                                 <input type="date"  id="bir" name="users_bir"  class="required"> </td>
                              </tr>
                              
                              <tr>
                                 <th scope="row"><span class="marking">필수항목</span><label
                                    for="email">이메일</label></th>
                                 <td data-member-form="email"><input type="text"
                                    name="email1" id="email1" value="" title="이메일 아이디 입력" /> 
                                    
                                    @ <select name="tmp_mail" id="tmp_mail"
                                    onchange="javascript:mail_check();" class="input200"
                                    title="이메일 주소 선택">
                                       <option value="">선택하세요</option>
                                       <option value="naver.com">naver.com</option>
                                       <option value="daum.net">daum.net</option>
                                       <option value="hanmail.net">hanmail.net</option>
                                       <option value="hotmail.com">hotmail.com</option>
                                       <option value="gmail.com">gmail.com</option>
                                       <option value="other">직접입력</option>
                                 </select> <input type="text" name="email2" value="" id="email2"
                                     title="이메일주소 직접입력" /></td>
                              </tr>
                                    
                              
                              <tr>
                                 <th scope="row"><label for="gender" name="gender" id="gender">성별</label></th>
                                 <td data-member-form="gender" aria-labelledby="gender">
                                    <div class="designRadio" role="radiogroup">
                                       <input type="radio" name="gender" id="gender" value="남"
                                          > <label for="genderM">남성</label> <input
                                          type="radio" name="gender" id="gender" value="여">
                                       <label for="genderF">여성</label>
                                    </div>
                                 </td>
                              </tr>
                              <tr>
                                 <th scope="row"><span class="marking">필수항목</span><label
                                    for="phone1">연락처</label></th>
                                 <td data-member-form="phone"><!-- <select name="phone1"
                                    id="phone" class="input100" title="연락처 앞자리 선택">
                                       <option value="010">010</option>
                                 </select>  -->
                                 <input type="text" name="users_tel" id="tel" value=""
                                    title="연락처 처음" maxlength="13"
                                    title="연락처" />
                                     <!-- class="input100 required" -->
                                    <em>예) 010-1234-1234</em>
                                      
                                 <!-- -<input type="text" name="phone2" id="phone2" value=""
                                    title="연락처 중간자리" maxlength="4" class="input100 required"
                                    title="연락처" /> - 
                                    <input type="text" name="phone3"
                                    id="phone3" value="" title="연락처 끝자리" maxlength="4"
                                    class="input100 required" title="연락처" />  -->
                                    <!-- <em>해당 연락처는 아이디 비밀번호 찾기시 이용합니다.</em> -->  </td>
                              </tr>
                              <tr>
                                 <th>주소</th>
                                 <td data-member-form="addr"><span> <input
                                       type="text" name="users_zip" id="zip" value="" title="우편번호" readonly/> <!-- <a
                                       href="javascript:execDaumPostcode()" class="button green"
                                       title="클릭시 우편번호 검색 팝업창">우편번호검색</a> -->
                                       
                                       <input type="button" id="zipsearch" class="button green" title="클릭시 우편번호 검색 팝업창" 
                                       onclick="kakaopost()" value="우편번호검색"/> 
                                       
                                 </span> <input type="text" name="users_addr1" id="addr1"
                                    class="inputFull" value="" title="주소" /> 
                                    
                                    <input type="text"name="users_addr2" id="addr2" class="inputFull" value=""
                                    title="상세주소" /></td>
                              </tr>
                              
                           </tbody>
                        </table>
                        <div class="btn_area">
                           <button type="button"  class="button lg black" id="send" name="send" value="회원가입" >회원가입</button>
                           <span id="spanid2"></span>
                        </div>
                     </div>
                  </form>
               </div>
            </article>
         </div>
      </section>
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
        
      </footer>
   </div>rid
   <script>
    AOS.init();
  </script>
</body>
</html>

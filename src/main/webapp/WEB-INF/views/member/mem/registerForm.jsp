<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

         <!-- App css -->
        <link href="/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="/resources/assets/css/app.min.css" rel="stylesheet" type="text/css" id="light-style" />
        <link href="/resources/assets/css/app-dark.min.css" rel="stylesheet" type="text/css" id="dark-style" />
   
<script type="text/javascript">
console.log("test1");
function callContents() {
	console.log("test2");
	$('#memId').val('gkwjddn123');
	$('#memPw').val('Qqwe123!');
	$('#Re-memPw').val('Qqwe123!');
	$('#memNm').val('하정우');
	$('#memZipcode').val('123456');
	$('#memAddr1').val('대전광역시 서구 관저동');
	$('#memAddr2').val('리슈@123동123호');
	$('#memPh').val('01011114567');
	$('#memEm').val('gkwjddn123@naver.com');
	
}


function f_hr(){
	// 전송전에 하고 싶은 기능이 있으면 여기에 작성
	return true;
}

function nopro(ele, str){
	let vs = $(ele).parents('.form-group').find('.sp');
	$(vs).html(str).css('color','red').css('font-size', '12px');
	
}

function okpro(ele){
	let vs = $(ele).parents('.form-group').find('.sp');
	$(vs).empty();
	
	$('<img>', {
		'src' : '/resources/assets/images/check.png',
		'width' : '16px',
		'height' : '16px'
	}).appendTo(vs);
}



//실시간 id중복체크
$(function(){
	$('#memId').on('keyup',function(){
		//공백체크
		let idValue = $('#memId').val().trim(); //입력한 id의 앞뒤 공백 제거 후 변수에 담음
		//아이디 입력란이 공백이면 빨간색 도움말이 초기화
		if(idValue.length < 1){
			$('#checkResult').text('');
// 			$('#checkResult').html("아이디를 작성해주세요.").css('color','red');
			return;
		}

		//id체크 정규식 (regular Expression, regex)
		regid = /^[a-zA-Z][a-zA-Z0-9]{5,}$/;	//영문으로 시작, 숫자-영문으로 구성된 1+3~7자릿수의 문자열
		
		//1단계 : validation 통과여부
		if(regid.test(idValue)){	//통과
			let vs = $('#memId').parents('.form-group').find('.sp');
			$(vs).empty();
			
			//2단계 : 아이디 체킹
			$.ajax({
				type:"get",
				url : '/idCheck',	
				data : {memId : $('#memId').val()},
				success : function(checkResult){
	 					if(checkResult == 0){
	 						$('#checkResult').text('사용가능한 아이디입니다.').css('color','green').css('font-size', '12px');
	 				}else{
	 					$('#checkResult').text('사용불가능한 아이디입니다.').css('color','red').css('font-size', '12px');
	 				}
				},
			});
		}else{	//validation 실패
			nopro(this, "영문+숫자로 된 6자리이상 입력가능");
			$('#checkResult').text('');
		}
	});
	
	
	
	//비밀번호
	$('#memPw').on('keyup',function(){
		let passValue = $(this).val().trim();

		let regpass = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		if(regpass.test(passValue)){
			okpro(this);
		}else{
			nopro(this,"대/소문자, 특수문자, 숫자가 포함된 8자리 이상만 입력가능");
		}
	});
	

	//비밀번호 일치 검사
	$(function(){
		$('#Re-memPw').keyup(function(){
			if($('#memPw').val()!=$('#Re-memPw').val()){
				$('font[name=check]').text('');
			    $('font[name=check]').html("비밀번호가 일치하지 않습니다.");
			}else{
				$('font[name=check]').text('');
			    $('font[name=check]').html("일치하는 비밀번호입니다.").css('color','green');
			}
		});
	});

	// 이름
	$('#memNm').on('keyup',function(){
		let nameValue = $(this).val().trim();
	
		if(nameValue.length < 1){
			nopro(this, "이름을 입력하세요");
			return;
		}
	
		let regname = /^[가-힣]{2,5}$/;
		if(regname.test(nameValue)){
			okpro(this);
		}else{
			nopro(this,"한글 2~5자리만 입력 가능");
		}
	});
	
	//전화번호
	$('#memPh').on('keyup',function(){
		let hpValue = $(this).val().trim();

		let reghp = /^[0-9]{3}[0-9]{3,4}[0-9]{4}$/;
		if(reghp.test(hpValue)){
			okpro(this);
		}else{
			nopro(this,"01012341234 형식으로 입력");
		}
	});
	
	//이메일
	$('#memEm').on('keyup',function(){
		let mailValue = $(this).val().trim();

		let regmail = /^[0-9a-zA-Z]+@[0-9a-zA-Z]+(\.[a-z]+){1,2}$/;
		if(regmail.test(mailValue)){
			okpro(this);
		}else{
			nopro(this,"올바른 형식이 아닙니다");
		}
	});


});



</script>


<body class="loading authentication-bg">

    <div class="account-pages mt-5 mb-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5">
                    <div class="card">
                        <!-- Logo-->
<!--                         <div class="card-header pt-3 pb-3 text-center bg-primary"> -->
<!--                             <a href="/views/index.html"> -->
<!--                                 <span><img src="/resources/assetsimages/logo.png" alt="" height="18"></span> -->
<!--                             </a> -->
<!--                         </div> -->

                        <div class="card-body p-3" style="border:1px solid; border-radius: 0.5em;">
                            
                            <div class="text-center w-60 m-auto">
                                <h4 class="text-dark-50 text-center mt-0 font-weight-bold"><a href="#" onclick="callContents();">회원가입</a></h4>
                                <p class="text-muted mb-4">계정을 만들어주세요. </p>
                            </div>

                            <form:form class="user" method="post" action="/registerPost" modelAttribute="member" onsubmit="return f_hr()">

							<input type="hidden" name="memIdx" value="" />
							<input type="hidden" name="memDvsn" value="" />
							<input type="hidden" name="memStart" value="" />
							<input type="hidden" name="memEnd" value="" />
							<input type="hidden" name="memPicture" value="" />
							<input type="hidden" name="memPoint" value="" />
							<input type="hidden" name="memDnreason" value="" />
							

                                <div class="form-group">
                                    <form:label path="memId" for="memId">ID</form:label>
                                    <form:input class="form-control " path="memId" id="memId" placeholder="영문+숫자로 된 6자리이상의 아이디 입력"  required="required"/>
                                    <span id="checkResult"></span>
                                    <span class="sp"></span>
                                </div>
							

                                <div class="form-group">
                                    <form:label path="memPw" for="memPw">비밀번호</form:label>
                                    <form:input path="memPw" type="password" id="memPw" class="form-control" placeholder="비밀번호 입력" required="required"/>
                                    <span class="sp"></span>
                                </div>
							

                                <div class="form-group">
                                    <form:label path="memPw" for="memPw">비밀번호 확인</form:label>
                                    <input type="password" id="Re-memPw" class="form-control" placeholder="비밀번호 확인" required="required"/>
                                    <span class="sp"></span>
<!--                                     <font color="red" size="1" id="memPwFont" style="display: none;"></font> -->
									<font name="check" size="2" color="red"></font> 
                                </div>


                                <div class="form-group">
                                    <form:label path="memNm" for="memNm">이름</form:label>
                                    <form:input path="memNm" class="form-control"  name="memNm" id="memNm" placeholder="이름 입력" required="required"/>
                                    <span class="sp"></span>
                                </div>
                                

								<div class="form-group style=" style="margin-bottom: -3;">
                                    <form:label path="memZipcode" for="memZipcode">주소</form:label>
                                </div>

                                <div class="form-group row" style="margin-bottom: auto;">
		                                <div class="form-group col-sm-6 mb-3 mb-sm-0">
		                                    <input path="memZipcode" class="form-control" name="memZipcode"  id="memZipcode" placeholder="우편번호를입력" required="required"/>
		                                </div>
		                            <div class="col-sm-6">
		                                <div class="form-group">
 		                                    <input type="button" class="btn btn-primary " onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
 		                                </div>
 		                             </div> 
 		                             
 		                        </div> 
 		                        
 		                        

                                <div class="form-group">
                                    <form:input path="memAddr1" class="form-control"  id="memAddr1" placeholder="주소를 입력해주세요" required="required"/>
                                </div>

                                <div class="form-group">
                                    <form:input path="memAddr2" class="form-control"  id="memAddr2" placeholder="상세주소를 입력해주세요"/>
                                </div>
                                    <input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
                                
                                
                                


                                <div class="form-group">
                                    <form:label path="memPh" for="memPh">전화번호</form:label>
                                    <form:input path="memPh" class="form-control"  id="memPh" placeholder="전화번호 입력" required="required"/>
                                    <span class="sp"></span>
                                </div>
                                <div class="form-group">
                                    <form:label path="memEm" for="memEm">이메일</form:label>
                                    <form:input path="memEm" class="form-control" type="email" id="memEm" placeholder="이메일 주소 입력" required="required"/>
                                    <span class="sp"></span>
                                </div>

                               
								 <div class="form-group row">
	                                <div class="col-sm-6 mb-3 mb-sm-0 text-center ">
	                                    <input class="btn btn-primary" type="submit" id="idSubmit" value="가입요청" >
	                                </div>
	                                <div class="col-sm-6 text-center ">
	                                   <input class="btn btn-primary" onclick="location.href='/loginForm';" type="button" id="back_Btn" value="가입취소">
	                                </div>
	                             </div>

                            </form:form>
                        </div> <!-- end card-body -->
                    </div>
                    <!-- end card -->

                    <div class="row mt-3">
                        <div class="col-12 text-center">
                            <p class="text-muted">회원가입이 되어있습니까?<a href="/loginForm" class="text-muted ml-1"><b>로그인</b></a></p>
                        </div> <!-- end col-->
                    </div>
                    <!-- end row -->

                </div> <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </div>
    <!-- end page -->
    
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
            	
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

            	console.log(data);
            	
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('memZipcode').value = data.zonecode;
                document.getElementById("memAddr1").value = addr;
                
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("memAddr2").focus();
            }
        }).open();
    }
</script>

        <tiles:insertAttribute name="footer" />

        <!-- bundle -->
		<script src="/resources/assets/js/vendor.min.js"></script>
        <script src="/resources/assets/js/app.min.js"></script>

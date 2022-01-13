<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script src="/resources/assets/js/jquery-3.6.0.js"></script>

<!-- App css -->
        <link href="/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="/resources/assets/css/app.min.css" rel="stylesheet" type="text/css" id="light-style" />
        <link href="/resources/assets/css/app-dark.min.css" rel="stylesheet" type="text/css" id="dark-style" />
        

<script type="text/javascript">



</script>

<script src="https://www.google.com/recaptcha/api.js"></script>
<script>

$(function() {
$('#idLogin').click(function() {
	 // 아이디가 없는 경우 "일치하는 회원이 없음"표시
	 // 아이디가 있지만 승인되지 않은 회원일 경우 "미승인 회원입니다"
	$.ajax({
		type:"get",
		url : '/idCheck',	//MemberController의 url Mapping
		data : {memId : $('#memId').val()},
		success : function(checkResult){
			if(checkResult == 0){
				$('#checkResult').text('없는 회원입니다.').css('color','red').css('font-size', '12px');
// 			}else if(dbmemberVO.getMemDvsn().equals("1")){
// 				$('#checkResult').text('미승인 회원입니다.').css('color','red').css('font-size', '12px');
// 			}else{
// 				return true;
			}
		},
		error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		},
		dataType : 'json'
	});
	
	
	
	if($("#memId").val()=="" ){
		 alert("아이디를 입력해주세요");
		 document.querySelector("#memId").focus();
		 return false;
	 }
	 if($("#memPw").val()==""){
		 alert("비밀번호를 입력해주세요");
		 document.querySelector("#memPw").focus();
		 return false;
	 }
	
		var captcha = 1;
		$.ajax({
            url: '/VerifyRecaptcha',
            type: 'post',
            data: {
                recaptcha: $("#g-recaptcha-response").val()
            },
            success: function(p_data) {
//             	alert("하는데"+p_data+"ppp");
            	p_data = p_data -0;
                switch (p_data) {
                    case 0:
                        console.log("자동 가입 방지 봇 통과");
                        captcha = 0;
                        $("#frm")[0].submit();
                		break;
                    case 1:
                        alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
                        break;
                    default:
                        alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + p_data + "]");
                   		break;
                }
            },
            error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
// 		if(captcha != 0) {
// 			return false;
// 		} 
	});
});

</script>
<body class="loading authentication-bg" data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":false, "leftSidebarScrollable":false,"darkMode":false, "showRightSidebarOnStart": true}'>
<%
//요청할 때마다 request객체에 cookie가 함께 던져짐
Cookie[] cookies = request.getCookies();
String memId = "";
    		
if(cookies!=null){
	for(int i=0;i<cookies.length;i++){
		if(cookies[i].getName().equals("memId")){
// 			out.print("쿠키 : " + cookies[i].getName());
// 			out.print("쿠키값 : " + cookies[i].getValue());
			memId = cookies[i].getValue();
		}
	}
}
%>
<c:set var="memId" value="<%=memId %>"/>
    <div class="account-pages mt-5 mb-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5">
                    <div class="card">

                        <!-- Logo -->
                        <div class="card-header pt-4 pb-4 text-center bg-primary" style="background-color: #fff !important;">
                            <a href="index.html">
                                <span><img src="/resources/assets/images/microApple.png" alt="" height="60"></span>
                            </a>
                        </div>

                        <div class="card-body p-4">
                            
                            <div class="text-center w-60 m-auto">
                                <h4 class="text-dark-50 text-center mt-0 font-weight-bold">로그인</h4>
                                <p class="text-muted mb-4">승인된 아이디와 비밀번호를 입력해주세요.</p>
                            </div>

                            <form:form class="user" id="frm" method="post" action="/login" modelAttribute="member">
                            
	                         	<input type="hidden" name="memIdx" value="0" />
	                            <input type="hidden" name="memNm" value="0" />
	                            <input type="hidden" name="memEm" value="0" />
	                            <input type="hidden" name="memPh" value="0" />  
	                            <input type="hidden" name="memZipcode" value="0" />  
	                            <input type="hidden" name="memAddr1" value="0" />  
	                            <input type="hidden" name="memAddr2" value="0" />  
	
	                                <div class="form-group">
	                                    
	                                    <a href="javascript:void(0);"class="text-muted float-right"><small>아이디찾기</small></a>
	                                    
	                                    <form:label path="memId" for="memId">ID</form:label>
	                                    <form:input path="memId" class="form-control" id="memId" value="${memId }" placeholder="아이디를 입력해주세요" required="required"/>
	                                    <span id="checkResult"></span>
	                                </div>
	
	                                <div class="form-group">
	                                    <a href="javascript:void(0);"class="text-muted float-right"><small>비밀번호찾기</small></a>
	                                    <form:label path="memPw" for="memPw">Password</form:label>
	                                    <div class="input-group input-group-merge">
	                                        <form:password path="memPw" id="memPw" class="form-control" required="required" placeholder="비밀번호를 입력해주세요" />
	                                        <span id="checkResult"></span>
	                                        <div class="input-group-append" data-password="false">
	<!--                                             <div class="input-group-text"> -->
	<!--                                                 <span class="password-eye"></span> -->
	<!--                                             </div> -->
	                                        </div>
	                                    </div>
	                                	<c:if test="${loginFail!=''}">
											<font color="red" size="1">${loginFail}</font>
	                                    </c:if>
	                                </div>
	
	                                <div class="form-group mb-3">
	                                    <div class="custom-control custom-checkbox">
	                                        <input type="checkbox" class="custom-control-input" name="customCheck" id="customCheck" checked>
	                                        <label class="custom-control-label" for="customCheck">아이디 기억하기</label>
	                                    </div>
	                                </div>
	                                <div class="form-group">
	                                	<div class="g-recaptcha" data-sitekey=6LcRNWodAAAAACmWFLmRXgrltcXlRtjkKG-0gHmm></div>
	                                </div>
	                                
	                                
	
	                                <div class="form-group mb-0 text-center">
	                                    <input class="btn btn-primary" type="button" id="idLogin" value="로그인"/>
	<!--                                     <button class="btn btn-primary" type="submit"> Log In </button> -->
	                                </div>

                            </form:form>
                        </div> <!-- end card-body -->
                    </div>
                    <!-- end card -->

                    <div class="row mt-3">
                        <div class="col-12 text-center">
                            <p class="text-muted">아이디/비밀번호가 없습니까?<a href="/registerForm" class="text-muted ml-1"><b>회원가입</b></a></p>
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->

                </div> <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </div>
    <!-- end page -->


 <tiles:insertAttribute name="footer" />

        <!-- bundle -->
		<script src="/resources/assets/js/vendor.min.js"></script>
        <script src="/resources/assets/js/app.min.js"></script>



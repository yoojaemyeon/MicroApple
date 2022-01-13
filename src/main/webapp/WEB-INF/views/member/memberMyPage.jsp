<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
var sel_file;

function handleImgFileSelect(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e){
			$("#img").attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
	});
}

$(function(){
	$("#hi2").on("change",handleImgFileSelect);
	
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
	
	//수정 버튼 클릭을 하면 수정모드가 됨
	$("#idUpdate").on("click",function(){
		//수정 가능하도록 함
		$("input").removeAttr("readonly");
		$("input").removeAttr("disabled");
		$("#hi1").removeAttr("hidden");
		$("#image_contailner").removeAttr("hidden");
		//단, 사원번호는 수정할 수 없음
		$("#memIdx").attr("readonly", "readonly");
		$("#memId").attr("readonly", "readonly");
		$("#memStart").attr("readonly", "readonly");
		
		$("#divEdit").css("display","none");
		$("#divConfirm").css("display","");
	});
	//취소 버튼 클릭을 하면 보기모드가 됨
	$("#idCancel").on("click",function(){
		$("input").attr("readonly","readonly");
		$("#addressSearch").attr("disabled", "disabled");
		$("#hi1").attr("hidden", "hidden");
		$("#idFont").attr("display", "none");
		$("#image_contailner").attr("hidden", "hidden");
		
		$("#divEdit").css("display","");
		$("#divConfirm").css("display","none");
	});
	//확인 버튼 클릭 시 직원 정보를 수정
	$("#idOk").on("click",function(){
		//비밀번호 확인 처리
  			if($("#memPw").val()==$("#Re-memPw").val()){
   			//폼을 submit함
   			$(".member").submit();    				
// 		alert("확인버튼");
  			}else{
  				//모달창의 내용을 변경
  				$(".modal-body").html("비밀번호가 다릅니다.");
  				//모달창을 보여주는 구문
  				$("#myModal").modal("show");
  				
  				$("#idFont").css("display","block");
  			}
	});
});
	</script>
<body class="loading" data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":false, "leftSidebarScrollable":false,"darkMode":false, "showRightSidebarOnStart": true}'>
	
	
	
	
	
	<div class="account-pages mt-3">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="card">

                        <div class="card-body p-3">
                            
                            <div class="text-center w-60 m-auto">
                                <h4 class="text-dark-50 text-center mt-0 font-weight-bold">${member.memNm} 정보</h4>
                            </div>

							<form:form class="member"  modelAttribute="member" method="post" action="/memberMyPagePost" enctype="multipart/form-data">


								<div class="page-aside-left">

									<div class="card-body">
<%-- 										<img  src="/resources/images/profile/${member.memPicture}" onerror="this.src ='/resources/images/pro.jpg'" --%>
										<img  src="/resources/images/profile/${member.memPicture}" 
												 class="Square avatar-lg img-thumbnail" alt="profile-image" style="width: 150px; height: 180px;">
										
										<div style="text-align: center;">
											<h4 class="mb-0 mt-2">${member.memNm}</h4>
											<p class="text-muted font-14">${member.positionNm}</p>
		
										</div>
										<label path="memIdx"  id="hi1" for="hi2" class="btn btn-info" style="width: 150px;" hidden>프로필 사진 수정</label>
										<input type="file" id="hi2" name="multipartFile" style="display: none;"  onchange="setImage(event);" />
<!-- 										<input id="memIdxPhoto" name="memIdxPhoto" type="file" onchange="setImage(event);"> -->
										
									</div>
									
									<div id="image_contailner"  class="image_contailner" hidden> 
										<p style="text-align: center; margin-bottom: -5px;">프로필 사진 미리보기</p>	
										<img id="img"  style="width:200px; height:230px; border:0px;" onerror="this.style.display='none'">
									</div>
									
									
		
		
								</div>
						
						
								<div class="page-aside-right">
	                                <div class="form-group">
	                                    <form:label path="memIdx" for="memIdx">사원번호</form:label>
	                                    <form:input name="memIdx" id="memIdx" class="memIdx form-control " path="memIdx"  value="${member.memIdx}" readonly="true"/>
	                                </div>
								
	                                <div class="form-group">
	                                    <form:label path="memId" >ID</form:label>
	                                    <form:input class="form-control " path="memId" id="memId" name="memId" value="${member.memId}" readonly="true"/>
	                                </div>
								
	
	                                <div class="form-group">
	                                    <form:label path="memNm" for="memNm">이름</form:label>
	                                    <form:input path="memNm" class="form-control" value="${member.memNm}"  name="memNm" id="memNm" readonly="true" />
	                                    <span class="sp"></span>
	                                </div>
	                                
	                                <div class="form-group">
	                                    <form:label path="memEm" for="memEm">이메일</form:label>
	                                    <form:input path="memEm" class="form-control" type="email" id="memEm"  value="${member.memEm}" readonly="true"/>
	                                    <span class="sp"></span>
	                                </div>
	                             
	                             
	
									<div class="form-group style=" style="margin-bottom: -3;">
	                                    <form:label path="memZipcode" for="memZipcode">주소</form:label>
	                                </div>
	
	                                <div class="form-group row" style="margin-bottom: auto;">
			                                <div class="form-group col-sm-6 mb-3 mb-sm-0">
			                                    <form:input path="memZipcode" value="${member.memZipcode}" class="form-control" name="memZipcode"  id="memZipcode" readonly="true" />
			                                </div>
			                            <div class="col-sm-6">
			                                <div class="form-group">
	 		                                    <input type="button" id="addressSearch" class="btn btn-primary " onclick="sample6_execDaumPostcode()" value="주소찾기" disabled="true"><br>
	 		                                </div>
	 		                             </div> 
	 		                             
	 		                        </div> 
	 		                        
	 		                        
	
	                                <div class="form-group">
	                                    <form:input path="memAddr1" class="form-control" value="${member.memAddr1}"  id="memAddr1"  readonly="true"/>
	                                </div>
	
	                                <div class="form-group">
	                                    <form:input path="memAddr2" class="form-control" value="${member.memAddr2}"  id="memAddr2" readonly="true" />
	                                </div>
	                                    <input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
	                                
	
	
	                                <div class="form-group">
	                                    <form:label path="memPh" for="memPh">전화번호</form:label>
	                                    <form:input path="memPh" class="form-control"  id="memPh" value="${member.memPh}"  readonly="true"/>
	                                    <span class="sp"></span>
	                                </div>
	                                
	                                
									<div class="form-group">
	                                    <form:label path="memStart" for="memStart">입사날짜</form:label>
	                                    <form:input path="memStart" class="form-control" value="${member.memStart}"  name="memStart" id="memStart" readonly="true" />
	                                    <span class="sp"></span>
	                                </div>
									
									
									<div class="form-group row">
	                                    <div class="col-sm-6">
	                                    	<label path="memStart" for="memStart">비밀번호 확인</label>
	                                        <input type="password" id="Re-memPw" class="form-control form-control-user"
	                                            placeholder="비밀번호 확인 후 수정이 가능합니다." readonly="true"/>
	                                        <font color="red" size="1" id="idFont" style="display:none;">
		                                    	비밀번호가 다릅니다.
		                                 	</font> 
	                                    </div>
	                                    <div class="col-sm-6 mb-3 mb-sm-0">
	                                        <form:input hidden="hidden" path="memPw" id="memPw" value="${member.memPw}" class="form-control form-control-user"
	                                            placeholder="비밀번호" readonly="true" />
	                                        <font color="red" size="1">
	                                    		<errors path="memPw"/>
	                                    	</font>
	                                    </div>
	                                </div>
	                                
	                             
	                                
	                                <div hidden class="form-group">
	                                    <input path="memDvsn" class="form-control" id="memDvsn" name="memDvsn" value="${member.memDvsn}"/>
	                                    <input path="memEnd" class="form-control" id="memEnd" name="memEnd"  value="${member.memEnd}"/>
	                                    <input path="memEnd" class="form-control" id="memPicture" name="memPicture"  value="${member.memPicture}"/>
	                                    <input path="memEnd" class="form-control" id="memPoint" name="memPoint"  value="${member.memPoint}"/>
	                                    <input path="memEnd" class="form-control" id="memDnreason" name="memDnreason"  value="${member.memDnreason}"/>
	                                    <span class="sp"></span>
	                                </div>





	                             
		                             <div class="form-group row" id="divEdit">
	                                	<div class="ol-sm-6 mb-3 mb-sm-0 text-center">
		                                	<a href="javascript:void(0)" id="idUpdate" class="btn btn-primary">
	                                    		수정
		                                	</a>
		                                </div>
	                                </div>
	                                <div class="form-group row" id="divConfirm" style="display:none;">
	                                	<div class="ol-sm-6 mb-3 mb-sm-0 text-center">
		                                	<a href="javascript:void(0)" id="idOk" class="btn btn-primary btn-user btn-block">
		                                    	확인
		                                	</a>
		                                </div>
		                                <div class="ol-sm-6 text-center">
		                                	<a href="javascript:void(0)" id="idCancel" class="btn btn-danger btn-user btn-block"
		                                		style="margin-left: 10px;">
		                                    	취소
		                                	</a>
		                                </div>
	                                </div>
								</div>
								
							</form:form> 
							
							
<%-- 							<form action="/profileImgGet" method="post" enctype="multipart/form-data"> --%>
								
<%-- 							</form> --%>
							
							
							
                        </div> <!-- end card-body -->
                        
                    </div>
                    <!-- end card -->


                </div> <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </div>
    <!-- end page -->	   

	
	
	<!-- Modal 추가 시작 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">MicroApple</h4>
			</div>
			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default"
				data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal 추가 끝 -->
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
</body>


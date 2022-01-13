<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <!-- 서머노트를 위해 추가해야할 부분 -->
  <script src="/resources/summernote/summernote-lite.js"></script>
  <script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
  <script src="https://kit.fontawesome.com/9b429fd177.js" crossorigin="anonymous"></script>
<!-- 바꿀 스크립트 및 css -->


</head>

<body>

                   <!-- Start Content-->
                    <div class="container-fluid">
                        <!-- start page email-title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <div class="page-title-right">
                                      <ol class="breadcrumb bg-light-lighten p-2 mb-0">
											<li class="breadcrumb-item"><a
												href="<%=request.getContextPath()%>/mainPage">
													<i class="uil-home-alt"></i>Home</a></li>
											<li class="breadcrumb-item active" aria-current="page">메세지 쓰기</li>
										</ol>
                                    </div>
                                    <h4 class="page-title">메세지 쓰기</h4>
                                </div>
                            </div>
                        </div>     
                        <!-- end page email-title --> 
                        <div class="row">
                            <!-- Right Sidebar -->
                            <div class="col-12">
                                <div class="card" style="min-height: 1000px; max-height: 1000px; border:1px solid; border-radius: 0.5em;">
                                    <div class="card-body">
                                        <!-- Left sidebar -->
                                       <jsp:include page="/WEB-INF/views/mail/mailPageAside.jsp" flush="true"/>
                                        <!-- End Left sidebar -->
                                        <div class="page-aside-right">
                                            <div>
												<h3>사내 메세지 보내기</h3>
												<hr>
											</div>



<div class="mt-3">

<!--  style="width: 100px;" -->

 <form action="/write" name="messageSend" class="messageSend" method="post" enctype="multipart/form-data" onSubmit="return Checkform()">
 <table style="width: 100%;">
 	<tr>
		<td style="width: 100px;">받는사람</td>
		<td>
			<input type="text" id="emIn" name="emIn" list="list" style="width: 700px;font-size: large;" placeholder=" 받는사람을 선택하세요">
			<datalist id="list" id="emIn" name="emIn">
				<c:forEach var="List" items="${List}" varStatus="status">
					<option value="${List.memEm}">이름 : ${List.memNm} </option>
				</c:forEach>
			</datalist>
			<button type="button" class="btn btn-warning" data-toggle="tooltip"
				    data-placement="right" title=""
				    data-original-title="우리 회사 사람들에게만 보낼 수 있습니다.">
				    <i class="fas fa-exclamation-circle"></i>
			</button>
			
		</td>
 	</tr>
 	<tr>
		<td style="width: 100px;">제목</td>
		<td><input type="text" style="width: 700px;" id="emTitle" name="emTitle" class="form-control"></td>
 	</tr>
 	<tr>
		<td>파일첨부</td>
		<td><input type="file" class="uploadFile" name="uploadFile" multiple="multiple">
		</td>
 	</tr>
 	<tr>
		<td colspan="4">
			<div class="container" style="overflow-y: scroll; height: 400px; width: 1000px;">
<!-- 				<div id="summernote-basic"></div> -->
<!-- 				<textarea id="summernote-basic" name="emCont" class="form-control" style="display: none"></textarea> -->
					<textarea class="summernote" id ="summernote" name ="emCont"></textarea>
			</div>
		</td>
 	</tr>
 	<tr> 
		<td colspan="2">
			<div style="float: right; margin-right: 70px;">
				<input type="submit" id="submit" value="보내기" class="btn btn-success">
				<input type="reset" value="취소" class="btn btn-danger">
			</div>
		</td>
 	</tr>
 </table>
 
 </form>

</div>

      <!-- end row-->
                                        </div> 
                                        <!-- end inbox-rightbar-->
                                    </div>
                                    <!-- end card-body -->
                                    <div class="clearfix"></div>
                                </div> <!-- end card-box -->
                            </div> <!-- end Col -->
                        </div><!-- End row -->
                    </div> <!-- container -->
            
          <!-- 기존 스크립트 및 css -->  
     <script type="text/javascript">
     $('.summernote').summernote({
   	  // 에디터 높이
   	  height: 700,
   	  // 에디터 한글 설정
   	  lang: "ko-KR",
   	  // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
   	  focus : true,
   	  toolbar: [
   		    // 글꼴 설정
   		    ['fontname', ['fontname']],
   		    // 글자 크기 설정
   		    ['fontsize', ['fontsize']],
   		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
   		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
   		    // 글자색
   		    ['color', ['forecolor','color']],
   		    // 표만들기
   		    ['table', ['table']],
   		    // 글머리 기호, 번호매기기, 문단정렬
   		    ['para', ['ul', 'ol', 'paragraph']],
   		    // 줄간격
   		    ['height', ['height']],
   		    // 그림첨부, 링크만들기, 동영상첨부
   		    ['insert',['picture','link','video']],
   		    // 코드보기, 확대해서보기, 도움말
   		    ['view', ['codeview','fullscreen', 'help']]
   		  ],
   		  // 추가한 글꼴
   		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
   		 // 추가한 폰트사이즈
   		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
   		
   	});
     
     
     function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "uploadSummernoteImageFile",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(el).summernote('editor.insertImage', data.url);
				}
			});
		}
     
     $(document).ready(function(){ 
    	 $("#submit").click(function(){
	    	 if($("#emIn").val().length==0){ alert("받을 사람을 선택하세요."); $("#emIn").focus(); return false; }
	    	 if($("#emTitle").val().length==0){ alert("제목을 입력하세요."); $("#emTitle").focus(); return false; }
	    	 if($("#summernote").val().length==0){ alert("메세지 내용을 입력하세요."); $("#summernote").focus(); return false; }
	    	 });
    	 });
     
		
		function saveContent() {
			var fileValue = $("#uploadFile").val().split("\\");
			var fileName = fileValue[fileValue.length - 1]; // 파일명
	    	
	        //값 가져오기
// 	        var summernoteContent = $('#summernote-basic').summernote('code');        //썸머노트(설명)
// 	        console.log("summernoteContent : " + summernoteContent);
	        var summernoteContent = $('#summernote').summernote('code');        //썸머노트(설명)
	        console.log("summernoteContent : " + summernoteContent);
			
	    }
		
	</script>        
<!-- 	<script src="/resources/assets/js/vendor/summernote-bs4.min.js"></script> -->
<!-- 	<script src="/resources/assets/js/pages/demo.summernote.js"></script> -->
	<!-- 기존 스크립트 및 css -->
	
	
	
	
</body>
</html>
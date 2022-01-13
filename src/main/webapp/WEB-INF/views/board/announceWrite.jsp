<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 게시판 내용 시작 -->
<link href="/resources/assets/css/vendor/simplemde.min.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 게시판 내용 끝 -->
<!-- 웹소켓 설정 시작 -->
<script src="/resources/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript">
var socket = null;

$(document).ready(function() {
	// 웹소켓 연결
	sock = new SockJS('<c:url value="/notify"/>');
	socket = sock;
	console.log("소켓 연결 ok");
});
</script>
<!-- 웹소켓 설정 끝-->
<title>공지게시판 게시글 작성</title>
</head>
<body>
	<div class="page-title-box">
		<div class="page-title-right">
			<ol class="breadcrumb m-0">
				<li class="breadcrumb-item"><a href="javascript:location.href='/mainPage';"><i class="uil-home-alt"></i>Home</a></li>
				<li class="breadcrumb-item"><a href="javascript:location.href='/announce?boardDvsn=2';">공지게시판</a></li>
				<li class="breadcrumb-item active">공지 게시글 작성</li>
			</ol>
		</div>
		<h2 class="page-title">공지 게시판</h2>
	</div>
	
	<div class="card-body">
		<div class="row mb-2" style="position: relative; right: 20px;">
			<div class="col-lg-8">
				<form class="form-inline">
					<div class="form-group mb-2"></div>
				</form>
			</div>
		</div>
	
		<!-- 게시글 작성 폼 -->
		<form method="post" action="/announceWritePost" enctype="multipart/form-data">
		 	<div class="container">
				<div class="row">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="2" style="background-color: #eeeeee; text-align: center;">공지 게시글</th>
							</tr>
							<tr>
								<td>
									<input type="text" class="form-control" value="2" name="boardDvsn" style="display: none;">	
								</td>
								
							</tr>
							<tr>
								<td>
									제목 <input type="text" class="form-control" placeholder="글 제목" name="boardTitle"
										style="width:600px; float:right;">						
								</td>
							</tr>
							<tr>
								<td>
									<input type="text" class="form-control" placeholder="작성자" value="${member.memIdx}" name="memIdx"
										id="annNotifyMemIdx" style="width:600px; float:right; border: 0; display: none;" readonly="readonly"  />
<!-- 									<input type="text" id="noticeCont" name="noticeCont" value="새로운 공지가 등록되었습니다." style="display: none;" /> -->
<!-- 									<input type="text" id="noticeUrl" name="noticeUrl" value="/announce?boardDvsn=2" style="display: none;" /> -->
<!-- 									<input type="text" id="noticeAddr" name="noticeAddr" value="공지게시판" style="display: none;" /> -->
								</td>
							</tr>
							<tr>
								<td>
								    <div class="fallback" style="float:right;">
								        <input name="file" type="file" multiple />
								    </div>
								</td>
							</tr>
							<tr>
								<td>
									<textarea id="simplemde1" name="boardCont"></textarea>
								</td>
							</tr>
						</thead>
					</table>
					<br />
					<!-- File Upload -->


<!-- Preview -->
<div class="dropzone-previews mt-3" id="file-previews"></div>

<!-- file preview template -->
<div class="d-none" id="uploadPreviewTemplate">
    <div class="card mt-1 mb-0 shadow-none border">
        <div class="p-2">
            <div class="row align-items-center">
                <div class="col-auto">
                    <img data-dz-thumbnail src="#" class="avatar-sm rounded bg-light" alt="">
                </div>
                <div class="col pl-0">
                    <a href="javascript:void(0);" class="text-muted font-weight-bold" data-dz-name></a>
                    <p class="mb-0" data-dz-size></p>
                </div>
                <div class="col-auto">
                    <!-- Button -->
                    <a href="" class="btn btn-link btn-lg text-muted" data-dz-remove>
                        <i class="dripicons-cross"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
				</div>
			</div>
				<div class="text-lg-right">
					<input type="submit" class="btn btn-secondary" id="announceNotifyBtn"
						value="저장" onclick="ann_notify()" style="position: relative; right: 210px;" />
				</div>
		</form>
	</div>


<script type="text/javascript">
// announceNotifyBtn(공지 저장 버튼) 누르면

function ann_notify() {
// 	alert("오니");
	var form = $("<form></form>");
	form.attr("action","/announceWritePost");
	form.attr("method","get");
	form.appendTo("body");
	var iput1 = $("<input type='hidden' value="+memIdx+" name='memIdx'>");
     
    form.append(iput1);
	
	form.submit();
	send_notify('공지게시판', '새로운 공지글이 등록되었습니다.', '/announce?boardDvsn=2', '0');
};


</script>
<!-- SimpleMDE js -->
<script src="/resources/assets/js/vendor/simplemde.min.js"></script>
<!-- SimpleMDE demo -->
<script src="/resources/assets/js/pages/demo.simplemde.js"></script>

<!-- File Uploads -->
<!-- plugin js -->
<script src="/resources/assets/js/vendor/dropzone.min.js"></script>
<!-- init js -->
<script src="/resources/assets/js/ui/component.fileupload.js"></script>

</body>
</html>
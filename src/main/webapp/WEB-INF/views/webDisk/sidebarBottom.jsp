<%@page import="org.apache.velocity.tools.view.WebappUberspector.GetAttributeExecutor"%>
<%@page import="javax.swing.plaf.multi.MultiFileChooserUI"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="micro.apple.groupware.webDisk.service.impl.WebDiskServiceImpl"%>
<%@page import="micro.apple.groupware.webDisk.vo.WebDiskVO"%>
<%@page import="micro.apple.groupware.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
// 	String memIdx = session.getAttribute("MEMBERVO") == null? "2112080012" : ((MemberVO)(session.getAttribute("MEMBERVO"))).getMemIdx();
// 	String memNm = session.getAttribute("MEMBERVO") == null? "juyi12" : ((MemberVO)(session.getAttribute("MEMBERVO"))).getMemNm();

	String memIdx = ((MemberVO)(session.getAttribute("MEMBERVO"))).getMemIdx();
	String memNm = ((MemberVO)(session.getAttribute("MEMBERVO"))).getMemNm();
///20220112
%>

<!DOCTYPE html>
<html>
<head>
<title>sidebar-contextmenu,modal</title>
<!-- jquery-contextmenu -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.9.2/jquery.contextMenu.css" integrity="sha512-EF5k2tHv4ShZB7zESroCVlbLaZq2n8t1i8mr32tgX0cyoHc3GfxuP7IoT8w/pD+vyoq7ye//qkFEqQao7Ofrag==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="/resources/assets/js/webDisk.js"></script>
<link href="/resources/assets/css/webDisk.css" rel="stylesheet" type="text/css" />
<!-- 웹소켓 설정 시작 -->
<script src="/resources/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

</head>
<body>

<!-- Mouse contextmenu 시작 -->
<div side-left-context>
	<ul class="contextmenu" id="contextmenu_aside">
		<li>
			<button type="button" class="btn btn-insertFolder btn-block" data-toggle="modal" data-target="#compose-modal1">
		 	<i class="folder dripicons-folder noti-icon"></i>폴더 생성</button>
		</li>
		<li>
			<button type="button" class="btn btn-insertFolder btn-block" data-toggle="modal" data-target="#compose-modal2">
		 	<i class="folder dripicons-folder-open noti-icon"></i>폴더 수정</button>
		</li>
		<li>
			<button type="button" class="btn btn-insertFolder btn-block" data-toggle="modal" data-target="#compose-modal3">
		 	<i class="folder dripicons-trash noti-icon"></i>폴더 삭제</button>
		</li>
	</ul>
</div>
<div side-right-context>
	<ul class="contextmenu" id="contextmenu_content">
		<li>
			<button type="button" class="btn btn-insertFolder btn-block" data-toggle="modal" data-target="#compose-modal4">
		 	<i class="folder uil-file-upload noti-icon"></i>파일업로드</button>
		</li>
		<li>
			<button type="button" class="btn btn-insertFolder btn-block" data-toggle="modal" data-target="#compose-modal5">
		 	<i class="folder uil-file-download noti-icon"></i>파일 수정</button>
		</li>
		<li>
			<button type="submit" class="btn btn-insertFolder btn-block" data-toggle="modal" data-target="#compose-modal6"
				id="delOk" value="삭제">
		 	<i class="folder uil-trash-alt noti-icon"></i>파일 삭제</button>
		</li>
	</ul>
</div>
<!-- Mouse contextmenu 끝 -->



<!-- Modal 창 (폴더 생성) -->
<div id="compose-modal1" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="compose-header-modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header modal-colored-header bg-primary1">
				<h4 class="modal-title1" id="compose-header-modalLabel">폴더 생성</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			</div>
			<div class="modal-body p-3">
				<form class="p-1" method="post" name="frm" id="frm" action="/folderInsert">
					<div class="form-group mb-2">
						<label for="webNm">폴더명</label>
						<input type="text" id="webNm" name="webNm" class="form-control">
					</div>
					<div class="form-group mb-2">
						<label for="webExpl">폴더설명</label>
						<input type="text" id="webExpl" name="webExpl" class="form-control">
						<input type="hidden" id="webIdx" name="webIdx" class="form-control">
						<input type="hidden" id="webIsfile" name="webIsfile" class="form-control" value="N">
						<input type="hidden" id="memIdx" name="memIdx" class="form-control" value="<%=memIdx%>">
					</div>
					<div class="form-group mb-2">
						<label for="webRead" class="read_write_YN" >폴더 읽기 권한</label>
						<input class="Read_Write" type="checkbox" id="webRead" name="webRead" class="form-control" value="Y">
						<label for="webWrite" class="read_write_YN" >폴더 쓰기 권한</label>
						<input class="Read_Write" type="checkbox" id="webWrite" name="webWrite" class="form-control" value="Y">
					</div>
					<input type="submit" class="btn btn-primary1" value="생성" />
					<button type="button" class="btn btn-light" data-dismiss="modal" >닫기</button>
				</form>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal 창 (폴더 수정) -->
<div id="compose-modal2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="compose-header-modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header modal-colored-header bg-primary1">
				<h4 class="modal-title2" id="compose-header-modalLabel">폴더 수정</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			</div>
			<div class="modal-body p-3">
				<form class="p-1" method="post" name="frm" id="frm" action="/updateFolder">
					<div class="form-group mb-2">
						 <label for="webNm2">폴더명</label>
						<input type="text" id="webNm2" name="webNm2" class="form-control">
					</div>
					<div class="form-group mb-2">
						<label for="webExpl2">폴더설명</label>
						<input type="text" id="webExpl2" name="webExpl2" class="form-control">
						<input type="hidden" id="webIdx2" name="webIdx2" class="form-control">
					</div>
					<div class="form-group mb-2">
						<label for="webRead2" class="read_write_YN">폴더 읽기 권한</label>
						<input class="Read_Write" type="checkbox" id="webRead" name="webRead" class="form-control" value="Y">
						<label for="webWrite2" class="read_write_YN">폴더 쓰기 권한</label>
						<input class="Read_Write" type="checkbox" id="webWrite" name="webWrite" class="form-control" value="Y">
					</div>
					<input type="submit" class="btn btn-primary1" value="수정" />
					<button type="button" class="btn btn-light" data-dismiss="modal" >닫기</button>
				</form>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal 창 (폴더 삭제) -->
<div id="compose-modal3" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="compose-header-modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header modal-colored-header bg-primary1">
				<h4 class="modal-title3" id="compose-header-modalLabel">폴더 삭제</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			</div>
			<div class="modal-body p-3">
				<form class="p-1" method="post" name="frm" id="frm" action="/deleteFolder">
					<div class="form-group mb-2">
						<label for="webNm3">삭제 할 폴더명</label>
						<input type="text" id="webNm3" name="webNm3" class="form-control" placeholder="삭제 할 폴더를 선택해주세요" readonly />
						<input type="hidden" id="webIdx3" name="webIdx3" class="form-control" />
					</div>
					<div class="form-group mb-2">
						<label for="webDelete" style="margin-right: 30px;">
						삭제하면 폴더안의 파일(폴더)도 함께 삭제됩니다.<br />
						삭제된 파일(폴더)은 복구할 수 없습니다.<br />
						삭제하시려면 삭제버튼을 클릭해주세요.</label>
					</div>
					<input type="submit" class="btn btn-primary1" value="삭제" />
					<button type="button" class="btn btn-light" data-dismiss="modal" >취소</button>
				</form>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- Modal 창 (파일 업로드) -->
<div id="compose-modal4" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="compose-header-modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header modal-colored-header bg-primary1">
				<h4 class="modal-title4" id="compose-header-modalLabel">파일 업로드</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			</div>
			<div class="modal-body p-3">
				<form class="p-1" method="post" name="frm4" id="frm4" action="/fileUpload" enctype="multipart/form-data">
					<div class="form-group mb-2">
						<label for="webNm">파일업로드명</label>
						<input type="text" id="webNm" name="webNm" class="form-control" placeholder="파일업로드 이름">
					</div>
					<div class="form-group mb-2">
						<label for="webExpl">파일 설명</label>
						<input type="text" id="webExpl" name="webExpl" class="form-control" placeholder="파일설명">
						<input type="hidden" id="webIdx" name="webIdx" class="form-control" placeholder="파일인덱스" readonly>
						<input type="hidden" id="webIsfile" name="webIsfile" class="form-control" value="Y" placeholder="폴더파일구분" readonly>
						<input type="hidden" id="webOriginNm" name="webOriginNm" class="form-control" placeholder="원본파일명" readonly>
						<input type="hidden" id="webSaveNm" name="webSaveNm" class="form-control" placeholder="저장파일명" readonly>
						<input type="hidden" id="memNm" name="memNm" class="form-control" value="<%=memNm%>" placeholder="사원명" readonly>
						<input type="hidden" id="memIdx" name="memIdx" class="form-control" value="<%=memIdx%>" placeholder="사번" readonly>
						<input type="hidden" id="webUptoIdx" name="webUptoIdx" class="form-control" placeholder="상위인덱스" readonly>
						<input type="hidden" id="webExtn" name="webExtn" class="form-control"  placeholder="파일확장자">
						<input type="hidden" id="webPath" name="webPath" class="form-control" value="${fileMap.WEB_PATH}" placeholder="파일경로" readonly>
						<input type="hidden" id="webRead" name="webRead" class="form-control"  placeholder="읽기권한">
						<input type="hidden" id="webWrite" name="webWrite" class="form-control"  placeholder="쓰기권한">
					</div>
					<div class="form-group mb-2 uploadDiv">
						<label style="display: block;">파일 업로드(파일 미리보기는 이미지 파일만 가능합니다.)</label>
<!-- 						accept="image/*" -->
						<input id="fileInput" name="file" type="file" onchange="setImage(event);"/>
					</div>
					<div id="image_container" class="image_container">
						<ul></ul>
<!-- ///20220112 -->
					</div>
					<input type="submit" id="submitButton" class="btn btn-primary1" value="업로드" onclick="fileCheck();" />
					<button type="button" class="btn btn-light" data-dismiss="modal" > 닫기</button>
				</form>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal 창 (파일 수정) -->
<div id="compose-modal5" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="compose-header-modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header modal-colored-header bg-primary1">
				<h4 class="modal-title5" id="compose-header-modalLabel">파일 수정</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			</div>
			<div class="modal-body p-3">
				<form class="p-1" method="post" name="frm" id="frm" action="/updateFile" enctype="multipart/form-data">
					<div class="form-group mb-2">
						 <label for="webNm5">파일명</label>
						<input type="text" id="webNm5" name="webNm5" class="form-control">
					</div>
					<div class="form-group mb-2">
						<label for="webExpl5">파일 설명</label>
						<input type="text" id="webExpl5" name="webExpl5" class="form-control">
						<input type="hidden" id="webIdx5" name="webIdx5" class="form-control">
					</div>
					<div class="form-group mb-2">
						<label for="webExpl5">수정할 파일 업로드</label>
						
						<input type="text" id="webOriginNm5" name="webOriginNm5" class="form-control" placeholder="원본파일명" readonly>
						<input type="hidden" id="webSaveNm5" name="webSaveNm5" class="form-control" placeholder="저장파일명" readonly>
					</div>
						
					<div class="form-group mb-2">
<!-- 						<input id="fileInput" name="file" type="file" onchange="setImage(event);"/> -->
<!-- 						<button id="btn_del" type="button" onclick="clickBtn()" >삭제</button> -->
<!-- 						<input type="hidden" id="delete_file" name="deleteFile" value=""/> -->
						<img src="" id="updateFileThumbnail2" style="width:300px; height:150px"></img>
					</div>
<!-- ///20220112 -->
					<div id="image_container" class="image_container">
						<ul></ul>
					</div>
<!-- ///20220112 -->
<!-- 					<div class="form-group mb-2"> -->
<!-- 						<label for="webRead5" class="read_write_YN">파일 읽기 권한</label> -->
<!-- 						<input class="Read_Write" type="checkbox" id="webRead" name="webRead" class="form-control" value="Y" > -->
<!-- 						<label for="webWrite5" class="read_write_YN">파일 쓰기 권한</label> -->
<!-- 						<input class="Read_Write" type="checkbox" id="webWrite" name="webWrite" class="form-control" value="Y" > -->
<!-- 					</div> -->
					<input type="submit" class="btn btn-primary1" value="수정" />
					<button type="button" class="btn btn-light" data-dismiss="modal" >닫기</button>
				</form>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal 창 (파일 삭제) -->
<div id="compose-modal6" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="compose-header-modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header modal-colored-header bg-primary1">
				<h4 class="modal-title6" id="compose-header-modalLabel">파일 삭제</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			</div>
			<div class="modal-body p-3">
<!-- 				<form class="p-1" method="post" name="frm" id="frm" action="/removeFile" > -->
					<div class="form-group mb-2">
						<label for="webNm6">삭제 할 파일명</label>
						<input type="text" id="webNm6" name="webNm6" class="form-control" placeholder="삭제 할 파일의 체크박스를 선택해주세요" readonly />
						<input type="hidden" id="webIdx6" name="webIdx6" class="form-control" placeholder="파일인덱스" readonly />
					</div>
					<div class="form-group mb-2">
						<label for="webDelete" style="margin-right: 30px;">
						삭제된 파일은 복구할 수 없습니다.<br />
						삭제하시려면 삭제버튼을 클릭해주세요.</label>
					</div>
					<input type="submit" class="btn btn-primary1" value="삭제" onclick="deleteFunction();"/>
<!-- 					<input type="submit" class="btn btn-primary1" id="fileDeleteBtn" name="" value="삭제" /> -->
					<button type="button" class="btn btn-light" data-dismiss="modal" >취소</button>
<!-- 				</form> -->
			</div>
		</div><!-- /.modal-content -->
		
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal 창 (업로드 후 제목 클릭시 상세보기창) -->
<div id="titlemodal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="compose-header-modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header modal-colored-header bg-primary1">
				<h4 class="modal-title7" id="compose-header-modalLabel">파일 상세보기</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			</div>
			<div class="modal-body p-3">
				<form class="p-1" method="post" name="frm" id="frm" action="/fileDownload">
					<div class="form-group mb-2">
						<label>파일명</label>
						<input type="text" id="webNm7" name="webNm7" class="form-control" readonly />
						<input type="hidden" id="webIdx7" name="webIdx7" class="form-control" readonly />
					</div>
					<div class="form-group mb-2">
						<label>파일설명</label>
						<input type="text" id="webExpl7" name="webExpl7" class="form-control" readonly />
					</div>
					<div class="form-group mb-2">
						<label>첨부파일명</label>
						<input type="text" id="webOriginNm7" name="webOriginNm7" class="form-control" readonly />
					</div>
					<div class="form-group mb-2" id="img_file">
						<label>첨부파일 미리보기 (미리보기는 이미지파일만 가능합니다)</label><br />
						<img src="" id="fileThumbnail" style="width:300px; height:auto"></img>
					</div>
					<input id="download" type="submit" class="btn btn-primary1" download="" target="_blank" value="다운로드" />
					<button type="button" class="btn btn-light" data-dismiss="modal" >닫기</button>
				</form>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">
///20220112
String.prototype.indexOfArray = function(s){
	var flag = false;
	var o = Object(this);
	$.each(s, function(i, v){
		if(o.indexOf(v) != -1){
			flag = true;
			return flag;
		}
	});
	return flag;
}
///20220112
/** 일반파일 썸네일 처리 - 상세보기, 수정, 업로드시*/
function fileTypes_image(f){
	return f.indexOfArray(['jpg', 'jpeg', 'png', 'gif', 'jfif']);
// 	if(filetype !== 'jpg' && filetype !== 'jpeg' && filetype !== 'png' && filetype !== 'gif' && filetype !== 'jfif'){
// 		return false;
// 	}else{
// 		return true;
// 	}
}
///20220112


/** 파일업로드 썸네일z, */
function setImage(event){
	var reader = new FileReader();
	
	reader.onload = function(event){
///20220112
		$('div#image_container').html('');
		var img = document.createElement("img");
		console.log(event);
		if(fileTypes_image(event.target.result.split(';')[0])){
			img.setAttribute("src", event.target.result);
		}else{
			img.setAttribute("src", "/resources/images/webDisk_fileupload.png");
		}
		img.setAttribute("width", "150px");
		document.querySelector("div#image_container").appendChild(img);
	};
	reader.readAsDataURL(event.target.files[0]);
}

///20220112

/** 알림 웹소켓 */
var socket = null;

$(document).ready(function() {
	// 웹소켓 연결
	sock = new SockJS('<c:url value="/webDiskMain"/>');
	socket = sock;
// 	console.log("소켓 연결 ok");
});

///20220112
function fileCheck(){																//회사폴더가 업로드 될때만 알림이 뜨도록 해야함, 알림 3개씩 뜸//////////////////////////////////////////////////////////
		var form = $("<form></form>");
		form.attr("action","/fileUpload");
		form.attr("method","post");
		form.appendTo("body");
		var iput1 = $("<input type='hidden' value="+memIdx+" name='memIdx'>");
// 	console.log("===============  "+ memIdx);
	
	form.append(iput1);
	
		form.submit();
		send_notify('웹디스크','회사폴더에 공유파일이 등록되었습니다.','/webDiskMain','0');
};
/** 알림 웹소켓 끝 */

///20220112
/** 목록영역 우클릭 */
$(document).ready(function(){ 
	/**해당영역에서만 contextmenu 생성*/
	$('#content_frame').contextmenu(function(e){
		var idx = $('#folder_idx').val();
		$('input[type="hidden"][value="' + idx + '"]')
// 		console.log("폴더상세내역(tbody)에서 우클릭했을때" + idx);
		var checkVal = $(".file_idx").val();	//check된 값의 value값 가져오기
// 		console.log("폴더상세내역(tbody)에서 우클릭했을때" + checkVal);
		var checkNm = $(".file_nm").val();
		var checkExpl = $(".file_expl").val();
		console.log(checkNm[0].value, checkExpl[0].value)
		//파일업로드(4),파일수정(5)
		if($('.modal-title4')){	
			$("#webUptoIdx").val(idx);
		}
// 		if($('modal-title5')){
// 			console.log('------------------------------------2')
// 			console.log(checkVal);
// 			console.log(checkNm);
// 			console.log(checkExpl);
// 			console.log('------------------------------------2')
// 			$('#webIdx5').val(checkVal);
// 			$('#webNm5').val(checkNm);
// 			$('#webExpl5').val(checkExpl);
// 		}
		
		var originNm = $('#originFileNm').val();
// 		console.log("파일 저장명");
// 		console.log(originNm);
		
		
		//Get window size: 
		var winWidth = $(document).width(); 
		var winHeight = $(document).height(); 
		//Get pointer position: 
		var posX = e.pageX; 
		var posY = e.pageY; 
		//Get contextmenu size: 
		var menuWidth = $("#contextmenu_content").width(); 
		var menuHeight = $("#contextmenu_content").height(); 
		//Security margin: 
		var secMargin = 10;
		//Prevent page overflow: 
		//Case 1: right-bottom overflow: 
		if(posX + menuWidth + secMargin >= winWidth && posY + menuHeight + secMargin >= winHeight){ 
			posLeft = posX - menuWidth - secMargin + "px"; 
			posTop = posY - menuHeight - secMargin + "px"; 
		}else if(posX + menuWidth + secMargin >= winWidth){ 	//Case 2: right overflow: 
			posLeft = posX - menuWidth - secMargin + "px"; 
			posTop = posY + secMargin + "px";
		}else if(posY + menuHeight + secMargin >= winHeight){ //Case 3: bottom overflow: 
			posLeft = posX + secMargin + "px"; 
			posTop = posY - menuHeight - secMargin + "px"; 
		}else{ 												//Case 4: default values: 
			posLeft = posX + secMargin + "px"; 
			posTop = posY + secMargin + "px"; 
		}; 
		$("#contextmenu_content").css({ 				//Display contextmenu: 
			"left": posLeft, 
			"top": posTop 
		}).show(); 
		//Prevent browser default contextmenu. 
		return false; 
		
	}); 
	$(document).click(function(){ 		//Hide contextmenu: 
		$("#contextmenu_content").hide(); 
	});
}); 

</script>
</body>
</html>
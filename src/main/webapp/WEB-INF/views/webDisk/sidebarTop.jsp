<%@page import="micro.apple.groupware.member.vo.MemberVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="micro.apple.groupware.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
List<Map<String, Object>> folderList = (List<Map<String, Object>>)(request.getAttribute("folderList"));
String memIdx = ((MemberVO)(session.getAttribute("MEMBERVO"))).getMemIdx();
String memID = ((MemberVO)(session.getAttribute("MEMBERVO"))).getMemNm();
%>
<link href="/resources/assets/css/webDisk.css" rel="stylesheet" type="text/css" />
<script src="/resources/assets/js/jstree.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<style>
.table-sm td {text-align: center;}
.folder-icon {
background-image: url(https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/32px.png);
    width: 24px;
    height: 24px;
    line-height: 24px;
    background-position: -260px -4px;
    background-repeat: no-repeat;
    background-color: transparent;
    display: inline-block;
    text-decoration: none;
    margin: 0;
    padding: 0;
    vertical-align: top;
    text-align: center;
    margin-right: 2px;
    }
.file-icon {
background-image: url(https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/32px.png);
    width: 24px;
    height: 24px;
    line-height: 24px;
    background-position: -98px -72px;
    background-repeat: no-repeat;
    background-color: transparent;
    display: inline-block;
    text-decoration: none;
    margin: 0;
    padding: 0;
    vertical-align: top;
    text-align: center;
    margin-right: 2px;
    }  
</style>
<!-- start Left sidebar(top) -->
<div class="row">
	<div class="col-sm-2.5 col-xs-4">
		<div class="card">
			<div class="card-body" style="min-height: 700px; max-height: 700px;">
<!-- 				<a href="#" class="nav-link dropdown-toggle arrow-none" class="contextmenu_aside"> -->
<!-- 	            	<i class="uil-folder-plus"></i> -->
<!-- 	            </a> -->
<!-- 				<i class="uil-folder-exclamation"></i> -->
<!-- 				<i class="uil-folder-times"></i> -->
				<div class="row no-gutters">
					<div class="col-8">
						<h4>Micro Apple</h4>
					</div>
					<div class="col-4 py-1">
					<!-- 
						<button type="button" class="btn btn-sm btn-success" onclick=''>??????</button>
					 -->
					</div>
				</div>
				<div class="row">
					<div class="page-aside-left" id="directory-tree"></div>
				</div>
			</div>
		</div>
	</div>
<!-- End Left sidebar(top) -->
<script>
//jstree??? ?????? ????????????
var current_folder = '';
var current_folderNm= '';
var current_folderExpl= '';

var firstIdx = "3";		//???????????? ????????? ????????? : ???????????? ??????
getContents(firstIdx);

var selectedFileIdx = ''
var selectedFileNm = ''
var selectedFileExpl = ''

var jst = $('#directory-tree').jstree({
	core: {
		data:[
			<%
			int cnt = 0;
			for(Map<String, Object> item : folderList){
				if(cnt>0){
			%>
			,
				<% } %>
			{
				id: '<%=item.get("id") %>'
				,parent: '<%=item.get("parent") %>'
				,text: '<%=item.get("text") %>'
				,data:{
					WEB_IDX: '<%=item.get("WEB_IDX") %>'
					,WEB_NM: '<%=item.get("WEB_NM") %>'
					,WEB_EXPL: '<%=item.get("WEB_EXPL") %>'
				}
				//20210111
				,state:{opened:true}
				//20210111
			}
			<%
			cnt++;
			}
			%>
		]
	}
});

console.log(jst);
jst.bind('select_node.jstree', function(event, data){
	var id = data.instance.get_node(data.selected).id;        //id ????????????
	var WEB_IDX = data.instance.get_node(data.selected).data.WEB_IDX;    //data ?????? a ????????????
	var WEB_NM = data.instance.get_node(data.selected).data.WEB_NM;    //data ?????? a ????????????
	var WEB_EXPL = data.instance.get_node(data.selected).data.WEB_EXPL;    //data ?????? a ????????????
	
	
	current_folder = WEB_IDX;
	$('#webIdx').val(current_folder);
	current_folderNm = WEB_NM;
	current_folderExpl = WEB_EXPL;
	getContents(WEB_IDX);
	
});
setTimeout(function(){
	$('#directory-tree > ul > li:nth-child(1) > a').addClass('jstree-clicked');
}, 700);

// ????????? ????????? ?????? ?????? ????????????
function getContents(WEB_UPTO_IDX){
	
	
	$.ajax({
		type: 'post',
		dataType: 'json',
		url: '/webDisk/ajax/getContents',
		data: {
			webUptoIdx : WEB_UPTO_IDX,
		},
		success: function(data){	
// 			alert(JSON.stringify(data));
// 			console.log("data: ");
// 			console.log(data);
			var fileList = data.FILE_LIST;
			var folderList = data.FOLDER_LIST;
			var idx = 175;				/////////////////////////////////uptoidx??? 1,2,3,4????????? ?????????????????? ??????????????? ???????????? , ??? ?????????????????? ?????????????????? idx??? ????????? ??????????????? ????????????

			if(fileList.length > 0){
				console.log(fileList[0].WEB_UPTO_IDX);
				idx= fileList[0].WEB_UPTO_IDX;
				fileIdx = fileList[0].WEB_IDX;
				fileNm = fileList[0].WEB_NM;
				fileExpl = fileList[0].WEB_EXPL;
				fileOriginNm = fileList[0].WEB_ORIGIN_NM;
				fileSaveNm = fileList[0].WEB_SAVE_NM;
				
// 			console.log("???????????? ???????????? :" + fileIdx);
// 			console.log("???????????? ???????????? :" + fileExpl);
// 			console.log("???????????? ????????? :" + fileNm);
// 			console.log("???????????? ????????? :" + fileOriginNm);
			}
			
			if(folderList.length > 0){
// 				console.log(folderList[0].WEB_UPTO_IDX);
				idx = folderList[0].WEB_UPTO_IDX;
			}
			
			$('#disk_content_frame tbody').html('');
			var html = '';
			html += '<input type="hidden" id="folder_idx" value="'+idx+'">';
			$.each(data.FOLDER_LIST, function(i,v){
				html += '<tr>';
// 				html += '<td><input type="checkbox" name="selectCheckbox" class="selectCheckbox"></td>';
				html += '<td></td>';
				html += '<td><i class="folder-icon" style=""></i></td>';
//  				html += '<td>'+'<a href="/webDisk/fileDetail">'+v.WEB_NM+'</a></td>';
 				html += '<td>'+'<a href="#">'+v.WEB_NM+'</a></td>';
				html += '<td>'+v.WEB_EXPL+'</td>';
				html += '<td></td>';
				html += '<td></td>';
				html += '<td></td>';
				html += '<td></td>';
				html += '</tr>';
			});
			var tempStr = ''
			$.each(data.FILE_LIST, function(i,v){
				if (v.WEB_SIZE >= 1024 * 1024) {
					v.WEB_SIZE = (v.WEB_SIZE / (1024 * 1024))+'';
					v.WEB_SIZE = v.WEB_SIZE.split('.')
					v.WEB_SIZE  = v.WEB_SIZE[0]
					tempStr = v.WEB_SIZE + "MB";
		            }
		            //KB ?????? ???????????? KB ????????? ??????
		            else if (v.WEB_SIZE >= 1024) {
		            	v.WEB_SIZE = (v.WEB_SIZE / 1024)+'';
		            	v.WEB_SIZE = v.WEB_SIZE.split('.')
						v.WEB_SIZE  = v.WEB_SIZE[0]
		            	tempStr = v.WEB_SIZE + "KB";
		            }
		            //KB ???????????? ????????? byte ????????? ??????
		            else {
		            	tempStr = v.WEB_SIZE + "byte";
		            }
				console.log("data.FILE_LIST")
				console.log(data.FILE_LIST)
				html += '<tr>';
				html += '<input type="hidden" class="file_idx" value="'+fileIdx+'">';
				html += '<input type="hidden" class="file_nm" value="'+fileNm+'">';
				html += '<input type="hidden" class="file_expl" value="'+fileExpl+'">';
				html += '<input type="hidden" clasd="file_originNm" value="'+fileOriginNm+'">';
				html += '<input type="hidden" clasd="file_originNm" value="'+fileSaveNm+'">';
				html += '<td><input type="checkbox" name="selectCheckbox" class="selectCheckbox" data-value="'+ v.ROWNUM +'"onclick="selectCheckOne(\'' + v.WEB_IDX + '\', \''+v.WEB_NM+'\', \''+v.WEB_EXPL+'\', \''+v.WEB_ORIGIN_NM+'\', \''+v.WEB_SAVENM+'\',this)"></td>';
				html += '<td><i class="file-icon" style=""></i></td>';
 				html += '<td>'+'<a class="titlemodal" name="titlemodal" href="#" data-toggle="modal" data-target="#titlemodal" ';
 				html += 'onclick="clickFileTitle(\'' + v.WEB_IDX + '\', \''+v.WEB_NM+'\', \''+v.WEB_EXPL+'\', \''+v.WEB_ORIGIN_NM+'\', \''+v.WEB_SAVENM+'\')">'+v.WEB_NM+'</a></td>';
				html += '<td>'+v.WEB_EXPL+'</td>';
				html += '<td>'+$('#memNm').val()+'</td>';
				html += '<td>'+tempStr+'</td>';
				html += '<td>'+v.WEB_EXTN+'</td>';

				var d = new Date(v.WEB_WRDATE);
				var month = (+d.getMonth() + 1)
				var day = d.getDate()
				
				if((+d.getMonth() + 1) < 10) {
					month = '0' + month 
				}
				
				if(d.getDate() < 10) {
					day = '0' + day
				}
				
				var date = (d.getYear() + 1900) + '-' + month + '-' + day;
				html += '<td>'+date+'</td>';
				html += '</tr>';
			});
			$('#disk_content_frame tbody').html(html);
		}
	});
}

/** ????????? ????????????(????????????)??? ????????? list??? ???????????? ?????? ////////////////////////////////*/
// var image_container = $(".image_container ul");
// 	function showUploadFile(image_containerArr){
// 		var str = "";
// 		$(image_containerArr).each(function(i, obj){
// 			str += "<li>" + obj.webOriginNm + "</li>";
// 		});
// 		console.log("111111111111111111111111111111")
// 		console.log(obj);
// 		image_container.append(str);
// 	}
// 		$.ajax({
// 			url: '/fileUpload',
// 			processData: false,
// 			contentType: false,
// 			data: {
// 				'webIdx' : selectedFileIdx,
// 			},
// 			type: 'POST',
// 			dataType: 'json',
// 			success: function(result){
// 				alert("ddddddddd")
// 				console.log("result");
// 				console.log(result);
// 				showUploadFile(result);
// 				$(".uploadDiv").html(cloneObj.html());
// 			}
// 		});



/** ??????????????????-???????????? ?????? ?????? */
function checkAll(){
	if($('#check_all').is(':checked')){
		$('input[name=selectCheckbox]').prop('checked',true);
	}else{
		$('input[name=selectCheckbox]').prop('checked',false);
	}
}

/** ???????????? ????????? ??????????????? */
function selectCheckOne(checkVal, checkNm, checkExpl, checkOriginNm, checkSaveNm, objCheckbox){
	var nowCheckedNum = "";
	var nowCheckedNm = "";
	var nowCheckedExpl = "";
	var nowCheckedOriginNm = "";
	var nowCheckedSaveNm = "";
	var obj = document.getElementsByName("selectCheckbox");
	
	nowCheckedNum = checkVal; 
	nowCheckedNm = checkNm;
	nowCheckedExpl = checkExpl;
	nowCheckedOriginNm = checkOriginNm;
	nowCheckedSaverNm = checkSaveNm;
// 	alert("checkOriginNm: "+checkOriginNm + "// checkSaveNm: "+checkSaveNm);
	
	for (var i = 0; i < obj.length; i++) {
			obj[i].checked = false;		//????????? ??????????????? ?????????????????? ?????? ??????????????? ???????????? ?????? ??????????????? ?????????
	}
	if(objCheckbox.checked) {
		objCheckbox.checked = false;		
	} else {
		objCheckbox.checked = true;
	}
	
	
	//???????????? ????????? ?????? ?????? ?????????
	selectCheckFile(checkVal,checkNm, checkExpl,checkOriginNm,checkSaveNm);
	
}


/** ????????????-???????????? ????????? ??????,??????  ---------------------------?????? ????????? ?????? ??????/ ??????????????? 0???????????? ?????????*/
function selectCheckFile(checkVal, checkNm, checkExpl,checkOriginNm,checkSaveNm){
// 	var checkVal = $("#file_idx").val();	//#file_id??? value??? ???????????? checkVal??? ??????
// 	var checkNm = $("#file_nm").val();
// 	var checkExpl = $("#file_expl").val();
	
	selectedFileIdx = checkVal
	selectedFileNm = checkNm
	selectedFileExpl = checkExpl
	selectedFileOriginNm = checkOriginNm
	selectedFileSaveNm = checkSaveNm
// 	selectedFileImage = checkImage
	
	if($('.selectCheckbox').is(':checked')){
		$("input[name=selectCheckbox]").is(function(){
	
			if($(".modal-title6")){
				
				$("#webIdx6").val(checkVal);
				$("#webNm6").val(checkNm);
			}
			
			if($(".modal-title5")){
		///20220112
			var ext = checkOriginNm.split('.')[checkOriginNm.split('.').length - 1];
// 			alert(fileTypes_image(ext));
// 			var updateImage = "resources/webDiskFile/" + checkSaveNm;
			var updateImage = '';
			if(fileTypes_image(ext)) updateImage = "/resources/webDiskFile/"+checkSaveNm;
			else updateImage = "/resources/images/webDisk_fileupload.png";
		///20220112
				$("#webIdx5").val(checkVal);
				$("#webNm5").val(checkNm);
				$("#webExpl5").val(checkExpl);
				$("#webOriginNm5").val(checkOriginNm);
				$("#webSaveNm5").val(checkSaveNm);
				$("#updateFileThumbnail2").attr('src', updateImage);
			}
		})
	}
};
///20220112
	
/** ???????????? */
function deleteFunction(){
// 	console.log(selectedFileIdx)
	if(confirm("????????? ???????????? ????????????????????????. ?????????????????????????") == true){
	} else{ return;}
	$.ajax({
		url : '/removeFile',
		data : {
			'webIdx6' : selectedFileIdx,
		},
		method : 'post',		
		success : function(data){
			if(data) {
				window.location.reload();
				alert("?????? ??????");
			} else {
				window.location.reload();
				alert("?????? ??????");
			}
		},
		error : function (data) {
			window.location.reload();
			alert("?????? ??????");			
		},
		dataType : 'json',
		
// 		error : function(){},
	})
	
}
/** ?????? ????????????-?????? ?????? */
///20220112
//clickFileTitle(\'' + v.WEB_IDX + '\', \''+v.WEB_NM+'\', \''+v.WEB_EXPL+'\', \''+v.WEB_ORIGIN_NM+'\', \''+v.WEB_SAVENM+'\')
function clickFileTitle(clickVal, clickNm, clickExpl, clickFileNm, clickTitle){
// 	var clickVal = $("#file_idx").val();
// 	var clickNm = $("#file_nm").val();
// 	var clickExpl = $("#file_expl").val();
// 	var clickFileNm = $("#file_originNm").val();

	// ?????????.?????????.?????????.jpg
	var ext = clickFileNm.split('.')[clickFileNm.split('.').length - 1];
	var title = '';
	if(fileTypes_image(ext)) title = "/resources/webDiskFile/"+clickTitle;
	else title = "/resources/images/webDisk_fileupload.png";
///20220112
	if($(".modal-title7")){
		$("#webIdx7").val(clickVal);
		$("#webNm7").val(clickNm);
		$("#webExpl7").val(clickExpl);
		$("#webOriginNm7").val(clickFileNm);
		$("#fileThumbnail").attr('src',title);
	}
};

/** ???????????? ????????? */
$(document).ready(function(){ 
	/**????????????????????? contextmenu ??????*/
	$('#directory-tree').contextmenu(function(e){ 
		/**?????? ??????(1),??????(2),?????????(3) ?????? ????????? ?????? ?????????*/
		if($('.modal-title1')){
			$('#webNm').val(current_folderNm);
		}
		if($('.modal-title2')){
			$('#webNm2').val(current_folderNm);
			$('#webExpl2').val(current_folderExpl);
			$("#webIdx2").val(current_folder);
		}
		if($('.modal-title3')){
			$('#webNm3').val(current_folderNm);
			$('#webIdx3').val(current_folder);
		}
		
		//Get window size: 
		var winWidth = $(document).width(); 
		var winHeight = $(document).height(); 
		//Get pointer position: 
		var posX = e.pageX; 
		var posY = e.pageY; 
		//Get contextmenu size: 
		var menuWidth = $("#contextmenu_aside").width(); 
		var menuHeight = $("#contextmenu_aside").height(); 
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
		$("#contextmenu_aside").css({ 							//Display contextmenu: 
			"left": posLeft, 
			"top": posTop 
		}).show(); 
		//Prevent browser default contextmenu. 
		return false; 
		
	}); 
	$(document).click(function(){ 						//Hide contextmenu: 
		$("#contextmenu_aside").hide(); 
	});
}); 
</script>
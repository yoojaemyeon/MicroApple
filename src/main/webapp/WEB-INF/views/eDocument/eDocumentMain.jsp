<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="row">
<div class="col-12">
<div class="page-title-box">
	<div class="page-title-right">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb bg-light-lighten p-2 mb-0">
				<li class="breadcrumb-item"><a
					href="<%=request.getContextPath()%>/mainPage">
						<i class="uil-home-alt"></i>Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">전자결재</li>
			</ol>
		</nav>
	</div>
	<div style="display: inline-block;">
		<h4 class="page-title">전자결재</h4>
	</div>
</div>
<div class="row no-gutters my-3">
	<div class="col-2">
		<jsp:include page="include/leftMenu.jsp"/>
	</div>
	<div class="col-10 pl-1">
		<div class="card border-dark border" id="document_content" style="height: 850px; overflow: auto;">
		</div>
	</div>
</div>
</div>
</div>
<script>
var vLine = {};
make_content('home');
function document_confirm(AL_IDX, APRV_IDX){
	$.ajax({
		type: 'post',
		dataType: 'json',
		url: '/ajax/documentConfirm',
		data: {
			AL_IDX : AL_IDX,
			APRV_IDX : APRV_IDX
		},
		success: function(data){
			console.log(data);
			getDocumentCount();
			make_content('view');
		}
	});
}
function get_data(type){
	$.ajax({
		type: 'post',
		dataType: 'json',
		url: '/ajax/getDocumentList',
		data: {
			type : type
		},
		success: function(data){
			console.log(data);
			gridData[type] = [];
			$.each(data.row, function(i, v){
				gridData[type].push(rowProcess(v));
			});
			grid[type].resetData(gridData[type]);
		}
	});
}
function rowProcess(data){
	var tmp_obj = {};
	$.each(data, function(i2, v2){
		tmp_obj[i2] = v2;
	});
	tmp_obj['VIEW'] = '<button type="button" class="btn btn-sm btn-outline-dark" onclick="content_data=\''+tmp_obj['APRV_IDX']+'\';make_content(\'view\');"><i class="dripicons-search"></i></button>';
	return tmp_obj;
}
function save_document(){
	var APRV_TITLE = $('#APRV_TITLE').val();
	var APRV_CONT = editor.getHTML();
	var objData = {};
	objData['APRV_TITLE'] = APRV_TITLE;
	objData['APRV_CONT'] = APRV_CONT;
	objData['LINE'] = vLine;
	
	if(APRV_TITLE.trim() == ''){
		alert('문서 제목을 입력하지 않거나 공백으로만 입력할 수 없습니다.');
		return false;
	}
	
	if(Object.keys(vLine).length < 1) {
		alert('결제선을 등록하지 않았습니다.');
		return false;
	}
	
	var jsonData = JSON.stringify(objData);
	$.ajax({
		type: 'post',
		dataType: 'json',
		url: '/ajax/save_document',
		data:{
			jsonData : jsonData
		},
		success: function(data){
			console.log(data);
			if(data.check){
				alert("등록이 완료되었습니다.");
				location.href = '/eDocument';
			}else{
				
			}
		}
	});
}
function show_line(){
	var html = '';
	$('#document_line').html(html);
	html += '<table class="line-table">';
	html += '';
	html += '';
	html += '<thead>';
	html += '<tr>';
	$.each(vLine, function(i, v){
		html += '<th>' + v.POSITION_NM + '</th>';		
	});
	html += '</tr>';
	html += '</thead>';
	html += '<tbody>';
	html += '<tr>';
	$.each(vLine, function(i, v){
		html += '<td></td>';		
	});
	html += '</tr>';
	html += '</tbody>';
	html += '<tfoot>';
	html += '<tr>';
	$.each(vLine, function(i, v){
		html += '<th>' + v.MEM_NM + '</th>';		
	});
	html += '</tr>';
	html += '</tfoot>';
	html += '</table>';
	$('#document_line').html(html);
}
function make_line(){
	window.open('/eDocument/lineView', 'make_line', 'width=500,height=600');
}
</script>

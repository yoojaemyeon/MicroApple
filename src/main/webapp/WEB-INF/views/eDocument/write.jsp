<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/resources/assets/css/vendor/summernote-bs4.css" rel="stylesheet" type="text/css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.line-table {float: right;}
.line-table td, .line-table th {border: 1px solid #000;}
.line-table th {width: 7rem; padding: 0.5rem;}
.line-table td {padding: 3rem;}
</style>
<div class="row no-gutters my-3">
	<div class="col-2">
		<jsp:include page="include/leftMenu.jsp"/>
	</div>
	<div class="col-10 pl-1">
		<div class="card border-dark border">
			<div class="card-header py-1 px-5">
				<input type="text" id="APRV_TITLE" class="w-100 text-center" style="font-size: 2rem;" placeholder="전자결재 제목입력">
			</div>
			<div class="card-body py-1 px-5">
				<div class="row no-gutters">
					<div class="col-12 mt-3 text-center" id="document_line">
					</div>
					<div class="col-12 mb-3 text-right">
						<button type="button" class="btn btn-md btn-info" onclick="make_line();">결재선 제작</button>
					</div>
				</div>
				<div class="row no-gutters mb-3">
					<div class="col-12">
						<textarea id="summernote-basic" name="boardCont"></textarea>
					</div>
				</div>
				<div class="row no-gutters">
					<div class="col-12">
						<button type="button" class="btn btn-sm btn-success btn-block" onclick="save_document();">작성 완료</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
var vLine = {};
function save_document(){
	var APRV_TITLE = $('#APRV_TITLE').val();
	var APRV_CONT = $('#summernote-basic').val();
	var objData = {};
	objData['APRV_TITLE'] = APRV_TITLE;
	objData['APRV_CONT'] = APRV_CONT;
	objData['LINE'] = vLine;
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
<script src="/resources/assets/js/vendor/summernote-bs4.min.js"></script>
<!-- Summernote demo -->
<script src="/resources/assets/js/pages/demo.summernote.js"></script>
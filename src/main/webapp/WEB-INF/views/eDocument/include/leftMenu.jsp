<%@page import="micro.apple.groupware.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Editor's Dependecy Style -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<!-- Editor's Style -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/tui/css/tui-calendar.css" />
<link rel="stylesheet" type="text/css" href="/resources/tui/css/tui-date-picker.css" />
<link rel="stylesheet" type="text/css" href="/resources/tui/css/tui-time-picker.css" />
<link rel="stylesheet" href="/resources/tui/css/tui-pagination.css" />
<link rel="stylesheet" href="/resources/tui/css/tui-grid.css" />
<!-- Scripts -->
<script type="text/javascript" src="/resources/tui/js/tui-code-snippet.js"></script>
<script type="text/javascript" src="/resources/tui/js/tui-date-picker.js"></script>
<script type="text/javascript" src="/resources/tui/js/tui-time-picker.min.js"></script>
<script type="text/javascript" src="/resources/tui/js/tui-pagination.js"></script>
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<style>
.line-table {float: right;}
.line-table td, .line-table th {border: 1px solid #000;}
.line-table th {width: 7rem; padding: 0.5rem;}
.line-table td {padding: 3rem;}
</style>
<div class="row no-gutters">
	<div class="col-12">
		<div class="card text-center border-dark border">
			<div class="card-header p-1">
				<h3 style="cursor: pointer;" onclick="make_content('home');">전자결재</h3>
			</div>
			<div class="card-body p-1">
				<button type="button" class="btn btn-sm btn-block btn-success"
				onclick="make_content('write');">새 결재 진행</button>
			</div>
		</div>
	</div>
</div>
<div class="row no-gutters">
	<div class="col-12">
		<div class="card bg-dark">
			<div class="card-body p-1">
				<ul class="metismenu side-nav">
					<li class="side-nav-item mm-active">
						<a href="javascript: void(0);" class="side-nav-link" aria-expanded="false">
							<i class="dripicons-folder"></i>
							<span> 결재하기 </span>
							<span class="menu-arrow"></span>
						</a>
						<ul class="side-nav-second-level mm-collapse" aria-expanded="false" style="">
							<li class="side-nav-item">
								<a href="javascript: void(0);" onclick="make_content('home');" aria-expanded="false">결재 대기 문서 (<font id="CNT_WAIT">0</font>)</a>
							</li>
							<li class="side-nav-item">
								<a href="javascript: void(0);" onclick="make_content('home');" aria-expanded="false">결재 완료 문서 (<font id="CNT_COMP">0</font>)</a>
							</li>
						</ul>
					</li>
					<li class="side-nav-item mm-active">
						<a href="javascript: void(0);" class="side-nav-link" aria-expanded="false">
							<i class="dripicons-folder"></i>
							<span> 기안문서함 </span>
							<span class="menu-arrow"></span>
						</a>
						<ul class="side-nav-second-level mm-collapse" aria-expanded="false" style="">
							<li class="side-nav-item">
								<a href="javascript: void(0);" onclick="make_content('home');" aria-expanded="false">결재 진행 문서함 (<font id="CNT_START">0</font>)</a>
							</li>
							<li class="side-nav-item">
								<a href="javascript: void(0);" onclick="make_content('home');" aria-expanded="false">결재 완료 문서함 (<font id="CNT_END">0</font>)</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<script>
var editor;
var content_data;
var gridData = [];
gridData['wait'] = [];
// get_data('wait');
getDocumentCount();
var grid = {};
function getDocumentCount(){
	$.ajax({
		type: 'post',
		dataType: 'json',
		url: '/ajax/getCount',
		success: function(data){
			console.log(data);
			$.each(data, function(i, v){
				$('#'+i).html(v);
			});
		}
	});
}
function make_content(div){
	var html = '';
	var target = $('#document_content');
	target.html(html);
	switch (div) {
		case 'view':
			$.ajax({
				type: 'post',
				dataType: 'json',
				url: '/ajax/getDocumentInfo',
				data: {
					APRV_IDX: content_data
				},
				success: function(data){
					console.log(data);
					
					html += '<div class="card-header py-3 px-5">';
					html += '	<h3>'+data.info.APRV_TITLE+'</h3>';
					html += '</div>';
					html += '<div class="card-body py-1 px-5">';
					html += '	<div class="row no-gutters mb-3">';
					html += '		<div class="col-2 mt-3">';
					html += '			<br><br><br>';
					html += '			<h5>기안자 : '+data.info.APRV_WR+'</h5>';
					html += '			<h5>기안일시 : '+data.info.APRV_WRDATE+'</h5>';
					html += '		</div>';
					html += '		<div class="col-10 mt-3 text-center" id="document_line">';
					html += '			<table class="line-table">';
					html += '				<thead>';
					html += '					<tr>';
					$.each(data.line, function(i, v){
						html += '					<th>' + v.AL_MEM_POSITION + '</th>';		
					});
					html += '					</tr>';
					html += '				</thead>';
					html += '				<tbody>';
					html += '					<tr>';
					$.each(data.line, function(i, v){
						var flag = v.AL_ORDER == '0' ? true : (data.line[v.AL_ORDER*1 -1].AL_STAT == 'C');
						html += '					<td class="py-3 px-1">';		
						if(v.AL_STAT == 'C') html += v.AL_MEM_NM;
						else if(v.AL_STAT == 'W' && v.MEM_IDX == '<%=((MemberVO)session.getAttribute("MEMBERVO")).getMemIdx() %>' && flag){
							html += '<button type="button" class="btn btn-sm btn-success" onclick="document_confirm(\''+v.AL_IDX+'\',\''+v.APRV_IDX+'\');">결재</button>';
						}
						html += '					</td>';		
					});
					html += '					</tr>';
					html += '				</tbody>';
					html += '				<tfoot>';
					html += '					<tr>';
					$.each(data.line, function(i, v){
						html += '					<th>' + v.AL_MEM_NM + '</th>';		
					});
					html += '					</tr>';
					html += '				</tfoot>';
					html += '			</table>';
					html += '		</div>';
					html += '	</div>';
					html += '	<div class="row no-gutters mb-3">';
					html += '		<div class="col-12 p-3 border border-dark">';
					html += data.info.APRV_CONT;
					html += '		</div>';
					html += '	</div>';
					html += '</div>';
					target.html(html);
				}
			});
			
			break;
		case 'home':
			html += '<div class="card-body py-3 px-5">';
			html += '	<div class="row no-gutters">';
			html += '		<div class="col-6 p-3">';
			html += '			<div class="card">';
			html += '				<div class="card-header">결재대기문서 목록</div>';
			html += '				<div class="card-body">';
			html += '					<div class="card-header"><div id="data-sheet-wait"></div></div>';
			html += '				</div>';
			html += '			</div>';
			html += '		</div>';
			html += '		<div class="col-6 p-3">';
			html += '			<div class="card">';
			html += '				<div class="card-header">결재완료문서 목록</div>';
			html += '				<div class="card-body">';
			html += '					<div class="card-header"><div id="data-sheet-comp"></div></div>';
			html += '				</div>';
			html += '			</div>';
			html += '		</div>';
			html += '	</div>';
			html += '	<div class="row no-gutters mb-3">';
			html += '		<div class="col-6 p-3">';
			html += '			<div class="card">';
			html += '				<div class="card-header">진행결재 목록</div>';
			html += '				<div class="card-body">';
			html += '					<div class="card-header"><div id="data-sheet-start"></div></div>';
			html += '				</div>';
			html += '			</div>';
			html += '		</div>';
			html += '		<div class="col-6 p-3">';
			html += '			<div class="card">';
			html += '				<div class="card-header">완료결재 목록</div>';
			html += '				<div class="card-body">';
			html += '					<div class="card-header"><div id="data-sheet-end"></div></div>';
			html += '				</div>';
			html += '			</div>';
			html += '		</div>';
			html += '	</div>';
			html += '</div>';
			target.html(html);

			make_grid('wait');
			make_grid('comp');
			make_grid('start');
			make_grid('end');
			
			get_data('wait');
			get_data('comp');
			get_data('start');
			get_data('end');
			
			break;
		case 'write':
			html += '<div class="card-header py-3 px-5">';
			html += '	<input type="text" id="APRV_TITLE" class="w-100 text-center" style="font-size: 2rem;" placeholder="전자결재 제목입력">';
			html += '</div>';
			html += '<div class="card-body py-1 px-5">';
			html += '	<div class="row no-gutters">';
			html += '		<div class="col-12 mt-3 text-center" id="document_line">';
			html += '		</div>';
			html += '		<div class="col-12 mb-3 text-right">';
			html += '			<button type="button" class="btn btn-md btn-info" onclick="make_line();">결재선 지정</button>';
			html += '		</div>';
			html += '	</div>';
			html += '	<div class="row no-gutters mb-3">';
			html += '		<div class="col-12">';
			html += '			<div id="editor"></div>';
			html += '		</div>';
			html += '	</div>';
			html += '	<div class="row no-gutters mb-3">';
			html += '		<div class="col-12">';
			html += '			<button type="button" class="btn btn-sm btn-success btn-block" onclick="save_document();">작성 완료</button>';
			html += '		</div>';
			html += '	</div>';
			html += '</div>';
			target.html(html);
			
			editor = new toastui.Editor({
			    el: document.querySelector('#editor'),
			    previewStyle: 'vertical',
			    height: '500px',
			    initialEditType: 'wysiwyg'
		    });
			break;
	}
}
function make_grid(type){
	grid[type] = new tui.Grid({
		el: document.getElementById('data-sheet-'+type),
		columnOptions: {
			resizable: true,
		},
		pageOptions:{
			useClient: true,
			perPage: 5
		},
		columns: [
			{
				header: 'APRV_IDX',
				name: 'APRV_IDX',
				align: 'center',
				hidden: true
			},
			{
				header: '기안일시',
				name: 'APRV_WRDATE',
				align: 'center',
			},
			{
				header: '결재제목',
				name: 'APRV_TITLE',
				align: 'center',
			},
			{
				header: '기안자',
				name: 'APRV_WR',
				align: 'center',
			},
			{
				header: '보기',
				name: 'VIEW',
				align: 'center',
			},
		]
	});
}
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
System.out.println(request.getAttribute("data"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재선 생성</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta content="Coderthemes" name="author" />
	<link rel="shortcut icon" href="/resources/assets/images/favicon.ico">
	<script src="/resources/assets/js/jquery-3.6.0.js" ></script>
	
	<!-- third party css -->
	
	<link href="/resources/assets/css/vendor/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
	<!-- third party css end -->
	<!-- App css -->
	<link href="/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
	<link href="/resources/assets/css/app.min.css" rel="stylesheet" type="text/css" id="light-style" />
	<link href="/resources/assets/css/app-dark.min.css" rel="stylesheet" type="text/css" id="dark-style" />
	<link href="/resources/aside.css">
	<link rel="/resources/jquery-3.6.0.js">
	
</head>
<body class="bg-dark">
<div class="row m-2" style="height: calc(100vmax - 2rem);">
	<div class="col-6" style="height: 100%; overflow: auto;">
		<div class="card bg-dark" id="list_card">
			<ul class="metismenu side-nav">
				<c:forEach items="${data }" var="item">
					<li class="side-nav-item">
						<a href="javascript: void(0);" class="side-nav-link" aria-expanded="false">
							<i class="dripicons-folder"></i>
							<span> ${item.key } </span>
							<span class="menu-arrow"></span>
						</a>
						<ul class="side-nav-second-level mm-collapse" aria-expanded="false" style="">
							<c:forEach items="${item.value }" var="item2">
								<li class="side-nav-item">
									<a href="javascript: void(0);" aria-expanded="false" id="memIdx_${item2.MEM_IDX }"
									data-mem-idx="${item2.MEM_IDX }" data-mem-nm="${item2.MEM_NM }" data-position-nm="${item2.POSITION_NM }" data-position-idx="${item2.POSITION_IDX }"
									onclick="stacked_line('${item2.MEM_IDX }');">[${item2.POSITION_NM }] ${item2.MEM_NM}</a>
								</li>
							</c:forEach>
						</ul>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="col-6" style="height: 100%;">
		<div class="row no-gutters mb-3" style="height: 80%; overflow: auto;">
			<div class="col-12">
				<div class="card bg-dark" id="line_card">
				</div>
			</div>
		</div>
		<div class="row no-gutters" style="height: 10%; overflow: auto;">
			<div class="col-12">
				<div class="card bg-dark">
					<button type="button" class="btn btn-sm btn-success btn-block" onclick="save_line();">결제선 저장</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
var vLine = {};
function save_line(){
	if(Object.keys(vLine).length == 0){
		alert('선택된 결제자가 없습니다.');
		return false;
	}
	opener.vLine = vLine;
	opener.parent.show_line();
	window.close();
}
function stacked_line(MEM_IDX){
	var flag = true;
	$.each(vLine, function(i, v){
		console.log(v.MEM_IDX+' : '+MEM_IDX);
		if(v.MEM_IDX == MEM_IDX) flag = false;
	});
	if(flag){
		var t = $('#memIdx_'+MEM_IDX);
		var tmp = {};
		tmp['MEM_IDX'] = t.data('mem-idx');
		tmp['MEM_NM'] = t.data('mem-nm');
		tmp['POSITION_NM'] = t.data('position-nm');
		tmp['POSITION_IDX'] = t.data('position-idx');
		vLine[Object.keys(vLine).length] = tmp;
		show_line();
	}
}
function show_line(){
	var html = '';
	$('#line_card').html(html);
	html += '<table class="table table-sm table-borderless text-light m-0">';
	html += '<tbody>';
	$.each(vLine, function(i, v){
		html += '<tr>';
		html += '<td>';
		html += '<a href="javascript:void(0);" onclick="line_up('+i+');"><i class="dripicons-arrow-thin-up"></i></a>';
		html += '<a href="javascript:void(0);" onclick="line_remove('+i+');"><i class="dripicons-trash"></i></a>';
		html += '<a href="javascript:void(0);" onclick="line_down('+i+');"><i class="dripicons-arrow-thin-down"></i></a>';
		html += '['+v.POSITION_NM+'] ';
		html += v.MEM_NM;
		html += '</td>';
		html += '</tr>';
	});
	html += '</tbody>';
	html += '</table>';
	html += '';
	$('#line_card').html(html);
	
}
function line_up(o){
	o = o*1;
	if(o == 0) return false;
	var tmp = vLine[o-1];
	vLine[o-1] = vLine[o];
	vLine[o] = tmp;
	show_line();
}
function line_down(o){
	o = o*1;
	if(o+1 == Object.keys(vLine).length) return false;
	var tmp = vLine[o+1];
	vLine[o+1] = vLine[o];
	vLine[o] = tmp;
	show_line();
}
function line_remove(o){
	var tmp = {};
	$.each(vLine, function(i, v){
		if(o != i) tmp[Object.keys(tmp).length] = v;
	});
	vLine = tmp;
	show_line();
}
</script>
</body>
<!-- bundle -->
<script src="/resources/assets/js/vendor.min.js"></script>
<script src="/resources/assets/js/app.min.js"></script>
</html>
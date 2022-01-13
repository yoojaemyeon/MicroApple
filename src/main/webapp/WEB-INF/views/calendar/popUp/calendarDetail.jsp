<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="/resources/jquery-3.6.0.js"></script>
<link href='/resources/fullcalendar/lib/main.css' rel='stylesheet' />
<link href="/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/assets/css/app.min.css" rel="stylesheet" type="text/css" id="light-style" />
<!-- <link href="/resources/assets/css/app-dark.min.css" rel="stylesheet" type="text/css" id="dark-style" /> -->
<link href="/resources/aside.css">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function updateBtn() {
		//버튼누르면 수정버튼 없어지고 저장버튼 보임
		const btnElement = document.getElementById('detailUpdate');
		btnElement.style.display = "none";
		const btnElementSave = document.getElementById('detailSave');
		btnElementSave.style.display = "initial";
		
		//위의 변경 실행 및 input박스들의 readonly해제
		const activation1 = document.getElementById('title');
		activation1.readOnly = false;
		const activation2 = document.getElementById('content');
		activation2.readOnly = false;
		const activation3 = document.getElementById('start');
		activation3.readOnly = false;
		const activation4 = document.getElementById('end');
		activation4.readOnly = false;
// 		const activation5 = document.getElementById('shareMan');
// 		activation5.disabled = false;
		const activation6 = document.getElementById('ckb');
		activation6.disabled = false;
	}
	//수정필요
	$(function () {
		$("#ckb").change(function() {
			var ck = this.checked;
			if(ck){
				$("select#shareMan").prop("disabled", false);
				$("select#shareMan").css("display", "");
			} else{
				$("select#shareMan").prop("disabled", true);
			}
		});
	});
	
	
	
	//셀렉트 박스 내용 선택시 위에 출력
	function handleOnChange(e) {
		 const text = e.options[e.selectedIndex].text;
		 const memIdx = e.options[e.selectedIndex].value;
			
		 // 선택한 텍스트 출력
		  var target = $('#result');
		  target.append('<a href="javascript:void(0);" onclick="$(this).remove();" class="badge badge-outline-info mr-1" data-memIdx="'+memIdx+'">'+text+'</a>');
// 		  document.getElementById('result').innerText = text;
	}
	//저장버튼 누르면
	function saveBtn() {
		console.log('saveBtn');
		
		//보낼때 일정의 번호도 보내기
		var schdIdx = $('#schdIdx').text();
		
// 		console.log("test");
// 		var shareNm = $('#result .badge').text();
// 		var memIdx = $('#result .badge').attr('data-memIdx');
// 		if(shareNm == '' && memIdx==''){
// 			shareNm = null;
// 			memIdx = null;
// 		}
// 		console.log(shareNm);
// 		console.log(memIdx);
		
		
		$.each($('#result .badge'), function(i, v){
			var memIdx = $(this).attr('data-memIdx');
			var shareNm = $(this).text();
			
			//날짜 형식 변환하여 세팅(월에 -1을 하여 해당 날짜로 맞추기)
			const start = document.getElementById('start').value;
			var schdStart = new Date();
			schdStart.setFullYear(start.substring(0,4),start.substring(5,7)-1,start.substring(8,10));
			console.log("schdStart : "+schdStart);
				
			const end = document.getElementById('end').value;
			var schdEnd = new Date();
			schdEnd.setFullYear(end.substring(0,4),end.substring(5,7)-1,end.substring(8,10));
			console.log("schdEnd : "+schdEnd);
			
			//obj셋팅
			var obj = {"title":document.getElementById('title').value,
					"textarea":document.querySelector('textarea').value,
					"schdIdx":schdIdx,
					"start":schdStart.toString(),
					"end":schdEnd.toString(),
					"share":shareNm,
					"memIdx": memIdx
					};
			
			//데이터 세팅
			$.ajax({
				url: "/updateDetail",
				type:"post",
				data: JSON.stringify(obj),
				dataType:'json',
				contentType: "application/json;  charset=utf-8",
				async: false,
				success: function(data){
					console.log(data);
				},
				error: function(){
					alert("수정이 반영되지 않았습니다.");
				}
			});
		});
		alert("수정된 내용을 반영합니다.");
		
	}
	
	
</script>
<body>

<div class="container">
<div class="row justify-content-center">
<div class="col-lg-5">
	<h4>일정 상세</h4>
   <c:forEach var="schd" items="${list}" varStatus="status">
			<table class="table table-centered table-borderless mb-0">
		    <thead>
		        <tr>
		            <th style="width: 110px;">구분</th>
		            <th>내용</th>
		        </tr>
		    </thead>
		    <tbody>
		        <tr style="display: none;">
		            <th>번호</th>
		            <td><div id="schdIdx">${schd.schdIdx}</div></td>
		        </tr>
		        <tr>
		            <th>제목</th>
		            <td><input type="text" value="${schd.schdTitle}" readonly="readonly" id="title" style="width: -webkit-fill-available;"></td>
		        </tr>
		        <tr>
		            <th>내용</th>
		            <td>
						<textarea rows="5" cols="30" placeholder="수정을 누르고 내용을 입력하세요" readonly="readonly" id="content" style="width: -webkit-fill-available;">${schd.schdCont}</textarea>
		            </td>
		        </tr>
		        <tr>
		            <th>일시</th>
		            <td>
		            	<input type="date" value="${schd.schdStartFmt}" readonly="readonly" id="start">
		             ~ 
		            	<input type="date" value="${schd.schdEndFmt}" readonly="readonly" id="end">
		            </td>
		        </tr>
		        
		        <tr>
		            <th>일정공유</th>
		            <td>
		            	<input type="checkbox" id="ckb" name="ckb" disabled="disabled">공유 여부
			            	<select disabled="disabled" id="shareMan" name="Nm" onchange="handleOnChange(this)">
				            		<option value="null">== 공유자 선택 ==</option>
			            		<c:forEach var="Nm" items="${Nm}" varStatus="status">
				            		<option value="${Nm.memIdx }">${Nm.memNm}</option>
				            	</c:forEach>
			            	</select>
		            </td>
		        </tr>
		        
		        <tr>
		        	<th>공유자 목록</th>
		        	<td>
		        		<div id='result'>
		        			<a href="javascript:void(0);" onclick="$(this).remove();" class="badge badge-outline-info mr-1" data-memIdx="0" style="display:none;">null</a>
		        		</div>
		        	</td>
		        </tr>
		        
		    </tbody>
		</table>
   </c:forEach>
	
	<div style="float: right; padding: 10px;">	
		<button class="btn btn-success" id="detailSave" onclick="saveBtn()" style="display: none;">저장</button>
		<button class="btn btn-success" id="detailUpdate" onclick="updateBtn()">수정</button>
		<button class="btn btn-danger" onclick="window.close()">창닫기</button>
	</div>
	</div>
</div>
</div>
</body>
</html>
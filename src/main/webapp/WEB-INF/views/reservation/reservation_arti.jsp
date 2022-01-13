<%@page import="micro.apple.groupware.reservation.vo.ArticleVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="micro.apple.groupware.reservation.vo.ReservationVO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
List<ReservationVO> myList = request.getAttribute("myList") == null ? new ArrayList<ReservationVO>() : (List<ReservationVO>)(request.getAttribute("myList"));
System.out.println(myList);
SimpleDateFormat format = new SimpleDateFormat();
%>
<% 
List<ReservationVO> arti_rsvList= (List<ReservationVO>)(request.getAttribute("arti_rsvList"));
ArticleVO arti_info= (ArticleVO)(request.getAttribute("arti_info"));
System.out.println("arti_rsvList null :  " + arti_rsvList);
%>
<!DOCTYPE html>
<html>
 <head>
	    <link href='/resources/fullcalendar/lib/main.css' rel='stylesheet' />
	    <link rel="stylesheet" href="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>

   <style type="text/css">
    
    	.fc-event{
    		margin-top: 5px;
    		cursor:move
    	}

		.table-responsive{
			overflow-x: hidden;
		    height: 620px;
		    background-color: #dbeeff;
		}
		.table-responsive > table > thead > tr > th{
			padding:2px;
		}
		.table-responsive > table > tbody > tr > td{
			text-align: center;
		}
		.text-center-title{
			text-align: center;
			max-width: 180px;
   			min-width: 180px;
		}	
		.datepicker datepicker-inline1{
			width: 320px;
		}
		.side-nav-item1{
			font-weight:500;
			font-size: 20px;
			color: #343a40;
		}
		.side-nav-item1:hover{
			font-size: 25px;
			color: #6c757d;
		}
    </style>

  	<script src="/resources/jquery-3.6.0.js"></script>
    <script src='/resources/fullcalendar/lib/main.js'></script>
    <script src='/resources/fullcalendar/lib/locales/ko.js'></script>
    <script src='/resources/fullcalendar/examples/js/theme-chooser.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script>
    var calendar = null;
//     function updateFunc(info) {
// 	var start = info.event.start;
// 	start = dateFormat(start);
// 	vat end = info.event.end;
// 	end = dateFormat(end);
// 	var title = info.event.title;
// 	var msg;
// 	$ajax({
// 		type : 'POST',
// 		data : {
// 			start : start,
// 			end : end,
// 			title : title
// 		},
// 		dataType : 'json',
// 		async : false,
// 		url : '',
// 		success : function(result) {
// 			if(result == 'y'){
// 				msg = '수정되었습니다.';
// 			}else{
// 				msg = '수정에 실패 했습니다.';
// 			}
// 		},
// 		error :function(xhr, status, error){
// 			msg='수정에 실패 했습니다.';
// 		}
// 	});
// 	return msg;
// 	}
    
    $(function(){
//기본 설정
        var Calendar = FullCalendar.Calendar;
        var Draggable = FullCalendar.Draggable;
// calendar element 취득
        var containerEl = document.getElementById('external-events');
        var calendarEl = document.getElementById('calendar');
        var checkbox = document.getElementById('drop-remove');

        // initialize the external events
        // -----------------------------------------------------------------

        new Draggable(containerEl, {
          itemSelector: '.fc-event',
          eventData: function(eventEl) {
            return {
              title: eventEl.innerText
            };
          }
        });

        // initialize the calendar
        // -----------------------------------------------------------------
        
        
// full-calendar 생성하기
       calendar = new Calendar(calendarEl, {
//비율 설정
        	aspectRatio: 1.85,
//상단 툴바 설정        	
          	headerToolbar: {
	            left: 'prev,next today',
	            center: 'title',
	            right: 'dayGridMonth,timeGridWeek,timeGridDay'
          	},
//한국 시간으로 설정
          	timeZone : 'local',
//버튼 글자 커스텀
          	buttonText:{
          		today : '오늘',
          		month : "월",
          		week:"주",
          		day:"일"
          	},
//navLinks: 달력상의 날짜를 클릭할수 있는지 여부 체크(날짜 누르면 주,일,시간 단위 화면으로 넘어감)
          navLinks: true,
// 달력 일자 드래그 설정가능
          selectable: true,
// 사용자가 드래그하는 동안 "자리 표시자" 이벤트를 그릴지 여부?!?!?!
          selectMirror: true,
// 캘린더에서 드래그로 이벤트를 생성할 수 있다.
          select: function(arg) {
        	  
//         	  alert("선택함 : " + arg.startStr + " ~ " + arg.endStr)
         	  $(".modal fade");
        	  
//             var title = prompt('이벤트 내용 작성');
//             if (title) {
//               calendar.addEvent({
//                 title: title,
//                 start: arg.start,
//                 end: arg.end
//               })
//               $.ajax({
//             	  type: "POST",
//             	  url: "/insertArticle",
//             	  data:{
//             		  start: moment(arg.start).format('MM-DD'),
//             		  end: moment(arg.end).format('MM-DD'),
//             		  title : title
//             	  },
//             	  success:function(response){
//             		  alert('일정이 추가되었습니다.');
//             	  }
//               })
//             calendar.unselect()
//             }
          },
          
          eventClick: function(info) {  
            if (confirm(info.event.title + ' 삭제 하시겠습니까?')) {
            	$.ajax({
            		type:"POST",
            		url: "/deleteArticle",
            		data: {
            		  start: moment(arg.start).format('yyyy-MM-dd'),
               		  end: moment(arg.end).format('yyyy-MM-dd'),
               		  title : title
            		},
            		success:function(response){
            			window.location.reload()
            		}
            		
            	})
//             	info.event.remove()
            }
          },
//           eventDrop: function(info){
//         	  if(confirm("수정하시겠습니까?"){
//         		  var msg = updateFunc(info);
//         		  alert(msg);
//         	  }else{
        		  //취소시키기(없을 겨우 무조건 이동이 이루어진다.)
//         		  info.revent();
//         	  }
//           },
          //이벤트 일정을 드래그 해 변경했을 때(종료 일자)
//           eventResize: function(info){
//         	  if(confirm("수정하시겠습니까?"){
//         		  var msg = updateFunc(info);
//         		  alert(msg);
//         	  }else{
        		  //취소시키기(없을 겨우 무조건 이동이 이루어진다.)
//         		  info.revent();
//         	  }
//           },

//dayMaxEvents: 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
          dayMaxEvents: true,
//editable: 이벤트 드래그, 리사이징 등의 편집 여부를 설정(default:false)          
         editable: true
//          컨트롤러에서 가져온 데이터 jsp에 세팅해주기

<% if(arti_rsvList.size() > 0) {%>

  ,events:[	//DB에 있는 EVENT 가져오기
        	  <% 
        	  for(int i = 0; i < arti_rsvList.size(); i++){
        		  if(i > 0){
        	  %>
        	  ,
        	  <%}%>
		        	{
		        		title: '<%=arti_rsvList.get(i).getRsrvCont() %>', 
		        		color:'#9575cd',
		       			start: new Date('<%=arti_rsvList.get(i).getRsrvStart() %>'), 
		       			end: new Date('<%=arti_rsvList.get(i).getRsrvEnd() %>')
			        }
        	  <%}%>
          ]
<% }%> 
      
        //droppable : 다른 캘린더의 외부 드래그 가능한 요소 또는 이벤트를 캘린더에 놓을 수 있는지 여부를 결정합니다 .          
          ,droppable: true,
// drop : 외부 드래그 가능 요소 또는 다른 캘린더의 이벤트가 캘린더 에 드롭 될 때 호출됩니다 .          
          drop: function(dropInfo) {
// is the "remove after drop" checkbox checked? : "삭제 후 제거" 확인란이 선택되어 있습니까?
            if (checkbox.checked) {
// draggedEl: 드래그 중인 HTML 요소입니다.
// if so, remove the element from the "Draggable Events" list : 그렇다면 "Draggable Events" 목록에서 요소를 제거하십시오.
              dropInfo.draggedEl.parentNode.removeChild(dropInfo.draggedEl);
            }
          },
// 한국어 설정          
          locale: 'ko',
// 이벤트가 추가되면 발생하는 이벤트          
		eventAdd: function(obj) { 
        	  console.log(obj);
        	  },
// 이벤트가 수정되면 발생하는 이벤트
		eventChange: function(obj) { 
        	  console.log(obj);
        	  },
// 이벤트가 삭제되면 발생하는 이벤트
		eventRemove: function(obj){ 
        	  console.log(obj);
        	  }
        });
// 캘린더 랜더링
        calendar.render();
      });
      
      function checkTarget(event) {
    	  var articleNM = event.currentTarget;
    	  console.log(articleNM);
    	}

</script>
    <script>
    $(function(){
        $('.datetimepicker').appendDtpicker({'locale':'ko'});
    });
    </script>
</head>
<div class="content">
<!-- Start Content-->
	<div class="container-fluid">

<!-- start page 예약 title -->
		<div class="row">
			<div class="col-12">
				<div class="page-title-box">
					<div class="page-title-right">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb bg-light-lighten p-2 mb-0">
								<li class="breadcrumb-item"><a
									href="<%=request.getContextPath()%>/mainPage"><i
										class="uil-home-alt"></i>Home</a></li>
								<li class="breadcrumb-item"><a
									href="<%=request.getContextPath()%>/reservation">예약</a></li>
								<li class="breadcrumb-item active" aria-current="page">예약하기</li>
							</ol>
						</nav>
					</div>
					
					<div style="display: inline-block;">
						<h4 class="page-title">예약하기</h4>
					</div>
<!-- 부서번호:4(인사부)만 버튼 생김-->					
					<c:if test="${sessionScope.MEMBERVO.deptIdx=='4'}">
						<div
							style="display: inline-block; position: relative; left: 10px; bottom: 30px;">
							<a href="/updateArticle" class="btn btn-danger mb-2"> <i
								class="mdi mdi-plus-circle mr-2"></i> 물품 리스트 수정
							</a>
						</div>
					</c:if>
				</div>
			</div>
		</div>
<!-- end page 예약 title -->

                 <div class="row">
                        	<div class="col-2">
                        		<div class="card">
                                    <div class="card-body" style="border:1px solid; border-radius: 0.5em; ">
                                    <h4 class="header-title mb-3">예약 가능 물품</h4>
	                                   <div class="page-aside-left">
											 <ul class="metismenu">
											 <!-- 대기만성 member list -->
											 <c:forEach var="article" items="${arti_list}" >
					                            <li class="side-nav-item">
				                                    <div onclick="checkTarget();"><a class="side-nav-item1" href="/reservation_arti?artiIdx=${article.artiIdx}">${article.artiNm}</a></div>
				                                </li>
											</c:forEach>
						                     </ul>
                                        </div>
									</div>
								</div>
							</div>
			<div class="col-xl-7">
				<div class="card">
					<div class="card-body" style="border:1px solid; border-radius: 0.5em; ">
	
						<h4 class="header-title mb-3">예약 현황</h4>

<!-- external-events -->
                            <div id='external-events' style="float:left; width: 0%; padding-right:30px; padding-left:20px;">
							</div>
	
<!-- calendar -->
                         <div class="page-aside">
  							 <div style="float:center; width: 100%; height: 580px; padding-left: 30px;">
                                 <div id="calendar"></div>
                             </div>
                         </div> <!-- end col -->
						</div>
					</div>
				</div>
				

		
			<!-- 등록 -->
			<div class="col-xl-3">
				<div class="card">
					<div class="card-body" style="border:1px solid; border-radius: 0.5em; ">
						<h4 class="header-title mb-3">예약 등록</h4>
						<div class="col-md-12">
								<!-- 		                                                <div class="datepicker-days" style=""> -->
							<form action="/ReservationSave" method="post" >
								<div class="form-group mb-12">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text" id="inputGroupPrepend">신청 물품</span>
										</div>
										<input style="width:50px;" type="text" class="form-control" name="artiNm" id="artiNm" value="${arti_info.artiNm } "/>
										<input type="hidden" name="artiIdx" id="artiIdx" value="${arti_info.artiIdx}"/>
										<input type="hidden" name="artiDvsn" id="artiDvsn" value="${arti_info.artiDvsn}"/>
									</div><br>
								</div>
<!-- 
								<div class="form-group mb-10">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text" id="inputGroupPrepend">신 청 자</span>
										</div>
										<input style="width:50px;" type="text" class="form-control" name="articleName" id="articleName" value="${arti_info.artiNm } "/>
										
									</div>
								</div>
								<div class="form-group mb-10">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text" id="inputGroupPrepend"> 부  서 </span>
										</div>
										<input style="width:50px;" type="text" class="form-control" name="articleName" id="articleName" value="${arti_info.artiNm } "/>
										
									</div>
								</div>
-->

								<div class="form-group mb-12">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text" id="inputGroupPrepend">사용 시간</span>
										</div>
											<input style="width:50px; font-size: 5px;" type="text" class="form-control" type="text" name="datetimes" id="datetimes" />
									</div>
								</div>
								<div class="form-group mb-10">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text" id="inputGroupPrepend">신청 내용</span>
										</div>
										<textarea class="form-control" name="content" id ="rsrvCont" rows="10" cols="37"></textarea>
									</div>
								</div>
							
								<button type="button" class="btn btn-success" id="rsrv">
									<i class="uil-notes"></i> 예약
								</button>&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-danger" onClick="history.back();">
									<i class="uil-label"></i> 뒤로
								</button>
							</form>
							</div>
							<!-- end col-->
						</div>
					</div>
			</div>
			<!-- end col -->
		</div>
		<!-- end row -->
	</div>
	<!-- end container-fluid -->
</div>
<!-- container -->
	<script>
	$(function() {
	  $('input[name="datetimes"]').daterangepicker({
	    timePicker: true,
	    timePicker24Hour:true,
	    startDate: moment().startOf('hour'),
	    endDate: moment().startOf('hour').add(1, 'hour'),
	    locale: {
	      format: 'YYYY/MM/DD HH:mm'
	    }
	  });
	});
	
	$(document).ready(function() {
		$('#rsrv').click(function(){
			var articleName = $('#artiNm').val();
			var articleIdx = $('#artiIdx').val();
			var articleDvsn = $('#artiDvsn').val();
			var datetimes = $('#datetimes').val().split(' - ');
			var rsrvStart = datetimes[0];
			var rsrvEnd = datetimes[1];
			var contents = $('#rsrvCont').val();
			
			console.log("articleName : " + articleName);
			console.log("articleIdx : " + articleIdx);
			console.log("articleDvsn : " + articleDvsn);
			console.log("rsrvStart : " + rsrvStart);
			console.log("rsrvEnd : " + rsrvEnd);
			console.log("contents : " + contents);
			
//가상Form 태그
//create element(form)
			var newForm = document.createElement('form');
//set attribute(form)
			newForm.name = 'newForm';
			newForm.method ='post';
			newForm.action ='/reservationSave';
			
//create element(input)	
			var input1 = document.createElement('input');
			var input2 = document.createElement('input');
			var input3 = document.createElement('input');
			var input4 = document.createElement('input');
			var input5 = document.createElement('input');
			var input6 = document.createElement('input');
//set attribute(input)
			input1.setAttribute("type","hidden");
			input1.setAttribute("name","artiNm");
			input1.setAttribute("value",articleName);
			input2.setAttribute("type","hidden");
			input2.setAttribute("name","artiIdx");
			input2.setAttribute("value",articleIdx);
			input3.setAttribute("type","hidden");
			input3.setAttribute("name","artiDvsn");
			input3.setAttribute("value",articleDvsn);
			input4.setAttribute("type","hidden");
			input4.setAttribute("name","rsrvStart");
			input4.setAttribute("value",rsrvStart+':00');
			input5.setAttribute("type","hidden");
			input5.setAttribute("name","rsrvEnd");
			input5.setAttribute("value",rsrvEnd+':00');
			input6.setAttribute("type","hidden");
			input6.setAttribute("name","rsrvCont");
			input6.setAttribute("value",contents);
			
//append input (to form)
			newForm.appendChild(input1);
			newForm.appendChild(input2);
			newForm.appendChild(input3);
			newForm.appendChild(input4);
			newForm.appendChild(input5);
			newForm.appendChild(input6);
			
			console.log(newForm);
			
//append form (to body)
			document.body.appendChild(newForm);
			
//submit form
 			newForm.submit();

		});
	});

	
	
	</script>
</html>


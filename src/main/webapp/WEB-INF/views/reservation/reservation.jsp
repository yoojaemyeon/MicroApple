<%@page import="micro.apple.groupware.reservation.vo.ArticleVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="micro.apple.groupware.reservation.vo.ReservationVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
List<ReservationVO> myList = request.getAttribute("myList") == null ? new ArrayList<ReservationVO>() : (List<ReservationVO>)(request.getAttribute("myList"));
ArticleVO arti_info1= (ArticleVO)(request.getAttribute("arti_info1"));
%>
<!DOCTYPE html>
<html>
 <head>
	<link href='/resources/fullcalendar/lib/main.css' rel='stylesheet' />
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
		,
    
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
    
    $(document).ready(function(){
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
        var calendar = new Calendar(calendarEl, {
//비율 설정
        	aspectRatio: 1.85,
//상단 툴바 설정        	
          	headerToolbar: {
	            left: 'prev,next today',
	            center: 'title',
	            right: 'dayGridMonth,timeGridWeek,timeGridDay'
          	},
//한국 시간으로 설정
          	//timeZone : 'local',
//버튼 글자 커스텀
//           	buttonText:{
//           		today : '오늘',
//           		month : "월",
//           		week:"주",
//           		day:"일"
//           	},
//navLinks: 달력상의 날짜를 클릭할수 있는지 여부 체크(날짜 누르면 주,일,시간 단위 화면으로 넘어감)
          navLinks: true,
// 달력 일자 드래그 설정가능
          selectable: true,
// 사용자가 드래그하는 동안 "자리 표시자" 이벤트를 그릴지 여부?!?!?!
          selectMirror: true,
// 캘린더에서 드래그로 이벤트를 생성할 수 있다.
          select: function(arg) {
        	  console.log("arg : " + arg);
        	 //var title = prompt('일정 내용을 입력하세요');
//               if (title) {
//                 calendar.addEvent({
//                   title: title,
//                   start: arg.startStr,
//                   end: arg.endStr
//                 })
//               }
              console.log("arg.startStr : " + arg.startStr);
              calendar.unselect()
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


<% if(myList.size() > 0) {%>
          ,events:[	//DB에 있는 EVENT 가져오기
        	  <% 
        	  for(int i = 0; i < myList.size(); i++){
        		  if(i > 0){
        	  %>
        	  ,
	        	  <%}%>
	        	  <%
	        	  	String color = "";
	        	  	switch(myList.get(i).getArtiIdx()) {
		        	  	case 1 + "":
		        	  		color = "#ffcdd2";
		        	  		break;
		        	  	case 2 + "":
		        	  		color = "#e1bee7";
		        	  		break;
		        	  	case 3 + "":
		        	  		color = "#c5cae9";
		        	  		break;
		        	  	case 21 + "":
		        	  		color = "#b2ebf2";
		        	  		break;
		        	  	case 22 + "":
		        	  		color = "#c8e6c9";
		        	  		break;
		        	  	case 23 + "":
		        	  		color = "#ffecb3";
		        	  		break;
	        	  	}
	        	  %>
		        	  {
			        		title: '<%=myList.get(i).getRsrvCont() %>', 
		        		   	color : '<%=color%>',
			       			start: new Date('<%=myList.get(i).getRsrvStart() %>'),
			       			end: new Date('<%=myList.get(i).getRsrvEnd() %>')
			          }
	        	  <%}%>
          		]
     <% }%> 

        //droppable : 다른 캘린더의 외부 드래그 가능한 요소 또는 이벤트를 캘린더에 놓을 수 있는지 여부를 결정합니다 .          
          , droppable: true,
// drop : 외부 드래그 가능 요소 또는 다른 캘린더의 이벤트가 캘린더 에 드롭 될 때 호출됩니다 .          
          //drop: function(dropInfo) {
// is the "remove after drop" checkbox checked? : "삭제 후 제거" 확인란이 선택되어 있습니까?
            //if (checkbox.checked) {
// draggedEl: 드래그 중인 HTML 요소입니다.
// if so, remove the element from the "Draggable Events" list : 그렇다면 "Draggable Events" 목록에서 요소를 제거하십시오.
              //dropInfo.draggedEl.parentNode.removeChild(dropInfo.draggedEl);
            //}
         // },
// 한국어 설정          
          locale: 'ko'
// 이벤트가 추가되면 발생하는 이벤트          
		//,eventAdd: function(obj) { 
        	  //console.log(obj);
        	  //},
// 이벤트가 수정되면 발생하는 이벤트
		//eventChange: function(obj) { 
        	  //console.log(obj);
        	  //},
// 이벤트가 삭제되면 발생하는 이벤트
		//eventRemove: function(obj){ 
        	//  console.log(obj);
        	  //}
        });
// 캘린더 랜더링
        calendar.render();
      });
      
      function allSave() {
      	var allEvent = calendar.getEvents();
      	
      	var events = [];
      	for(var i=0; i< allEvent.length; i++){
      		var obj = {};
      		
      		obj['title'] = allEvent[i]._def.title; //이벤트 명칭
      		obj['start'] = allEvent[i]._instance.range.start; //시작날짜 및 시간
      		obj['end'] = allEvent[i]._instance.range.end; //마침날짜 및 시간
      		
  	   		$.ajax({
  	   			type:"post",
  	   			dataType: "json",
  	   			url: "/reservation1",
  	   			async: false,
  	   			data: obj,
  	   			success: function(data){
  	   				console.log("data" + data);
  	   			}
  	   		});
      	}
      	location.reload();
  	}

</script>
</head>
<body>

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
								<li class="breadcrumb-item">
									<a href="<%=request.getContextPath()%>/mainPage">
										<i class="uil-home-alt"></i>Home
									</a>
								</li>
								<li class="breadcrumb-item active" aria-current="page">예약</li>
							</ol>
						</nav>
					</div>
					
					<div style="display: inline-block;">
						<h4 class="page-title">자원예약</h4>
					</div>
					
				<div style="display: inline-block; position: relative; left: 10px; bottom: 30px;">
					<a href="/reservation_arti" class="btn btn-secondary mb-2"> 
						<i class="mdi mdi-plus-circle mr-2"></i>예약 하기
					</a>
				</div>
				</div>
			</div>
		</div>
<!-- end page 예약 title -->

		<div class="row">
			<div class="col-xl-10">
				<div class="card">
					<div class="card-body" style="height: 880px; border:1px solid;border-radius: 0.5em; ">
						<h4 class="header-title mb-3">나의 예약 현황</h4>

<!-- external-events -->
                    <div id='external-events' style="float:left; width: 0%; padding-right:30px; padding-left:20px;"></div>
<!-- calendar -->
                    <div class="page-aside">
						<div style="float:center; width: 100%; height: 580px; ">
				   			<div id='calendar'></div>
				   		
			  		 	</div>
					</div><!-- end calendar-->
				</div><!-- end card-body -->
				</div><!-- end card-->
			</div><!-- end col-xl-7 -->
			<div class="col-xl-2">
				<div class="card">
					<div class="card-body" style= "border:1px solid; border-radius: 0.5em; ">
						<h4 class="header-title mb-3">예약 물품 구분</h4>
						 <ul class="metismenu">
							 <c:forEach var="article" items="${arti_list}" >
	                            <li class="side-nav-item">
                                    <div><i class="uil-apple">${color}</i>${article.artiNm}</div>
                                </li>
							</c:forEach>
	                     </ul>
					</div>
				</div>
			</div>
		</div><!-- end row -->
	
</div><!-- end container -->
</div><!-- end content -->
</body>
</html>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="micro.apple.groupware.calendar.vo.CalendarVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
List<CalendarVO> list = (List<CalendarVO>)(request.getAttribute("list"));
System.out.println(list);
SimpleDateFormat format = new SimpleDateFormat();
%>
<!DOCTYPE html>
<html>
 <head>
    <meta charset='utf-8' />
    <link href='/resources/fullcalendar/lib/main.css' rel='stylesheet' />
<!--     <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet"> -->
<!--     <link rel="stylesheet" href="https://bootswatch.com/4/pulse/bootstrap.min.css"> -->
    <style type="text/css">
    
    	.fc-event{
    		margin-top: 5px;
    		cursor:move
    	}
/*     	.schdList > thead, tbody > tr { */
/*     		text-align: center; */
/*     	} */
/*     	.schdList > thead, tbody > tr > th{ */
/*     		padding: 2px; */
/*     	} */
		.table-responsive{
			overflow-x: hidden;
		    height: 460px;
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
		.fc-prev-button fc-button fc-button-primary{
			background-color: rgb(148 206 255 / 71%);
		}
		
    
    </style>
    
    <script src="/resources/jquery-3.6.0.js"></script>
    <script src='/resources/fullcalendar/lib/main.js'></script>
    <script src='/resources/fullcalendar/lib/locales/ko.js'></script>
    <script src='/resources/fullcalendar/examples/js/theme-chooser.js'></script>
    
    <script>
    var calendar = null;
    
    $(document).ready(function(){
        var Calendar = FullCalendar.Calendar;
        var Draggable = FullCalendar.Draggable;

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

        calendar = new Calendar(calendarEl, {
        	aspectRatio: 1.85,
          headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
          },
          navLinks: true, // can click day/week names to navigate views
          selectable: true,
          selectMirror: true,
          select: function(arg) {
//         	  console.log(arg.startStr);
			  console.log(arg);
//         	  $("#event-modal").modal({backdrop: "static"});
            var title = prompt('일정의 제목을 입력하세요');
            if (title) {
              calendar.addEvent({
                title: title,
                start: arg.start,
                end: arg.end,
                allDay: arg.allDay
              })
            }
            console.log(arg.startStr);
            calendar.unselect()
          },
          eventClick: function(arg) {
            if (confirm('저장을 취소하시겠습니까?')) {
              arg.event.remove()
            }
          },
          dayMaxEvents: true, // allow "more" link when too many events
          editable: true//수정가능 여부
//           컨트롤러에서 가져온 데이터 jsp에 세팅해주기
          <% if(list.size() > 0) {%>
          ,events:[
        	  <% 
        	  for(int i = 0; i < list.size(); i++){
        		  if(i > 0){
// 		        	Date endDate = new Date(list.get(i).getSchdEnd());
// 		  			endDate.setDate(endDate.getDate()-1);
        	  %>
        			
        	  ,
        	  <%}%>
        		
        	  		{
		        		title: '<%=list.get(i).getSchdTitle() %>', 
		       			start: new Date('<%=list.get(i).getSchdStart() %>'), 
		       			end: new Date('<%=list.get(i).getSchdEnd() %>'),
		       			allDay: '<%=list.get(i).getSchdAd() %>'
		       			
	        	 	}
        	  <%}%>
          ]
          <% }%>
          
          
          ,droppable: true, // this allows things to be dropped onto the calendar
          drop: function(info) {
            // is the "remove after drop" checkbox checked?
            if (checkbox.checked) {
              // if so, remove the element from the "Draggable Events" list
              info.draggedEl.parentNode.removeChild(info.draggedEl);
            }
          },
          locale: 'ko'
        });
        console.log("날짜 데이터");
        console.log(calendar);
        calendar.render();
      });

    //1. 데이터 추출	
    function allSave() {
    	var allEvent = calendar.getEvents();
    	
    	var events = [];
    	for(var i=0; i< allEvent.length; i++){
    		var obj = {};
    		
    		obj['title'] = allEvent[i]._def.title; //이벤트 명칭
    		obj['allDay'] = allEvent[i]._def.allDay; //하루 종일의 이벤트인지 알려주는 boolean값(true or false)
    		obj['start'] = allEvent[i]._instance.range.start; //시작날짜 및 시간
    		obj['end'] = allEvent[i]._instance.range.end; //마침날짜 및 시간
    		
	   		$.ajax({
	   			type:"post",
	   			dataType: "json",
	   			url: "/calendar1",
	   			async: false,
	   			data: obj,
	   			success: function(data){
	   				console.log(data);
	   			}
	   		});
    	}
    	location.reload();
	}

   function savedata(jsondata) {
		$.ajax({
			url: "/calendar1",
			type:"post",
// 			data: JSON.stringify(param),
			traditional:true,
			data: {
				data:JSON.stringify(jsondata),
			},
			dataType:'json',
			contentType: "application/json",
			success: function(data){
				alert("두번째 테스트 성공");
				console.log("성공");
			},
			error: function(){
				alert("두번째 실패");
			}
		});
	}
	console.log("끝");
	
	
	function schdShareDelete() {
		var schdIdx = $('.schdIdx').val();
		console.log("TEST");
		console.log(schdIdx);
		
		$.ajax({
			type:"POST",
			url:"/shareDelete",
			traditional:true,
			data : {schdIdx:schdIdx},
			dataType:'json',
			success:function(data){
				console.log("성공");
			}
		});
		
		
		
	}
	
	//삭제버튼
//     function selectDelete(){
//     	var form = document.list;
//     	form.submit();
//     }

    </script>
  </head>
  <body>
           <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->

                    <!-- Start Content-->
                    <div class="container-fluid">
                        <!-- start page email-title -->
                           <div class="col-12">
                  <div class="page-title-box">
                      <div class="page-title-right">
                          <nav aria-label="breadcrumb">
							<ol class="breadcrumb bg-light-lighten p-2 mb-0">
							    <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/mainPage"><i class="uil-home-alt"></i> Home</a></li>
							        <li class="breadcrumb-item active" aria-current="page">일정관리</li>
							    </ol>
							</nav>
                       </div>
                       <h4 class="page-title">일정관리</h4>
                   </div>
               </div>
           </div>    
                        <!-- end page email-title --> 
                        <div class="row">
                            <!-- Right Sidebar -->
                            <div class="col-12">
                                <div class="card" style="height: 715px;">
                                    <div class="card-body">
                                        <!-- Left sidebar -->
                                        	<div id='external-events' style="float:left; width: 0%; padding-right:30px; padding-left:20px;">
		
		
		
		
		
		
	</div>
	
                                        <!-- End Left sidebar -->
                                        <div class="page-aside">
  
  
  
  
  

  	<div style="float:left; width: 70%; height: 580px; padding-left: 30px;">
	    <div id='calendar'></div>
   	</div>
   	
   	
   	
<div style="float:right; width: 25%; height: 60%">
	<h4>일정목록</h4>
	<ul class="nav nav-tabs nav-bordered mb-3">
	    <li class="nav-item">
	        <a href="#profile-b1" data-toggle="tab" aria-expanded="false" class="nav-link active">
	            <i class="mdi mdi-account-circle d-md-none d-block"></i>
	            <span class="d-none d-md-block">개인일정</span>
	        </a>
	    </li>
	     <li class="nav-item">
        <a href="#settings-b1" data-toggle="tab" aria-expanded="false" class="nav-link">
            <i class="mdi mdi-settings-outline d-md-none d-block"></i>
            <span class="d-none d-md-block">공유일정</span>
        </a>
    </li>
	</ul>
	
	<div class="tab-content">
	    <div class="tab-pane show active" id="profile-b1">
	        	        <form action="<%=request.getContextPath()%>/schdDelete" method="post" id="selectBtn" name="list">
<!--    									<div style="float:right; width: 25%; height: 60%"> -->
   										
   										
  									 	<div class="table-responsive">
                                            <table class="table table-bordered table-striped mb-3">
                                                <thead>
                                                <tr>
                                                    <th class="text-center">구분</th>
                                                    <th class="text-center-title">제목</th>
                                                    <th class="text-center">시작일</th>
                                                    <th class="text-center">종료일</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                	<c:forEach var="schd" items="${list}" varStatus="status">
                                              		 	 <tr>
		                                                    <td><input type="checkbox" value="${schd.schdIdx}" name="checkBox"></td>
		                                                    <td><a href="javascript:;" onclick="window.open('/calendarDetail?schdIdx=${schd.schdIdx}', 'test', 'loaction=no, width=600px, height=630px, toolbar=no, menubar=no, status=no, scrollbars=no');">${schd.schdTitle}</a></td>
		                                                    <td style="font-size: smaller; padding: 0px; padding-top: 20px;">${schd.schdStartFmt}</td>
		                                                    <td style="font-size: smaller; padding: 0px; padding-top: 20px;">${schd.schdEndFmt}</td>
                                                		</tr> 
          	                                         </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                                	<div>
<!--                                                 		<button class="btn btn-danger" type="submit">삭제</button> -->
                                                		<button type="button" class="btn btn-success" onclick="javascript:allSave();" style="float:right; margin-top:10px; width: -webkit-fill-available;">일정 저장</button>
                                                		<button class="btn btn-danger" style="float:right; margin-top:10px; width: -webkit-fill-available;">삭제</button>
<!--                                                 		<button class="btn btn-danger" onclick="javascript:delete();">삭제</button> -->
                                                	</div>
<!--                                    	</div> -->
   								</form>
	    </div>
<!-- 	    공유일정 -->
	    <div class="tab-pane" id="settings-b1">
        	<div class="table-responsive">
                                            <table class="table table-bordered table-striped mb-3">
                                                <thead>
                                                <tr>
                                                    <th class="text-center">구분</th>
                                                    <th class="text-center-title">제목</th>
                                                    <th class="text-center">시작일</th>
                                                    <th class="text-center">종료일</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                	<c:forEach var="schdShare" items="${schdList}" varStatus="status">
                                              		 	 <tr>
		                                                    <td><input type="checkbox" class="schdIdx" value="${schdShare.schdIdx}" name="checkBox"></td>
		                                                    <td><a href="javascript:;" onclick="window.open('/calendarDetail2?schdIdx=${schdShare.schdIdx}', 'test', 'loaction=no, width=600px, height=630px, toolbar=no, menubar=no, status=no, scrollbars=no');">${schdShare.schdTitle}</a></td>
		                                                    <td style="font-size: smaller; padding: 0px; padding-top: 20px;">${schdShare.schdStartFmt}</td>
		                                                    <td style="font-size: smaller; padding: 0px; padding-top: 20px;">${schdShare.schdEndFmt}</td>
                                                		</tr> 
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        			<div>
<!--                                                 		<button class="btn btn-danger" type="submit">삭제</button> -->
<!--                                                 		<button type="button" class="btn btn-success" onclick="javascript:allSave();" style="float:right; margin-top:10px; width: -webkit-fill-available;">일정 저장</button> -->
                                                		<button class="btn btn-danger" onclick="javascript:schdShareDelete();" style="float:right; margin-top:10px; width: -webkit-fill-available;">공유취소</button>
<!--                                                 		<button class="btn btn-danger" onclick="javascript:delete();">삭제</button> -->
                                                	</div>
   		</div>
	</div>
</div>
   	
   	
   	
                                        </div> 
                                        <!-- end inbox-rightbar-->
                                    </div>
                                    <!-- end card-body -->
                                    <div class="clearfix"></div>
                                </div> <!-- end card-box -->
                            </div> <!-- end Col -->
                        </div><!-- End row -->
                    </div> <!-- container -->

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->

  </body>
</html>
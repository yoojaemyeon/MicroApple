<%@page import="micro.apple.groupware.mcaShop.vo.McaShopVO"%>
<%@page import="oracle.net.aso.h"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
McaShopVO inf = (McaShopVO)request.getAttribute("detail");
int year = inf.getProdDate().getYear() + 1900;

int Month = inf.getProdDate().getMonth() + 1;
String month_str = "";
if(Month < 10) month_str = "0"+Month;
else month_str = Month+"";

int day = inf.getProdDate().getDate();
String day_str = "";
if(day < 10) day_str = "0"+day;
else day_str = day+"";
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>
<meta charset="UTF-8">
<title>상품 상세</title>
</head>
<script>
    lightbox.option({
      'maxWidth': 1000,
      'maxHeight': 800
    })
</script>

<body>
   <!-- Start Content-->
   <div class="container-fluid">
      <!-- start page title -->
      <div class="row">
         <div class="col-12">
            <div class="page-title-box">
               <div class="page-title-right">
                  <ol class="breadcrumb m-0">
                     <li class="breadcrumb-item"><a href="/mainPage">Home</a></li>
                     <li class="breadcrumb-item"><a href="/mcaShop">복지몰</a></li>
                     <li class="breadcrumb-item active">상품</li>
                  </ol>
               </div>
                   <div style="position: relative; top: 20px; left: 3px;">   
                     <div style="display: inline-block; ">
                        <h1 class="page-title">상품 정보</h1>
                     </div>
                     <c:if test="${map.DEPT_IDX != 4 }">
                        <div style="display: inline-block; position: relative; left: 25px; bottom: 30px;">
                           <a href="/updateProduct?prodIdx=${detail.prodIdx }" >
                              <i ></i> 
                           </a>
                           <a href="/deleteProduct?prodIdx=${detail.prodIdx }" onclick="return confirm('정말 삭제 하시겠습니까?')" >
                              <i ></i> 
                           </a>
                        </div>
                     </c:if>   
                     <c:if test="${map.DEPT_IDX == 4 }">
                        <div style="display: inline-block; position: relative; left: 25px; bottom: 30px;">
                           <a href="/updateProduct?prodIdx=${detail.prodIdx }" class="btn btn-secondary mb-2">
                              <i class="mdi mdi-plus-circle mr-2"></i> 상품 수정
                           </a>
                           <a href="/deleteProduct?prodIdx=${detail.prodIdx }" onclick="return confirm('정말 삭제 하시겠습니까?')" class="btn btn-danger mb-2">
                              <i class="mdi mdi-plus-circle mr-2"></i> 상품 삭제
                           </a>
                        </div>
                     </c:if>   
                  </div>   
            </div>
         </div>
      </div>
      <!-- end page title -->
      <div class="row">
         <div class="col-12">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                        <div class="col-lg-5">
                     <c:forEach var="filess" items="${detail.fProdVO }" begin="0" end="0" step="1" > 
                           <a href="/resources/images/<%=year %>/<%=month_str %>/<%=day_str %>/${filess.fprodNm}" class="text-center d-block mb-4" data-lightbox="example-set">
                              <img src="/resources/images/<%=year %>/<%=month_str %>/<%=day_str %>/${filess.fprodNm}" class="img-fluid" style="max-width: 600px;" alt="메인사진" />
                           </a>
                     </c:forEach>      
                           <div class="d-lg-flex d-none justify-content-center">
                     <c:forEach var="files" items="${detail.fProdVO }"> 
                              <a href="/resources/images/<%=year %>/<%=month_str %>/<%=day_str %>/${files.fprodNm}" data-lightbox="example-set" >
                                 <img src="/resources/images/<%=year %>/<%=month_str %>/<%=day_str %>/${files.fprodNm}" class="img-fluid img-thumbnail p-2" style="width: 100px; height: 80px;" alt="Product-img" />
                              </a>
                     </c:forEach>
                           </div>
                        </div>
                  
                     <!-- end col -->
                     <div class="col-lg-7" style="display: inline-block;">
                        
                        <form class="pl-lg-4" method="post" action="/buyProduct">
                           <input type="text" value="${detail.prodIdx}" name="prodIdx" id="prodIdx" style="display: none;">
                           <input type="text" value="${detail.prodPrice}" name="prodPrice" id="prodPrice" style="display: none;">
                           <input type="text" value="${map.MEM_IDX}" name="memIdx" id="memIdx" style="display: none;">
                           <input type="text" value="${detail.prodQty }" name="prodQty" id="prodQty" style="display: none;">
                           <input type="text" value="${detail.prodNm }" name="prodNm" id="prodNm" style="display: none;">
                        
                           <!-- Product title -->
                           <h3 class="mt-0">${detail.prodNm } </h3>
                           
                           
<%--                            <p class="mb-1">${detail.prodDate }</p> --%>
                           <p class="font-12">
                              해당 상품은 포인트로 결제 됩니다.
                           </p>
                           <!-- Product stock -->
                           <div class="mt-3">
                              <h4>
                                 <span class="badge badge-success-lighten">재고 : ${detail.prodQty }</span>
                              </h4>
                           </div>
                           <!-- Product description -->
                           <div class="mt-4">
                              <h6 class="font-14">가격:</h6>
                              <h3><fmt:formatNumber value="${detail.prodPrice }" pattern="#,###"></fmt:formatNumber>&nbsp;포인트</h3>
                           </div>
                           <p class="font-12">
                              나의 포인트 :<fmt:formatNumber value="${map.MEM_POINT}" pattern="#,###" ></fmt:formatNumber>&nbsp;포인트
                           </p>
                           <!-- Quantity -->
                           <div class="mt-4">
                              <h6 class="font-14">구매 수량</h6>
                              <div class="d-flex" style="display: inline-block;">
                                 <input type="number" name="ordrProdqty" id="ordrProdqty" class="form-control" value="1" style="width: 90px;">
                                 <input type="button" onclick="buy();" value="구매" class="btn btn-success" style="position:relative; left: 2px;">
                              </div>
                           </div>
                           <!-- Product description -->
                           <div class="mt-4">
                              <h6 class="font-14">설명 :</h6>
                              <p>${detail.prodCont}</p>
                           </div>
                        </form>
                                 
                     </div>
                     <!-- end col -->
                  </div>
                  <!-- end row-->
                  <div class="table-responsive mt-4">
                     <table class="table table-bordered table-centered mb-0">
                        <thead class="thead-light">
                           <tr>
                              <th>아웃렛</th>
                              <th>가격(포인트)</th>
                              <th>남은 수량(개)</th>
                              <th>평균 배송 기간(일)</th>
                           </tr>
                        </thead>
                        <tbody>
                           <tr>
                              <td>한국 문구</td>
                              <td><fmt:formatNumber value="${detail.prodPrice }" pattern="#,###"></fmt:formatNumber></td>
                              <td style="text-align: left;">
                                  ${detail.prodQty }
                              </td>
                              <td>2</td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
                  <!-- end table-responsive-->
               </div>
               <!-- end card-body-->
            </div>
         </div>
      </div>
   </div>
   
   <script type="text/javascript">
      function buy(){
         alert("정말 구매 하시겠습니까?");
         var prodIdx = $('#prodIdx').val();
         var prodPrice = $('#prodPrice').val();
         var memIdx = $('#memIdx').val();
         var prodQty = $('#prodQty').val();
         var ordrProdqty = $('#ordrProdqty').val();
         var prodNm = $('#prodNm').val();
         
         $.ajax({
            type: 'post',
            dataType: 'json',
            url: '/buyProduct',
            data:{
               prodIdx : prodIdx,
               prodPrice : prodPrice,
               memIdx : memIdx,
               prodQty : prodQty,
               ordrProdqty : ordrProdqty,
               prodNm : prodNm,
            },
            success: function(data){
               console.log(data);
               console.log(data);
               
               if(!data.check){
                  console.log(data.reason);
                  alert(data.reason);
               }else{
                  alert('구매성공! 주문 페이지로 이동 합니다.');
                  
                     console.log("memIdx_ : " + memIdx);
                     orlist(memIdx);
               }
            }
         });
      } // end buy()
         
      function orlist(memIdx){
         console.log("memIdx->memIdx : " + memIdx);
         //동적 form 생성
         var form = $('<form></form>');
          form.attr('action', "/orlist");
          form.attr('method', 'post');
          form.appendTo('body');
          
          var iput1 = $("<input type='hidden' value="+memIdx+" name='memIdx'>");
        
          form.append(iput1);
          
          form.submit();

      }; //end orList()
      
   </script>
   
</body>
</html>
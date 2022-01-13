<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>포인트 구매창</title>
</head>
<body>
	<div class="alert alert-primary" role="alert" size="100;">
		<h1>
			<strong>포인트 결제</strong>
		</h1>
	</div>
	 <div class="card-body bg-white mt-0 shadow">
		<form method="post" id="frm" action="/pointBuy" class="kakaopay-form" >
			<input type="text" value="${member.memIdx }" name="memIdx" style="display: none;" >
			<input type="text" value="${member.memNm }" name="memNm" style="display: none;" >
            <div class="title">
	           <h2> 카카오페이 충전 금액  <img src="/resources/images/kakaopay.jpg" width="40px;" height="40"></h2>	
            </div>
            <div class="kakao-box">
                <div class="kakao-label">
                    <label class="box-radio-input"><input type="radio" name="memPoint" value="100"><span>100원</span></label> <br>
                    <label class="box-radio-input"><input type="radio" name="memPoint" value="5000"><span>5,000원</span></label> <br>
                    <label class="box-radio-input"><input type="radio" name="memPoint" value="10000"><span>10,000원</span></label><br>
                    <label class="box-radio-input"><input type="radio" name="memPoint" value="20000"><span>20,000원</span></label><br>
                    <label class="box-radio-input"><input type="radio" name="memPoint" value="30000"><span>30,000원</span></label><br>
                    <label class="box-radio-input"><input type="radio" name="memPoint" value="40000"><span>40,000원</span></label><br>
                    <label class="box-radio-input"><input type="radio" name="memPoint" value="50000"><span>50,000원</span></label>
                </div>
                <p class="guide">카카오페이의 최소 충전금액은 5,000원이며 최대 충전금액은 50,000원 입니다.</p>
                <div class="btn-box">
                    <button type="submit" class="btn btn-lg btn-block btn-custom" id="charge_kakao" >충전하기</button>
                </div>
            </div>
		</form>
 </div>
 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/javascript/jquery/jquery-ui.css"/>

<script>
	$(function(){
		
		//홈페이지 딱 들어간 시점에서 checkIn과 checkOut 현재날짜 기준으로 placeholder와 value 설정
		var date = new Date();
		var today = dateToString(date);
		
		$("#checkIn").prop("placeholder",today);
		$("#checkIn").prop("value",today);
		
		date.setDate(date.getDate()+1);
		var tommorow = dateToString(date);
		
		$("#checkOut").prop("placeholder",tommorow);
		$("#checkOut").prop("value",tommorow);
		
		
		
		// 지역선택 체크박스 전체와 나머지 클릭했을 때 어떻게 동작할지 처리
		$(".all").click(function(){
			if($(".all:checkbox").is(":checked")){
				$(".etc:checkbox").prop("checked", false);
			}
		});
		$(".etc").click(function(){
			if($(".etc:checkbox").is(":checked")){
				$(".all:checkbox").prop("checked", false);
			}
		});
			
		
		//체크인 달력 띄워주기
		var yearSuffix = "년";
		var dateFormat = "yy-mm-dd";
		var monthNames = [ "1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월" ];
		var dayNamesMin = [ "월", "화", "수", "목", "금", "토", "일" ];
		$("#checkIn").datepicker({
			minDate: 0,
			showMonthAfterYear: true,
			yearSuffix: yearSuffix,
			dateFormat: dateFormat,
			monthNames: monthNames,
			dayNamesMin: dayNamesMin,
			onClose: function(selectedDate){
				// #checkOut의 최소선택날짜 설정(+1)
				var min = new Date(selectedDate);
				min.setDate(min.getDate()+1);
				var minDate = dateToString(min);
				
				$("#checkOut").datepicker("option",{minDate: minDate});
			}
		});
		//체크아웃 달력 띄워주기
		$("#checkOut").datepicker({
			minDate: 1,
			showMonthAfterYear: true,
			yearSuffix: yearSuffix,
			dateFormat:dateFormat,
			monthNames: monthNames,
			dayNamesMin: dayNamesMin,
		});
	});
	
	// date타입을 "yyyy-mm-dd"형식 문자열로 바꿔주는 함수
	function dateToString(date){
		return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
	}
	
	//검색조건 submit함수
	function confirmSubmit(){
		
		//선택한 local지역 합치기
		$("input[name='local[]'").each(function(i, e){
			if(e.checked==true){
				$("#local").val($("#local").val()+e.value+",");
			}
		});
	}
</script>



</head>
<body>

	
	<form name="form" action="${root}/search" method="get" onsubmit="return confirmSubmit()">
	
		<div>
			체크인
			<input type="text" name="checkIn" id="checkIn" placeholder="2019-12-12" value="2019-12-12"/><br/>
			체크아웃
			<input type="text" name="checkOut" id="checkOut" placaholder="2019-12-13" value="2019-12-13"/><br/>
		</div><br/>
		
		
		<div>
			지역
			<input type="checkbox" class="all" checked="checked"/>전체<br/>
			<input type="checkbox" name="local[]" value="'jeju'" class="etc"/>제주시<br/>
			<input type="checkbox" name="local[]" value="'jejuEast'" class="etc"/>제주시 동부<br/>
			<input type="checkbox" name="local[]" value="'jejuWest'" class="etc"/>제주시 서부<br/>
			<input type="checkbox" name="local[]" value="'seoguipo'" class="etc"/>중문/서귀포<br/>
			<input type="checkbox" name="local[]" value="'seoguipoEast'" class="etc"/>서귀포시 동부<br/>
			<input type="checkbox" name="local[]" value="'seoguipoWest'" class="etc"/>서귀포시 서부<br/>
			<input type="hidden" name="local" id="local"/>
			<br/>
		</div>
		
		<div>
			인원
			<select title="인원" id="searchPeople" name="people">
				<option value="1">1명</option>
				<option value="2">2명</option>
				<option value="3">3명</option>
				<option value="4">4명</option>
				<option value="5">5명이상</option>
			</select><br/>
		</div>
		
		<div>
			검색
			<input type="text" name="searchHouseName" placeholder="숙소명이름"/><input type="submit" value="검색"/>
		</div>
		<br/><br/>
		
		
		
		
		<!-- <div>
			가격
			<select title="가격" id="searchPrice" name="price">
				<option value>전체</option>
				<option value="0/50000">5만원이하</option>
				<option value="50000/100000">5~10만원</option>
				<option value="100000/150000">10~15만원</option>
				<option value="150000/">15만원이상</option>
			</select><br/>
		</div> -->
		
		
		
	</form>
		<a href="${root}/dataInput">데이터 넣기</a>
		
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="//code.jquery.com/jquery-3.2.1.min.js"></script> -->
<script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${root}/resources/javascript/jquery/base/jquery-ui.css">
<!-- <script src="//code.jquery.com/jquery-1.12.4.js"></script> -->
<script type="text/javascript" src="${root}/resources/javascript/jquery/base/jquery-ui.js"></script>

<script type="text/javascript">
	var rangeDate = 31;
	var setSDate, setEDate;
	
	$(function(){
		$('#from').datepicker({
			dateFormat: 'yy-mm-dd',
			minDate: 0,
			onSelect: function(selectDate){
				var stxt = selectDate.split("-");
				stxt[1]=stxt[1]-1;
				var sdate = new Date(stxt[0],stxt[1],stxt[2]);
				var edate = new Date(stxt[0],stxt[1],stxt[2]);
				edate.setDate(sdate.getDate()+rangeDate);
				
				$('#to').datepicker('option',{
					minDate: selectDate,
					beforeShow: function(){
						$("#to").datepicker("option","maxDate",edate);
						setSDate = selectDate;
						console.log(setSDate)
					}
				});
			}
		});
		
		$('#to').datepicker({
			dateFormat: "yy-mm-dd",
			onSelect: function(selectDate){
				setEDate = selectDate;
				console.log(setEDate)
			}
		});
	});
</script>
</head>
<body>
	<h3>게스트하우스 페이지</h3>
	<h4>예약하기</h4>
	<div class="wrap">
		<div>
			시작일
		</div>
		<div>
			<input type="text" id="from">
		</div>
		<div>
			~종료일
		</div>
		<div>
			<input type="text" id="to">
		</div>
	</div>
	<button class="btn">조회</button>
	
</body>
</html>
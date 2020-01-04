<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<!--   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->
  <link rel="stylesheet" href="${root}/resources/css/guestdelluna/menuLayout.css">
  <script type="text/javascript"
   src="${root}/resources/javascript/guestdelluna/menuLayout.js"></script>
<title>Insert title here</title>
<script type="text/javascript" src="${root}/resources/xhr/xhr.js"></script>
<script type="text/javascript">
	function toServer(root, param) {
		var selectHouse = document.getElementById("houseList").value
		;
		
		var url = root + "/host/reservationOkView.do";
		
		if(selectHouse != "숙소를 선택하세요") {
			var params = "houseName=" + selectHouse
			params= params.replace(/&/g,"%26"); 
			params= params.replace(/\+/g,"%2B");
			params= params + "&pageNumber=" + param;
			sendRequest("GET", url, fromServer, params);
		}
	}
	
	function fromServer() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			document.getElementById("listView").innerHTML = xhr.responseText;
			var currentPage = $("#currentPage").val();
			var page = "#" + currentPage.toString();
			$(page).css({
				'color' : '#008489',
				'font-size' : '1.2rem',
				'font-weight' : 'bold'
			});
		}
	}
</script>
<style>
	select {
		padding: 5px 10px;
		border-radius: 5px;
		border: 1px solid #ddd;
		background-color: #ffffff;
		margin: 2rem 0;
	}
</style>
</head>
<body>
<div id="wrap">
	<div class="menuL">
	<ul>
		<li>
			<a href="${root}/guestdelluna/allMyReview.do">후기</a>
		</li>
		<li>
			<a href="${root}/guestdelluna/memberUpdate.do">회원수정</a>
		</li>
		<li>
			<a href="${root}/guestdelluna/managePoint.do">포인트관리</a>
		</li>
		<li>
			<a href="${root}/guestdelluna/payList.do">결제내역</a>
		</li>
		<c:if test="${memberLevel == 'Host'}">
		<hr style="border: 0.0315rem solid #ddd;"/>
			<li>
				<a href="${root}/host/reservationView.do">숙소예약현황</a>
			</li>
		<li>
			<a href="${root}/host/exReservationView.do">체험예약현황</a>
		</li>
		<li>
			<a href="${root}/host/salesView.do">매출조회</a>
		</li>
		<li>
			<a href="${root}/host/houseManagement.do">게스트하우스 관리</a>
		</li>
		<li>
			<a href="${root}/host/exManagement.do">체험 관리</a>
		</li>
		</c:if>
		<li>
			<a href="${root}/guestdelluna/memberDelete.do">회원탈퇴</a>
		</li>
	</ul>
	</div>

	<div class="menuR">
	
	<h3>숙소 예약현황</h3>
	<select name="houseList" id="houseList" onchange="toServer('${root}' , '')" style="padding: 5px 10px;
		border-radius: 5px;
		border: 1px solid #ddd;
		background-color: #ffffff;
		margin: 2rem 0;">
		<option>숙소를 선택하세요</option>
		<c:forEach var="houseNameList" items="${houseNameList}">
			<option>${houseNameList}</option>
		</c:forEach>
	</select>
   	<div id="listView" style="text-align: center">
   		예약 조회를 원하는 숙소를 선택해주세요.
   	</div>
	</div>
  </div>
</body>
</html>
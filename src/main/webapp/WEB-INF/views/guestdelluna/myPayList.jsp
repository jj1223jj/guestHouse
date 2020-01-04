<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!-- 1.맨 위에 페이지 블록 -->
<c:set var="pageBlock" value="${5}" />
<!DOCTYPE html>
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<!-- <script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->
<!-- <script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->
<link rel="stylesheet"	href="${root}/resources/css/guestdelluna/menuLayout.css">
<script type="text/javascript"	src="${root}/resources/javascript/jquery/flick/jquery-ui.js"></script>
<link rel="stylesheet"	href="${root}/resources/javascript/jquery/flick/jquery-ui.css">
<script type="text/javascript" src="${root}/resources/xhr/xhr.js"></script>
<script type="text/javascript"
   src="${root}/resources/javascript/guestdelluna/menuLayout.js"></script>
<title>결제 내역</title>
<script type="text/javascript"	src="${root}/resources/javascript/guestdelluna/mypaylist.js"></script>
<style type="text/css">
html {
	font-size: 16px;
}
</style>

<script type="text/javascript">
	$(function(){
		$('#tabs').tabs();
			paging('${root}','','500000','');
		$(".payExp").click(function(){
			paging('${root}','','','300000');
		})
		$(".payHouse").click(function(){
			paging('${root}','','500000','');
		})
	});

	function paging(root, param, accuCount, useCount) {
		if(useCount>50000){
		var url = root + "/guestdelluna/payExpAjax.do";

		var params = "pageNumber=" + param;

		sendRequest("GET", url, accuPOK, params);
		}
		
		if(accuCount>50000){
			
			var url = root + "/guestdelluna/payHouseAjax.do";

			var params = "usePageNumber=" + param;

			sendRequest("GET", url, usePOK, params);
		}
	}

	function accuPOK() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			document.getElementById("payExpView").innerHTML = xhr.responseText;
			var currentPage = $("#currentPage").val();
			var page = "#" + currentPage.toString();
			$(page).css({
				'color' : '#008489',
				'font-size' : '1.2rem',
				'font-weight' : 'bold'
			});
		}
	}
	
	function usePOK(){
		if (xhr.readyState == 4 && xhr.status == 200) {
			document.getElementById("payHouseView").innerHTML = xhr.responseText;
			var currentPage = $("#useCurrentPage").val();
			var page = "#" + currentPage.toString();
			$(page).css({
				'color' : '#008489',
				'font-size' : '1.2rem',
				'font-weight' : 'bold'
			});
		}
	}
</script>
</head>
<body>
	<div id="wrap" style="margin-top: 3rem;">
		<div class="menuL" style="margin-top: 6.5rem;">
			<ul>
				<li><a href="${root}/guestdelluna/allMyReview.do" style="color: black;">후기</a></li>
				<c:if test="${memberCode == memberDto.memberCode}">
					<li><a href="${root}/guestdelluna/memberUpdate.do" style="color: black;">회원수정</a></li>
					<li><a href="${root}/guestdelluna/managePoint.do" style="color: black;">포인트관리</a></li>
					<li><a href="${root}/guestdelluna/payList.do" style="color: black;">결제내역</a></li>
					<c:if test="${memberLevel == 'Host'}">
						<hr style="border: 0.0315rem solid #ddd;" />
						<li><a href="${root}/host/reservationView.do" style="color: black;">숙소예약현황</a></li>
						<li><a href="${root}/host/exReservationView.do" style="color: black;">체험예약현황</a></li>
						<li><a href="${root}/host/salesView.do" style="color: black;">매출조회</a></li>
						<li><a href="${root}/host/houseManagement.do" style="color: black;">게스트하우스 관리</a></li>
						<li><a href="${root}/host/exManagement.do" style="color: black;">체험 관리</a></li>
					</c:if>
					<li><a href="${root}/guestdelluna/memberDelete.do" style="color: black;">회원탈퇴</a></li>
				</c:if>
			</ul>
		</div>

		<div class="menuR" style="margin-left: -4rem; margin-top: 5rem;">
			<div id="tabs" class="container"
				style="width: 60rem; margin-top: 1.5rem; margin-left: -4rem;">
				<ul style="border: 0px; background: #ffffff;">
					<li class="payHouse"
						style="float: left; border: 0px; background: #ffffff; margin-top: -3.04rem; margin-left: -0.5rem"><a
						href="#fragment-1"><span>게스트하우스 결제 내역</span></a></li>
					<li class="payExp"
						style="float: left; border: 0px; background: #ffffff; margin-top: -3.04rem; margin-left: 14rem"><a
						href="#fragment-2"><span>체험 결제 내역</span></a></li>
						
							<li style="margin-top: -2.3rem; float: right; color: black">
							<span>총 ${countPayExp + countPayHouse }건 (게스트하우스 : ${countPayHouse } / 체험 : ${countPayExp })</span>
						</li>
				</ul>
				<div id="fragment-1">
					<div id="payHouseView"></div>
				</div>

				<div id="fragment-2">				
					<div id="payExpView"></div>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(function() {
		$('#tabs').tabs();
	});
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath }" />
<script type="text/javascript" src="${root}/resources/xhr/xhr.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/jquery/flick/jquery-ui.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/guestdelluna/mypaylist.js"></script>
<link rel="stylesheet"
	href="${root}/resources/javascript/jquery/flick/jquery-ui.css">
<link rel="stylesheet"
	href="${root}/resources/css/guestdelluna/bootstrap.css">
<script type="text/javascript"
	src="${root}/resources/javascript/guestdelluna/bootstrap.js"></script>
</head>
<body>

	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="sysYear">
		<fmt:formatDate value="${now}" pattern="yyyy-mm-dd" />
	</c:set>

	<div id="tabs">
		<ul>
			<li><a href="#fragment-1"><span>체험 결제리스트</span></a></li>
			<li><a href="#fragment-2"><span>게스트하우스 결제리스트</span></a></li>
		</ul>

		<div id="fragment-1">

			<div>
				<input type="checkBox" name="allCheck" id="allCheck" />모두선택
			</div>

			<table class="table"
				style="vertical-align: middle; text-align: center">
				<thead class="thead-light">
					<tr style="font-weight: 800;">
						<td>번호</td>
						<td>체험이름</td>
						<td>체험날짜</td>
						<td>예약여부</td>
					</tr>
				</thead>
			</table>

			<c:forEach var="exList" items="${newExpReserveDto}"
				varStatus="status">

				<input type="checkbox" name="expCheck" class="expCheck"
					value="${exList.exReserveCode}" />

				<input type="hidden" name="exReserveCode"
					value="${exList.exReserveCode}" />

				<table class="table"
					style="text-align: center; vertical-align: middle; margin-bottom: auto;">
					<tbody>
						<tr>
							<td>${status.count}</td>
							<td>$${exList.exName}</td>
							<td><fmt:formatDate value="${exList.exDate}" pattern="yyyy-MM-dd" /></td>
							<td>
							<div class="exResState">

					<fmt:formatDate var="startTime" value="${now}" pattern="yyyy-MM-dd" />
					<fmt:formatDate var="endTime" value="${exList.exDate}"
						pattern="yyyy-MM-dd" />

					<c:if test="${startTime < endTime}">
						<script type="text/javascript">
							var exResState = document
									.getElementsByClassName("exResState");
							exResState['${status.index}'].innerHTML = "예약완료"
						</script>
					</c:if>


					<c:if test="${startTime > endTime}">
						<script type="text/javascript">
							var exResState = document
									.getElementsByClassName("exResState");
							exResState['${status.index}'].innerHTML = "이용완료"
						</script>
					</c:if>

					<c:if test="${startTime == endTime}">
						<script type="text/javascript">
							var exResState = document
									.getElementsByClassName("exResState");
							exResState['${status.index}'].innerHTML = "체험 날짜입니다"
						</script>
					</c:if>
				</div>
							</td>
						</tr>
					</tbody>
				</table>
			</c:forEach>

			<button id="opener">체험 결제 취소</button>
			<div id="dialog" title="삭제 하시겠습니까?"></div>
			<br /> <br /> <br />
		</div>

		<div id="fragment-2">

			<div>
				<input type="checkBox" name="checkAll" id="checkAll" />모두선택
			</div>

			<table class="table"
				style="vertical-align: middle; text-align: center">
				<thead class="thead-light">
					<tr style="font-weight: 800;">
						<td>번호</td>
						<td>게스트하우스 이름</td>
						<td>체크인날짜</td>
						<td>체크아웃날짜</td>
						<td>예약여부</td>
					</tr>
				</thead>
			</table>

			<c:forEach var="houseList" items="${newHouseReserveDto}"
				varStatus="status">


				<table class="table"
					style="text-align: center; vertical-align: middle; margin-bottom: auto;">
					<tbody>
						<tr>
							<td><input type="checkbox" name="houseCheck"
								class="houseCheck" value="${houseList.reserveCode}" /></td>
							<td>${status.count}</td>
							<td>$${houseList.houseName}</td>
							<td><fmt:formatDate value="${houseList.checkIn}"
									pattern="yyyy-MM-dd" /></td>
							<td></td>
							<td><fmt:formatDate value="${houseList.checkOut}"
									pattern="yyyy-MM-dd" /></td>
							<td>
								<div class="houseResState">

									<fmt:formatDate var="startTime" value="${now}"
										pattern="yyyy-MM-dd" />
									<fmt:formatDate var="endTime" value="${houseList.checkOut}"
										pattern="yyyy-MM-dd" />

									<c:if test="${startTime < endTime}">
										<script type="text/javascript">
											var houseResState = document
													.getElementsByClassName("houseResState");
											houseResState['${status.index}'].innerHTML = "예약완료"
										</script>
									</c:if>


									<c:if test="${startTime > endTime}">
										<script type="text/javascript">
											var houseResState = document
													.getElementsByClassName("houseResState");
											houseResState['${status.index}'].innerHTML = "이용완료"
										</script>
									</c:if>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<input type="hidden" name="houseReserveCode"
					value="${houseList.reserveCode}" />
			</c:forEach>

			<button id="opener2">게스트하우스 결제 취소</button>
			<div id="dialog2" title="삭제 하시겠습니까?"></div>
		</div>
	</div>

</body>

<script type="text/javascript">
	var str = "";

	$("#allCheck").click(function() {

		var chk = $("#allCheck").prop("checked");
		if (chk) {
			$(".expCheck").prop("checked", true);
		} else {
			$(".expCheck").prop("checked", false);
		}

	})

	var expCheck = document.getElementsByClassName("expCheck");
	var exReserveOk = document.getElementsByClassName("exReserveOk");
	var exResState = document.getElementsByClassName("exResState");
	$("#dialog").dialog({
		autoOpen : false
	});

	$("#opener").each(function(i, e) {
		$(this).click(function() {
			$("#dialog").dialog("open");

			$(function(obj) {
				var str = "";
				var cnt = 0;

				$("#dialog").dialog({

					buttons : [ {
						text : "네",
						click : function(obj) {
							//네를 누르면 div태그의 예약완료가 사라져야함		
							for (i = 0; i < expCheck.length; i++) {
								if (expCheck[i].checked == true) {
									//alert(expCheck.length);

									str += expCheck[i].value + ",";
									++cnt

								}
							}

							//	alert(str)
							deleteExpPayState('${root}', str)

							if (cnt == 0) {
								window.alert("선택된 것이 없습니다.")
								return false
							}
							alert("삭제 완료되었습니다");
							setTimeout("location.reload()");
							$(this).dialog("close")
						}
					},

					{
						text : "아니오",
						click : function() {
							$(this).dialog("close")
						}
					} ]
				})
			})
		})
	})
	//--------------------------------------------------------------------------------
	$("#checkAll").click(function() {

		var chk = $("#checkAll").prop("checked");
		if (chk) {
			$(".houseCheck").prop("checked", true);
		} else {
			$(".houseCheck").prop("checked", false);
		}

	})

	var reserveOk = document.getElementsByClassName("reserveOk");
	var houseCheck = document.getElementsByClassName("houseCheck");
	var resDate = document.getElementsByClassName("resDate");
	var houseReserveCode = document.getElementsByName("houseReserveCode");
	$("#dialog2").dialog({
		autoOpen : false
	});

	$("#opener2").each(function(i, e) {
		$(this).click(function() {
			$("#dialog2").dialog("open");

			$(function() {

				var cnt = 0;
				var str = "";

				$("#dialog2").dialog({

					buttons : [ {
						text : "네",
						click : function(obj) {
							//네를 누르면 div태그의 예약완료가 사라져야함		
							for (i = 0; i < houseCheck.length; i++) {
								if (houseCheck[i].checked == true) {

									str += houseCheck[i].value + ",";
									++cnt

								}
							}

							//window.alert(str);		2,3, 이렇게 넘어옴 당연히

							deleteHousePayState('${root}', str);

							if (cnt == 0) {
								window.alert("선택된 것이 없습니다.")
								$(this).dialog("close")
								return false
							}
							alert("삭제 완료되었습니다");
							setTimeout("location.reload()");
							$(this).dialog("close")
						}
					},

					{
						text : "아니오",
						click : function() {
							$(this).dialog("close")
						}
					} ]
				})
			})
		})
	})

	//----------------------------------------------------------------
	$(function() {
		$('#tabs').tabs();
	});
</script>

</html>
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
</head>
<body>
	예약목록중에 상태가 예약완료인 것을 불러오고 날짜가 지난 것만 예약취소에서 이용완료로 바꿔준다

	<div>
		<div>
			<a href="${root}/guestdelluna/memberUpdate.do">회원수정</a>
		</div>
		<div>
			<a href="${root}/guestdelluna/memberDelete.do">회원탈퇴</a>
		</div>
		<div>
			<a href="${root}/guestdelluna/managePoint.do">포인트관리</a>
		</div>
		<div>
			<a href="${root}/guestdelluna/payList.do">결제내역</a>
		</div>
		<div>
			<a href="${root}/guestdelluna/allMyReview.do">내가쓴후기</a>
		</div>
	</div>

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

			<table border="1">
				<tr>
					<td>
						<div>
							<input type="checkBox" name="allCheck" id="allCheck" />모두선택
						</div>
					</td>
				</tr>
			</table>

			<c:forEach var="exList" items="${expList}" varStatus="status">

				<table border="1">
					<tr>
						<td><input type="checkbox" name="expCheck" class="expCheck"
							value="${exList.exReserveCode}" /></td>
						<td>
							<div>번호</div>
							<div class="seqRes">${status.count}</div>
						</td>
					</tr>
					<input type="hidden" name="exReserveCode"
						value="${exList.exReserveCode}" />
				</table>

			</c:forEach>

			<c:forEach var="exName" items="${expName}" varStatus="status">
				<table border="1">
					<tr>
						<td>
							<div>체험이름</div>
							<div>
								<a href="#">${exName}</a>
							</div>
						</td>
					</tr>
				</table>
			</c:forEach>

			<c:forEach var="exList" items="${expList}" varStatus="status">
				<table border="1">
					<tr>
						<td>
							<div>체험 날짜</div>
							<div>
								<fmt:formatDate value="${exList.exDate}" pattern="yyyy-MM-dd" />
							</div>
						</td>

						<td>
							<div>예약여부</div>
							<div class="exResState">

								<fmt:formatDate var="startTime" value="${now}"
									pattern="yyyy-MM-dd" />
								<fmt:formatDate var="endTime" value="${exList.exDate}"
									pattern="yyyy-MM-dd" />

								<c:if test="${startTime < endTime}">
									<script type="text/javascript">
										var exResState = document.getElementsByClassName("exResState");
										exResState['${status.index}'].innerHTML = "예약완료"
									</script>
								</c:if>


								<c:if test="${startTime > endTime}">
									<script type="text/javascript">
										var exResState = document.getElementsByClassName("exResState");
										exResState['${status.index}'].innerHTML = "이용완료"
									</script>
								</c:if>

								<c:if test="${startTime == endTime}">
									<script type="text/javascript">
										var exResState = document.getElementsByClassName("exResState");
										exResState['${status.index}'].innerHTML = "체험 날짜입니다"
									</script>
								</c:if>
							</div>
						</td>
					</tr>
				</table>

			</c:forEach>

			<button id="opener">삭제</button>
			<div id="dialog" title="삭제 하시겠습니까?"></div>
			<br /> <br /> <br />
		</div>

		<div id="fragment-2">

			<table border="1">
				<tr>
					<td>
						<div>
							<input type="checkBox" name="checkAll" id="checkAll" />모두선택
						</div>
					</td>
				</tr>
			</table>

			<c:forEach var="houseList" items="${houseList}" varStatus="status">

				<table border="1">
					<tr>
						<td><input type="checkbox" name="houseCheck"
							class="houseCheck" value="${houseList.reserveCode}" /></td>
						<td>
							<div>번호</div>
							<div class="seqRes">${status.count}</div>
						</td>
					</tr>

					<input type="hidden" name="houseReserveCode"
						value="${houseList.reserveCode}" />
				</table>

			</c:forEach>

			<c:forEach var="houseName" items="${houseName}">
				<table border="1">
					<tr>
						<td>
							<div>게스트하우스 이름</div>
							<div>
								<a href="#">${houseName}</a>
							</div>
						</td>
					</tr>
				</table>
			</c:forEach>

			<c:forEach var="houseList" items="${houseList}" varStatus="status">
				<table>
					<tr>
						<td>
							<div>체크인날짜</div>
							<div class="resDate">
								<fmt:formatDate value="${houseList.checkIn}"
									pattern="yyyy-MM-dd" />
							</div>
						</td>

						<td>
							<div>체크아웃날짜</div>
							<div class="resDate">
								<fmt:formatDate value="${houseList.checkOut}"
									pattern="yyyy-MM-dd" />
							</div>
						</td>

						<td>
							<div>예약여부</div>
							<div class="houseResState">

								<fmt:formatDate var="startTime" value="${now}"
									pattern="yyyy-MM-dd" />
								<fmt:formatDate var="endTime" value="${houseList.checkOut}"
									pattern="yyyy-MM-dd" />

								<c:if test="${startTime < endTime}">
									<script type="text/javascript">
										var houseResState = document.getElementsByClassName("houseResState");
										houseResState['${status.index}'].innerHTML = "예약완료"
									</script>
								</c:if>


								<c:if test="${startTime > endTime}">
									<script type="text/javascript">
										var houseResState = document.getElementsByClassName("houseResState");
										houseResState['${status.index}'].innerHTML = "이용완료"
									</script>
								</c:if>
							</div>
						</td>
					</tr>
				</table>

			</c:forEach>

			<button id="opener2">삭제</button>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath }" />
<script type="text/javascript" src="${root}/resources/xhr/xhr.js"></script>
<%-- <script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script> --%>
<script type="text/javascript" src="${root}/resources/javascript/jquery/flick/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/guestdelluna/myreservelist.js"></script>
<link rel="stylesheet" href="${root}/resources/javascript/jquery/flick/jquery-ui.css">
<body>
	<c:set var="countExp" value="${countExp}" />
	<c:set var="countHouse" value="${countHouse}" />
	<c:set var="houseDtoList" value="${houseDtoList}" />

	<div id="tabs">
		<ul>
			<li><a href="#fragment-1"><span>체험예약리스트</span></a></li>
			<li><a href="#fragment-2"><span>게스트하우스예약리스트</span></a></li>
		</ul>

		<div id="fragment-1">
						<div>
							<input type="checkBox" name="allCheck" id="allCheck" />모두선택
						</div>
			<c:forEach var="exList" items="${listExp}" varStatus="status">
					<input type="checkbox" name="expCheck" class="expCheck"
							value="${exList.exReserveCode}" />
							<div>번호</div>
					
					<input type="hidden" name="exReserveCode"
						value="${exList.exReserveCode}" />
			</c:forEach>

			<c:forEach var="exName" items="${exName}" varStatus="status">
				
							<div>체험이름</div>
							<div>
								<div>${exName}</div>				
							</div>
			</c:forEach>

			<c:forEach var="exList" items="${listExp}" varStatus="status">
							<div>체험날짜</div>
							<div>
								<fmt:formatDate value="${exList.exRegDate }"
									pattern="yyyy-MM-dd" />
							</div>
						
							<div>예약여부</div>
							<div>${exList.state}</div>
			</c:forEach>

			<button id="opener">예약취소</button>
			<div id="dialog" title="예약취소 하시겠습니까?"></div>
			<br /> <br /> <br />
		</div>

		<div id="fragment-2">
						<div>
							<input type="checkBox" name="checkAll" id="checkAll" />모두선택
						</div>
			<c:forEach var="houseList" items="${listHouse}" varStatus="status">

				<input type="checkbox" name="houseCheck"
							class="houseCheck" value="${houseList.reserveCode}" />
							<div>번호</div>
							<div class="seqRes">${status.count}</div>

					<input type="hidden" name="houseReserveCode"
						value="${houseList.reserveCode}" />
				<input type="hidden" name="result" />

			</c:forEach>

			<c:forEach var="houseName" items="${houseName}">
							<div>게스트하우스 이름</div>
							<div>
								${houseName}
							</div>
			</c:forEach>

			<c:forEach var="houseList" items="${listHouse}" varStatus="status">
							<div>예약날짜</div>
							<div class="resDate">
								<fmt:formatDate value="${houseList.reserveDate}"
									pattern="yyyy-MM-dd" />
							</div>
						
							<div>예약여부</div> <div>${houseList.state}</div>
			</c:forEach>

			<button id="opener2">예약취소</button>
			<div id="dialog2" title="예약취소 하시겠습니까?"></div>
		</div>

	</div>

	<input type="hidden" name="exVal" value="${countExp }" />
	<input type="hidden" name="houseVal" value="${countHouse }" />
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
	$("#dialog").dialog({
		autoOpen : false
	});

	$("#opener").each(function(i, e) {
		$(this).click(function() {
			$("#dialog").dialog("open");

			$(function(obj) {

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
							updateExpState('${root}', str)

							if (cnt == 0) {
								window.alert("선택된 것이 없습니다.")
								return false
							}
							alert("예약취소가 완료되었습니다");
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

							updateState('${root}', str);

							if (cnt == 0) {
								window.alert("선택된 것이 없습니다.")
								$(this).dialog("close")
								return false
							}
							alert("예약취소가 완료되었습니다");
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
	//---------------------------------------------------------------
	$(function() {
		$('#tabs').tabs();
	});
</script>
</head>
</html>
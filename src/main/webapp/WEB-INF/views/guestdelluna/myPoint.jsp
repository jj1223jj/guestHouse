<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>Insert title here</title>
</head>
<body>

	<c:set var="accuPointVal" value="${accuPoint}" />
	<c:set var="usePointVal" value="${usePoint}" />
	<input type="hidden" name="accuPoint" value="${accuPoint}" />
	<input type="hidden" name="usePoint" value="${usePoint}" />

	<div id="tabs" class="container">
		<ul style="border: 0px; background: #ffffff; ">
			<li style="float: left;  border: 0px; background: #ffffff; margin-left: 125px" ><a href="#fragment-1"><span>포인트 적립 내역</span></a></li>
			<li style="float: left;  border:0px; background: #ffffff"><a href="#fragment-2"><span>포인트 사용 내역</span></a></li>
		</ul>
		<div id="fragment-1">
			<div>
				<table class="table" style="vertical-align: middle; text-align: center">
				<thead class="thead-light">
					<tr style="font-weight: 800;">
						<td>번호</td>
						<td>적립장소</td>
						<td>적립날짜</td>
						<td>적립포인트</td>
					</tr>
					</thead>
				</table>
				<c:forEach var="accuPoint" items="${accuPoint}" varStatus="status">
					<table class="table" style="text-align: center; vertical-align: middle; margin-bottom: auto;">
						<tbody>
							<tr>
								<td>${status.count}</td>
								<td>${accuPoint.accuPlace}</td>
								<td><fmt:formatDate value="${accuPoint.accuDate}"
										pattern="yyyy-MM-dd" /></td>
								<td>${accuPoint.accuPoint}</td>
							</tr>
						</tbody>
					</table>
				</c:forEach>
			</div>
		</div>

		<div id="fragment-2">
			<div>
				<c:forEach var="usePoint" items="${usePoint}" varStatus="status">

					<div>번호</div>
					<div class="seqRes">${status.count}</div>

					<div>사용 장소</div>
					<div>${usePoint.usePlace}</div>

					<div>사용 날짜</div>
					<div>
						<fmt:formatDate value="${usePoint.useDate}" pattern="yyyy-MM-dd" />
					</div>

					<div>사용포인트</div>
					<div>${usePoint.usePoint}</div>

				</c:forEach>
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
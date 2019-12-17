<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/resources/xhr/xhr.js"></script>
<script type="text/javascript">
	function toServer(root) {
		var selectHouse = document.getElementById("houseList").value;
		
		var url = root + "/host/reservationOkView.do";
		
		if(selectHouse != "숙소를 선택하세요") {
			var params = "houseName=" + selectHouse;
			sendRequest("post", url, fromServer, params);
		}
	}
	
	function fromServer() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			document.getElementById("listView").innerHTML = xhr.responseText;
		}
	}
</script>
</head>
<body>
	<h3>예약현황</h3>
	<select name="houseList" id="houseList" onchange="toServer('${root}')">
		<option>숙소를 선택하세요</option>
		<c:forEach var="houseNameList" items="${houseNameList}">
			<option>${houseNameList}</option>
		</c:forEach>
	</select>
   	<div id="listView">
   	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript" src="${root}/resources/xhr/xhr.js"></script>
<script type="text/javascript">
	function toServer(root, param) {
		var selectHouse = document.getElementById("houseList").value;
		
		var url = root + "/host/reservationOkView.do";
		
		if(selectHouse != "숙소를 선택하세요") {
			var params = "houseName=" + selectHouse + "&pageNumber=" + param;
			sendRequest("GET", url, fromServer, params);
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
	<select name="houseList" id="houseList" onchange="toServer('${root}' , '')">
		<option>숙소를 선택하세요</option>
		<c:forEach var="houseNameList" items="${houseNameList}">
			<option>${houseNameList}</option>
		</c:forEach>
	</select>
   	<div id="listView">
   	</div>
</body>
</html>
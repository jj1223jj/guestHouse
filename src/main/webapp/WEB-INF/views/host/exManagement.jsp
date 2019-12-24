<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/resources/xhr/xhr.js"></script>
<script type="text/javascript">
	function toServer(root, param) {
		var url = root + "/host/exManagementView.do";
		var params = "pageNumber=" + param;
		sendRequest("GET", url, fromServer, params);
	}
	
	function fromServer() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			document.getElementById("listView").innerHTML = xhr.responseText;
		}
	}
	
	function cancel(root, exCode) {
		alert(root + "," + exCode);
		var value = confirm("정말 삭제하시겠습니까?");
		if (value == false) {
			return false;
		} else {
			location.href=root + "/host/exCancel.do?exCode=" + exCode;
		}
	}
</script>
</head>
<body onload="toServer('${root}','')">
   <div id="listView">
   </div>
</body>
</html>
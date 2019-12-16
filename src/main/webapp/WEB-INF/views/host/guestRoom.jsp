<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>게스트 룸 등록</h3>
	<form action="${root}/host/fileupload.do" method="post" enctype="multipart/form-data">
	<input multiple="multiple" type="file" name="file" id="file[]"/>
	<input type="submit">
	</form>
</body>
</html>
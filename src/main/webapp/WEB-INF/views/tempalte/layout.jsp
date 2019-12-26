<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<t:insertAttribute name="header"/>
	<hr color="blue" style="margin-top: 9rem"/>
	
	<t:insertAttribute name="menu"/>
	<hr color="pink"/>
	
	<t:insertAttribute name="content"/>
	
	<hr color="green"/>
	
	<t:insertAttribute name="foot"/>
</body>
</html>
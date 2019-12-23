<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript"
	src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css"
	href="${root}/resources/javascript/jquery/jquery-ui.css" />
<script type="text/javascript"
	src="${root}/resources/javascript/search/search.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c37448871d1dc7c24bd47df3b92bf2c3"></script>
<link rel="stylesheet" href="${root}/resources/css/swiper/swiper.css">
<script type="text/javascript">

	$(function(){
		$( "#price" ).slider({
				range:!0,
				values:[17,67],
				max:500,
				slide: function(e,ui){
					$("#minPrice").val(ui.values[0]);
					$("#maxPrice").val(ui.values[1]);
				},
		
			}
		);
		
		
	});
	
</script>
<style type="text/css">
#price{
	width: 200px;
}
</style>
</head>
<body>
	
	<input id="minPrice" name="minPrice" type="text" value="17"/>
	<input id="maxPrice" name="maxPrice" type="text" value="67"/>
	<div id="price"></div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/javascript/jquery/jquery-ui.css"/>
<script type="text/javascript" src="${root}/resources/javascript/search/search.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c37448871d1dc7c24bd47df3b92bf2c3"></script>

<style>
	#listCon{
		width :840px;
		height : 1000px;
		background-color: #cccccc;
	}
	
	#mapCon{
		position :absolute;
		top: 410px;
		right: 0px;
		width :840px;
		height : 600px;
		background-color: #dddddd;
	}
</style>

</head>
<body>

	<div id="listCon"></div>
	<div id="mapCon">
		<div id="map" style="width:500px;height:400px;"></div>
	</div>
	
	
	<script>
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.53630753279682, 126.83552349439641), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options);
		
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng(33.48378483975008,126.3953553887375)
		});
		
		marker.setMap(map);
		
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng(33.53630753279682,126.83552349439641)
		});
		
		marker.setMap(map); 
		
		////////////
	</script>
	
	
</body>
</html>
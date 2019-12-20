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

<!-- Demo styles -->
<style>
.swiper-container {
	width: 300px;
	height: 200px;
	border: solid #cccccc 1px;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}
</style>
</head>
<body>
	<!-- Swiper -->
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide">Slide 1</div>
			<div class="swiper-slide">Slide 2</div>
			<div class="swiper-slide">Slide 3</div>
			<div class="swiper-slide">Slide 4</div>
			<div class="swiper-slide">Slide 5</div>
			<div class="swiper-slide">Slide 6</div>
			<div class="swiper-slide">Slide 7</div>
			<div class="swiper-slide">Slide 8</div>
			<div class="swiper-slide">Slide 9</div>
			<div class="swiper-slide">Slide 10</div>
		</div>
		<!-- Add Pagination -->
		<div class="swiper-pagination"></div>
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>

	</div>



	<!-- Swiper JS -->
	<script src="${root}/resources/javascript/swiper/swiper.js"></script>

	<!-- Initialize Swiper -->
	<script>
    var swiper = new Swiper('.swiper-container', {
      pagination: {
        el: '.swiper-pagination',
        dynamicBullets: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  </script>

	<div class="overlaybox box0">
		<div class="boxtitle">지연게하55555</div>
		<ul>
			<li class="up">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide">0</div>
						<div class="swiper-slide">1</div>
						<div class="swiper-slide">2</div>
					</div>
					<div class="swiper-pagination"></div>
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
				</div> <span class="number">인원2</span> <span class="number">가격99999</span>
				<div class="houseCode">63</div>
				<button aria-label="목록에 숙소 추가하기" type="button" class="_r0agyd">
					<svg viewBox="0 0 24 24" fill="currentColor" fill-opacity="0"
						stroke="#222222" stroke-width="1.4" focusable="false"
						aria-hidden="true" role="presentation" stroke-linecap="round"
						stroke-linejoin="round"
						style="height: 16px; width: 16px; display: block; overflow: visible;">
						<path
							d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6"
							stroke-linejoin="round"></path></svg>
				</button></li>
		</ul>
	</div>
</body>
</html>
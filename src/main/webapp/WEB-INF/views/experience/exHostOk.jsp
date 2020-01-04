<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>

<%-- <script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script> --%>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->

</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	
	<c:if test="${exRegisterChk > 0}">	<!-- 제대로 수정되었으면 1, 아니면 00  -->
		<script type="text/javascript">
			alert("체험이 등록되었습니다");
			//location.href="${root}/guestHouse.do";
	
		</script>
		
	
		<!--  전체 -->
		<div style="width: 70rem; height: auto; margin: 0 auto; /* border: 0.1rem solid black; */ padding-bottom: 7rem;">
			<div align="center" style="font-weight: bold; font-size: 1.5rem; margin: 5rem;">체험등록 완료</div>
			
			<div align="center">
				<div>
					<img style="width: 30rem;" class="rounded" src="<spring:url value='/ex/${mainImg}' />" />
					
				</div>
				<div style="margin: 5rem; width: 60rem; /* border: 0.1rem solid red; */ height: auto; ">
					<div style="/* border: 0.1rem solid orange; */ width: 40rem; height: auto;">
						<div style="width: 10rem; float: left; font-weight: bold;" >체험 이름</div>
						<div id="name" style="width: 20rem; margin-left: 10rem; text-align: left;"> ${experienceDto.exName}</div>
						<div style="width: 10rem; float: left; font-weight: bold; margin-top: 2rem;">체험 설명</div>
						<div id="explain" style="word-break: break-all; width: 20rem; margin-left: 10rem; margin-top: 2rem; text-align: left;">${experienceDto.exExplain}</div>	
						<div style="width: 10rem; float: left; font-weight: bold; margin-top: 2rem;">장소</div>
						<div id="reserveCode"  style="width: 20rem; margin-left: 10rem; text-align: left; margin-top: 2rem;">${experienceDto.exAddress}</div>
						
						<div style="width: 10rem; float: left; font-weight: bold; margin-top: 2rem;">인원수</div>
						<div id="payment" style="width: 20rem; margin-left: 10rem; text-align: left; margin-top: 2rem;"> ${experienceDto.exPeople}</div>
						<div style="width: 10rem; float: left; font-weight: bold; margin-top: 2rem;">진행시간</div>
						<div id="point" style="width: 20rem; margin-left: 10rem; text-align: left; margin-top: 2rem;">${experienceDto.exTime}</div>
						
						<div style="width: 10rem; float: left; font-weight: bold; margin-top: 2rem;">진행날짜</div>
						<div id="point" style="width: 20rem; margin-left: 10rem; text-align: left; margin-top: 2rem;">${exStartDateS} ~ ${exEndDateS}</div>
						
						<div style="width: 10rem; float: left; font-weight: bold; margin-top: 2rem;">은행</div>
						<div id="point" style="width: 20rem; margin-left: 10rem; text-align: left; margin-top: 2rem;">${experienceDto.exBank}</div>
						<div style="width: 10rem; float: left; font-weight: bold; margin-top: 2rem;">계좌</div>
						<div id="point" style="width: 20rem; margin-left: 10rem; text-align: left; margin-top: 2rem;">${experienceDto.exAccount}</div>
						<div style="width: 10rem; float: left; font-weight: bold; margin-top: 2rem;">가격</div>
						<div id="point" style="width: 20rem; margin-left: 10rem; text-align: left; margin-top: 2rem;">${experienceDto.exPrice}</div>
					</div>
				</div>
			</div>
			
			<div align="center" style="margin-top: 5rem;">
					<button style="margin-right: 1.5rem;" id="btn" type="button" class="btn btn-warning btn-lg" name="home" onclick="location.href='${root}'">Home</button>
					<button id="btn" type="button" class="btn btn-light btn-lg" name="myInfpo" onclick="location.href='${root}/guestdelluna/myInfo.do'">MY PAGE</button>
				
			</div>
			
		</div>
	</c:if>
	
	<c:if test="${exRegisterChk == 0}">
		<script type="text/javascript">
			alert("체험이 등록되지 않았습니다");
			location.href="${root}/experience/exHost.do";
	
		</script>
	</c:if>
	
	 <!-- footer 겹침현상 제거 -->
	<div style="clear:both;"></div>
</body>
</html>
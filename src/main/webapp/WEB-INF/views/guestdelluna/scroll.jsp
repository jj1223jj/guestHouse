<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<c:forEach var="houseReviewList" items="${houseReviewList}">
			<div class="reviewDiv">
				<div class="reviewL">
					<p>
					<fmt:formatDate value="${houseReviewList.revDate}" pattern="yyyy-MM-dd"/>
					</p>
					<span class="reviewContent">${houseReviewList.revContent}</span>
					<div  class="reviewMemberImg">
						<img alt="img loading" src="<spring:url value='/profileImg/${houseReviewList.memberImgName}' />"/>
					</div>
					<span>${houseReviewList.memberName}</span>
				</div>
				<div class="reviewR">
					<div class="reviewHouseImg">
						<img alt="img loading" src="<spring:url value='/image/${houseReviewList.mainImgName}' />"/>
					</div>
					<span>${houseReviewList.houseName}</span>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach var="exReviewList" items="${exReviewList}">
			<div class="reviewDiv">
				<div class="reviewL">
					<p>
					<fmt:formatDate value="${exReviewList.revDate}" pattern="yyyy-MM-dd"/>
					</p>
					<span class="reviewContent">${exReviewList.revContent}</span>
					<div  class="reviewMemberImg">
						<img alt="img loading" src="<spring:url value='/profileImg/${exReviewList.memberImgName}' />"/>
					</div>
					<span>${exReviewList.memberName}</span>
				</div>
				<div class="reviewR">	
					<div class="reviewHouseImg">
						<img alt="img loading" src="<spring:url value='/image/${exReviewList.mainImgName}' />"/>
					</div>
					<span>${exReviewList.exName}</span>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach var="myHouseReviewList" items="${myHouseReviewList}">
			<div class="reviewDiv">
				<div class="reviewL">
					<p>
					<fmt:formatDate value="${myHouseReviewList.revDate}" pattern="yyyy-MM-dd"/>
					</p>
					<span class="reviewContent">${myHouseReviewList.revContent}</span>
				</div>
				<div class="reviewR">
					<div class="reviewHouseImg">
						<img alt="img loading" src="<spring:url value='/image/${myHouseReviewList.mainImgName}' />"/>
					</div>
					<span>${myHouseReviewList.houseName}</span>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach var="myExReviewList" items="${myExReviewList}">
			<div class="reviewDiv">
				<div class="reviewL">
					<p>
					<fmt:formatDate value="${myExReviewList.revDate}" pattern="yyyy-MM-dd"/>
					</p>
					<span class="reviewContent">${myExReviewList.revContent}</span>
				</div>
				<div class="reviewR">
					<div class="reviewHouseImg">
						<img alt="img loading" src="<spring:url value='/image/${myExReviewList.mainImgName}' />"/>
					</div>
					<span>${myExReviewList.exName}</span>
				</div>
			</div>
		</c:forEach>
</body>
</html>
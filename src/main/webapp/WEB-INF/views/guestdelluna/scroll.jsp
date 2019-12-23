<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="houseReviewList" items="${houseReviewList}">
			<div class="reviewDiv">
				<div class="reviewL">
					<p>
					<fmt:formatDate value="${houseReviewList.revDate}" pattern="yyyy-MM-dd"/>
					</p>
					<span>${houseReviewList.revContent}</span>
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
</body>
</html>
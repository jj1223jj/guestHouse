<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.houseList {
		overflow: hidden;
	}
	.houseDiv {
		float: left;
	}
	.houseImg {
		width: 250px;
		height: 160px;
		overflow: hidden;
	}
	
	
	.reviewDiv{
		overflow: hidden;
		width: 600px;
		margin-top: 20px;
	}
	.reviewL {
		float:left;
	}
	.reviewMemberImg {
		width: 48px;
		height: 48px;
		border-radius: 25px;
		overflow: hidden;
	}
	.reviewR {
		float:right;
	}
	.reviewHouseImg {
		width: 50px;
		height: 40px;
		overflow: hidden;
	}
</style>
<c:set var="root" value="${pageContext.request.contextPath }" />
<script type="text/javascript" src="${root}/resources/xhr/xhr.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/jquery/flick/jquery-ui.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/guestdelluna/myInfo.js"></script>
	<script type="text/javascript"
	src="${root}/resources/javascript/guestdelluna/scroll.js"></script>
<link rel="stylesheet"
	href="${root}/resources/javascript/jquery/flick/jquery-ui.css">
</head>
<body onload="rootPage('${root}')">
	<button id="opener">알림종그림이라는 뜻</button>
	<div id="dialog" title="메시지 확인">
		<script type="text/javascript">
			$(function(root) {

				/* value로 메시지넘버를 받아야함 */

			})
		</script>
	</div>

	<div>
		<div>내정보입니다</div>
		<h3>${memberLevel}</h3>
		<div>
			<a href="${root}/guestdelluna/memberUpdate.do">회원수정</a>
		</div>
		<div>
			<a href="${root}/guestdelluna/memberDelete.do">회원탈퇴</a>
		</div>
		<div>
			<a href="${root}/guestdelluna/managePoint.do">포인트관리</a>
		</div>
		<div>
			<a href="${root}/guestdelluna/payList.do">결제내역</a>
		</div>
		<div>
			<a href="${root}/guestdelluna/allMyReview.do">내가쓴후기</a>
		</div>
		<c:if test="${memberLevel == 'Host'}">
			<div>
				<a href="${root}/host/reservationView.do">예약현황</a>
			</div>
			<div>
				<a href="${root}/host/salesView.do">매출조회</a>
			</div>
			<div>
				<a href="${root}/host/houseManagement.do">관리</a>
			</div>
		</c:if>
		
	</div>
	
	<div>
		<div><img alt="img loading" src="<spring:url value='/profileImg/파일명' />"/></div>
		<div>${memberDto.memberInfo}</div>
	</div>
	
	<c:if test="${memberLevel == 'Host'}">
		<h3>host의 숙소</h3>
		<div class="houseList">
		<c:forEach var="hostHouseList" items="${hostHouseList}">
			<div class="houseDiv">
				<div class="houseImg">
					<img alt="img loading" src="<spring:url value='/image/${hostHouseList.mainImgName}' />"/>
				</div>
				<span class="houseRate">
				<c:if test="${hostHouseList.revRate==1}">
			    	<img src="${root}/resources/css/review/star1.PNG" style="width: 50px;">
				</c:if>
				<c:if test="${hostHouseList.revRate==2}">
					<img src="${root}/resources/css/review/star2.PNG" style="width: 50px;">
				</c:if>
				<c:if test="${hostHouseList.revRate==3}">
					<img src="${root}/resources/css/review/star3.PNG" style="width: 50px;">
				</c:if>
				<c:if test="${hostHouseList.revRate==4}">
					<img src="${root}/resources/css/review/star4.PNG" style="width: 50px;">
				</c:if>
				<c:if test="${hostHouseList.revRate==5}">
					<img src="${root}/resources/css/review/star5.PNG" style="width: 50px;">
				</c:if>
				</span>
				<span>( ${hostHouseList.reviewCount} )</span>
				<span>${hostHouseList.houseName}</span>
			</div>		
		</c:forEach>
		</div>
		
		<h3>host의 체험</h3>
		<div class="houseList">
		<c:forEach var="hostExList" items="${hostExList}">
			<div class="houseDiv">
				<div class="houseImg">
					<img alt="img loading" src="<spring:url value='/ex/${hostExList.mainImgName}' />"/>
				</div>
				<span class="houseRate">
				<c:if test="${hostExList.revRate==1}">
			    	<img src="${root}/resources/css/review/star1.PNG" style="width: 50px;">
				</c:if>
				<c:if test="${hostExList.revRate==2}">
					<img src="${root}/resources/css/review/star2.PNG" style="width: 50px;">
				</c:if>
				<c:if test="${hostExList.revRate==3}">
					<img src="${root}/resources/css/review/star3.PNG" style="width: 50px;">
				</c:if>
				<c:if test="${hostExList.revRate==4}">
					<img src="${root}/resources/css/review/star4.PNG" style="width: 50px;">
				</c:if>
				<c:if test="${hostExList.revRate==5}">
					<img src="${root}/resources/css/review/star5.PNG" style="width: 50px;">
				</c:if>
				</span>
				<span>( ${hostExList.reviewCount} )</span>
				<span>${hostExList.exName}</span>
			</div>		
		</c:forEach>
		</div>
		
<%-- 		<div>
			<h3>숙소후기</h3>
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
		</div>
		
		<div>
			<h3>체험후기</h3>
			<c:forEach var="exReviewList" items="${exReviewList}">
			<div class="reviewDiv">
				<div class="reviewL">
					<p>
					<fmt:formatDate value="${exReviewList.revDate}" pattern="yyyy-MM-dd"/>
					</p>
					<span>${exReviewList.revContent}</span>
					<div  class="reviewMemberImg">
						<img alt="img loading" src="<spring:url value='/profileImg/${exReviewList.memberImgName}' />"/>
					</div>
					<span>${exReviewList.memberName}</span>
				</div>
				<div class="reviewR">
					<div class="reviewHouseImg">
						<img alt="img loading" src="<spring:url value='/ex/${exReviewList.mainImgName}' />"/>
					</div>
					<span>${exReviewList.exName}</span>
				</div>
			</div>
			</c:forEach>
		</div> --%>
	</c:if>
	
	<button type="button" id="houseBtn" selected="selected">숙소</button>
	<button type="button" id="exBtn">체험</button>
	<div id="scrollView">
	ㅎㅇㅎㅇ
	</div>
	
	<script>
		$("#dialog").dialog({
			autoOpen : false
		});
		$("#opener").click(function() {
			$("#dialog").dialog("open");
		});
	</script>

</body>
</html>
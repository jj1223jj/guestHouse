<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var = "root" value = "${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title> 후기작성 </title>

<script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js">
</script>

<link rel="stylesheet" href="${root}/resources/css/review/review.css"/>
<script type="text/javascript" src="${root}/resources/javascript/review/review.js"></script>

</head>
<body>

	<h3> 리뷰 갯수: ${count},
		  현재 페이지:  ${currentPage},
		  한 페이지 당 리뷰 갯수: ${boardSize}
	</h3>
	 
	<div align="center" style="margin: 100px auto;">
		<%-- 리뷰 갯수가 0개 이거나 현재 페이지가 1일 경우 --%>
		<c:if test="${count==0 || currentPage==1}">
			<form class="form" action="${root}/experience/exReviewOk.do" method="get">
				<div class="title">
					<span>이메일</span>
					<input type="text" name="email" size="20" value="${email}" disabled="disabled"/>
			
					<span>비밀번호</span>
					<input type="password" name="password" size="12"/>
				</div>
			
				<div class="content"> 후기 내용
					<textarea rows="5" cols="53" name="revContent"></textarea>
				</div>
				
				<div class="star-input">별점
					<span class="input">
						<input type="radio" name="star-input" value="1" id="p1">
						
					</span>
					
				</div>
				<div class="title" style="text-align: right;">
					<input type="submit" value="확인"/>
					<input type="reset" value="취소"/>
				</div>
			</form>
		</c:if>
		
		<%-- 미리 쓴 후기가 존재하는 경우  --%>
		<c:if test ="${count > 0}">
			<c:forEach var="exReviewDto" items="${exReviewList}">
				<div class="form" style="margin: 50px auto; border-width:1px;">
					<div class="title">
						
						<!-- 리뷰 번호  -->
						${exReviewDto.exReviewCode} &nbsp;&nbsp;	
						<!-- 후기 작성 시간 -->
						<fmt:formatDate value="${exReviewDto.revDate}" pattern = "yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;
						<a href="javascript:updateCheck('${root}','${exReviewDto.exReviewCode}','${currentPage}')"	>수정</a>
						<a href="javascript:deleteCheck('${root}','${exReviewDto.exReviewCode}','${currentPage}')">삭제</a> 		
					</div>
					
					<div class="content" >
						${exReviewDto.revContent}
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
	
	<%-- 페이지 번호
			1. 총 페이지수 : 전체 레코드 수(count)와 페이지 당 게시물 수(boardSize)
			2. 페이지 블럭 : 시작번호, 끝번호 나와야 함  [1][2][3][4][5] [다음]
			3. 
	--%> 
	<div align="center">
		<c:if test="${count > 0}">
			<%-- 1. 총 페이지 수  count/boardSize --%>
			<fmt:parseNumber var="pageCount" integerOnly="true" value="${count/boardSize + (count%boardSize==0 ? 0 : 1)}"/>	<%--딱 떨어지지 않는 페이지 일때  --%>
			
			<%-- 2. 페이지 블럭이  value값의 갯수만큼 나옴. 1의 경우 [이전] 1 [다음] --%>
			<c:set var="pageBlock" value="${2}"/>
			
			<%-- 2. 페이지 블럭/ 시작, 끝번호 
				자바로 짰을 때 :
				int startPage = (int)((currentPage-1)/pageBlock)*pageBlock+1;
				int endPage = startPage+pageBlock-1;
			--%>
			
			<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock}" integerOnly="true"/> 
			
			<c:set var="startPage" value="${rs*pageBlock+1}"/>
			<c:set var="endPage" value="${startPage+pageBlock-1}"/>
			
			<%-- 3. 총 레코드 수: 270/10 = 27페이지 까지 나와야 함. 위의 로직대로면 21~30까지의 페이지 블럭이 나옴. 27페이지까지만 나오게  --%>
			
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}"/>
			</c:if>
			
			<%-- 이전  // startPage=3, pageBlock=2 이면 [이전][3] 출력, 이전을 누르면  1페이지로 이동--%>
			<c:if test="${startPage > pageBlock}">
				<a href="${root}/guest/write.do?pageNumber=${startPage-pageBlock}">[이전]</a>
			</c:if>
			
			<%-- 페이지 블럭 [1][2][3] --%>
			<c:forEach var="i" begin = "${startPage}" end = "${endPage}">
				<a href="${root}/guest/write.do?pageNumber=${i}">[${i}]</a>
			</c:forEach>
			
			<%-- 다음  // endPage=2, pageCount=3(총 페이지 갯수)이면 [1][2][다음] 출력, startPage=1, pageBlock=2일때 다음을 누르면 3페이지로 이동--%>
			<c:if test="${endPage < pageCount}">
				<a href="${root}/guest/write.do?pageNumber=${startPage+pageBlock}">[다음]</a>
			</c:if>
			
		</c:if>
	
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>기간조회</h3>
		 <div align="center">
		 <c:if test="${searchDateList.size() == 0 || count == 0}">
		 	<table border="1">
		 		<tr>
		 			<td>예약 목록이 존재하지 않습니다.</td>
		 		</tr>
		 	</table>
		 </c:if>
		 
		<c:if test="${count > 0}"> 
		<div class="container">
	   <table class="table table-hover">
	   <thead align="center">
	      <tr>
	         <th align="center" height="20"  width="80">예약일</th> 
	         <th align="center" height="20"  width="80">예약자</th> 
	         <th align="center" height="20"  width="80">예약인원</th> 
	         <th align="center" height="20"  width="80">결제금액</th>
	      </tr>
	      </thead>
	      
	      <tbody>
	      <c:forEach var="searchDateList" items="${searchDateList}">
	      <tr>
	         <td align="center" height="20"  width="80">
	         <fmt:formatDate value="${searchDateList.reserveDate}" pattern="yyyy-MM-dd"/>
	         </td>
	         <td align="center" height="20"  width="80">${searchDateList.memberName}</td>
	         <td align="center" height="20"  width="80">${searchDateList.people}</td>
	         <td align="center" height="20"  width="80">${searchDateList.payment}</td> 
	      </tr>
	      </c:forEach>
	      </tbody>
		</table>
		</c:if>
		<h3>건 수: ${searchDateListCount.count}</h3>
		<h3>총금액: ${searchDateListCount.payment}</h3>
		<div align="center">
		<c:if test="${count>0 }">
			<fmt:parseNumber var="pageCount" integerOnly="true" 
							value="${count/boardSize+(count%boardSize==0 ? 0:1)}"/>
							
			<c:set var="pageBlock" value="${10}"/>
			
			<fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
			<c:set var="startPage" value="${result*pageBlock+1}"/>
			<c:set var="endPage" value="${startPage+pageBlock-1}"/>
			
			<c:if test="${endPage>pageCount}">
				<c:set var="endPage" value="${pageCount}"/>
			</c:if>
			
			<c:if test="${startPage>pageBlock}">
				<a onclick="searchDate('${root}','${startPage-pageBlock}')">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a onclick="searchDate('${root}', '${i}')">[${i}]</a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a onclick="searchDate('${root}','${startPage+pageBlock}')">[다음]</a>
			</c:if>
		</c:if>
		
	</div>
   
   </div>
   </div>
</body>
</html>
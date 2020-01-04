<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
		 <div align="center">
		 <c:if test="${reserveViewList.size() == 0 || count == 0}">
		 	<h5>예약목록이 존재하지 않습니다.</h5>
		 </c:if>
		 
		<c:if test="${count > 0}"> 
		<div class="container">
	   <table class="table table-hover">
	   <thead align="center">
	      <tr style="background-color: #f7f7f7">
	         <th align="center" height="20"  width="80">예약자</th> 
	         <th align="center" height="20"  width="125">예약자이메일</th> 
	         <th align="center" height="20"  width="125">예약자연락처</th> 
	         <th align="center" height="20"  width="80">예약인원</th>
	         <th align="center" height="20"  width="200">예약일</th>
	         <th align="center" height="20"  width="80">결제금액</th>
	         <th align="center" height="20"  width="80">예약상태</th>
	      </tr>
	      </thead>
	      
	      <tbody>
	      <c:forEach var="reserveViewList" items="${reserveViewList}">
	      <tr>
	         <td align="center" height="20"  width="80">${reserveViewList.memberName}</td> 
	         <td align="center" height="20"  width="125">${reserveViewList.email}</td>
	         <td align="center" height="20"  width="125">${reserveViewList.phone}</td>
	         <td align="center" height="20"  width="80">${reserveViewList.people}</td> 
	         <td align="center" height="20"  width="200">
	         <fmt:formatDate value="${reserveViewList.checkIn}" pattern="yyyy-MM-dd"/> ~
	         <fmt:formatDate value="${reserveViewList.checkOut}" pattern="yyyy-MM-dd"/>
	         </td>
	         <td align="center" height="20"  width="80">${reserveViewList.payment}</td>
	         <td align="center" height="20"  width="80">${reserveViewList.state}</td> 
	      </tr>
	      </c:forEach>
	      </tbody>
		</table>
		</c:if>
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
				<a onclick="toServer('${root}','${startPage-pageBlock}')">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a onclick="toServer('${root}', '${i}')" id="${i}">${i}</a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a onclick="toServer('${root}','${startPage+pageBlock}')">[다음]</a>
			</c:if>
		</c:if>
		<input type="hidden" value="${currentPage}" id="currentPage"/>
	</div>
   </div>
   </div>
</body>
</html>
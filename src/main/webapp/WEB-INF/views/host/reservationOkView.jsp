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
	<h3>예약현황</h3>
		 <div align="center">
	   <table border="1">
	      <tr>
	         <td align="center" height="20"  width="80">예약자</td> 
	         <td align="center" height="20"  width="125">예약자이메일</td> 
	         <td align="center" height="20"  width="125">예약자연락처</td> 
	         <td align="center" height="20"  width="200">예약일</td>
	         <td align="center" height="20"  width="80">결제금액</td>
	         <td align="center" height="20"  width="80">예약상태</td>
	      </tr>
	      
	      <c:forEach var="reserveViewList" items="${reserveViewList}">
	      <tr>
	         <td align="center" height="20"  width="80">${reserveViewList.memberName}</td> 
	         <td align="center" height="20"  width="125">${reserveViewList.email}</td>
	         <td align="center" height="20"  width="125">${reserveViewList.phone}</td>
	         <td align="center" height="20"  width="200">
	         <fmt:formatDate value="${reserveViewList.checkIn}" pattern="yyyy-MM-dd"/> ~
	         <fmt:formatDate value="${reserveViewList.checkOut}" pattern="yyyy-MM-dd"/>
	         </td>
	         <td align="center" height="20"  width="80">${reserveViewList.payment}</td>
	         <td align="center" height="20"  width="80">${reserveViewList.state}</td> 
	      </tr>
	      </c:forEach>
		</table>
   
   </div>
</body>
</html>
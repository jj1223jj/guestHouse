<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<!--   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->
<title>Insert title here</title>
</head>
<body>
   <div align="center">
   
	 <c:if test="${houseList.size() == 0 && count == 0}">
	 	<h5>등록된 숙소가 존재하지 않습니다.</h5>
	 </c:if>
   
   <c:if test="${count > 0}"> 
   <div class="container">
   <table class="table table-hover">
   <thead align="center">
      <tr style="background-color: #f7f7f7">
         <th align="center" height="20"  width="250">숙소명</th> 
         <th align="center" height="20"  width="250">주소</th> 
         <th align="center" height="20"  width="110">등록일</th> 
         <th align="center" height="20"  width="100">승인여부</th> 
         <th align="center" height="20"  width="80">관리</th>
      </tr>
      </thead>
      
      <tbody>
      <c:forEach var="houseList" items="${houseList}">
      <tr>
         <td align="center" height="20"  width="250">${houseList.houseName}</td> 
         <td align="center" height="20"  width="250">${houseList.address} ${houseList.detailAddress}</td> 
         <td align="center" height="20"  width="100" pattern="yyyy-MM-dd">
         	<fmt:formatDate value="${houseList.houseRegDate}" pattern="yyyy-MM-dd"/>
         </td>
         <td align="center" height="20"  width="100">${houseList.approvalStatus}</td> 
         <td align="center" height="20"  width="80">
         <c:if test="${houseList.approvalStatus != '삭제'}"> 
         <a href="#" onclick="return cancel('${root}','${houseList.houseCode}')" class="deleteBtn">삭제</a>
         </c:if>
         </td> 
      </tr>
      </c:forEach>
      </tbody>
      
      </table>
      </c:if>
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
</body>
</html>
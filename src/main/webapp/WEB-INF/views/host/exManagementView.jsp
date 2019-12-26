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
   <div align="center">
   
	 <c:if test="${experienceList.size() == 0 || count == 0}">
	 	<table border="1">
	 		<tr>
	 			<td>등록된 체험이 존재하지 않습니다.</td>
	 		</tr>
	 	</table>
	 </c:if>
   
   <c:if test="${count > 0}"> 
   <div class="container">
   <table class="table table-hover">
   <thead align="center">
      <tr>
         <th align="center" height="20"  width="125">체험명</th> 
         <th align="center" height="20"  width="300">주소</th> 
         <th align="center" height="20"  width="125">등록일</th> 
         <th align="center" height="20"  width="125">승인여부</th> 
         <th align="center" height="20"  width="80">관리</th>
      </tr>
      </thead>
      
      <tbody>
      <c:forEach var="experienceList" items="${experienceList}">
      <tr>
         <td align="center" height="20"  width="125">${experienceList.exName}</td> 
         <td align="center" height="20"  width="300">${experienceList.exAddress}</td> 
         <td align="center" height="20"  width="125">
         	<fmt:formatDate value="${experienceList.exRegDate}" pattern="yyyy-MM-dd"/>
         </td>
         <td align="center" height="20"  width="125">${experienceList.exApproval}</td>
         <td align="center" height="20"  width="80">
         <c:if test="${experienceList.exApproval != '삭제'}"> 
         <a href="#" onclick="return cancel('${root}','${experienceList.exCode}','${experienceList}')">삭제</a>
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
				<a onclick="toServer('${root}', '${i}')">[${i}]</a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a onclick="toServer('${root}','${startPage+pageBlock}')">[다음]</a>
			</c:if>
		</c:if>
      </div>
   </div>
</body>
</html>
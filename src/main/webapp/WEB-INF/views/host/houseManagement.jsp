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
<script>
	function cancel(root, houseCode) {
		alert(root + "," + houseCode);
		var value = confirm("정말 삭제하시겠습니까?");
		if (value == false) {
			return false;
		} else {
			location.href=root + "/host/hostCancel.do?houseCode=" + houseCode;
		}
	}
</script>
</head>
<body>
	<a href="${root}/host/houseManagement.do">게스트하우스관리</a>
	<a href="${root}/host/exManagement.do">체험 관리</a>
   <div align="center">
   <h3>${memberCode} </h3>
   
	 <c:if test="${houseList.size() == 0 || count == 0}">
	 	<table border="1">
	 		<tr>
	 			<td>등록된 숙소가 존재하지 않습니다.</td>
	 		</tr>
	 	</table>
	 </c:if>
   
   <c:if test="${count > 0}"> 
   <table border="1">
      <tr>
         <td align="center" height="20"  width="125">숙소명</td> 
         <td align="center" height="20"  width="300">주소</td> 
         <td align="center" height="20"  width="125">등록일</td> 
         <td align="center" height="20"  width="125">승인여부</td> 
         <td align="center" height="20"  width="80">관리</td>
      
      </tr>
      
      <c:forEach var="houseList" items="${houseList}">
      <tr>
         <td align="center" height="20"  width="125">${houseList.houseName}</td> 
         <td align="center" height="20"  width="300">${houseList.address} ${houseList.detailAddress}</td> 
         <td align="center" height="20"  width="125" pattern="yyyy-MM-dd">
         	<fmt:formatDate value="${houseList.houseRegDate}" pattern="yyyy-MM-dd"/>
         </td>
         <td align="center" height="20"  width="125">${houseList.approvalStatus}</td> 
         <td align="center" height="20"  width="80"><a href="#" onclick="return cancel('${root}','${houseList.houseCode}','${houseList}')">삭제</a></td> 
      </tr>
      </c:forEach>
      
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
				<a href="${root}/host/houseManagement.do?pageNumber=${startPage-pageBlock}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="${root}/host/houseManagement.do?pageNumber=${i}">[${i}]</a>
				
			</c:forEach>
			
			<c:if test="${endPage < pageCount}">
				<a href="${root}/host/houseManagement.do?pageNumber=${startPage+pageBlock}">[다음]</a>
			</c:if>
		</c:if>
   
   </div>
</body>
</html>
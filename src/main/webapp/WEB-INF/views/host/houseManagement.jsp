<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<h3>게스트하우스관리</h3>
   <div align="center">
   <h3>${memberCode} </h3>
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
         <td align="center" height="20"  width="300">${houseList.address}</td> 
         <td align="center" height="20"  width="125" pattern="yyyy-MM-dd">
         ${houseList.houseRegDate}
         	<fmt:formatDate value="${houseList.houseRegDate}" pattern="yyyy-MM-dd"/>
         </td>
         <td align="center" height="20"  width="125">${houseList.approvalStatus}</td> 
         <td align="center" height="20"  width="80"><a href="#" onclick="return cancel('${root}','${houseList.houseCode}','${houseList}')">삭제</a></td> 
      <%--    <fmt:formatDate value="${scoreDto.write_date}" pattern="yyyy-MM-dd"/> --%>
      </tr>
      </c:forEach>
      
      </table>
   
   </div>
</body>
</html>
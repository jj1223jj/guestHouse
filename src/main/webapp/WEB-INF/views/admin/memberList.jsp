<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
	<script src="${root}/resources/javascript/jquery/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
		
		<script src="${root}/resources/javascript/admin/admin.js" type="text/javascript" charset="utf-8"></script>
		

<title>List</title>
</head>
<body>

			<input type="hidden" name ="memberCode" value="${memberCode}"/>
			<input type="hidden" name ="pageNumber" value="${pageNumber}"/>
	<table width = "500" height ="20" align="center">
		<tr>
			<td align = "center" bgcolor="pink">
				<div>회원번호를 클릭하시면 수정이 가능합니다.</div>
			</td>
		</tr>
	</table>
	
	<c:if test="${count == 0 || memberList.size() == 0}">
         <table>
            <tr>
               <td align="center">게시판에 저장된 글이 없습니다.</td>
            </tr>         
         </table>
      </c:if>
      
      <c:if test="${count > 0 }">
		<table border="1" style="width:600px; cellpadding:2; cellspacing:0; align:center;margin: 100px auto;">
			<tr>
				<td align="center" width="20">회원번호</td>
				<td align="center" width="40">이름</td>
				<td align="center" width="100">이메일</td>
				<td align="center" width="70">전화</td>
				<td align="center" width="100">가입일자</td>
				<td align="center" width="50">포인트</td>
				<td align="center" width="50">회원등급</td>
			
			</tr>
			<c:forEach var="memberDto" items="${memberList}">
				<tr>
					<td>
					<button onclick="window.open('${root}/admin/adminMemberRead.do?memberCode=${memberDto.memberCode}&pageNumber=${currentPage}','window_name','width=430,height=500,location=no,status=no,scrollbars=yes')">${memberDto.memberCode}</button>
					<input type="hidden" id="memberCode" name="memberCode" value="${memberDto.memberCode}"/>
					
					<!--  <a href="${root}/admin/adminMemberRead.do?memberCode=${memberDto.memberCode}&pageNumber=${currentPage}">${memberDto.memberCode}</a>
					-->
					</td>
					<td>${memberDto.memberName}</td>
					
					<td>${memberDto.email}</td>
					<td>${memberDto.phone}</td>
					<td>
						<fmt:formatDate value="${memberDto.regDate}" pattern="yyyy-MM-dd hh:mm:ss"/>
					</td>
					<td>${memberDto.point}</td>
					<td>${memberDto.memberLevel}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<br/>
	<div align = "center">
		<c:if test="${count > 0 }">
			<c:set var="pageBlock" value="${10}"/>
			<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1)}"/>
			
			<fmt:parseNumber var = "result" value = "${(currentPage-1)/pageBlock}" integerOnly="true"/>
			<c:set var="startPage" value = "${result*pageBlock+1}"/>
			<c:set var="endPage" value = "${startPage+pageBlock-1}"/>
			
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}"/>
			</c:if>
			
			<c:if test="${startPage > pageBlock}">
				<a href="${root}/admin/memberList.do?pageNumber=${startPage-pageBlock}">[이전]</a>
			</c:if>
			
			<c:forEach var = "i" begin="${startPage}" end="${endPage}">
				<a href="${root}/admin/memberList.do?pageNumber=${i}">[${i}]</a>
			</c:forEach>  
			
			<c:if test="${endPage > pageCount}">
				<a href="${root}/admin/memberList.do?pageNumber=${startPage+pageBlock}">[다음]</a>
			</c:if>
		
		</c:if>
	</div>
</body>
</html>
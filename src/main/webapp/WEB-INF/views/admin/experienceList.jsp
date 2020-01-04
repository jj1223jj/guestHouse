<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>

<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<%-- <script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script> --%>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->
<%-- <script src="${root}/resources/javascript/jquery/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script> --%>


<script src="${root}/resources/javascript/admin/admin.js" type="text/javascript" charset="utf-8"></script>
	
	
</head>
<body>

			<input type="hidden" name ="memberCode" value="${memberCode}"/>
			<input type="hidden" name ="pageNumber" value="${pageNumber}"/>
	<table class="table">
		<tr>
			<td align = "center" bgcolor="khaki">
				<div>해당 체험 페이지로 이동하여 승인여부를 결정해주세요.</div>
			</td>
		</tr>
	</table>
	
	<c:if test="${count == 0 || experienceList.size() == 0}">
         <table>
            <tr>
               <td align="center">게시판에 저장된 글이 없습니다.</td>
            </tr>         
         </table>
      </c:if>
      
       <div class="container">
	      <c:if test="${count > 0 }">
			<table class="table table-hover">
				<thead>
					<tr>
						<td>체험 이름</td>
						<td style="width: 6rem;">회원코드</td>
						<td>위치</td>
						<td style="width: 9rem;">체험 승인여부</td>
						<td style="width: 8rem;">체험페이지로</td>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="experienceDto" items="${experienceList}">
						<tr>
							<td>
							<%-- <button onclick="window.open('${root}/experience/exPage.do?memberCode=${experienceDto.memberCode}&exCode=${experienceDto.exCode}','window_name','width=1400,height=500,location=no,status=no,scrollbars=yes')">${experienceDto.exName}</button>
							 --%>
							<!--  <a href="${root}/admin/adminMemberRead.do?memberCode=${memberDto.memberCode}&pageNumber=${currentPage}">${memberDto.memberCode}</a>
							-->
							${experienceDto.exName}
							</td>
							<td style="padding-left: 2rem;">${experienceDto.memberCode}</td>
							<!--address나 local 둘 중 ?  -->
							<td>${experienceDto.exAddress}</td>
							<td>${experienceDto.exApproval}</td>
							<td><p><button style="margin-left: 1.5rem;" class="btn btn-outline-success btn-xs" data-toggle="modal" onclick="window.open('${root}/experience/exPage.do?exApp=1&memberCode=${experienceDto.memberCode}&exCode=${experienceDto.exCode}','window_name','width=1300,height=700,location=no,status=no,scrollbars=yes')"><i class="fa fa-mail-forward"></i></button></p></td>
	    
						</tr>
					</c:forEach>
				</tbody>
			</table>
		  </c:if>
		</div>
	<br/>
	<div align = "center">
		<ul class="pagination justify-content-center">
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
					<li class="page-item"><a class="page-link" href="${root}/admin/experienceList.do?pageNumber=${startPage-pageBlock}">이전</a></li>
				</c:if>
				
				<c:forEach var = "i" begin="${startPage}" end="${endPage}">
					<li class="page-item"><a class="page-link" href="${root}/admin/experienceList.do?pageNumber=${i}">${i}</a></li>
				</c:forEach>  
				
				<c:if test="${endPage < pageCount}">
					<li class="page-item"><a class="page-link" href="${root}/admin/experienceList.do?pageNumber=${startPage+pageBlock}">다음</a></li>
				</c:if>
			
			</c:if>
		</ul>
	</div>
</body>
</html>
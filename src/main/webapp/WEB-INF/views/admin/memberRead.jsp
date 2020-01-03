<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var = "root" value = "${pageContext.request.contextPath}"/>
<html>
<head>
<%-- <script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script> --%>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->
<%-- <script src="${root}/resources/javascript/jquery/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script> --%>
		
<script src="${root}/resources/javascript/admin/admin.js" type="text/javascript" charset="utf-8"></script>
		

</head>
<body>
	<input type="hidden" name ="memberCode" value="${memberCode}"/>
	<input type="hidden" name ="pageNumber" value="${pageNumber}"/>
			
<form action="${root}/admin/memberUpdateOk.do?memberCode=${memberDto.memberCode}" method = "post" onsubmit = "return boardForm(this)" name="createForm">
	
	<div align = "center" style="margin-top:50px;">
	
		<div border="1">
			<div>
				 
				<p align="center" height="20" width="125">${memberDto.memberName}님의 회원 정보 수정입니다.</p>
				
				<p align="center" height="20" width="125">포인트</p>
				<div align="center" height="20" width="125"><input type="text" name="point" value="${memberDto.point}" /></div>
				<p align="center" height="20" width="125">회원등급</p>
					<div>
						<select name = "memberLevel">
						<option value = "">선택하세요</option>
						<option value = "Admin">관리자</option>
						<option value = "A">일반</option>
						<option value="Host">호스트</option>
					</select>
					<script type="text/javascript">
					createForm.memberLevel.value="${memberDto.memberLevel}"
					</script>	
					</div>
				
			</div>
			<br/><br/>
			<div>
				<div height="30" colspan="7" align="center">
					<input type="submit" value="수정"/>
					
					<input type="reset" value="취소"/>
					
				</div>
			</div>
		</div>
	</div>
	</form>
</body>
</html>
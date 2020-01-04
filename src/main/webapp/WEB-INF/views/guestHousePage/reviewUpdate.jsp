<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<c:set var = "root" value = "${pageContext.request.contextPath}"/>
<html>
<head>
<title>Insert title here</title>
<%-- <script src="${root}/resources/javascript/jquery/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script> --%>
		
<script src="${root}/resources/javascript/review/review.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="${root}/resources/css/review/review.css"/>
<script type="text/javascript">
	

</script>	
</head>
<body>

<div align="center" style="margin: 40px auto;">
		<%-- 리뷰 갯수가 0개 이거나 현재 페이지가 1일 경우 --%>
				
			<form class="form" action="${root}/guestHousePage/reviewUpdateOk.do?memberCode=${memberCode}&reserveCode=${reserveCode}&pageNumber=${currentPage}" 
			method="get" onsubmit="return checkUp()">
				<div class="title">
				<input type="hidden" name = "memberCode" value="${memberCode}"/>
				<input type="hidden" name="exReserveCode" value="${reserveCode}"/>
					<span>이메일</span>
					<input type="text" name="email" size="20" value="${email}" disabled="disabled"/>
			
				</div>
			
				<div class="content"> 후기 내용
					<textarea rows="5" cols="53" name="revContent" id="revContent">${revContent}</textarea>
				</div>
				<div>
					<span class="star-input">
					   <span class="input">
					       <input type="radio" name="star-input" value="1" id="p1">
					       <label for="p1">1</label>
					       <input type="radio" name="star-input" value="2" id="p2">
					       <label for="p2">2</label>
					       <input type="radio" name="star-input" value="3" id="p3">
					       <label for="p3">3</label>
					       <input type="radio" name="star-input" value="4" id="p4">
					       <label for="p4">4</label>
					       <input type="radio" name="star-input" value="5" id="p5">
					       <label for="p5">5</label>
					     </span>
		
					     <output for="star-input" name="starValue"><input type="hidden" name="revRate" id="revRate" class="revRate"/></output>                  
					</span>
				
				</div>
					     <script type="text/javascript" src="${root}/resources/javascript/review/review.js"></script>
				
				
				<div class="title" style="text-align: right;">
					<input type="submit" value="확인" />
					<input type="reset" value="취소" onclick="self.close()"/>
				</div>
			</form>
		
	</div>
</body>
</html>
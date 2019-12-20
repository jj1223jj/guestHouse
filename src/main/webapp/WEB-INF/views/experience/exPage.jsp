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
<script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/jquery/Blitzer/jquery-ui.js"></script>
<link rel="stylesheet" href="${root}/resources/javascript/jquery/Blitzer/jquery-ui.css">

<script type="text/javascript">
	$(function(){
		$("#date").datepicker({
			dateFormat:"yy-mm-dd",
			 monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
			 dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ]
			
		});
	});
</script>

</head>
<body>
	<form action="${root}/experience/exReserve.do" method="get">
		<div class="wrap">
	      <ul>  
	         <li>
	            <label>체험이름</label>
	    		<input type="text" name="exName" id="exName" value="${experienceDto.exName}"/>
	    	</li>
	    	<li>	
	    		<label>진행시간</label>
	    		<input type="text" name="exTime" id="exTime" value="${experienceDto.exTime}"/>
	    	</li>
	    	<li>	
	    		<label>체험날짜</label>
	    		<fmt:formatDate var="startDate" pattern="yyyy년 MM월 dd일" value="${experienceDto.exStartDate}"/>
	    		<fmt:formatDate var="endDate" pattern="yyyy년 MM월 dd일" value="${experienceDto.exEndDate}"/>
	    		
	    		<input type="text" name="exStartDate" id="exStartDate" value="${startDate}"/>
	    		<input type="text" name="exEndDate" id="exEndDate" value="${endDate}"/>
	    	</li>
	    	<li>	
	    		<label>가격</label>
	    		<input type="text" name="exPrice" id="exPrice" value="${experienceDto.exPrice}"/>
	    	</li>
	    	<li>	
	    		<label>위치</label>
	    		<input type="text" name="exAddress" id="exAddress" value="${experienceDto.exAddress}"/>
	    		
	        </li>
	        
	         	<div>이미지가져오기</div>
	         	
	         	
	         	
	         <li>
	         	<label>프로그램설명</label>
	    		<input type="text" name="exExplain" id="exExplain" value="${experienceDto.exExplain}"/>
	    		
	         </li>
	         
	       	<li>
	       		<label>예약가능날짜</label>
	            <div type="text" id="date" name="date"></div>
	        </li>
	        
	        <li>
	        	<label>리뷰</label>
	        </li>
	        <li>
	        	<label>호스트정보</label>
	        	<input type="text" name="memberName" id="memberName" value="${memberDto.memberName}">
	        	<label>회원가입 날짜</label>
	        	<fmt:formatDate var="regDate" pattern="yyyy년 MM월 dd일" value="${memberDto.regDate}"/>
	    		
	        	<input type="text" name="regDate" id="regDate" value="${regDate}">
	        	<label>소개</label>
	        	<input type="text" name="memberInfo" id="memberInfo" value="${memberDto.memberInfo}">
	        </li>
	        
	        <li>
	        	<label>지도</label>
	        </li>
	        
	        
	        
          </ul>
      
       		
       		
        </div>
	
	</form>
</body>
</html>
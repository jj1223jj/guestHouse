<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/jquery/Blitzer/jquery-ui.js"></script>
<link rel="stylesheet" href="${root}/resources/javascript/jquery/Blitzer/jquery-ui.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=50ff539a80f0de17cdf30d7ef1f997fc&libraries=services"></script>


<link rel="stylesheet" href="${root}/resources/css/review/review.css"/>
<script src="${root}/resources/javascript/review/review.js" type="text/javascript"></script>


</head>
<body>
	<c:if test="${memberLevel == 'Admin'}">
		<button id="btn" class="btn" name="stateOk" onclick="location.href='${root}/admin/exState.do?exCode='+'${experienceDto.exCode}'">승인</button>
		<button id="btn" class="btn" name="stateNo" onclick="location.href='${root}/admin/exStateNo.do?exCode='+'${experienceDto.exCode}'">거절</button>
	</c:if>
	<div class="wrap" style="margin:0px auto;">
<!-- 이미지 -->		
		<div>체험 이미지</div>
	         	<div class="img">
	         		<c:forEach var="exFileDto" items="${exFileList}">
	         			<c:if test="${exFileDto.mainImgName!=null}">
	         				<img alt="img loading" src="<spring:url value='/exImage/${exFileDto.mainImgName}' />"/>
	         			</c:if>
	         			<c:if test="${exFileDto.fileName!=null}">
	         				<img alt="img loading" src="<spring:url value='/exImage/${exFileDto.fileName}' />"/>
	         			</c:if>
	         		</c:forEach>
	         	</div>
	         
		
	     
<!-- 체험정보 -->	
		<div style="margin-left: 100px; margin-top: 50px;">
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
	    		<!-- view를 위한 날짜 포맷-->
	    		<fmt:formatDate var="startDate" pattern="yyyy년 MM월 dd일" value="${experienceDto.exStartDate}"/>
	    		<fmt:formatDate var="endDate" pattern="yyyy년 MM월 dd일" value="${experienceDto.exEndDate}"/>
	    		
	    		<input type="text" name="exStartDate" id="exStartDate" value="${startDate}"/>
	    		<input type="text" name="exEndDate" id="exEndDate" value="${endDate}"/>
	    		
	    		<!-- 달력 표시를 위한 날짜 포맷 -->
	    		<fmt:formatDate var="startDateC" pattern="yyyy-MM-dd" value="${experienceDto.exStartDate}"/>
	    		<fmt:formatDate var="endDateC" pattern="yyyy-MM-dd" value="${experienceDto.exEndDate}"/>
	    		
	    	</li>
	    	
	    	
	    	
	    	
	    	
	    	<li>	
	    		<label>가격</label>
	    		<input type="text" name="exPrice" id="exPrice" value="${experienceDto.exPrice}"/>
	    	</li>
	    	<li>	
	    		<label>위치</label>
	    		<input type="text" name="exAddress" id="exAddress" value="${experienceDto.exAddress}"/>
	    		
	        </li>
	        
	         <li>
	         	<label>프로그램설명</label>
	    		<input type="text" name="exExplain" id="exExplain" value="${experienceDto.exExplain}"/>
	    		
	         </li>
<!-- 달력 -->		         
	       	<li>
	       		<label>예약가능날짜</label>
	            <div type="text" id="date" name="date"></div>
	        </li>
	        
	        
	        <script type="text/javascript">
				$(function(){
					$("#date").datepicker({
						dateFormat:"yy-mm-dd",
						 monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
						 dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
						 minDate:new Date('${startDateC}'),
						 maxDate:new Date('${endDateC}'),					
						 onSelect:function(dateText, inst, root){
							 
							 var exDate = $(this).val();
							 
							 alert(exDate);
							 var exCode = ${experienceDto.exCode};
							 var url="${root}/experience/exReserveCal.do?exDate="+exDate+"&exCode="+exCode;
							 alert(url);
							//location.href=url;
						 }
						
					});
				});
			</script>
	       </ul>
	     </div>
<!-- 예약하기 -->
<form action="${root}/experience/exReserve.do"  method="get" name="exForm">
	<div style="width:500px; margin:20px 100px; border: 1px solid red;">
	
		<p>예약하기</p>
		<p>날짜선택</p>
		<input type="text" id="exDateS" name="exDateS"/>
		
		<script type="text/javascript">
		$(function(){
			$("#exDateS").datepicker({
				dateFormat:"yy-mm-dd",
				 monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
				 dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
				 showOn:"button",
				 buttonText:"날짜선택",
				 minDate:new Date('${startDateC}'),
				 maxDate:new Date('${endDateC}'),
				 onClose:function(selectedDate){
					 //$("#exEndDateS").datepicker("option","minDate",selectedDate);
					
					
				 }
			});
		});
		</script>
		
		<p>인원</p>
		<input type="number" name="exPeople" id="exPeople"/>
		<input type="hidden" name="exCode" id="exCode" value="${experienceDto.exCode}"/>
		<input type="hidden" name="reviewList" id="reviewList" value="${reviewList.size()}"/>
		
		<input type="hidden" name="experienceDto" id="experienceDto" value="${experienceDto}"> 
		<input type="submit" id="exReserveBtn" value="예약하기"/>
		
	</div>
	
	</form>
	<br/><br/>
 <!-- 리뷰수 count -->
			전체 리뷰 수: ${count}, 이 페이지의 리뷰 수 : ${reviewList.size()}, 현재 페이지: ${currentPage}




 <!-- 후기 작성 -->   
  <form action="${root}/experience/exReviewOk.do"  method="get" name="exForm" onsubmit="return check('${revContent}','${revRate}')">  
	    <div align="" style="margin: 100px;">
		
		
		<%-- 후기 갯수가 0개 이거나 현재 페이지가 1일 경우 --%>
		<c:if test="${reviewList.size()==0 || currentPage==1}">
			<div class="form">
				<div class="title">
					<span>이메일</span>
					<input type="text" name="email" size="20" value="${email}" disabled="disabled"/>
			
				</div>
			
				<div class="content"> 후기 내용
					<textarea rows="5" cols="53" name="revContent" id="revContent" class="revContent"></textarea>
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
					     
					     <output for="star-input" name="starValue"><input type="hidden" name="revRate" id="revRate" class="revRate"></output>                  
					</span>
				
				</div>
		
				<%-- 
				전부 0값 들어감
				<input type="hidden" name="exReserveCode" value="${exReviewDto.exReserveCode}">
				<input type="hidden" name="memberCode" value="${exReviewDto.memberCode}">
				
				<input type="hidden" name="revContent" value="${revContent}">
				 --%>
			
				<!-- 별점 스크립트를 위해서 여기에 또 스트립트 선언 해줘야 함  -->
				<script type="text/javascript" src="${root}/resources/javascript/review/review.js"></script>
				
				<div class="bottom" style="text-align: left; margin-left: 300px; margin-top: 50px;">
						
					<%-- <button id="exReviewOk" onclick="exReviewChk('${root}')">확인</button> --%>
					<input type="hidden" name="exCode" value="${experienceDto.exCode}"/>
					<input type="submit" value="확인"/>
					<input type="button" value="취소"/>
					
					
				</div>
			</div>
		</c:if>
	</div>
</form>
	
		
<!-- 후기 리스트 -->			
		<%-- 미리 쓴 후기가 존재하는 경우  --%>
		
	<div>
		<c:if test ="${reviewList.size() > 0}">
			<c:forEach var="exReviewDto" items="${reviewList}">
				<div class="form" style="margin: 50px 100px; border-width:1px;">
					<div class="title">
						
												
						<!-- 리뷰 번호  -->
						예약번호: ${exReviewDto.exReserveCode} &nbsp;&nbsp;
						<input type="hidden" name="exReserveCode" value="${exReviewDto.exReserveCode}">
						
						<!-- 이메일 -->
						이메일: ${exReviewDto.email}&nbsp;&nbsp;
					
						<!-- 후기 작성 시간 -->
						<fmt:formatDate value="${exReviewDto.revDate}" pattern = "yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;
						
						<!-- session의 이메일과 등록한 이메일 같으면 수정, 삭제 화면 보이기 (본인만 수정 삭제 가능)-->
						<c:if test="${email eq exReviewDto.email}"> 
							<a href="javascript:updateCheck('${root}','${exReviewDto.exReserveCode}','${exReviewDto.memberCode}')"	>수정</a>
							<a href="javascript:deleteCheck('${root}','${exReviewDto.exReserveCode}','${exReviewDto.memberCode}','${currentPage}')">삭제</a> 		
						</c:if>
					</div>
					<div class="content" >
						${exReviewDto.revContent}
					</div>
					<!-- 별점 출력 -->
					<div>
						 ${exReviewDto.revRate} 
						<span class="star-out">
						   <span class="output">
						       <input type="hidden" name="star-output" value="${exReviewDto.revRate}" id="${exReviewDto.revRate}">
						       <label for="${exReviewDto.revRate}"></label>
						       <c:if test="${exReviewDto.revRate==1}">
						       		<img src="${root}/resources/css/review/star1.PNG" style="width: 50px;">
						       </c:if>
						       <c:if test="${exReviewDto.revRate==2}">
						       		<img src="${root}/resources/css/review/star2.PNG" style="width: 50px;">
						       </c:if>
						       <c:if test="${exReviewDto.revRate==3}">
						       		<img src="${root}/resources/css/review/star3.PNG" style="width: 50px;">
						       </c:if>
						       <c:if test="${exReviewDto.revRate==4}">
						       		<img src="${root}/resources/css/review/star4.PNG" style="width: 50px;">
						       </c:if>
						       <c:if test="${exReviewDto.revRate==5}">
						       		<img src="${root}/resources/css/review/star5.PNG" style="width: 50px;">
						       </c:if>
						   </span>
						   
						
						</span>
					</div>
					
				</div>
			</c:forEach>
		</c:if>
	</div>
	
<!-- 페이징 -->	
	<%-- 페이지 번호
			1. 총 페이지수 : 전체 레코드 수(count)와 페이지 당 게시물 수(boardSize)
			2. 페이지 블럭 : 시작번호, 끝번호 나와야 함  [1][2][3][4][5] [다음]
			3. 
	--%> 
	<div style="margin-left: 150px; margin-bottom: 50px;">
		<c:if test="${count > 0}">
		
			<%-- 1. 총 페이지 수  count/boardSize --%>
			<fmt:parseNumber var="pageCount" integerOnly="true" value="${count/boardSize + (count%boardSize==0 ? 0 : 1)}"/>	<%--딱 떨어지지 않는 페이지 일때  --%>
			
			<%-- 2. 페이지 블럭이  value값의 갯수만큼 나옴. 1의 경우 [이전] 1 [다음] --%>
			<c:set var="pageBlock" value="${2}"/>
			
			<%-- 2. 페이지 블럭/ 시작, 끝번호 
				자바로 짰을 때 :
				int startPage = (int)((currentPage-1)/pageBlock)*pageBlock+1;
				int endPage = startPage+pageBlock-1;
			--%>
			
			<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock}" integerOnly="true"/> 
			
			<c:set var="startPage" value="${rs*pageBlock+1}"/>
			<c:set var="endPage" value="${startPage+pageBlock-1}"/>
			
			<%-- 3. 총 레코드 수: 270/10 = 27페이지 까지 나와야 함. 위의 로직대로면 21~30까지의 페이지 블럭이 나옴. 27페이지까지만 나오게  --%>
			
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}"/>
			</c:if>
			
			<%-- 이전  // startPage=3, pageBlock=2 이면 [이전][3] 출력, 이전을 누르면  1페이지로 이동--%>
			<c:if test="${startPage > pageBlock}">
				<a href="${root}/experience/exReview.do?pageNumber=${startPage-pageBlock}">[이전]</a>
			</c:if>
			
			<%-- 페이지 블럭 [1][2][3] --%>
			<c:forEach var="i" begin = "${startPage}" end = "${endPage}">
				<a href="${root}/experience/exReview.do?pageNumber=${i}">[${i}]</a>
			</c:forEach>
			
			<%-- 다음  // endPage=2, pageCount=3(총 페이지 갯수)이면 [1][2][다음] 출력, startPage=1, pageBlock=2일때 다음을 누르면 3페이지로 이동--%>
			<c:if test="${endPage < pageCount}">
				<a href="${root}/experience/exReview.do?pageNumber=${startPage+pageBlock}">[다음]</a>
			</c:if>
			
		</c:if>
	
	</div>
	
<!-- 호스트 정보 -->	
		<ul style="margin-left: 100px;">
	
	        <li>
	        	<label>호스트정보</label>
	        	<input type="text" name="memberName" id="memberName" value="${memberDto.memberName}">
	        	<label>회원가입 날짜</label>
	        	<fmt:formatDate var="regDate" pattern="yyyy년 MM월 dd일" value="${memberDto.regDate}"/>
	    		
	        	<input type="text" name="regDate" id="regDate" value="${regDate}">
	        	<label>소개</label>
	        	<input type="text" name="memberInfo" id="memberInfo" value="${memberDto.memberInfo}">
	        	
	        	<label>프로필사진</label>
	        	<img src="<spring:url value='/profileImg/${memberDto.memberImgName}' />"/>
	        </li>
	       
          </ul>

<!-- 체험 지도 -->  
		<div style="margin-left: 100px;">  
      		<h3>체험장소</h3>
      			
	    		<p>위치 : ${experienceDto.exAddress}</p>
	    		
	    		
	      
	        
       			<div id="exMap" style="width: 500px;height: 400px;"></div>
					
					<script>
						var container = document.getElementById('exMap');
						var option = {
							center: new kakao.maps.LatLng(33.450701, 126.570667),
							level: 3
						};
						//var addr = "${experienceDto.exAddress}";
						// 지도생성
						var map = new kakao.maps.Map(container, option);
						
						// 주소로 좌표 검색
						var geocoder = new kakao.maps.services.Geocoder();

						geocoder.addressSearch('${experienceDto.exAddress}',function(result, status){
							
							// 정상적으로 검색 완료
							if(status === kakao.maps.services.Status.OK){
								var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
								
								// 결과값으로 받은 위치 마커 표시
								var marker = new kakao.maps.Marker({
									map:map,
									position: coords
									
								});
										
								map.setCenter(coords);
								
							}
						});
						
						
						
						
					</script>
       		
        </div>
	 </div>  
</body>
</html>
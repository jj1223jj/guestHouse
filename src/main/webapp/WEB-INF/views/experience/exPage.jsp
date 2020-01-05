<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%-- <script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script> --%>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->

<script type="text/javascript" src="${root}/resources/javascript/jquery/Blitzer/jquery-ui.js"></script>
<link rel="stylesheet" href="${root}/resources/javascript/jquery/Blitzer/jquery-ui.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=50ff539a80f0de17cdf30d7ef1f997fc&libraries=services"></script>
<script type="text/javascript" src="${root}/resources/javascript/review/review.js"></script>

<link rel="stylesheet" href="${root}/resources/css/review/review.css"/>
<script src="${root}/resources/javascript/review/review.js" type="text/javascript"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
$(document).ready(function(){
	
	var divs = document.querySelectorAll('.img div');

	for(var i=0; i<divs.length;++i){
		var div = divs[i];
		var divAspect = div.offsetHeight/div.offsetWidth;
		div.style.overflow='hidden';
		
		var img = div.querySelector('#exImg');
		var imgAspect = div.height / div.width;
		
		
		if(imgAspect <= divAspect){
			// 이미지가 div보다 작은경우 세로를 div에 맞추고 잘라낸다
			var imgWidthActual = div.offsetHeight/ imgAspect;
			var imgWidthToBe = div.offsetHeight / divAspect;
			var marginLeft = -Math.round((imgWidthActual - imgWidthToBe)/2);
			img.style.cssText = 'width: auto; height: 100%; margin-left:'+marginLeft+'rem;'
			
		}else{
			//이미지가 div보다 긴 경우 가로를 div에 맞추고 세로를 잘라냄
			img.style.cssText='width:100% height:auto; margin-left:0;';
		}
	}
	
});
</script>

<script>
var dddd=[];
$(function(){
	load('${root}' ,'${sessionScope.email}','${experienceDto.exCode}');
	$("#exPeople").change(function(){
		var url= "${root}/experience/exDisableDates.do?exCode=${experienceDto.exCode}&people="+$(this).val();
		$.ajax({
			url:url,
			method:"get",
			success:function(d){
				
				var dd= JSON.parse(d);
				var disabledDays =[];
				
				for(var j =0;j<dd.length;j++){
					var ddd = new Date(dd[j]);
					var m = ddd.getMonth(), d = ddd.getDate(), y = ddd.getFullYear();
					disabledDays.push(y + '-' +(m+1) + '-' + d);
				}
				dddd=disabledDays;
				// 특정일 선택막기
				function disableAllTheseDays(date) {
				    var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
				    for (i = 0; i < disabledDays.length; i++) {
				        if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
				            return [false];
				        }
				    }
				    return [true];
				}
				$("#exDateS").datepicker( "option", "beforeShowDay", disableAllTheseDays );
				$("#date").datepicker( "option", "beforeShowDay", disableAllTheseDays );
				
				
				
			}
		})
	})

		
});
function onExReserve(form){
	var date =new Date(form.exForm.exDateS.value);
	var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
	if($.inArray(y + '-' +(m+1) + '-' + d,dddd) != -1) {
		alert("해당 날짜는 예약이 다 찼습니다.");
        return false;
    }
}	 

</script>



<style type="text/css">
#exImg{
	object-fit:cover;
	width: 100%;
	height: 100%;
}

#exinfo> ul > li{
list-style: none;
float: left;
margin-right: 3rem; 
margin-bottom: 3rem;
/* border: 0.1rem solid purple; */
width: 10rem;
height: auto;

}
body{
/* position:absolute; */
margin-top: 3rem;
text-align: -webit-center;

}

#exinfo> ul > li >p{
text-align: center;
height: 3rem;
font-size: 1.2rem;
}

ul > li >label{
font-size: 1.5rem;
text-align: center;
margin: 2rem;
font-weight: bold;
}

li{
list-style: none;
}
</style>


</head>
<body>

	<div align="center" style="margin-bottom: 2rem; margin-top: 2rem;">
		<c:if test="${memberLevel == 'Admin'}">
			<div>호스트가 등록한 체험을 읽고 승인과 거절을 선택해주세요.</div>
		</c:if>
	</div>
	
	<!-- 전체 -->
	<div align="center" style="width: 100%; height: 210rem;">
	
		<!-- 이미지 -->	
		<div style="width:100%; height: 35rem; background-color: black; padding-top: 3.5rem;">
			<div align="center" style="width: 78rem; /* border: 0.1rem dotted pink; */ margin-left: 1rem;">
	         	<div class="img" style="overflow: hidden;">
		         		<c:forEach var="exFileDto" items="${exFileList}">
		         			
		         			<!-- 사진은 최소 5개  -->
			         		<c:if test="${exFileDto.mainImgName!=null}">
	         		
			         			
			         			<div style="float:left; width: 20rem; height: 27.42rem; overflow: hidden;  margin-right: 0.5rem;">
			         				<img id="exImg" style="width: 100%; height: 100%;/* position:static !important; top:0rem !important; right:0rem !important; left:0rem !important; bottom:0rem !important; object-fit:cover; */" alt="img loading" src="<spring:url value='/exImage/${exFileDto.mainImgName}' />"/>
			         			</div>
			         	
			         		</c:if>
			         	</c:forEach>
			         		
			         	<c:forEach var="exFileDto2"  varStatus="list" items="${exFileList}" begin="1">	
				         	<c:if test="${exFileDto2.mainImgName eq null}">
				         			
				         		<c:if test="${list.index < 3 and list.index > 0}">
					         		<div style="float:left; width: 20rem; height: 27.42rem; overflow: hidden; /* border: 0.01rem solid blue; */ margin-right: 0.5rem;">
					         			<img id="exImg" alt="img loading" src="<spring:url value='/exImage/${exFileDto2.fileName}' />"/>
					         		</div>
				         		</c:if>
				         		
				         		<!--  exFileList.size() > 3-->
				         		<c:if test="${list.index >=3}">
				         			<div style="float:left; width: 15rem; height: 13.5rem; margin-bottom:0.3rem; overflow: hidden; /* border: 0.01rem solid blue; */ margin-right: 0.5rem;">
					         			<img id="exImg" alt="img loading" src="<spring:url value='/exImage/${exFileDto2.fileName}' />"/>
					         		</div>
		         				</c:if>
				         	</c:if>
		         		</c:forEach>
	         		
	         	</div>
	         </div>
		</div>
	     
		<!-- 체험정보 -->	
		<div class="wrap" style="margin:0px auto; width: 80rem; /* border: 1px dotted black;  */">
			<div id="exinfo" style="margin-left: 2rem; margin-top: 3.125rem; margin-bottom:3rem; width: 76rem; height: auto; border: 0.01rem solid #ffc0cb5c; float: left;">
			 <ul style="width: 20rem; height:20rem; /* border: 0.1rem dotted orange; */ float: left; margin-right: 3rem;" > 
		         <li style="width: 16rem; height: auto;">
		            <label style="display: block;">체험이름</label>
		    		<img alt="이미지" src="https://image.flaticon.com/icons/svg/252/252041.svg" style="width: 3rem; height: 3rem; margin-bottom: 1rem;"> <input type="hidden" name="exName" id="exName" value="${experienceDto.exName}"/>
		            <p class="text-secondary" style="width: 16rem; height: 30rem; text-align: left;">${experienceDto.exName}</p>
		    	 </li>
		   	 </ul>
		     <ul style="width: 76rem; /* height: 30rem; */ border: 0.1rem dotted khaki; display: table-header-group;">	
		    	<li style="width: 10rem;">	
		    		<label style="display: block;">진행시간</label>
		    		<img style="width: 3rem; height: 3rem; margin-bottom: 1rem;" src="https://image.flaticon.com/icons/svg/251/251974.svg"/>
		    		<p class="text-secondary" style="height: 3rem;">${experienceDto.exTime}시간</p>
		    		<input type="hidden" name="exTime" id="exTime" value="${experienceDto.exTime}"/>
		    	</li>
		    	<li>	
		    		<label style="display: block;">인원</label>
		    		<img alt="이미지" src="https://image.flaticon.com/icons/svg/145/145847.svg" style="width: 3rem; height: 3rem; margin-bottom: 1rem;"> 
		    		<p class="text-secondary">${experienceDto.exPeople}명</p>
		    	</li>
		    	
		    	<li>	
		    		<label style="display: block;">가격</label>
		    		<img alt="이미지" src="https://image.flaticon.com/icons/svg/217/217853.svg" style="width: 3rem; height: 3rem; margin-bottom: 1rem;">
		    		<p class="text-secondary"> ${experienceDto.exPrice}원</p>
		    		<input type="hidden" name="exPrice" id="exPrice" value="${experienceDto.exPrice}"/>
		    	</li>
		    	
		    	<li style="margin-right: 3rem;">	
		    		<label style="display: block;">체험날짜</label>
		    		<img alt="이미지" src="https://image.flaticon.com/icons/svg/252/252020.svg" style="width: 3rem; height: 3rem; margin-bottom: 1rem;"/>
		    		<!-- view를 위한 날짜 포맷-->
		    		<fmt:formatDate var="startDate" pattern="yyyy년 MM월 dd일" value="${experienceDto.exStartDate}"/>
		    		<fmt:formatDate var="endDate" pattern="yyyy년 MM월 dd일" value="${experienceDto.exEndDate}"/>
		    		
		    		<input type="hidden" name="exStartDate" id="exStartDate" value="${startDate}"/>
		    		<input type="hidden" name="exEndDate" id="exEndDate" value="${endDate}"/>
		    		
		    		
		    		<p class="text-secondary">${startDate}</p>
		    		<p>-</p>
		    		<p class="text-secondary"> ${endDate}</p>
		    		
		    		<!-- 달력 표시를 위한 날짜 포맷 -->
		    		<fmt:formatDate var="startDateC" pattern="yyyy-MM-dd" value="${experienceDto.exStartDate}"/>
		    		<fmt:formatDate var="endDateC" pattern="yyyy-MM-dd" value="${experienceDto.exEndDate}"/>
		    		
		    	</li>
		    	
		    	<%-- <li style=" width: 31.5rem;">	
		    		<label>위치</label>
		    		<p class="text-secondary">${experienceDto.exAddress}</p>
		    		<input type="hidden" name="exAddress" id="exAddress" value="${experienceDto.exAddress}"/>
		    		
		        </li> --%>
		    	
		        
		         <li style="width: 49rem; height: auto; ">
		         	<label>프로그램 설명</label>
		         	<div class="text-secondary" style="width: 48rem; height: auto; word-break:break-all;text-align: left;">${experienceDto.exExplain}</div>
		    		<input type="hidden" name="exExplain" id="exExplain" value="${experienceDto.exExplain}"/>
		    		
		         </li>
		         
				
			</ul>
			<!--  -->
			
			<!-- 달력 -->	
			<div style="width: 100%; height: 30rem; border-top: 0.2rem solid #ebebeb;border-bottom: 0.2rem solid #ebebeb; margin-top: 5rem;">
				<div style="width: 25rem; height: 25rem; /* border: 0.1rem dotted black;  */float: left; margin-left: 5rem;margin-top: 2rem;">	         
			      <div style="width: 20rem; height: auto;">
			       	<label style="margin-top: 2rem; font-weight: bold; font-size: 1.5rem;">예약가능날짜</label>
			        <div type="text" id="date" name="date" style="margin-top: 3rem;"></div>
			      </div>
			        
			      <script type="text/javascript">
			        
			        var disabledDays =[];
			        <c:forEach var="item" items="${exDisableDates}">
				        var ddd = new Date('${item}'.split(" ")[0]);
						var m = ddd.getMonth(), d = ddd.getDate(), y = ddd.getFullYear();
						disabledDays.push(y + '-' +(m+1) + '-' + d);
			        </c:forEach>
		        	
		        	function disableAllTheseDays(date) {
					    var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
					    for (i = 0; i < disabledDays.length; i++) {
					        if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
					            return [false];
					        }
					    }
					    return [true];
					}
					
		        	

							$("#date").datepicker({
								dateFormat:"yy-mm-dd",
								 monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
								 dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
								 showMonthAfterYear: true,
								 yearSuffix: "년",
								 minDate: 'today',
								 maxDate:new Date('${endDateC}'),					
								 
								 onSelect:function(dateText, inst, root){
									 
									 var exDate = $(this).val();
		
									 alert(exDate + "은 예약이 가능합니다.");
									 $("#exDateS").val(exDate);
									 //var exCode = ${experienceDto.exCode};
									 //var url="${root}/experience/exReserveCal.do?exDate="+exDate+"&exCode="+exCode;
									 //alert(url);
									//location.href=url;
								 }
								
							});
							$("#date").datepicker( "option", "beforeShowDay", disableAllTheseDays );
					</script>
				</div>
				
				<!-- 예약하기 -->
				<div style="width: 40rem; height: 26rem; /* border: 0.1rem dotted black; */ margin-left: 35rem; margin-top: 2rem; margin-bottom: 10rem;">
					<form action="${root}/experience/exReserve.do"  method="get" name="exForm" onsubmit="return onExReserve(exForm)">
						<div style="width:30rem; height:22rem;  border: 0.1rem solid #e4e4e4; margin-top: 3.5rem;">
						
							<p style="width: 20rem; margin-bottom: 4rem; margin-top: 1rem; font-weight: bold; font-size: 1.5rem;">예약하기</p>
							
							<div  style="width:28rem;">
								
								<div>
									<p style="width: 5rem; float: left;">날짜선택</p>
									<div>
										<input readonly="readonly" type="text" id="exDateS" name="exDateS" size="12" class="form-control" style="background-color:white; width:13rem; float: left; margin-left: 3rem; " value="${checkIn}"/>
										<i class="calenderDate far fa-calendar-alt fa-3x"></i>
									</div>
									
									<script type="text/javascript">
									
								        var disabledDays =[];
								        <c:forEach var="item" items="${exDisableDates}">
									        var ddd = new Date('${item}'.split(" ")[0]);
											var m = ddd.getMonth(), d = ddd.getDate(), y = ddd.getFullYear();
											disabledDays.push(y + '-' +(m+1) + '-' + d);
								        </c:forEach>
							        	
							        	function disableAllTheseDays(date) {
										    var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
										    for (i = 0; i < disabledDays.length; i++) {
										        if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
										            return [false];
										        }
										    }
										    return [true];
										}
									        
										$("#exDateS").datepicker({
											dateFormat:"yy-mm-dd",
											 monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
											 dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
											 /* showOn:"button", */
											 /* buttonText:"날짜 선택", */
											 showMonthAfterYear: true,
											 yearSuffix: "년",
											 minDate: 'today',
											 maxDate:new Date('${endDateC}'),
											 onClose:function(selectedDate){
												 //$("#exEndDateS").datepicker("option","minDate",selectedDate);
												
												
											 }
										});
										$("#exDateS").datepicker( "option", "beforeShowDay", disableAllTheseDays );
										$(".calenderDate").click(function(){
											$("#exDateS").datepicker("show");
										});
									</script>
								</div>
								<div style="width: 28rem; /* border: 0.1rem dotted red; */ margin-top: 3rem;">	
									<p style="width: 4rem; float: left;">인원</p>
									<input type="number" name="exPeople" id="exPeople" value="${people}" min="1" max="${experienceDto.exPeople}" class="form-control" style="width:5rem"/>
									<input type="hidden" name="exCode" id="exCode" value="${experienceDto.exCode}"/>
									<input type="hidden" name="reviewList" id="reviewList" value="${reviewList.size()}"/>
									
									<input type="hidden" name="experienceDto" id="experienceDto" value="${experienceDto}"> 
								</div>
							</div>
							<div style="width: 15rem; margin-top: 3rem; margin-bottom: 1rem;">
								<!-- <input type="submit" id="exReserveBtn" value="예약하기"/> -->
								<c:if test="${sessionScope.email!= null}">
									<button type="submit" id="exReserveBtn" class="btn btn-outline-danger">예약하기</button>
								</c:if>
								
								<c:if test="${sessionScope.email== null}">
									<p>로그인 후 예약이 가능합니다.</p>
								</c:if>
								
							</div>
						</div>
					</form>
				</div>
			</div>
			
			<!-- 후기 전체 -->
			<div style="width: 70rem; height: auto; /* border: 0.1rem dotted orange; */ margin: 4rem;">
				<div style="width: 10rem; height: 10rem; /* border: 0.1rem solid skyblue; */ float: left; line-height: 7rem;">
					<div style="/* margin-top: 5rem; */ height: 4rem; font-weight: bold; font-size: 1.5rem; line-height: 2rem;">게스트 후기</div>
				
					<c:if test="${count !=0}">
						<div>
							후기 ${count}개
						</div>
					</c:if>
				
				</div>
				
				
				<!-- 후기 작성  -->
				<c:if test="${memberLevel != null}">
				  <form action="${root}/experience/exReviewOk.do"  method="get" name="exForm" onsubmit="return check('${revContent}','${revRate}')">  
					    <div>
						
							<input type="hidden" name="exCode" id="exCode" value="${experienceDto.exCode}"/>
							
							<%-- <input type="text" name="exReserveCode" value="${exReserveDto.exReserveCode}"/>
							<input type="text" name="exReserveCode" id ="exReserveCodes" value="${exReviewDto.exReserveCode}"> --%>
							
							<!-- 후기 갯수가 0개 이거나 현재 페이지가 1일 경우 -->
						
							<div class="form" style="/* border: 0.1rem solid black; */ width: 57rem; margin-left: 12rem; height: 20rem; border-bottom: 0.1rem solid #ebebeb;">
								<div class="title" style="float: left; width: 18rem; height: 3rem; /* border: 0.1rem solid gray; */ margin-top: 2rem; margin-left: 3rem;">
									<!-- <span>e-mail</span> -->
									<input type="text" name="email" size="20" value="${email}" disabled="disabled" class="form-control" width="17rem;"/>
							
								</div>
								<div style="width: 15rem;height:5rem; /* border:0.1rem solid black; */">
									<span class="star-input" style="height: 5rem; margin-top: 0.3rem;">
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
								
			
							
								<div class="content" style="width: 50rem; height: auto; /* border: 0.1rem dotted purple; */ text-align: left; margin-top: 1rem;"><!--Review  -->
									<!-- <textarea rows="5" cols="53" name="revContent" id="revContent" class="revContent"></textarea>
								 -->
									<div class="form-group">
										<!-- <label for="comment">Review</label> -->
										<textarea rows="5" name="revContent" id="revContent" class="revContent" style=" background: #fff;
										    border: none;
										 	width: 48rem;
										    -webkit-box-shadow: 0rem 0.063rem 0.25rem 0.125rem rgba(0,0,0,0.16);
										    -moz-box-shadow: 0rem 0.063rem 0.25rem 0.125rem rgba(0,0,0,0.16);
										    box-shadow: 0rem 0.063rem 0.25rem 0.125rem rgba(0,0,0,0.16);
										    border-radius: 0.938rem;
										    display: inline-block;"></textarea>
									</div>
								</div>
																
								<!-- 별점 스크립트를 위해서 여기에 또 스트립트 선언 해줘야 함  -->
								<script type="text/javascript" src="${root}/resources/javascript/review/review.js"></script>
								
								<div class="bottom" style="text-align: left; width: 10rem;">
										
									<%-- <button id="exReviewOk" onclick="exReviewChk('${root}')">확인</button> --%>
									<input type="hidden" name="exCode" value="${experienceDto.exCode}"/>
									
									<button type="submit" class="btn btn-light">등록</button>
									<button type="reset" class="btn link">취소</button>
									
									<!-- <input type="submit" value="등록"/>
									<input type="button" value="취소"/> -->
									
									
								</div>
							</div>
						</div>
					</form>
				</c:if>
				
				<!-- 리스트 뿌리기 -->
				<div style="width: 55rem; /* border: 0.1rem dotted green;  */margin-left: 10rem; margin-top: 3rem;">
					
					<div id="contentData" style="width: 55rem; height: auto;">
						<!-- <p id="exReserveCode"></p>
						<p id="emailJ"></p>
						<p id="revDateJ"></p>
						<p id="revContentJ"></p>
						<p id="revRateJ"></p> -->
					</div>	
					<div id="moreReviewB" style="margin: 3rem;"> 
					
						<button id="reviewBtn" type="button" class="btn btn-outline-info" onclick="moreView('${root}','${emailSession}','${experienceDto.exCode}')">후기 더보기</button> 
					</div>
				 </div>
			</div>
			<!-- 호스트 정보 -->	
			<div style="width: 100%; height: auto; border-top: 0.2rem solid #ebebeb; border-bottom: 0.2rem solid #ebebeb; padding-bottom: 3rem;" onclick="location.href='${root}/guestdelluna/myInfo.do?memberCode=${memberDto.memberCode}'">
				<div style="width: 70rem; height:auto; /* border: 0.1rem solid black; */ margin-top: 3rem; padding-top: 3rem; margin-bottom: 5rem;">
					<ul style="width: 15rem; height:auto; float: left; /* border: 0.1rem solid black; */">
						
				        <li style="list-style: none; float: left;">
				        	<label style="margin-top: 0rem;">호스트 정보</label>
				        	<!--/profileImg/${memberDto.memberImgName}  -->
				        	<img style="width: 10rem; height: 10rem;" src="<spring:url value='/profileImg/${memberDto.memberImgName}' />" class="rounded-circle" alt="이미지 없음"/>
				        	<br/><br/>
				        </li>
				     </ul>
				     
				     <ul style="width: 45rem; height: auto; margin-left: 25rem;/*  border: 0.1rem dotted #06ff00; */">  
					     <li style="list-style: none; margin-bottom: 3rem;" >	
					        <label style="width: 8rem; float: left;/*  border: 0.1rem solid #ff00f3; */ margin: 0 auto;">호스트</label>
					        <p class="text-secondary" style="width:15rem;/*  border: 0.1rem solid green; */text-align: left;">${memberDto.memberName}</p>
					        <input type="hidden" name="memberName" id="memberName" value="${memberDto.memberName}">
					     </li>
					     <li style="width: 45rem; margin-bottom: 3rem;">	
					        <label style="width: 10rem; float: left; margin: 0 auto;">회원가입 날짜</label>
					        <fmt:formatDate var="regDate" pattern="yyyy년 MM월 dd일" value="${memberDto.regDate}"/>
					    	<p class="text-secondary" style="width: 18rem; text-align: left;">${regDate}</p>
					        <input type="hidden" name="regDate" id="regDate" value="${regDate}">
					     </li>
					     <li style="margin-bottom: 3rem;">	
					        <label style="width: 8rem; float: left; margin: 0 auto;">소개</label>
					        <p class="text-secondary" style="width: 25rem; margin-left: 10rem; text-align: left; height: auto; word-break: break-all; ">${memberDto.memberInfo}</p>
					        <input type="hidden" name="memberInfo" id="memberInfo" value="${memberDto.memberInfo}">
					    </li>
		         	 </ul>
	          	</div>
	          </div>	
         	 <!-- 체험 지도 -->  
			 <div style="/* border: 0.1rem solid black; */ width: 70rem; margin-top: 3rem; margin-bottom: 5rem;">  
	      		<div style="width:15rem; height:30rem; line-height:30rem; float: left; font-size: 1.5rem; font-weight: bold;">체험장소</div>
	      			
		        <div id="exMap" style="width: 40rem;height: 30rem; margin-left: 15rem;"></div>
						
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
				
				<p style="width: 40rem; height: auto; margin-left: 15rem; word-break: break-all; text-align: left; margin-top: 1.5rem; font-size: 1.3rem;"> ${experienceDto.exAddress}</p>
	         </div>
	         <!-- 지도 -->
          
		</div>
	</div>   
</div>		

	<br/><br/>
 <!-- 리뷰수 count -->
			<%-- 전체 리뷰 수: ${count}, 이 페이지의 리뷰 수 : ${reviewList.size()}, 현재 페이지: ${currentPage} --%>

<!-- 모달 -->

	<div class="modal fade" id="updateModal">
		<div class="modal-dialog">
			<div class="modal-content">		
							
			 <!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">후기 수정</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					
				</div>
							
	<!-- Modal body -->
		<div class="form-group">
				<form class="form" action="${root}/experience/exReviewUpdateOk.do?memberCode=${memberCode}&exReserveCode=${exReserveCode}&pageNumber=${currentPage}" 
			method="get" >
			<!-- onsubmit="return checkUp()" -->
			
				<div class="title">
				<input type="hidden" name = "memberCode" value="${memberCode}"/>
				<input type="hidden" name="exReserveCode" id="exReserveCode" value="${exReserveCode}"/>
					<span><!-- 이메일 --></span>
					<input type="text" name="email" size="20" value="${email}" disabled="disabled" class="form-control" style="width: 20rem; margin-left:5.4rem; margin-top: 3rem;"/>
			
				</div>
			
				<div class="content" style="margin-top: 2rem;"> 
				
			<textarea name="revContent" id="modalRevContent" class="form-control" style=" background: #fff;
										    border: none;
										 	width: 20rem;
										 	margin-left:5.4rem;
										    -webkit-box-shadow: 0rem 0.063rem 0.25rem 0.125rem rgba(0,0,0,0.16);
										    -moz-box-shadow: 0rem 0.063rem 0.25rem 0.125rem rgba(0,0,0,0.16);
										    box-shadow: 0rem 0.063rem 0.25rem 0.125rem rgba(0,0,0,0.16);
										    border-radius: 0.938rem;
										    display: inline-block;"></textarea> 
								
					<%-- <textarea rows="3" cols="53" name="revContent" id="modalRevContent" class="form-control">${revContent}</textarea>  --%>
				</div>
				<div>
				<link rel="stylesheet" href="${root}/resources/css/review/review.css"/>
					<span class="mstar-input">
					   <span class="minput" style="margin-left: 9rem; margin-bottom: 5rem;">
					       <input type="radio" name="mstar-input" value="1" id="mp1">
					       <label for="mp1">1</label>
					       <input type="radio" name="mstar-input" value="2" id="mp2">
					       <label for="mp2">2</label>
					       <input type="radio" name="mstar-input" value="3" id="mp3">
					       <label for="mp3">3</label>
					       <input type="radio" name="mstar-input" value="4" id="mp4">
					       <label for="mp4">4</label>
					       <input type="radio" name="mstar-input" value="5" id="mp5">
					       <label for="mp5">5</label>
					     </span>
		
					     <output for="mstar-input" name="mstarValue"><input type="hidden" name="revRate" id="revRate" class="revRate"/></output>                  
					</span>
				</div>
				
				<!-- Modal footer -->
					<div class="modal-footer">
						<div style="width: 10rem; margin-right: 10rem;" align="center">
							<button id="modalSubmit" type="button" class="btn btn-info" onclick='reviewModalUpdate(form)'>수정</button>
							<button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
						</div>
					</div>
				
				<!-- 
				<div class="modal-footer" style="text-align: right;">
					<input type="submit" value="확인" />
					<input type="reset" value="취소" onclick="self.close()"/>
				</div> -->
			</form>
			</div>
			
			
			</div>
		</div>			
	</div>
 	
 	<div align="center" style="margin: 6rem;">
		<c:if test="${memberLevel == 'Admin'}">
			<button id="btn" type="button" class="btn btn-warning" name="stateOk" onclick="location.href='${root}/admin/exState.do?exCode='+'${experienceDto.exCode}'">승인</button>
			<button id="btn" type="button" class="btn btn-light" name="stateNo" onclick="location.href='${root}/admin/exStateNo.do?exCode='+'${experienceDto.exCode}'">거절</button>
		</c:if>
	</div>

 <!-- 후기 작성 -->   
 <%-- <c:if test="${memberLevel != null}">
  <form action="${root}/experience/exReviewOk.do"  method="get" name="exForm" onsubmit="return check('${revContent}','${revRate}')">  
	    <div align="" style="margin: 100px;">
		
		<input type="hidden" name="exCode" id="exCode" value="${experienceDto.exCode}"/>
		<input type="text" name="exReserveCode" value="${exReserveDto.exReserveCode}"/>
		후기 갯수가 0개 이거나 현재 페이지가 1일 경우
		
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
				
				</div> --%>
		
				<%-- 
				전부 0값 들어감
				<input type="hidden" name="exReserveCode" value="${exReviewDto.exReserveCode}">
				<input type="hidden" name="memberCode" value="${exReviewDto.memberCode}">
				
				<input type="hidden" name="revContent" value="${revContent}">
				 --%>
			
				<!-- 별점 스크립트를 위해서 여기에 또 스트립트 선언 해줘야 함  -->
				<%-- <script type="text/javascript" src="${root}/resources/javascript/review/review.js"></script>
				
				<div class="bottom" style="text-align: left; margin-left: 300px; margin-top: 50px;">
						
					<button id="exReviewOk" onclick="exReviewChk('${root}')">확인</button>
					<input type="hidden" name="exCode" value="${experienceDto.exCode}"/>
					<input type="submit" value="확인"/>
					<input type="button" value="취소"/>
					
					
				</div>
			</div>
	</div>
</form>
</c:if> --%>
	
		
<!-- 후기 리스트 -->			
		<%-- 미리 쓴 후기가 존재하는 경우  --%>
		
<%-- 	<div id="exReview">
		<c:if test ="${reviewList.size() > 0}">
			<c:forEach var="exReviewDto" items="${reviewList}">
				<div class="form" style="margin: 50px 100px; border-width:1px;">
					
					<div class="title">
						
						<input type="hidden" name="exCode" id="exCode" value="${experienceDto.exCode}"/>						
						<!-- 리뷰 번호  -->
						예약번호: ${exReviewDto.exReserveCode} &nbsp;&nbsp;
						
						<input type="hidden" name="exReserveCode" id ="exReserveCodes" value="${exReviewDto.exReserveCode}">
						
						<!-- 이메일 -->
						이메일: ${exReviewDto.email}&nbsp;&nbsp;
					
						<!-- 후기 작성 시간 -->
						<fmt:formatDate value="${exReviewDto.revDate}" pattern = "yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;
						
						<!-- session의 이메일과 등록한 이메일 같으면 수정, 삭제 화면 보이기 (본인만 수정 삭제 가능)-->
						<c:if test="${email eq exReviewDto.email}"> 
							<a href="javascript:updateCheck('${root}','${exReviewDto.exReserveCode}','${exReviewDto.memberCode}','${exReviewDto.revContent}')"	>수정</a>
							<a href="javascript:deleteCheck('${root}','${exReviewDto.exReserveCode}','${exReviewDto.memberCode}','${currentPage}','${experienceDto.exCode}')">삭제</a> 		
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
	 --%>
	
<!-- 페이징 -->	
	<%-- 페이지 번호
			1. 총 페이지수 : 전체 레코드 수(count)와 페이지 당 게시물 수(boardSize)
			2. 페이지 블럭 : 시작번호, 끝번호 나와야 함  [1][2][3][4][5] [다음]
			3. 
	--%> 
	<%-- <div style="margin-left: 150px; margin-bottom: 50px;">
		<c:if test="${count > 0}">
		
			1. 총 페이지 수  count/boardSize
			<fmt:parseNumber var="pageCount" integerOnly="true" value="${count/boardSize + (count%boardSize==0 ? 0 : 1)}"/>	딱 떨어지지 않는 페이지 일때 
			
			2. 페이지 블럭이  value값의 갯수만큼 나옴. 1의 경우 [이전] 1 [다음]
			<c:set var="pageBlock" value="${2}"/>
			
			2. 페이지 블럭/ 시작, 끝번호 
				자바로 짰을 때 :
				int startPage = (int)((currentPage-1)/pageBlock)*pageBlock+1;
				int endPage = startPage+pageBlock-1;
			
			
			<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock}" integerOnly="true"/> 
			
			<c:set var="startPage" value="${rs*pageBlock+1}"/>
			<c:set var="endPage" value="${startPage+pageBlock-1}"/>
			
			3. 총 레코드 수: 270/10 = 27페이지 까지 나와야 함. 위의 로직대로면 21~30까지의 페이지 블럭이 나옴. 27페이지까지만 나오게 
			
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}"/>
			</c:if>
			
			이전  // startPage=3, pageBlock=2 이면 [이전][3] 출력, 이전을 누르면  1페이지로 이동
			<c:if test="${startPage > pageBlock}">
				<a href="${root}/experience/exReview.do?pageNumber=${startPage-pageBlock}">[이전]</a>
			</c:if>
			
			페이지 블럭 [1][2][3]
			<c:forEach var="i" begin = "${startPage}" end = "${endPage}">
				<a href="${root}/experience/exReview.do?pageNumber=${i}">[${i}]</a>
			</c:forEach>
			
			다음  // endPage=2, pageCount=3(총 페이지 갯수)이면 [1][2][다음] 출력, startPage=1, pageBlock=2일때 다음을 누르면 3페이지로 이동
			<c:if test="${endPage < pageCount}">
				<a href="${root}/experience/exReview.do?pageNumber=${startPage+pageBlock}">[다음]</a>
			</c:if>
			
		</c:if>
	
	</div>
	



	  
	 
	 
	 </div> 
	 
	</div> --%>
	
	<!-- footer 겹침현상 제거 -->
	<div style="clear:both;"></div>
</body>
</html>
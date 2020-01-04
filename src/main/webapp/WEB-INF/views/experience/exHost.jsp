<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>

<%-- <script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script> --%>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->


<script type="text/javascript" src="${root}/resources/javascript/jquery/Blitzer/jquery-ui.js"></script>
<link rel="stylesheet" href="${root}/resources/javascript/jquery/Blitzer/jquery-ui.css">
<script type="text/javascript" src="${root}/resources/javascript/exHost/register.js"></script>
<link rel="stylesheet" href="${root}/resources/css/host/register.css">



<script type="text/javascript">
	$(function(){
		$("#exStartDateS").datepicker({
			dateFormat:"yy-mm-dd",
			 monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
			 dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
			 /* showOn:"button",
			 buttonText:"시작", */
			 showMonthAfterYear: true,
			 yearSuffix: "년",
			 minDate: 'today',
			 onClose:function(selectedDate){
				 $("#exEndDateS").datepicker("option","minDate",selectedDate);
				
				
			 }
		});
		 
		$("#exEndDateS").datepicker({
			dateFormat:"yy-mm-dd",
			 monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
			 dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
			 /* showOn:"button",
			 buttonText:"종료", */
			 showMonthAfterYear: true,
			 yearSuffix: "년",
			 onClose:function(selectedDate){
				 $("#exStartDateS").datepicker("option","maxDate",selectedDate);
			 }
		});
		$(".calenderSt").click(function(){
			$("#exStartDateS").datepicker("show");
		});
		$(".calenderEn").click(function(){
			$("#exEndDateS").datepicker("show");
		});


	});
</script>

<style type="text/css">
li{
list-style: none;
}
#exTotal > li > label{
	/* border: 0.1rem solid blue; */
	width: 10rem;
}

</style>
</head>
<body>

	<div style="width:80rem; /* border: 0.1rem solid black; */ margin: 5rem auto;">
	   <form action="${root}/experience/exHostOk.do" method="post" enctype="multipart/form-data"
	    onsubmit="return registerEx()">
	    
	    <!-- '${exName}','${exAddress}','${mainImg}','${subImg}','${exPeople}','${exTime}','${exExplain}','${exStartDateS}','${exEndDateS}','${exBank}','${exAccount}','${exPrice}' -->
	   <div class="wrap" style="width: 70rem; margin: 0 auto; /* border: 0.1rem solid red; */">
	      
	      <ul style="width: 50rem; /* border: 0.1rem dotted black; */ margin: 0 auto;" id="exTotal">
	         <li>
	            <label>체험이름</label>
	    		<input type="text" name="exName" id="exName"  class="form-control" style="width: 30rem;"/>
	         </li>
	         
	         <!-- 장소 선택 -->
		         <li>
		            <label>장소선택</label>
		            <select name="exAddress" id="exAddress" style="padding: 0.313rem 0.625rem; border-radius:0.313rem; border: 0.1rem solid #ddd; background-color: white; width: 30rem;">
	        			<c:forEach var="hostDto" items="${hostChkList}">
	        				<c:if test="${hostDto.approvalStatus eq '승인완료'}" >
	        			<!-- 사용자에게는 게하 이름으로 보여주고 디비에는 주소값 저장 -->
		               		<option value="${hostDto.address}:${hostDto.houseCode}">${hostDto.houseName}</option>
		               		<%-- <input type="hidden" name="exAddress" value="${hostDto.address}"/>
		           			<input type="hidden" name="exLatlng" value="${hostDto.latlng}"/> --%>	
		           			<%-- <input type="text" name="houseCode" value="${hostDto.houseCode}"/> --%>
		           			</c:if>
	         			</c:forEach>
		            </select>
		            
		         </li>
	         
	         
	         <li>
	            <label>메인사진</label>
	            <input type="file" name="mainImg" id="mainImg" onchange="mainImgPreview(this)" accept="image/*">
	            <br/>
	            <div id="mainImgDiv" onclick="mainUpload()">
	               <img src="" id="mainImgView" name="mainImgView"/>
	            </div>
	         </li>
	         <li>
	            <label>사진</label>
	            <input multiple="multiple" type="file" name="subImg" id="subImg" accept="image/*"/>
	            <br/>
	            <input type="button" class="subBtn" value="내부사진업로드" onclick="subUpload()" style="margin-bottom: 1rem"/>
	            <div class="subImgDiv">
	            </div>
	         </li>
	         <li>
	            <label>인원 수</label>
	            <input type="number" id="exPeople" name="exPeople" value="1" min="1"/> 
	            <br/>
	         </li>
	         
	         <li>
	            <label>진행 시간</label>
	            <input type="number" id="exTime" name="exTime" value="1" min="1"/> 
	            <br/>
	         </li>
	        
	         <li>
	            <label>체험소개</label>
	            <textarea rows="20" cols="50"name="exExplain" id="exExplain"></textarea>
	            <br/>
	         </li>
	      
	         
	         <li>
	            <label>진행날짜</label>
	            
	            <input type="text" id="exStartDateS" name="exStartDateS" />
	            <i class="calenderSt far fa-calendar-alt fa-2x"></i>
			~ <input type="text" id="exEndDateS" name="exEndDateS"/>
			<i class="calenderEn far fa-calendar-alt fa-2x"></i>
			<br/><br/>
			
	         </li>
	        
	          <li>
	            <label>은행</label>
	            <select name="exBank" id="exBank">
	               <option value="KEB하나">KEB하나</option>
	               <option value="NH농협">NH농협</option>
	               <option value="외한">외한</option>
	               <option value="국민">국민</option>
	               <option value="기업">기업</option>
	               <option value="신한">신한</option>
	               <option value="우리">우리</option>
	               <option value="우체국">우체국</option>
	               <option value="카카오뱅크">카카오뱅크</option>
	               <option value="새마을금고">새마을금고</option>
	            </select>
	         </li>
	         
	         
	         <li>
	            <label>계좌</label>
	            <input type="text" size="30" name="exAccount" id="exAccount" placeholder="'-'제외하고 입력해주세요."/>
	         </li>
	         
	          <li>
	            <label>가격</label>
	    		<input type="text" name="exPrice" id="exPrice">원</input>
	         </li>
	         
	        
	         <li>
	            <input type="submit" id="btn" value="다음">
	         </li>
	      </ul>
	   </div>
	   </form>
   </div>
   
   <!-- footer 겹침현상 제거 -->
	<div style="clear:both;"></div>
  
</body>
</html>
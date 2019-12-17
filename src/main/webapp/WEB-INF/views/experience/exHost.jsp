<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/host/register.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=50ff539a80f0de17cdf30d7ef1f997fc&libraries=services"></script>

<script type="text/javascript" src="${root}/resources/javascript/jquery/Blitzer/jquery-ui.js"></script>
<link rel="stylesheet" href="${root}/resources/javascript/jquery/Blitzer/jquery-ui.css">

<script type="text/javascript">
	$(function(){
		$("#exStartDateS").datepicker({
			dateFormat:"yy-mm-dd",
			 monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
			 dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
			 showOn:"button",
			 buttonText:"시작",
			 onClose:function(selectedDate){
				 $("#exEndDateS").datepicker("option","minDate",selectedDate);
				
				
			 }
		});
		$("#exEndDateS").datepicker({
			dateFormat:"yy-mm-dd",
			 monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
			 dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
			 showOn:"button",
			 buttonText:"종료",
			 onClose:function(selectedDate){
				 $("#exStartDateS").datepicker("option","maxDate",selectedDate);
			 }
		});
	


	});
</script>

</head>
<body>
   <form action="${root}/experience/exHostOk.do" method="post" enctype="multipart/form-data">
   <div class="wrap">
      <ul>
        
         <li>
            <label>체험이름</label>
    		<input type="text" name="exName" id="exName"/>
         </li>
         
         <!-- 장소 선택 -->
	         <li>
	            <label>장소선택</label>
	            <select name="exAddress" id="exAddress">
        			<c:forEach var="hostDto" items="${hostChkList}">
        				<!-- 사용자에게는 게하 이름으로 보여주고 디비에는 주소값 저장 -->
	               		<option value="${hostDto.address}">${hostDto.houseName}</option>
	               		<%-- <input type="hidden" name="exAddress" value="${hostDto.address}"/>
	           			<input type="hidden" name="exLatlng" value="${hostDto.latlng}"/> --%>	
         			</c:forEach>
	            </select>
	            
	         </li>
         
         
         <li>
            <label>메인사진</label>
            <input type="file" name="mainImg" id="mainImg" onchange="mainImgPreview(this)">
            <br/>
            <div id="mainImgDiv">
               <img src="" id="mainImgView"/>
            </div>
         </li>
         <li>
            <label>사진</label>
            <input multiple="multiple" type="file" name="subImg" id="subImg"/>
            <br/>
            <div class="subImgDiv">
            </div>
         </li>
         <li>
            <label>인원 수</label>
            <input type="number" id="exPeople" name="exPeople"/> 
            <br/>
         </li>
         
         <li>
            <label>진행 시간</label>
            <input type="text" id="exTime" name="exTime"/> 
            <br/>
         </li>
        
         <li>
            <label>체험소개</label>
            <textarea rows="20" cols="50"name="exExplain" id="exExplain"></textarea>
            <br/>
         </li>
      
         
         <li>
            <label>진행날짜</label>
            <input type="text" id="exStartDateS" name="exStartDateS"/>
		~ <input type="text" id="exEndDateS" name="exEndDateS"/>
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
            <input type="number" name="exAccount" id="exAccount" placeholder="'-'제외하고 입력해주세요."/>
         </li>
         
          <li>
            <label>가격</label>
    		<input type="number" name="exPrice" id="exPrice">원</input>
         </li>
         
        
         <li>
            <input type="submit" id="btn" value="다음">
         </li>
      </ul>
   </div>
   </form>
   
   
   <script>
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div
   mapOption = {
       center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
       level: 5 // 지도의 확대 레벨
   };
   
   //지도를 미리 생성
   var map = new daum.maps.Map(mapContainer, mapOption);
   //주소-좌표 변환 객체를 생성
   var geocoder = new daum.maps.services.Geocoder();
   //마커를 미리 생성
   var marker = new daum.maps.Marker({
   position: new daum.maps.LatLng(37.537187, 127.005476),
   map: map
   });

    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
/*                 if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }
 */
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
                document.getElementById('detailAddress').focus();
                //-------------------------------------------------------
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        
                        //위도 경도 저장
                        document.getElementById("latLng").value = result.y+','+result.x;
                        
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            },
            autoMapping:false
        }).open();
    }
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<%-- <script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script> --%>
<script type="text/javascript" src="${root}/resources/javascript/host/register.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/host/register.css"/>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=50ff539a80f0de17cdf30d7ef1f997fc&libraries=services"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="wrap">
	<div class="width">
	<form action="${root}/host/guestRoom.do" method="post" enctype="multipart/form-data" onsubmit="return register()">
		<ul>
			<c:if test="${empty memberDto.memberImgName}">
			<li>
				<label>프로필 사진 추가</label>
				<p class="textColor">게스트는 프로필 사진을 반드시 추가해야합니다. 게스트에게 나를 알릴 수 있는 사진을 등록해주세요.</p>
				<input type="file" id="profileImg" name="profileImg" onchange="profile()" accept="image/*"/>
				<!-- <input type="button" value="사진 업로드 하기" onclick="profileUpload()"> --> 
				<div class="profileDiv" onclick="profileUpload()">
					<img src="" id="profileView"/>
				</div>
				<label>자기 소개</label>
				<p class="textColor">게스트에게 나를 소개해보세요!</p>
				<textarea rows="10" cols="60" name="memberInfo" id="memberInfo">${memberDto.memberInfo}</textarea>
			</li>
			</c:if>
			<li>
				<label>숙소이름</label>
		<input type="text" name="houseName" id="houseName" size="50"/>
		<input type="button" onclick="return houseNameCheck('${root}')" value="숙소이름 확인"/>
			</li>
			<p class="houseCheckBox"></p>
			<li>
				<label>주소</label>
				<input type="text" name="zipCode" id="zipCode" placeholder="우편번호" disabled="disabled"/>

				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br/>
				<input type="text" name="sample4_roadAddress" id="sample4_roadAddress" placeholder="도로명주소"/>
				<input type="text" name="sample4_jibunAddress" id="sample4_jibunAddress" placeholder="지번주소"/>
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
				<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
				<input type="hidden" name="latLng" id="latLng"/>		
			</li>
			<li>
				<label>메인사진</label>
				<input type="file" name="mainImg" id="mainImg" onchange="mainImgPreview(this)" accept="image/*">
				<br/>
				<div id="mainImgDiv" onclick="mainUpload()">
					<img src="" id="mainImgView"/>
				</div>
			</li>
			<li>
				<label>내부 사진</label>
				<input multiple="multiple" type="file" name="subImg" id="subImg" accept="image/*"/>
				<input type="button" class="subBtn" value="내부사진업로드" onclick="subUpload()" style="margin-bottom: 1rem"/>
				<div class="subImgDiv"></div>
			</li>
			<li>
				<label>인원 수</label>
				<input type="number" id="people" name="people" min="1" max="16" value="1"/> 
				<br/>
			</li>
			<li>
				<label>침대 수</label>
				<input type="number" id="bed" name="bed" min="1" max="16" value="1"/> 
				<br/>
			</li>
			<li>
				<label>욕실 수</label>
				<input type="number" id="bath" name="bath" min="1" max="16" value="1"/> 
				<br/>
			</li>
			<li>
				<label>설명</label>
				<textarea rows="8" cols="60"name="explain" id="explain"></textarea>
				<br/>
			</li>
			<li>
				<label>편의시설</label>
				<div width="100%" height="14rem" style="width:100%; height:14rem">
				<div class="custom-control custom-checkbox mb-3">
				<input type="checkbox" class="custom-control-input" name="wifi" id="wifi"/>
				<label class="custom-control-label" for="wifi">와이파이</label>
				</div>
				<div class="custom-control custom-checkbox mb-3" style="width: 19rem !important;">
				<input type="checkbox" class="custom-control-input" name="necessary" id="necessary"/>
				<label class="custom-control-label" for="necessary">필수품목(수건,비누,화장지,베개)</label>
				</div>
				<div class="custom-control custom-checkbox mb-3">
				<input type="checkbox" class="custom-control-input" name="washer" id="washer"/>
				<label class="custom-control-label" for="washer">세탁기</label>
				</div>
				<div class="custom-control custom-checkbox mb-3">
				<input type="checkbox" class="custom-control-input" name="hotWater" id="hotWater"/>
				<label class="custom-control-label" for="hotWater">온수</label>
				</div>
				<div class="custom-control custom-checkbox mb-3">
				<input type="checkbox" class="custom-control-input" name="aircon" id="aircon"/>
				<label class="custom-control-label" for="aircon">에어컨</label>
				</div>
				<div class="custom-control custom-checkbox mb-3">
				<input type="checkbox" class="custom-control-input" name="tv" id="tv"/>
				<label class="custom-control-label" for="tv">티비</label>
				</div>
				<div class="custom-control custom-checkbox mb-3">
				<input type="checkbox" class="custom-control-input" name="mart" id="mart"/>
				<label class="custom-control-label" for="mart">편의점</label>
				</div>
				<div class="custom-control custom-checkbox mb-3">
				<input type="checkbox" class="custom-control-input" name="parking" id="parking"/>
				<label class="custom-control-label" for="parking">주차시설</label>
				</div>
				<div class="custom-control custom-checkbox mb-3">
				<input type="checkbox" class="custom-control-input" name="kitchen" id="kitchen"/>
				<label class="custom-control-label" for="kitchen">주방</label>
				</div>
				<div class="custom-control custom-checkbox mb-3">
				<input type="checkbox" class="custom-control-input" name="safety" id="safety"/>
				<label class="custom-control-label" for="safety">안전시설</label>
				</div>
				</div>
			</li>
			<li>
				<label>체크인</label>
				<select name="checkInHH" id="checkInHH"> : 
					<option value="선택하세요">선택하세요</option>
					<option value="00">00</option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
				</select>
				<select name="checkInMM" id="checkInMM">
					<option value="선택하세요">선택하세요</option>
					<option value="00">00</option>
					<option value="30">30</option>
				</select>
				<br/>
			</li>
			<li>
				<label>체크아웃</label>
				<select name="checkOutHH" id="checkOutHH">
					<option value="선택하세요">선택하세요</option>
					<option value="00">00</option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
				</select>
				<select name="checkOutMM" id="checkOutMM">
					<option value="선택하세요">선택하세요</option>
					<option value="00">00</option>
					<option value="30">30</option>
				</select>
				<br/>
			</li>
			<li>
				<label>은행</label>
				<select name="bank" id="bank">
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
				<input type="text" name="account" id="account" placeholder="'-'제외하고 입력해주세요." onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" size="30"/>
			</li>
			<li>
				<label>금액</label>
				<input type="text" name="price" id="price" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" size="30"/>
			</li>
			<li>
				<label>기타사항</label>
				<textarea rows="8" cols="60" name="etc" id="etc"></textarea>
				<br/>
			</li>
			<li>
				<input type="submit" value="등록">
			</li>
		</ul>
	</form>
	</div>
	</div>
	
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
                document.getElementById('zipCode').value = data.zonecode;
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>게스트하우스 정보 입력</h3>
	<form action="${root}/host/guestRoom.do">
		<label>숙소이름</label>
		<input type="text" name="houseName" id="houseName"/>
		<input type="button" value="중복 확인" onclick=""/>
		<br/>
		
		<label>주소</label>
		<input type="text" name="address" id="address"/>
		<input type="button" value="주소검색" onclick=""/>
		<br/>
		<label>상세주소</label>
		<input type="text" name="detailAddress" id="detailAddress"/>
		<br/>
		
		<label>설명</label>
		<textarea rows="20" cols="50"name="explain" id="explain"></textarea>
		<br/>
		
		<label>사진</label>
		<input type="file" name="file" id="file" >
		<br/>
		
		<label>욕실 수</label>
		<select name="bath" id="bath">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
			<option value="13">13</option>
			<option value="14">14</option>
			<option value="15">15</option>
			<option value="16">16</option>
		</select>
		<br/>
		
		<label>기타사항</label>
		<textarea rows="20" cols="50" name="etc" id="etc"></textarea>
		<br/>
		
		<label>체크인</label>
		<input type="text" name="checkInHH" id="checkInHH"/>:
		<input type="text" name="checkInMM" id="checkInMM"/>
		</select>
		<br/>
		
		<label>체크아웃</label>
		<input type="text" name="checkOutHH" id="checkOutHH"/>:
		<input type="text" name="checkOutMM" id="checkOutMM"/>
		<br/>
		
		필수품목(비누 수건 어쩌고)<input type="checkbox" name="necessary" id="necessary"/>
		와이파이<input type="checkbox" name="wifi" id="wifi"/>
		세탁기<input type="checkbox" name="washer" id="washer"/>
		온수<input type="checkbox" name="hotWater" id="hotWater"/>
		에어컨<input type="checkbox" name="aircon" id="aircon"/>
		티비<input type="checkbox" name="tv" id="tv"/>
		편의점<input type="checkbox" name="mart" id="mart"/>
		주차시설<input type="checkbox" name="parking" id="parking"/>
		주방<input type="checkbox" name="kitchen" id="kitchen"/>
		안전시설<input type="checkbox" name="safty" id="safty"/>
		<br/>
		
		<input type="submit" value="다음">
	</form>
</body>
</html>
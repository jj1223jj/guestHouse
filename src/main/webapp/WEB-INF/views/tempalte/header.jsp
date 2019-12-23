<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link rel="stylesheet" href="${root}/resources/css/tiles/header.css">

</head>
<body>
	<header>
		
		<div class="headerContainer">
			<div class="logoContainer">
				<div class="logo"><img src="${root}/resources/css/images/common/logo.png"" alt="logo준비중"></div>
			</div>
			<div class="titleContainer">
				<div class="title">title</div>
			</div>
			<div class="menuContainer">
				<div class="menu">
				<c:choose>
         			<c:when test="${memberCode==null}">
						<div class="loginContainer">
							<div class="login">로그인</div>
						</div>
						<div class="registerContainer">
							<div class="register">회원가입</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="myInfoContainer">
							<div class="myInfo">내정보</div>
						</div>
						<div class="logoutContainer">
							<div class="logout">로그아웃</div>
						</div>
						<div class="hostContainer">
							<div class="beHost">호스트신청</div>
						</div>
						<div class="zzimContainer">
							<div class="zzim">찜목록</div>
						</div>
						<div class="reserveListContainer">
							<div class="reserveList">로그아웃</div>
						</div>
		        	</c:otherwise>
		        </c:choose>
					<div class="hostingContainer">
						<div class="hosting">호스팅하기</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var = "root" value = "${pageContext.request.contextPath}"/>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<meta charset="utf-8">

		
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	
	<link rel="stylesheet" href="${root}/resources/css/header/header.css">
    

</head>
<body>

	<!-- 헤더영역 -->
    <nav class="navbar fixed-top navbar-light bg-light" id="probootstrap-navbar">
      <div class="container">
      	<div class="logCon">
      		<img src="${root}/resources/images/logo.jpg" style="width: 50px; height: 80px;"/>
      		<img src="${root}/resources/images/logo1.png" style="width: 50px; height: 50px;"/>
        	<a class="navbar-brand" href="#">제주 스테이</a>
        </div>
        <!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#probootstrap-menu" aria-controls="probootstrap-menu" aria-expanded="false" aria-label="Toggle navigation">
          <span><i class="ion-navicon"></i></span>
        </button> -->
        
        <div class="collapse navbar-collapse justufy-content-end" id="probootstrap-menu">
          <ul class="navbar-nav">
          	<div align="right">
	          	<c:if test="${memberLevel == null}">
		            <li class="nav-item"><a class="nav-link" href="${root}/member/login.do">로그인/회원가입</a></li>
		            <li class="nav-item active"><a class="nav-link" href="#" style="margin-right: 100px;">HOME</a></li>
	            </c:if>
            </div>
            
            <div align="right">
	            <c:if test="${memberLevel != null}">
	            
			            <li class="nav-item"><a class="nav-link" href="${root}/guestdelluna/myInfo.do">마이페이지</a></li>
			            <li class="nav-item"><a class="nav-link" href="${root}/member/logout.do">로그아웃</a></li>
		            	<li class="nav-item"><a class="nav-link" href="${root}/guestdelluna/zzimlist.do">장바구니</a></li>
			            <li class="nav-item"><a class="nav-link" href="${root}/experience/exHost.do">호스팅하기</a></li>
			            
		            <c:if test="${memberLevel =='Host'}">
		            	 <li class="nav-item"><a class="nav-link" href="${root}/experience/exHost.do">체험 등록하기</a></li>
		            </c:if>
		            
		            <c:if test ="${memberLevel =='Admin'}">
		            	 <li class="nav-item"><a class="nav-link" href="${root}/admin/experienceList.do">체험 관리</a></li>
		            	 <li class="nav-item"><a class="nav-link" href="${root}/admin/houseList.do">게스트하우스 관리(등록 승인, 취소)</a></li>
		            	 <li class="nav-item"><a class="nav-link" href="${root}/admin/memberList.do">회원관리</a></li>
					</c:if>
		            
		       
	            
	            </c:if>
	          </div>
          </ul>
        </div>
      </div>
    </nav>

			<!-- //헤더영역 -->
	
	
</body>
</html>
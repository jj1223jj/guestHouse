<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var = "root" value = "${pageContext.request.contextPath}"/>
<!--[if IE 8]><html lang="ko" class="ie8"><![endif]-->
<!--[if IE 9]><html lang="ko" class="ie9"><![endif]-->
<!--[if gt IE 9]><!-->
<html lang="ko">
	<!--<![endif]-->
<head>
<title>게스트하우스 홈페이지</title>
<style>
	footer {
		border-top: 0.063rem solid #ddd;
		height: 11rem;
		text-align: center;
	}
	footer div {
		width: 100% !important;
	}
	footer img {
		width: 14rem;
		margin-bottom: 1rem;
	}
	.copyRight {
		margin-bottom: 1rem;
	}
	footer, footer a {
		color: #777;
	}
</style>
</head>
</head>
<body>

<!-- Footer -->
<footer class="page-footer font-small teal pt-4"  style="background-color: #eee;">

  <!-- Footer Text -->
  <div>

    <!-- Grid row -->
    
	<div>
		<img alt="footerLogo" src="${root}/resources/images/footerLogo.png">
	</div>
      <!-- Grid column -->
      <div>

        <!-- Content -->
        <p style="margin: 0">제주스테이: 서울시 구로구, 사업자 등록번호 121-86-18441, 통신판매번호 제 2017-인천중구-0027호</p>

      </div>
      <!-- Grid column -->


      <!-- Grid column -->
      <div>

        <!-- Content -->
        <p>Tel. 1833-8855, E-mail : dolharebang@jejuStay.com, Copyright © JEJU STAY Co. Ltd. All rights reserved.</p>

      </div>
      <!-- Grid column -->

    
    <!-- Grid row -->

  </div>
  <!-- Footer Text -->

  <!-- Copyright -->
  <div class="copyRight">© 2018 Copyright:
    <a href="https://mdbootstrap.com/education/bootstrap/"> MDBootstrap.com</a>
  </div>
  <!-- Copyright -->

</footer>
<!-- Footer -->


	
</body>
</html>
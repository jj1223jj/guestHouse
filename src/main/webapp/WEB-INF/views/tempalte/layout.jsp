<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type=text/javascript>
	$(document).ready(function(){
	        
	    $(".return-top").hide(); // 탑 버튼 숨김
	    $(function () {
	                 
	        $(window).scroll(function () {
	            if ($(this).scrollTop() > 100) { // 스크롤 내릴 표시
	                $('.return-top').fadeIn();
	            } else {
	                $('.return-top').fadeOut();
	            }
	        });
	                
	        $('.return-top').click(function () {
	            $('body,html').animate({
	                scrollTop: 0
	            }, 400);  // 탑 이동 스크롤 속도
	            return false;
	        });
	    });
	 
	});
</script>
<style type="text/css">
.return-top{
    right: 5%;
    /* bottom: -100px; */
    top: 90%;
    position: fixed;
    z-index: 10;
    border-radius: 3rem;
    font-family: Font Awesome 5 Free;
    
}
</style>


</head>
<body>
	<t:insertAttribute name="header"/>

	<hr color="#ccc" style="margin-top: 6rem;"/>


<%-- 	<t:insertAttribute name="menu"/> --%>
<!-- 	<hr color="pink"/> -->
	
	<t:insertAttribute name="content"/>
	
	
	<span style="font-size: 3rem;"><img class="return-top" style="width:4rem;" src="${root}/resources/images/top.png"/></span>
	

	
	<t:insertAttribute name="foot"/>
</body>
</html>
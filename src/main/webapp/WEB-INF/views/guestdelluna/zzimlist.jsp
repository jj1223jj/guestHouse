<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<script type="text/javascript" src="${root}/resources/xhr/xhr.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/jquery/flick/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/guestdelluna/myzzimlist.js"></script>
<link rel="stylesheet" href="${root}/resources/javascript/jquery/flick/jquery-ui.css">
<title>Insert title here</title>
</head>
<body>
<div>게스트하우스와 체험이름을 클릭하면 해당 url로 이동해야한다</div>
<div id="tabs">
 <ul>
    <li><a href="#fragment-1"><span>체험 찜 목록</span></a></li>
    <li><a href="#fragment-2"><span>게스트하우스 찜 목록</span></a></li>
  </ul>

<div id="fragment-1">

<table border="1">
	<tr>
		<td>
			<div><input type="checkBox" name="allCheck" id="allCheck"/>모두선택</div>		
		</td>
	</tr>
</table>

<c:forEach var="expZzimDto" items="${expZzimDto}" varStatus="status">
	 
	<table border="1">
	<tr>
		<td>
			<input type="checkbox" name="expCheck" class="expCheck" value="${expZzimDto.exCode}"/>
		</td>
		<td>
			<div>번호</div>
			<div class="seqRes">${status.count}</div>
		</td>	
	</tr>	
	<input type="hidden" name="exReserveCode" value="${expZzimDto.exCode}"/>
	</table>
	
	
</c:forEach>

<c:forEach var="exName" items="${exName}" varStatus="status">
	<table border="1">
	<tr>
		<td>
			<div>체험이름</div>
			<div><a href="#">${exName}</a></div>
		</td>
	</tr>
	</table>
</c:forEach>
		
<c:forEach var="expZzimDto" items="${expZzimDto}" varStatus="status">
	<table border="1">
	<tr>		
		<td>
			<div>예약</div>
			<div><a href=#>예약하기 -> 예약누르면해당url로 이동</a></div>
		</td>
	</tr>
	</table>

</c:forEach>

	<button id="opener">예약취소</button>
	<div id="dialog" title="예약취소 하시겠습니까?"></div>
<br/><br/><br/>
</div>


<div id="fragment-2">
 
<table border="1">
	<tr>
		<td>
			<div><input type="checkBox" name="checkAll" id="checkAll"/>모두선택</div>		
		</td>
	</tr>
</table>

<c:forEach var="houseZzimDto" items="${houseZzimDto}" varStatus="status">
	
	<table border="1">
	<tr>
		<td>
			<input type="checkbox" name="houseCheck" class="houseCheck" value="${houseZzimDto.houseCode}"/>
		</td>
		<td>
			<div>번호</div>
			<div class="seqRes">${status.count}</div>
		</td>
	</tr>
	
	<input type="hidden" name="houseReserveCode" value="${houseZzimDto.houseCode}"/>
	
	</table>

<input type="hidden" name="result" />
		
</c:forEach>
	
<c:forEach var="houseName" items="${houseName}">
	<table border="1">
	<tr>
		<td>
			<div>게스트하우스 이름</div>
			<div><a href="#">${houseName}</a></div>
		</td>
	</tr>
	</table>
</c:forEach>

<c:forEach var="houseZzimDto" items="${houseZzimDto}" varStatus="status">	
	<table>
		<tr>	
		
		<td>
			<div>예약</div>
			<div><a href=#>예약하기 -> 예약누르면해당url로 이동</a></div>
		</td>
	</tr>
	</table>

</c:forEach>

<button id="opener2">예약취소</button>
<div id="dialog2" title="예약취소 하시겠습니까?"></div>
</div>
</div>
</body>

<script type="text/javascript">
var str="";
	$("#allCheck").click(function(){
		
		var chk = $("#allCheck").prop("checked");
		if(chk){
			$(".expCheck").prop("checked",true);
		}
		else{
			$(".expCheck").prop("checked",false);
		}
		
	})
	
	var expCheck = document.getElementsByClassName("expCheck");
	var exReserveOk = document.getElementsByClassName("exReserveOk");
	
	$("#dialog").dialog({
		autoOpen : false
	});

	$("#opener").each(function(i, e) {

		$(this).click(function() {
			$("#dialog").dialog("open");

			$(function(obj) {
				var cnt = 0;

				$("#dialog").dialog({

					buttons : [ {
						text : "네",
						click : function(obj) {
							//네를 누르면 div태그의 예약완료가 사라져야함		
							for (i = 0; i < expCheck.length; i++) {
								if (expCheck[i].checked == true) {
									//alert(expCheck.length);

									str += expCheck[i].value + ",";
									++cnt
								}
							}

							//alert(str)
							deleteExpState('${root}', str)

							if (cnt == 0) {
								window.alert("선택된 것이 없습니다.")
								return false
							}
							alert("삭제 완료되었습니다");
							setTimeout("location.reload()");
							$(this).dialog("close")
						}
					},

					{
						text : "아니오",
						click : function() {
							$(this).dialog("close")
						}
					} ]
				})
			})

		})

	})
	//--------------------------------------------------------------------------------
	$("#checkAll").click(function() {

		var chk = $("#checkAll").prop("checked");
		if (chk) {
			$(".houseCheck").prop("checked", true);
		} else {
			$(".houseCheck").prop("checked", false);
		}

	})

	var houseCheck = document.getElementsByClassName("houseCheck");
	var houseReserveCode = document.getElementsByName("houseReserveCode");
	$("#dialog2").dialog({
		autoOpen : false
	});

	$("#opener2").each(function(i, e) {
		$(this).click(function() {
			$("#dialog2").dialog("open");

			$(function(obj) {

				var cnt = 0;

				$("#dialog2").dialog({

					buttons : [ {
						text : "네",
						click : function(obj) {
							//네를 누르면 div태그의 예약완료가 사라져야함		
							for (i = 0; i < houseCheck.length; i++) {
								if (houseCheck[i].checked == true) {

									str += houseCheck[i].value + ",";
									++cnt

								}
							}
							//window.alert(str);		
							deleteHouse('${root}', str);

							if (cnt == 0) {
								window.alert("선택된 것이 없습니다.")
								$(this).dialog("close")
								return false
							}
							alert("삭제 완료되었습니다");
							setTimeout("location.reload()");
							$(this).dialog("close")
						}
					},

					{
						text : "아니오",
						click : function() {
							$(this).dialog("close")
						}
					} ]
				})
			})
		})
	})
	//---------------------------------------------------------------
	$(function() {
		$('#tabs').tabs();
	});
</script>
</head>
</html>
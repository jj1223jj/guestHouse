<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!-- 1.맨 위에 페이지 블록 -->
<c:set var="pageBlock" value="${3}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${root}/resources/xhr/xhr.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/jquery/flick/jquery-ui.js"></script>
<link rel="stylesheet"
	href="${root}/resources/javascript/jquery/flick/jquery-ui.css">
<link rel="stylesheet"
	href="${root}/resources/css/guestdelluna/bootstrap.css">
<link rel="stylesheet"
	href="${root}/resources/css/guestdelluna/menuLayout.css">
<script type="text/javascript"
	src="${root}/resources/javascript/guestdelluna/bootstrap.js"></script>
<title>포인트 관리</title>
<style type="text/css">
html {
	font-size: 16px;
}

.infoMenu {
	margin-left: 2rem;
}

.vl {
	border-left: 0.0625rem solid #dddddd;
	height: 16rem;
	float: left;
	margin-left: 6rem;
	margin-top: 4.4rem;
}

.page-link {
	background-color: #008489;
	border-color: #008489;
}

.aMenu {
	color: #333;
}
</style>

<script>
// 2.jquery 온로드
	$(function(){
		
// 		3.페이징에 필요한 변수들 선언
		var pageBlock=${pageBlock};
		var result=parseInt('${countAccu/boardSize}');
		var pageCount='${countAccu%boardSize}'==0? result:result+1;
		var currentPage = '${accuCurrentPage}';
		var result2= parseInt((currentPage-1)/pageBlock);
		var startPage = result2*pageBlock+1;
		var endPage = startPage+pageBlock-1;
		
// 		4. function setPaging, pageClick 함수를 선언
//		5. 페이지숫자를 담을 div,ul 선언
		setPaging(pageBlock,result,pageCount,currentPage,result2,startPage,endPage);
		pageClick(pageBlock,result,pageCount,currentPage,result2,startPage,endPage);
		
		
	});

//4-2 pageClic함수
function pageClick(pageBlock,result,pageCount,currentPage,result2,startPage,endPage){
	
	
	$(".pagination li[class!='page-item active']").click(function(){
		var liClass=$(this).attr("class");
		var accuPageNumber=0;
		if(liClass=='page-item')
			accuPageNumber=$(this).children().text();
		else if(liClass=='page-item pointFirstPage')
			accuPageNumber=1;
		else if(liClass=='page-item pointBeforePage')
			accuPageNumber=startPage-pageBlock;
		else if(liClass=='page-item pointNextPage')
			accuPageNumber=startPage+pageBlock;
		else if(liClass=='page-item pointEndPage')
			accuPageNumber=pageCount;
		// 6. 컨트롤러에서 받을 url과 requestMapping 만들기
		// 7. 현재페이지를 넘겨줘서 해당 컨트롤러와 서비스imp확인하기
		$.ajax({
			url: "${root}/guestdelluna/managePointAjax.do?accuPageNumber="+accuPageNumber,
			method: "get",
			//8. 서비스imp에서 ajax로 받을 데이터를 json으로 만들어주기
			//9. PrintWriter로 json형식 데이터를 넘겨주기
			success:function(d){
				//10. [{"":""},{"":""},{"":""}] 친구를 JSON.parse하기
				var list=JSON.parse(d);
				
				//alert(list.length);
				//console.log(list);
				var tr= $(".pointInfo tr");
				tr.remove();
				var tbody= $(".pointInfo");
				for(var i=0; i<list.length;i++){
					var date = new Date(list[i].accuDate);
					var dateString = date.getFullYear()+"-"+date.getMonth()+"-"+date.getDate();
					tbody.append(
					'	<tr>' +
					'		<td>'+((accuPageNumber-1)*'${boardSize}'+(i+1))+'</td>' +
					'		<td>'+list[i].accuPlace+'</td>' +
					'		<td>'+dateString+'</td>' +
					'		<td>'+list[i].accuPoint+'</td>' +
					'	</tr>'
					);
				}
				currentPage = accuPageNumber;
				result2= parseInt((currentPage-1)/pageBlock);
				startPage = result2*pageBlock+1;
				endPage = startPage+pageBlock-1;
				setPaging(pageBlock,result,pageCount,currentPage,result2,startPage,endPage);
				pageClick(pageBlock,result,pageCount,currentPage,result2,startPage,endPage);
			},
			error:function(a,b,c){
				console.log(a);
				alert(b);
				alert(c);
			}
		});
	});
	
}

//4.setPaging 함수
function setPaging(pageBlock,result,pageCount,currentPage,result2,startPage,endPage){
    
	$(".pagination").children().remove();
    
    //alert("pageBlock: "+pageBlock+", result:"+result+", pageCount: "+pageCount+",\n result2: "+result2+", startPage: "+startPage+", endPage: "+endPage+", currentPage: "+currentPage);
    if(endPage>pageCount){
       endPage=pageCount;
    }
    if(startPage>1){
       $(".pagination").append(
    		   '<li class="page-item pointFirstPage"><a class="page-link">[처음]</a></li>' +
               '<li class="page-item pointBeforePage"><a class="page-link">[이전]</a></li>'
       );
    }
    for(var i=startPage; i<=endPage;i++){
       if(i==currentPage){
          $(".pagination").append(
       		  '<li class="page-item active"><a class="page-link">'+i+'</a></li>'
          );
       }else{
          $(".pagination").append(
       		  '<li class="page-item"><a class="page-link">'+i+'</a></li>'
          );
       }
    }
    if(endPage<pageCount){
       $(".pagination").append(
             '<li class="page-item pointNextPage"><a class="page-link">[다음]</a></li>'+
             '<li class="page-item pointEndPage"><a class="page-link">[끝]</a></li>'
       );
    }
 }
</script>

<script>
// 2.jquery 온로드
	$(function(){
		
// 		3.페이징에 필요한 변수들 선언
		var pageBlock=${pageBlock};
		var useResult=parseInt('${countUse/boardSize}');
		var usePageCount='${countUse%boardSize}'==0? useResult:useResult+1;
		var useCurrentPage = '${useCurrentPage}';
		var useResult2= parseInt((useCurrentPage-1)/pageBlock);
		var useStartPage = useResult2*pageBlock+1;
		var useEndPage = useStartPage+pageBlock-1;
		
// 		4. function setPaging, pageClick 함수를 선언
//		5. 페이지숫자를 담을 div,ul 선언
		useSetPaging(pageBlock,useResult,usePageCount,useCurrentPage,useResult2,useStartPage,useEndPage);
		usePageClick(pageBlock,useResult,usePageCount,useCurrentPage,useResult2,useStartPage,useEndPage);
		
	});
//4-2 pageClic함수
function usePageClick(pageBlock,useResult,usePageCount,useCurrentPage,useResult2,useStartPage,useEndPage){
	
	$(".pagination li[class!='page-item active']").click(function(){
		var liClass=$(this).attr("class");
		var usePageNumber=0;
		if(liClass=='page-item')
			usePageNumber=$(this).children().text();
		else if(liClass=='page-item useFirstPage')
			usePageNumber=1;
		else if(liClass=='page-item useBeforePage')
			usePageNumber=useStartPage-pageBlock;
		else if(liClass=='page-item useNextPage')
			usePageNumber=useStartPage+pageBlock;
		else if(liClass=='page-item useEndPage')
			usePageNumber=usePageCount;
		// 6. 컨트롤러에서 받을 url과 requestMapping 만들기
		// 7. 현재페이지를 넘겨줘서 해당 컨트롤러와 서비스imp확인하기
		$.ajax({
			url: "${root}/guestdelluna/managePointUseAjax.do?usePageNumber="+usePageNumber,
			method: "get",
			//8. 서비스imp에서 ajax로 받을 데이터를 json으로 만들어주기
			//9. PrintWriter로 json형식 데이터를 넘겨주기
			success:function(d){
				//10. [{"":""},{"":""},{"":""}] 친구를 JSON.parse하기
				var list=JSON.parse(d);
				
				//alert(list.length);
				//console.log(list);
				var tr= $(".useInfo tr");
				tr.remove();
				var tbody= $(".useInfo");
				for(var i=0; i<list.length;i++){
					var date = new Date(list[i].useDate);
					var dateString = date.getFullYear()+"-"+date.getMonth()+"-"+date.getDate();
					tbody.append(
					'	<tr>' +
					'		<td>'+((usePageNumber-1)*'${boardSize}'+(i+1))+'</td>' +
					'		<td>'+list[i].usePlace+'</td>' +
					'		<td>'+dateString+'</td>' +
					'		<td>'+list[i].usePoint+'</td>' +
					'	</tr>'
					);
				}
				useCurrentPage = usePageNumber;
				useResult2= parseInt((useCurrentPage-1)/pageBlock);
				useStartPage = useResult2*pageBlock+1;
				useEndPage = useStartPage+pageBlock-1;
				useSetPaging(pageBlock,useResult,usePageCount,useCurrentPage,useResult2,useStartPage,useEndPage);
				usePageClick(pageBlock,useResult,usePageCount,useCurrentPage,useResult2,useStartPage,useEndPage);
			},
			error:function(a,b,c){
				console.log(a);
				alert(b);
				alert(c);
			}
		});
	});
	
}
//4.setPaging 함수
function useSetPaging(pageBlock,useResult,usePageCount,useCurrentPage,useResult2,useStartPage,useEndPage){
    
	$(".pagination point").children().remove();
    
    //alert("pageBlock: "+pageBlock+", result:"+result+", pageCount: "+pageCount+",\n result2: "+result2+", startPage: "+startPage+", endPage: "+endPage+", currentPage: "+currentPage);
    if(useEndPage>usePageCount){
    	useEndPage=usePageCount;
    }
    if(useStartPage>1){
       $(".pagination point").append(
    		   '<li class="page-item useFirstPage"><a class="page-link">[처음]</a></li>' +
               '<li class="page-item useBeforePage"><a class="page-link">[이전]</a></li>'
       );
    }
    for(var i=useStartPage; i<=useEndPage;i++){
       if(i==useCurrentPage){
          $(".pagination point").append(
       		  '<li class="page-item active"><a class="page-link">'+i+'</a></li>'
          );
       }else{
          $(".pagination point").append(
       		  '<li class="page-item"><a class="page-link">'+i+'</a></li>'
          );
       }
    }
    if(useEndPage<usePageCount){
       $(".pagination point").append(
             '<li class="page-item useNextPage"><a class="page-link">[다음]</a></li>'+
             '<li class="page-item useEndPage"><a class="page-link">[끝]</a></li>'
       );
    }
 }
</script>


</head>
<body>
	<div id="wrap">
		<div style="text-align: center;">
			${memberDto.memberName}님의 현재 사용가능 포인트는 <span
				style="text-decoration: underline;"> <c:forEach
					items="${accuPoint}" var="ap">
					<c:set var="accSum" value="${accSum + ap.accuPoint}" />
				</c:forEach> <c:set var="pointSum" value="${accSum}" /> <c:forEach
					items="${usePoint}" var="up">
					<c:set var="useSum" value="${useSum + up.usePoint}" />
				</c:forEach> <c:set var="pointUse" value="${useSum}" /> <c:if
					test="${pointSum - pointUse > 0}">
					<c:out value="${pointSum - pointUse}" />
				</c:if> <c:if test="${pointSum - pointUse < 0}">
					<span>없습니다.</span>
				</c:if>
			</span> <span>포인트 입니다.</span>
		</div>
		<div class="menuL">
			<ul>
				<li><a href="${root}/guestdelluna/allMyReview.do">후기</a></li>
				<c:if test="${memberCode == memberDto.memberCode}">
					<li><a href="${root}/guestdelluna/memberUpdate.do">회원수정</a></li>
					<li><a href="${root}/guestdelluna/managePoint.do">포인트관리</a></li>
					<li><a href="${root}/guestdelluna/payList.do">결제내역</a></li>
					<c:if test="${memberLevel == 'Host'}">
						<hr style="border: 0.0315rem solid #ddd;" />
						<li><a href="${root}/host/reservationView.do">숙소예약현황</a></li>
						<li><a href="${root}/host/exReservationView.do">체험예약현황</a></li>
						<li><a href="${root}/host/salesView.do">매출조회</a></li>
						<li><a href="${root}/host/houseManagement.do">게스트하우스 관리</a></li>
						<li><a href="${root}/host/exManagement.do">체험 관리</a></li>
					</c:if>
					<li><a href="${root}/guestdelluna/memberDelete.do">회원탈퇴</a></li>
				</c:if>
			</ul>
		</div>

		<div class="menuR">
			<div id="tabs" class="container"
				style="width: 70rem; margin-top: 1.5rem;">
				<ul style="border: 0px; background: #ffffff;">
					<li
						style="float: left; border: 0px; background: #ffffff; margin-top: -3rem; margin-left: -1rem"><a
						href="#fragment-1"><span>포인트 적립 내역</span></a></li>
					<li
						style="float: left; border: 0px; background: #ffffff; margin-top: -3rem; margin-left: 9rem;"><a
						href="#fragment-2"><span>포인트 사용 내역</span></a></li>
				</ul>
				<div id="fragment-1">
					<div>
						<c:if test="${countAccu==0 }">
							<span>적립된 포인트가 없습니다.</span>
						</c:if>
						<c:if test="${countAccu>0}">
							<table class="table"
								style="vertical-align: middle; text-align: center;">
								<thead class="thead-light">
									<tr style="font-weight: 800;">
										<td>번호</td>
										<td>적립장소</td>
										<td>적립날짜</td>
										<td>적립포인트</td>
									</tr>
								</thead>
								<tbody class="pointInfo">
									<c:forEach var="accuPoint" items="${accuPoint}"
										varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${accuPoint.accuPlace}</td>
											<td><fmt:formatDate value="${accuPoint.accuDate}"
													pattern="yyyy-MM-dd" /></td>
											<td>${accuPoint.accuPoint}</td>
										</tr>
									</c:forEach>
								</tbody>

							</table>
						</c:if>
						<!-- 								5. 페이징 숫자들 넣을 div와 ul을 선언 -->
						<div class="pointPageContainer">
							<ul class="pagination">

							</ul>
						</div>
					</div>
				</div>

				<div id="fragment-2">
					<div>
						<c:if test="${countUse==0 }">
							<span>사용된 포인트가 없습니다.</span>
						</c:if>
						<c:if test="${countUse>0 }">
							<table class="table"
								style="vertical-align: middle; text-align: center;">
								<thead class="thead-light">
									<tr style="font-weight: 800;">
										<td>번호</td>
										<td>사용장소</td>
										<td>사용날짜</td>
										<td>사용포인트</td>
									</tr>
								</thead>
								<tbody class="useInfo">
									<c:forEach var="usePoint" items="${usePoint}"
										varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${usePoint.usePlace}</td>
											<td><fmt:formatDate value="${usePoint.useDate}"
													pattern="yyyy-MM-dd" /></td>
											<td>${usePoint.usePoint}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:if>
						<!-- 								5. 페이징 숫자들 넣을 div와 ul을 선언 -->
						<div class="usePageContainer">
							<ul class="pagination point">


							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
























</body>


<script type="text/javascript">
	$(function() {
		$('#tabs').tabs();
	});
</script>
</html>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="pageBlock" value="${5}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${root}/resources/xhr/xhr.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/jquery/flick/jquery-ui.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/guestdelluna/mypaylist.js"></script>
<link rel="stylesheet"
	href="${root}/resources/javascript/jquery/flick/jquery-ui.css">
<link rel="stylesheet"
	href="${root}/resources/css/guestdelluna/bootstrap.css">
<script type="text/javascript"
	src="${root}/resources/javascript/guestdelluna/bootstrap.js"></script>
<title>Insert title here</title>
<style type="text/css">
html {
	font-size: 16px;
}

						<script type="text/javascript">


#vl {
	border-left: 0.0625rem solid #dddddd;
	height: 16rem;
	float: left;
	margin-left: 6rem;
	margin-top: 4.4rem;
}

.infoMenu {
	text-align: center;
	margin-left: -2rem;
}
</style>

<script>
	$(function() {

		var pageBlock = $
		{
			pageBlock
		}
		;

		var result = parseInt('${countAccu/boardSize}');
		var pageCount = '${countAccu%boardSize}' == 0 ? result : result + 1;
		var currentPage = '${accuCurrentPage}';
		var result2 = parseInt((currentPage - 1) / pageBlock);
		var startPage = result2 * pageBlock + 1;
		var endPage = startPage + pageBlock - 1;

		setPaging(pageBlock, result, pageCount, currentPage, result2,
				startPage, endPage);

		pageClick(pageBlock, result, pageCount, currentPage, result2,
				startPage, endPage);

	});

	function pageClick(pageBlock, result, pageCount, currentPage, result2,
			startPage, endPage) {
		$(".pagination li[class='page-item']")
				.click(
						function() {
							var accuPageNumber = $(this).children().text();
							$
									.ajax({
										url : "${root}/guestdelluna/managePointAjax.do?accuPageNumber="
												+ accuPageNumber,
										method : "get",
										success : function(d) {
											var list = JSON.parse(d);
											alert(list.length);
											console.log(list);
											var tr = $(".pointInfo tr");
											for (var i = 0; i < list.length; i++) {
												var date = new Date(
														list[i].accuDate);
												var dateString = date
														.getFullYear()
														+ "-"
														+ date.getMonth()
														+ "-" + date.getDate();
												$(tr[i])
														.children(
																":nth-child(1)")
														.text(
																(accuPageNumber - 1)
																		* '${boardSize}'
																		+ (i + 1));
												$(tr[i]).children(
														":nth-child(2)").text(
														list[i].accuPlace);
												$(tr[i]).children(
														":nth-child(3)").text(
														dateString);
												$(tr[i]).children(
														":nth-child(4)").text(
														list[i].accuPoint);
											}
											currentPage = accuPageNumber;
											result2 = parseInt((currentPage - 1)
													/ pageBlock);
											startPage = result2 * pageBlock + 1;
											endPage = startPage + pageBlock - 1;
											setPaging(pageBlock, result,
													pageCount, currentPage,
													result2, startPage, endPage);
											pageClick(pageBlock, result,
													pageCount, currentPage,
													result2, startPage, endPage);
										}

									});
						})

		$(".pagination li[class='page-item pointFirstPage']")
				.click(
						function() {
							var accuPageNumber = 1;
							$
									.ajax({
										url : "${root}/guestdelluna/managePointAjax.do?accuPageNumber="
												+ accuPageNumber,
										method : "get",
										success : function(d) {
											var list = JSON.parse(d);
											alert(list.length);
											console.log(list);
											var tr = $(".pointInfo tr");
											for (var i = 0; i < list.length; i++) {
												var date = new Date(
														list[i].accuDate);
												var dateString = date
														.getFullYear()
														+ "-"
														+ date.getMonth()
														+ "-" + date.getDate();
												$(tr[i])
														.children(
																":nth-child(1)")
														.text(
																(accuPageNumber - 1)
																		* '${boardSize}'
																		+ (i + 1));
												$(tr[i]).children(
														":nth-child(2)").text(
														list[i].accuPlace);
												$(tr[i]).children(
														":nth-child(3)").text(
														dateString);
												$(tr[i]).children(
														":nth-child(4)").text(
														list[i].accuPoint);
											}
											currentPage = accuPageNumber;
											result2 = parseInt((currentPage - 1)
													/ pageBlock);
											startPage = result2 * pageBlock + 1;
											endPage = startPage + pageBlock - 1;
											setPaging(pageBlock, result,
													pageCount, currentPage,
													result2, startPage, endPage);
											pageClick(pageBlock, result,
													pageCount, currentPage,
													result2, startPage, endPage);
										}

									});
						});
		$(".pagination li[class='page-item pointBeforePage']")
				.click(
						function() {
							var accuPageNumber = startPage - pageBlock;
							$
									.ajax({
										url : "${root}/guestdelluna/managePointAjax.do?accuPageNumber="
												+ accuPageNumber,
										method : "get",
										success : function(d) {
											var list = JSON.parse(d);
											alert(list.length);
											console.log(list);
											var tr = $(".pointInfo tr");
											for (var i = 0; i < list.length; i++) {
												var date = new Date(
														list[i].accuDate);
												var dateString = date
														.getFullYear()
														+ "-"
														+ date.getMonth()
														+ "-" + date.getDate();
												$(tr[i])
														.children(
																":nth-child(1)")
														.text(
																(accuPageNumber - 1)
																		* '${boardSize}'
																		+ (i + 1));
												$(tr[i]).children(
														":nth-child(2)").text(
														list[i].accuPlace);
												$(tr[i]).children(
														":nth-child(3)").text(
														dateString);
												$(tr[i]).children(
														":nth-child(4)").text(
														list[i].accuPoint);
											}
											currentPage = accuPageNumber;
											result2 = parseInt((currentPage - 1)
													/ pageBlock);
											startPage = result2 * pageBlock + 1;
											endPage = startPage + pageBlock - 1;
											setPaging(pageBlock, result,
													pageCount, currentPage,
													result2, startPage, endPage);
											pageClick(pageBlock, result,
													pageCount, currentPage,
													result2, startPage, endPage);
										}

									});
						});
		$(".pagination li[class='page-item pointNextPage']")
				.click(
						function() {
							var accuPageNumber = startPage + pageBlock;
							$
									.ajax({
										url : "${root}/guestdelluna/managePointAjax.do?accuPageNumber="
												+ accuPageNumber,
										method : "get",
										success : function(d) {
											var list = JSON.parse(d);
											alert(list.length);
											console.log(list);
											var tr = $(".pointInfo tr");
											for (var i = 0; i < list.length; i++) {
												var date = new Date(
														list[i].accuDate);
												var dateString = date
														.getFullYear()
														+ "-"
														+ date.getMonth()
														+ "-" + date.getDate();
												$(tr[i])
														.children(
																":nth-child(1)")
														.text(
																(accuPageNumber - 1)
																		* '${boardSize}'
																		+ (i + 1));
												$(tr[i]).children(
														":nth-child(2)").text(
														list[i].accuPlace);
												$(tr[i]).children(
														":nth-child(3)").text(
														dateString);
												$(tr[i]).children(
														":nth-child(4)").text(
														list[i].accuPoint);
											}
											if (accuPageNumber == pageCount) {
												for (var i = list.length; i < 5; i++) {
													$(tr[i]).remove();
												}
											}
											currentPage = accuPageNumber;
											result2 = parseInt((currentPage - 1)
													/ pageBlock);
											startPage = result2 * pageBlock + 1;
											endPage = startPage + pageBlock - 1;
											setPaging(pageBlock, result,
													pageCount, currentPage,
													result2, startPage, endPage);
											pageClick(pageBlock, result,
													pageCount, currentPage,
													result2, startPage, endPage);
										}

									});
						});
		$(".pagination li[class='page-item pointEndPage']")
				.click(
						function() {
							var accuPageNumber = pageCount;
							$
									.ajax({
										url : "${root}/guestdelluna/managePointAjax.do?accuPageNumber="
												+ accuPageNumber,
										method : "get",
										success : function(d) {
											var list = JSON.parse(d);
											alert(list.length);
											console.log(list);
											var tr = $(".pointInfo tr");
											for (var i = 0; i < list.length; i++) {
												var date = new Date(
														list[i].accuDate);
												var dateString = date
														.getFullYear()
														+ "-"
														+ date.getMonth()
														+ "-" + date.getDate();
												$(tr[i])
														.children(
																":nth-child(1)")
														.text(
																(accuPageNumber - 1)
																		* '${boardSize}'
																		+ (i + 1));
												$(tr[i]).children(
														":nth-child(2)").text(
														list[i].accuPlace);
												$(tr[i]).children(
														":nth-child(3)").text(
														dateString);
												$(tr[i]).children(
														":nth-child(4)").text(
														list[i].accuPoint);
											}
											for (var i = list.length; i < 5; i++) {
												$(tr[i]).remove();
											}
											currentPage = accuPageNumber;
											result2 = parseInt((currentPage - 1)
													/ pageBlock);
											startPage = result2 * pageBlock + 1;
											endPage = startPage + pageBlock - 1;
											setPaging(pageBlock, result,
													pageCount, currentPage,
													result2, startPage, endPage);
											pageClick(pageBlock, result,
													pageCount, currentPage,
													result2, startPage, endPage);
										}

									});
						});
	}

	function setPaging(pageBlock, result, pageCount, currentPage, result2,
			startPage, endPage) {

		$(".pagination").children().remove();

		//alert("pageBlock: "+pageBlock+", result:"+result+", pageCount: "+pageCount+",\n result2: "+result2+", startPage: "+startPage+", endPage: "+endPage+", currentPage: "+currentPage);
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		if (startPage > 1) {
			$(".pagination")
					.append(
							'<li class="page-item pointFirstPage"><a class="page-link">[처음]</a></li>'
									+ '<li class="page-item pointBeforePage"><a class="page-link">[이전]</a></li>');
		} else {
			$(".pagination").remove('li [class="page-item pointFirstPage"]');
			$(".pagination").remove('li [class="page-item pointBeforePage"]');
		}
		for (var i = startPage; i <= endPage; i++) {
			if (i == currentPage) {
				$(".pagination").append(
						'<li class="page-item active"><a class="page-link">'
								+ i + '</a></li>');
			} else {
				$(".pagination").append(
						'<li class="page-item"><a class="page-link">' + i
								+ '</a></li>');
			}
		}
		if (endPage < pageCount) {
			$(".pagination")
					.append(
							'<li class="page-item pointNextPage"><a class="page-link">[다음]</a></li>'
									+ '<li class="page-item pointEndPage"><a class="page-link">[끝]</a></li>');
		} else {
			$(".pagination").remove('li [class="page-item pointNextPage"]');
			$(".pagination").remove('li [class="page-item pointEndPage"]');
		}
	}
</script>

</head>
<body>

	<c:set var="accuPointVal" value="${accuPoint}" />
	<c:set var="usePointVal" value="${usePoint}" />
	<input type="hidden" name="accuPoint" value="${accuPoint}" />
	<input type="hidden" name="usePoint" value="${usePoint}" />

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-xs-15">
				<div style="margin: 4rem auto;" align="center">
					${memberDto.memberName}님의 현재 사용가능 포인트는 <span
						style="text-decoration: underline;"> <c:forEach
							items="${accuPoint}" var="ap">
							<c:set var="accSum" value="${accSum + ap.accuPoint}" />
						</c:forEach> <c:set var="pointSum" value="${accSum}" /> <c:forEach
							items="${usePoint}" var="up">
							<c:set var="useSum" value="${useSum + up.usePoint}" />
						</c:forEach> <c:set var="pointUse" value="${useSum}" /> <c:if
							test="${pointSum - pointUse > 0}">
							<c:out value="${pointSum - pointUse}" />
						</c:if> <c:if test="${pointSum - pointUse < 0}">
							<span>없습니다.</span>
						</c:if>
					</span> <span>포인트 입니다.</span>
				</div>
			</div>

			<div class="col-lg-2" style="margin-top: 4rem;">
				<div class="infoMenu">
					<a href="${root}/guestdelluna/myInfo.do">내 정보</a>
				</div>
				<br />
				<div class="infoMenu">
					<a href="${root}/guestdelluna/memberUpdate.do">회원 수정</a>
				</div>
				<br />
				<div class="infoMenu">
					<a href="${root}/guestdelluna/memberDelete.do">회원 탈퇴</a>
				</div>
				<br />
				<div class="infoMenu">
					<a href="${root}/guestdelluna/managePoint.do">포인트 관리</a>
				</div>
				<br />
				<div class="infoMenu">
					<a href="${root}/guestdelluna/payList.do">결제 내역</a>
				</div>
				<br />
				<div class="infoMenu">
					<a href="${root}/guestdelluna/allMyReview.do">내가 쓴 후기</a>
				</div>
			</div>

			<div class="col-lg-1" id="vl"
				style="margin-left: -3rem; margin-top: 3rem;"></div>

			<div class="col-lg-9" style="margin-left: -4rem;">
				<div id="tabs" style="width: 70rem">
					<ul style="background: none; border: none">
						<li><a href="#fragment-1"><span>포인트 적립 내역</span></a></li>
						<li><a href="#fragment-2"><span>포인트 사용 내역</span></a></li>
					</ul>
					<div id="fragment-1" style="text-align: center">
						<div style="text-align: center">
							<table class="table">
								<thead>
									<tr>
										<td>번호</td>
										<td>적립장소</td>
										<td>적립날짜</td>
										<td>적립포인트</td>
									</tr>
								</thead>
								<c:if test="${countAccu>0 }">
									<c:forEach var="accuPoint" items="${accuPoint}"
										varStatus="status">
										<tbody>
											<tr class="table pointInfo">
												<td>${status.count}</td>
												<td>${accuPoint.accuPlace}</td>
												<td>
														<fmt:formatDate value="${accuPoint.accuDate}"
															pattern="yyyy-MM-dd" />
													</td>
												<td>${accuPoint.accuPoint}</td>
											</tr>
										</tbody>
									</c:forEach>									
								</c:if>
							</table>

								<div align="center">
								<c:if test="${countAccu >0 }">
									<fmt:parseNumber var="accPageCount" value="${countAccu/boardSize + (countAccu%boardSize==0 ? 0 : 1) }" />
										<fmt:parseNumber var="result" value="${(accuCurrentPage-1)/pageBlock }" integerOnly="true" />
									<c:set var="accStartPage" value="${result * pageBlock+1 }" />
									<c:set var="accEndPage" value="${accStartPage + pageBlock -1 }" />

									<c:if test="${accEndPage > accPageCount }">
										<c:set var="accEndPage" value="${accPageCount }" />
									</c:if>

									<c:if test="${accStartPage > pageBlock}">
										<button type="button" class="btn btn-light btn-sm" onclick="accuPage('${root}','${accStartPage-pageBlock}')")>[이전]</button>
									</c:if>

									<c:forEach var="i" begin="${accStartPage }" end="${accEndPage }">
										<button type="button" class="btn btn-light btn-sm" onclick="accuPage('${root}','${i}')">[${i}]</button>
									</c:forEach>

									<c:if test="${accEndPage < accPageCount }">
										<button type="button" class="btn btn-light btn-sm" onclick="accuPage('${root}','${accStartPage+pageBlock}')">[다음]</button>
									</c:if>
								</c:if>
							</div> 

							<script type="text/javascript">
							
								function accuPage(root,page){
									
									var url = root + "/guestdelluna/managePointAjax.do";
									var params = "accuPageNumber=" + page;
									
									sendRequest("GET", url, fromServer, params);
								}
								
								function fromServer(){
									
									var accuPoint = document.getElementsByName("accuPoint");
								
									
								
								}
							</script>
							
							<div class="pointPageContainer">
								<ul class="pagination">

								</ul>
							</div>
						</div>
					</div>

					<div id="fragment-2">
						<div>
							<c:forEach var="usePoint" items="${usePoint}" varStatus="status">

								<div>번호</div>
								<div class="seqRes">${status.count}</div>

								<div>사용 장소</div>
								<div>${usePoint.usePlace}</div>

								<div>사용 날짜</div>
								<div>
									<fmt:formatDate value="${usePoint.useDate}"
										pattern="yyyy-MM-dd" />
								</div>

								<div>사용포인트</div>
								<div>${usePoint.usePoint}</div>

							</c:forEach>

							<c:if test="${countUse>0 }">
								<fmt:parseNumber var="usePageCount" integerOnly="true"
									value="${countUse/boardSize+(countUse%boardSize==0 ? 0:1)}" />

								<c:set var="usePageBlock" value="${10}" />

								<fmt:parseNumber var="result"
									value="${(useCurrentPage-1)/usePageBlock}" integerOnly="true" />
								<c:set var="useStartPage" value="${result*usePageBlock+1}" />
								<c:set var="useEndPage" value="${useStartPage+usePageBlock-1}" />

								<c:if test="${useEndPage>usePageCount}">
									<c:set var="useEndPage" value="${usePageCount}" />
								</c:if>

								<c:if test="${useStartPage>usePageBlock}">
									<a
										href="${root}/guestdelluna/managePoint.do?pageNumber=${useStartPage-usePageBlock}">[이전]</a>
								</c:if>

								<c:forEach var="i" begin="${useStartPage}" end="${useEndPage}">
									<a href="${root}/host/houseManagement.do?pageNumber=${i}">[${i}]</a>

								</c:forEach>

								<c:if test="${useEndPage < usePageCount}">
									<a
										href="${root}/guestdelluna/managePoint.do?pageNumber=${useStartPage+usePageBlock}">[다음]</a>
								</c:if>
							</c:if>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(function() {
		$('#tabs').tabs();
	});

	function scrollPage(root) {

	}
</script>
</html> --%>
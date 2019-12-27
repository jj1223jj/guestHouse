<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="pageBlock" value="${3}"/>
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
</style>

<script>




	$(function(){
		
		var pageBlock=${pageBlock};

		var result=parseInt('${countAccu/boardSize}');
		var pageCount='${countAccu%boardSize}'==0? result:result+1;
		var currentPage = '${accuCurrentPage}';
		var result2= parseInt((currentPage-1)/pageBlock);
		var startPage = result2*pageBlock+1;
		var endPage = startPage+pageBlock-1;

		
		
		setPaging(pageBlock,result,pageCount,currentPage,result2,startPage,endPage);
		
		pageClick(pageBlock,result,pageCount,currentPage,result2,startPage,endPage);
		
		
	});

function pageClick(pageBlock,result,pageCount,currentPage,result2,startPage,endPage){
	$(".pagination li[class='page-item']").click(function(){
		var accuPageNumber=$(this).children().text();
		$.ajax({
			url: "${root}/guestdelluna/managePointAjax.do?accuPageNumber="+accuPageNumber,
			method: "get",
			success:function(d){
				var list=JSON.parse(d);
				alert(list.length);
				console.log(list);
				var tr= $(".pointInfo tr");
				for(var i=0; i<list.length;i++){
					var date = new Date(list[i].accuDate);
					var dateString = date.getFullYear()+"-"+date.getMonth()+"-"+date.getDate();
					$(tr[i]).children( ":nth-child(1)").text((accuPageNumber-1)*'${boardSize}'+(i+1));
					$(tr[i]).children( ":nth-child(2)").text(list[i].accuPlace);
					$(tr[i]).children( ":nth-child(3)").text(dateString);
					$(tr[i]).children( ":nth-child(4)").text(list[i].accuPoint);
				}
				currentPage = accuPageNumber;
				result2= parseInt((currentPage-1)/pageBlock);
				startPage = result2*pageBlock+1;
				endPage = startPage+pageBlock-1;
				setPaging(pageBlock,result,pageCount,currentPage,result2,startPage,endPage);
				pageClick(pageBlock,result,pageCount,currentPage,result2,startPage,endPage);
			}
			
		});
	})
	
	$(".pagination li[class='page-item pointFirstPage']").click(function(){
		var accuPageNumber=1;
		$.ajax({
			url: "${root}/guestdelluna/managePointAjax.do?accuPageNumber="+accuPageNumber,
			method: "get",
			success:function(d){
				var list=JSON.parse(d);
				alert(list.length);
				console.log(list);
				var tr= $(".pointInfo tr");
				for(var i=0; i<list.length;i++){
					var date = new Date(list[i].accuDate);
					var dateString = date.getFullYear()+"-"+date.getMonth()+"-"+date.getDate();
					$(tr[i]).children( ":nth-child(1)").text((accuPageNumber-1)*'${boardSize}'+(i+1));
					$(tr[i]).children( ":nth-child(2)").text(list[i].accuPlace);
					$(tr[i]).children( ":nth-child(3)").text(dateString);
					$(tr[i]).children( ":nth-child(4)").text(list[i].accuPoint);
				}
				currentPage = accuPageNumber;
				result2= parseInt((currentPage-1)/pageBlock);
				startPage = result2*pageBlock+1;
				endPage = startPage+pageBlock-1;
				setPaging(pageBlock,result,pageCount,currentPage,result2,startPage,endPage);
				pageClick(pageBlock,result,pageCount,currentPage,result2,startPage,endPage);
			}
			
		});
	});
	$(".pagination li[class='page-item pointBeforePage']").click(function(){
		var accuPageNumber=startPage-pageBlock;
		$.ajax({
			url: "${root}/guestdelluna/managePointAjax.do?accuPageNumber="+accuPageNumber,
			method: "get",
			success:function(d){
				var list=JSON.parse(d);
				alert(list.length);
				console.log(list);
				var tr= $(".pointInfo tr");
				for(var i=0; i<list.length;i++){
					var date = new Date(list[i].accuDate);
					var dateString = date.getFullYear()+"-"+date.getMonth()+"-"+date.getDate();
					$(tr[i]).children( ":nth-child(1)").text((accuPageNumber-1)*'${boardSize}'+(i+1));
					$(tr[i]).children( ":nth-child(2)").text(list[i].accuPlace);
					$(tr[i]).children( ":nth-child(3)").text(dateString);
					$(tr[i]).children( ":nth-child(4)").text(list[i].accuPoint);
				}
				currentPage = accuPageNumber;
				result2= parseInt((currentPage-1)/pageBlock);
				startPage = result2*pageBlock+1;
				endPage = startPage+pageBlock-1;
				setPaging(pageBlock,result,pageCount,currentPage,result2,startPage,endPage);
				pageClick(pageBlock,result,pageCount,currentPage,result2,startPage,endPage);
			}
			
		});
	});
	$(".pagination li[class='page-item pointNextPage']").click(function(){
		var accuPageNumber=startPage+pageBlock;
		$.ajax({
			url: "${root}/guestdelluna/managePointAjax.do?accuPageNumber="+accuPageNumber,
			method: "get",
			success:function(d){
				var list=JSON.parse(d);
				alert(list.length);
				console.log(list);
				var tr= $(".pointInfo tr");
				for(var i=0; i<list.length;i++){
					var date = new Date(list[i].accuDate);
					var dateString = date.getFullYear()+"-"+date.getMonth()+"-"+date.getDate();
					$(tr[i]).children( ":nth-child(1)").text((accuPageNumber-1)*'${boardSize}'+(i+1));
					$(tr[i]).children( ":nth-child(2)").text(list[i].accuPlace);
					$(tr[i]).children( ":nth-child(3)").text(dateString);
					$(tr[i]).children( ":nth-child(4)").text(list[i].accuPoint);
				}
				if(accuPageNumber==pageCount){
					for(var i=list.length;i<5;i++){
						$(tr[i]).remove();
					}
				}
				currentPage = accuPageNumber;
				result2= parseInt((currentPage-1)/pageBlock);
				startPage = result2*pageBlock+1;
				endPage = startPage+pageBlock-1;
				setPaging(pageBlock,result,pageCount,currentPage,result2,startPage,endPage);
				pageClick(pageBlock,result,pageCount,currentPage,result2,startPage,endPage);
			}
			
		});
	});
	$(".pagination li[class='page-item pointEndPage']").click(function(){
		var accuPageNumber=pageCount;
		$.ajax({
			url: "${root}/guestdelluna/managePointAjax.do?accuPageNumber="+accuPageNumber,
			method: "get",
			success:function(d){
				var list=JSON.parse(d);
				alert(list.length);
				console.log(list);
				var tr= $(".pointInfo tr");
				for(var i=0; i<list.length;i++){
					var date = new Date(list[i].accuDate);
					var dateString = date.getFullYear()+"-"+date.getMonth()+"-"+date.getDate();
					$(tr[i]).children( ":nth-child(1)").text((accuPageNumber-1)*'${boardSize}'+(i+1));
					$(tr[i]).children( ":nth-child(2)").text(list[i].accuPlace);
					$(tr[i]).children( ":nth-child(3)").text(dateString);
					$(tr[i]).children( ":nth-child(4)").text(list[i].accuPoint);
				}
				for(var i=list.length;i<5;i++){
					$(tr[i]).remove();
				}
				currentPage = accuPageNumber;
				result2= parseInt((currentPage-1)/pageBlock);
				startPage = result2*pageBlock+1;
				endPage = startPage+pageBlock-1;
				setPaging(pageBlock,result,pageCount,currentPage,result2,startPage,endPage);
				pageClick(pageBlock,result,pageCount,currentPage,result2,startPage,endPage);
			}
			
		});
	});
}
	

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
    }else{
    	$(".pagination").remove('li [class="page-item pointFirstPage"]');
    	$(".pagination").remove('li [class="page-item pointBeforePage"]');
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
    }else{
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

	<div class="row">
		<div class="span9">
			<div
				style="margin-top: 2rem; margin-bottom: 1rem; text-align: center;">
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

			<div class="row">
				<div class="span2">
					<div style="float: left; margin-left: 6rem; margin-top: 6rem;">
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
				</div>

				<div class="span1">
					<div class="vl"></div>
				</div>

				<div class="span6" style="margin-top: 4rem">
					<div id="tabs" class="container"
						style="width: 70rem; margin-top: 4rem;">
						<ul style="border: 0px; background: #ffffff;">
							<li
								style="float: left; border: 0px; background: #ffffff; margin-top: -3rem; margin-left: -1rem"><a
								href="#fragment-1"><span>포인트 적립 내역</span></a></li>
							<li
								style="float: left; border: 0px; background: #ffffff; margin-top: -3rem; margin-left: 9rem;"><a
								href="#fragment-2"><span>포인트 사용 내역</span></a></li>
						</ul>
						<div id="fragment-1" style="margin-top: -14rem">
							<div>
								<table class="table"
									style="vertical-align: middle; text-align: center; margin-top: -2rem;">
									<thead class="thead-light">
										<tr style="font-weight: 800;">
											<td>번호</td>
											<td>적립장소</td>
											<td>적립날짜</td>
											<td>적립포인트</td>
										</tr>
									</thead>
								</table>
								<c:if test="${countAccu>0 }">
									<c:forEach var="accuPoint" items="${accuPoint}"
										varStatus="status">
										<table class="table pointInfo"
											style="text-align: center; vertical-align: middle; margin-bottom: auto;">
											<tbody>
												<tr>
													<td>${status.count}</td>
													<td>${accuPoint.accuPlace}</td>
													<td><fmt:formatDate value="${accuPoint.accuDate}"
															pattern="yyyy-MM-dd" /></td>
													<td>${accuPoint.accuPoint}</td>
												</tr>
											</tbody>
										</table>
									</c:forEach>
								</c:if>

								<div align="center">
									<c:if test="${countAccu >0 }">									
										<fmt:parseNumber var="pageCount"
											value="${countAccu/boardSize + (countAccu%boardSize==0 ? 0 : 1) }" />
										
										

										<fmt:parseNumber var="result"
											value="${(accuCurrentPage-1)/pageBlock }" integerOnly="true" />
										<c:set var="startPage" value="${result * pageBlock+1 }" />
										<c:set var="endPage" value="${startPage + pageBlock -1 }" />

										<c:if test="${endPage > pageCount }">
											<c:set var="endPage" value="${pageCount }" />
										</c:if>

										<c:if test="${startPage > pageBlock}">
											<button type="button" class="btn btn-light btn-sm">[이전]</button>
										</c:if>

										<c:forEach var="i" begin="${startPage }" end="${endPage }">
											<button type="button" class="btn btn-light btn-sm">[${i}]</button>					
										</c:forEach>

										<c:if test="${endPage < pageCount }">
											<button type="button" class="btn btn-light btn-sm">[다음]</button>
										</c:if>
									</c:if>
								</div>
								
								<div class="pointPageContainer">
									 <ul class="pagination">
									   
									  </ul>
								</div>
							</div>
						</div>

<script type="text/javascript">

	function scrollPage(root){
		
		
		
	}
	 
</script>


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
	</div>
</body>

<script type="text/javascript">
	$(function() {
		$('#tabs').tabs();
	});
</script>
</html>
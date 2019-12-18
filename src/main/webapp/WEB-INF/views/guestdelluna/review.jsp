<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<metacharset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root }/resources/javascript/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/guestdelluna/starJs.js"></script>
<link rel="stylesheet" href="${root}/resources/css/guestdelluna/startCss.css"/>
<%-- <link rel="stylesheet" href="${root }/css/reply/reply.css" />
<script type="text/javascript" src="${root }/xhr/xhr.js"></script>
<script type="text/javascript" src="${root }/javascript/reply/replyWrite.js"></script>
<script type="text/javascript" src="${root }/javascript/reply/replyDelete.js"></script>
<script type="text/javascript" src="${root }/javascript/reply/replyUpdate.js"></script> --%>
</head>
<body>
리뷰입니다 
리뷰제출하면 reviewOk.do로 이동

<h3>
	memberCode = ${memberCode}
	memberName = ${memberName}
</h3>

<form action="${root}/guestdelluna/reviewOk.do" method="post">
<input type="hidden" value="${memberCode}" name="memberCode"/>

<div>작성자</div>
<input type="text" name="memberName" value="${memberName}"/>

<div>후기내용</div>
<textarea rows="30" cols="80" name="revContent"></textarea>

<div>별점은 일단 숫자로입력 / 정수만 / 1~5</div>
<input type="text" name="revRate" />

<input type="submit" value="후기쓰기"/> <input type="reset" value="나가기" />

</form>

	<%-- 
	<div></div>

	<div>
		<input type="text" name="write" id="writeReply" size=45/>
		<input type="button" value="한줄답글 작성" onclick="writeToServer('${root}')"/>
	</div>
	
	<!-- 기존 댓글 -->
	<div id="listAllDiv">
			<!-- 새 댓글,, 해서 새로 작성될수록 위에서 갱신됨 --> 
			<!-- 새 댓글 -->
			<!-- 기존 댓글 -->
			<c:forEach var="replyDto" items="${replyList }" >
				<div class="replyDiv" id="${replyDto.bunho }">
					<span class="cssBunho">${replyDto.bunho }</span>
					<span class="cssReply">${replyDto.line_reply }</span>
					<span class="cssUpDel">
						<a href="javascript:updateForm('${root }','${replyDto.bunho }' , '${replyDto.line_reply }')">수정</a>&nbsp;
						<a href="javascript:deleteToServer('${root }','${replyDto.bunho }')">삭제</a>
					</span>
				</div>
			</c:forEach>		
	</div>
	 --%>
<!-- 
 <!-- Trigger/Open The Modal -->
 <!--   <button id="myBtn">Open Modal</button>
 
    The Modal
    <div id="myModal" class="modal">
 
      Modal content
      <div class="modal-content">
        <span class="close">&times;</span>                                                               
        <p>Some text in the Modal..</p>
      </div>
 
    </div>
 -->


</body>
</html>
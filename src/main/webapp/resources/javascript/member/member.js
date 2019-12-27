
function registerForm(obj){
	

}




function emailCheck(obj,root){
	
	if(obj.email.value==""){	//id값에 입력을 안한 경우
		alert("이메일을 입력하세요.");
		obj.email.focus();	//커서를 아이디에 놓아줌
		return false;
	}
	

	
	var url = root +"/member/emailCheck.do?email=" + obj.email.value;	// /homePage/member/idCheck.do?id=0000 id에 0000입력한 경우
	alert(url);													// idCheckAction으로 간 다음에 idCheck.jsp로 간다.
	
	open(url,"","width=400, height=400, scrollbars=yes");	// url페이지(idCheck.jsp)를 새창으로 오픈 
}





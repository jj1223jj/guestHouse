function registerForm(obj){
	

}

function memberManagement(root,obj){
	alert(obj.memberCode.value);
	
	var url = root +"/admin/adminMemberRead.do?memberCode=" + obj.memberCode.value;
	//alert(url);													// idCheckAction으로 간 다음에 idCheck.jsp로 간다.
	
	open(url,"","width=400, height=250, scrollbars=no");	// url페이지(idCheck.jsp)를 새창으로 오픈 
}

function onboardForm() {
	
}

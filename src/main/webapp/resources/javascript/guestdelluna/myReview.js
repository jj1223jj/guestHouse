/**
 * 
 */

function submitExpUp(root, exReserveCode, exContent) {

	alert(root)
	alert(exReserveCode)
	alert(exContent)

	/*
	 * var url = root + "/guestdelluna/reviewUpdate.do";
	 * 
	 * var params = "exValue=" + exValue;
	 * 
	 * sendRequest("GET", url, updateReviewFromServer, params);
	 */
}

function delCallBackFromServer() {
	if (xhr.readyState == 4 && xhr.status == 200) {
		alert("후기 삭제 완료됐습니다");
		setTimeout("location.reload()");
	}
}

function delExpRev(root, value) {
	// alert("hhhh")
	var url = root + "/guestdelluna/reviewDelete.do";

	var params = "value=" + value;

	sendRequest("GET", url, delCallBackFromServer, params);
}

function delHouseRev(root, hsValue) {

	var url = root + "/guestdelluna/houseReviewDelete.do";

	var params = "hsValue=" + hsValue;

	sendRequest("GET", url, delCallBackFromServer, params);

}

function updateCallBack() {
	if (xhr.readyState == 4 && xhr.status == 200) {
		alert("수정 완료됐습니당");
		location.reload();
	}
}

function focusExpReview(i) {

	var modal = document.getElementsByClassName("modal");
	modal[i-1].style.display = "block";

}

function closeModal(root, i) {

	var modal = document.getElementsByClassName("modal");
	modal[i-1].style.display = "none";

}

function expUpdateOk(root, expUpResCode) {

	var expReview = document.getElementsByName("expReview");
	var str = "";
	for (var i = 0; i < expReview.length; i++) {
		var expRevContent = document.getElementsByClassName("expRevContent");

		if (expRevContent[i].value != "") {
			str = expRevContent[i].value;
		}

		var url = root + "/guestdelluna/reviewUpdateOk.do?";
		var params = "expUpResCode=" + expUpResCode + "&expRevContent=" + str
	}

	sendRequest("POST", url, updateCallBack, params);
}

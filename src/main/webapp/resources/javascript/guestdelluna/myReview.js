/**
 * 
 */
function delExpRev(root, value) {
	// alert("hhhh")
	var url = root + "/guestdelluna/reviewDelete.do";

	var params = "value=" + value;

	sendRequest("GET", url, delCallBackFromServer, params);
}

function delCallBackFromServer() {
	if (xhr.readyState == 4 && xhr.status == 200) {
		alert("후기 삭제 완료됐습니다");
		setTimeout("location.reload()");
	}
}

function expUpdateOk(root, expUpResCode, i) {

	var str = "";

	var expRevContent = document.getElementsByName("expRevContent");

	if (expRevContent[i - 1].value != "") {

		str = expRevContent[i - 1].value;

	}
	

	var url = root + "/guestdelluna/reviewUpdateOk.do";

	var params = "expUpResCode=" + expUpResCode + "&expRevContent=" + str

	sendRequest("GET", url, updateCallBack, params);
}

function delHouseRev(root, hsValue) {

	var url = root + "/guestdelluna/houseReviewDelete.do";

	var params = "hsValue=" + hsValue;

	sendRequest("GET", url, delCallBackFromServer, params);

}

function delCallBackFromServer() {
	if (xhr.readyState == 4 && xhr.status == 200) {
		alert("후기 삭제 완료됐습니다");
		setTimeout("location.reload()");
	}
}

function houseUpdateOk(root, houseResCode,i) {

	var str = "";

		var houseRevContent = document.getElementsByName("houseRevContent");

		if (houseRevContent[i-1].value != "") {
			str = houseRevContent[i-1].value;
		}


		var url = root + "/guestdelluna/houseReviewUpdateOk.do";
		var params = "houseUpResCode=" + houseResCode + "&houseRevContent=" + str;

	sendRequest("GET", url, updateCallBack, params);

}

function updateCallBack() {
	if (xhr.readyState == 4 && xhr.status == 200) {
		alert("수정 완료됐습니다");
		location.reload();
	}
}
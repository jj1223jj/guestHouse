/**
 * 
 */

function deleteExpPayState(root, exValue) {

		var url = root + "/guestdelluna/deleteExpPayList.do";
		var params = "exValue=" + exValue;

		sendRequest("GET", url, deletePayListFromServer, params);

}

function deletePayListFromServer() {
	if (xhr.readyState == 4 && xhr.status == 200) {

	}
}

function deleteHousePayState(root, houseValue) {

		var url = root + "/guestdelluna/deleteExpPayHouse.do";
		var params = "houseValue=" + houseValue;

		sendRequest("GET", url, deletePayListFromServer, params);


}
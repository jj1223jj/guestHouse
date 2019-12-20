/**
 * 
 */

function deleteExpPayState(root, exValue) {

	var array = exValue.split(",");

	for (var i = 0; i < array.length - 1; i++) {
		exValue = array[i];
		//alert(exValue);
		var url = root + "/guestdelluna/deleteExpPayList.do";
		var params = "exValue=" + exValue;

		sendRequest("GET", url, deletePayListFromServer, params);

	}

}

function deletePayListFromServer() {
	if (xhr.readyState == 4 && xhr.status == 200) {

	}
}

function deleteHousePayState(root, houseValue) {

	var array = houseValue.split(",");

	for (var i = 0; i < array.length - 1; i++) {

		houseValue = array[i];

		var url = root + "/guestdelluna/deleteExpPayHouse.do";
		var params = "houseValue=" + houseValue;

		sendRequest("GET", url, deletePayListFromServer, params);

	}

}

//-------------------------------------------------------------------
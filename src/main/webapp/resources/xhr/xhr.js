/**
 * 
 */

var xhr = null;

function createXHR() {
	if (window.XMLHttpRequest) {
		return new XMLHttpRequest;
	}else {
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
}


function sendRequest(method, url, callback, params) {
	var httpMethod = method.toLowerCase();
	if (httpMethod != "get" && httpMethod != "post") {
		httpMethod = "get";
	}
	//alert(httpMethod);
	var httpParams = (params == null || params == "")? null : params;
	var httpUrl = url;
	if (httpMethod == "get" && httpParams != null) {
		httpUrl += "?" + httpParams;
	}
	//alert(httpUrl);
	xhr = createXHR();
	xhr.open(httpMethod, httpUrl, true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send(httpMethod == "post"? httpParams : null);
	xhr.onreadystatechange = callback;
	//alert(httpUrl);


}
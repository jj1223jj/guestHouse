/**
 * 
 *
 */
		function deleteAllMsg(root) {

			var url = root + "/guestdelluna/msgAllDelete.do";
			var params = "";

			sendRequest("GET", url, callBackFromServer, params);
		}

		function callBackFromServer() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				alert("모든 메시지가 삭제 됐습니다");
				location.reload();
			}
		}

		function deleteMsg(root, msgCode, count) {
			var url = root + "/guestdelluna/msgDelete.do";
			var params = "msgCode=" + msgCode;

			sendRequest("GET", url, delMsgFromServer, params);

		}

		function delMsgFromServer() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				alert("해당 메시지가 삭제 됐습니다");
				var stateMsg = document.getElementsByClassName("stateMsg");

				stateMsg[i - 1].innerHTML = "삭제된 메시지입니다.";

				function deleteRow(obj) {
					$(obj).parent().remove();
				}

			}
		}

		function readMsg(root, msgCode) {
			//읽음으로 상태변경
			var url = root + "/guestdelluna/msgUpdate.do";
			var params = "msgCode=" + msgCode;

			sendRequest("POST", url, updateCallBackFromServer, params);
		}

		function updateCallBackFromServer() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				location.href = "${root}/guestdelluna/payList.do";
			}
		}

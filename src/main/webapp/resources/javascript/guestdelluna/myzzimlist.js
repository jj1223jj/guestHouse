/**
 * 
 */

function deleteExpState(root,value){

		var url = root + "/guestdelluna/zzimExpCancel.do";
		var params = "value=" + value;
		
		sendRequest("GET" , url , deleteStateFromServer , params);
	
}

function deleteStateFromServer(){
	if(xhr.readyState==4 && xhr.status==200){
		
		//alert("콜백함수임");
		
	}
}	
function deleteHouse(root,hsValue){
		
		var url = root + "/guestdelluna/zzimhouseCancel.do";
		var params = "hsValue=" + hsValue;
		
		sendRequest("GET" , url , deleteStateFromServer , params);

}




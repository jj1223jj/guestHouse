/**
 * 
 */
function updateState(root,value){

	var array = value.split(",");

	for(var i=0; i<array.length-1; i++){
		value = array[i];

	var url = root + "/guestdelluna/cancelReserve.do";

	var params = "value=" + value;

	sendRequest("GET" , url , updateStateFromServer , params);

	}

}

function updateStateFromServer(){
	
	if(xhr.readyState==4 && xhr.status==200){
		
		//alert("콜백함수임");
		
	}
	
}

function updateExpState(root, eXvalue){
	
	var array = eXvalue.split(",");
	
	for(var i=0; i<array.length-1; i++){
		
		eXvalue=array[i]
		
		var url = root + "/guestdelluna/cancelExp.do";

		var params = "eXvalue=" + eXvalue;
		
		sendRequest("GET" , url , updateStateFromServer , params);
		
	}
	
}


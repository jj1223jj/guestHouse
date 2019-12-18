/**
 * 
 */

function deleteToServer(root , bunho){
	//alert(bunho + " , " +  root);
	
	var url = root + "/reply/delete.do";
	var params = "bunho=" + bunho;
	
	sendRequest("GET" , url , deleteFromServer , params);
}

function deleteFromServer(){
	
	if(xhr.readyState==4 && xhr.status==200){
		//alert(xhr.responseText);

		var divBunho = document.getElementById(xhr.responseText);
		
		var listAllDiv = document.getElementById("listAllDiv");
		listAllDiv.removeChild(divBunho);
		
	}
	
}
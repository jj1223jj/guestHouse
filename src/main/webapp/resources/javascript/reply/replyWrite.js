/**
 * 
 */
var root = null;

function writeToServer(requestRoot){
	var writeReply = document.getElementById("writeReply").value;
	//alert(writeReply); 값이 잘 넘어왔나 찍어봄
	
	root = requestRoot;
	var url = root + "/guestdelluna/reviewOk.do";
	
	var params = "writeReply=" + writeReply;
	sendRequest("POST" , url , writheFromServer , params);
	
}

function writheFromServer(){
	
	if(xhr.readyState==4 && xhr.status==200){
		//alert(xhr.responseText);
		
		var result = xhr.responseText.split(",");
		var bunho = result[0].trim();
		var reply = result[1].trim();
		
		document.getElementById("writeReply").value="";
		
		var listAllDiv = document.getElementById("listAllDiv");
		var div = document.createElement("div");
		div.className="replyDiv";
		div.id=bunho;
		
		var spanBunho = document.createElement("span");
		spanBunho.className="cssBunho";
		spanBunho.innerHTML = bunho;
		
		var spanReply = document.createElement("span");
		spanReply.className = "cssReply";
		spanReply.innerHTML = reply;
		
		var spanUpDel = document.createElement("span");
		spanUpDel.className = "cssUpDel";
		
		var aDelete = document.createElement("a");
		aDelete.href="javascript:deleteToServer("   +bunho+ ",\' "+root+   "\'  )"; // 부호 '/'인식때문에 \를써줌
		aDelete.innerHTML = "삭제 &nbsp";
		
		var aUpdate = document.createElement("a");
		aUpdate.href="";
		aUpdate.innerHTML="수정";
	
		spanUpDel.appendChild(aDelete);
		spanUpDel.appendChild(aUpdate);
		
		div.appendChild(spanBunho);
		div.appendChild(spanReply);
		div.appendChild(spanUpDel);
		
		listAllDiv.insertBefore(div , listAllDiv.childNodes[0]);
	
	}
	
}
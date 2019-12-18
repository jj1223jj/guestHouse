/**
 * 
 */

var root=null;

function upSelectToServer(bunho, requestRoot){
	root=requestRoot;
	
	var url=root+"/reply/replySelect.do";	
	var params="bunho="+bunho;
	
	//sendRequest("GET", url, upSelectFromServer, params);
	sendRequest("GET",url,upSelectFromServer,params);
}

function upSelectFromServer(){
	if(xhr.readyState==4 && xhr.status==200){
		var result=xhr.responseText.split(",");
		var bunho=result[0].trim();
		var reply=result[1].trim()
		
		// 새로운 inputTag 작성
		var div=document.createElement("div");
		div.id="upBunho"+bunho;
		
		var inputText=document.createElement("input");
		inputText.type="text";
		inputText.value=reply;
		
		var inputBtn=document.createElement("input");
		inputBtn.type="button";
		inputBtn.value="수정";
		inputBtn.onclick=function(){
			updateToServer(bunho, inputText.value);
		}
		
		div.appendChild(inputText);
		div.appendChild(inputBtn);
		
		var divBunho=document.getElementById(bunho);
		divBunho.appendChild(div);
	}
}

// 수정
function updateToServer(bunho, value){	
	var url=root+"/reply/replyUpdate.do";	
	var params="bunho="+bunho+"&lineReply="+value;
	
	sendRequest("POST", url, updateFromServer, params);
}

function updateFromServer(){
	if(xhr.readyState==4 && xhr.status==200){
		var result=xhr.responseText.split(",");
		var bunho=result[0].trim();
		var reply=result[1].trim();
		
		var bunhoDiv=document.getElementById(bunho);
		var updateDiv=document.getElementById("upBunho" + bunho);
		
		var span=bunhoDiv.getElementsByTagName("span");
		span[1].innerHTML=reply;
		bunhoDiv.removeChild(updateDiv);
	}
}
















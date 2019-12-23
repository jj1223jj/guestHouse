/**
 * 
 */




var page = 1;  //페이징과 같은 방식이라고 생각하면 된다. 
var proot = null;
var status = "house";
var exPage = 1;
var housePage = 1;

function rootPage(root) {
	 proot = root;
	 getList(housePage,proot,status);
	 housePage++;
 }
$(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
	$('#houseBtn').click(function() {
		$('#houseBtn').attr("selected", true);
		$('#exBtn').attr("selected", false);
		status = "house";
	});
	$('#exBtn').click(function() {
		$('#exBtn').attr("selected", true);
		$('#houseBtn').attr("selected", false);
		status = "ex";
		getList(exPage,proot,status);
	});
}); 

$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
     if($(window).scrollTop() >= $(document).height() - $(window).height()){
    	 if ($('#exBtn').attr("selected") == "selected") {
    		 getList(exPage,proot,status);
    		 exPage++;  
             alert("exPage: " + exPage);
    	 }
    	 if ($('#houseBtn').attr("selected") == "selected") {
    		 getList(housePage,proot,status);
    		 housePage++; 
             alert("housePage: " + housePage);
    	 } 
//          getList(page,proot);
//           page++;   
     } 
});
    
    function getList(page, root, status) {
    	alert("하" + root + page + status);
		var url = root + "/guestdelluna/scroll.do";
		var params = "page=" + page + "&status=" + status;
		
		sendRequest("GET", url, fromServer, params);
	}
	
	function fromServer() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var newDiv = document.createElement("div");
			newDiv.innerHTML = xhr.responseText;
			
			var scrollView = document.getElementById("scrollView");
			scrollView.appendChild(newDiv);
		}
	}



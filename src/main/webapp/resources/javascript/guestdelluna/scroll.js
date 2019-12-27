/**
 * 
 */




var page = 1;  //페이징과 같은 방식이라고 생각하면 된다. 
var proot = null;
var status = "house";
var housePage = 1;
var exPage = 1;

function rootPage(root, memberLevel) {
	proot = root;
	
	if (memberLevel != 'Host') {
		status = "myHouseReview";
		getList(myHousePage,proot,status);
		myHousePage++;
	}
	
	 getList(housePage,proot,status);
	 housePage++;
 }
$(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.

	$('#houseBtn').click(function() {
		$('#houseReview').css("display", "block");
		$('#exReview').css("display", "none");
		status = "house";
	});
	$('#exBtn').click(function() {
		$('#houseReview').css("display", "none");
		$('#exReview').css("display", "block");
		status = "ex";
	});
}); 

function moreView() {
	if (status == 'house') {
		 getList(housePage,proot,status);
		 housePage++; 
	 }   
	 if (status == 'ex') {
		 getList(exPage,proot,status);
		 exPage++;  
	 }
}

    
    function getList(page, root, status) {
    	//alert(root + page + status);
		var url = root + "/guestdelluna/scroll.do?";
		var params = "page=" + page + "&status=" + status;
//		if (status == 'house') sendRequest("GET", url, fromServerHouse, params);
//		if (status == 'ex') sendRequest("GET", url, fromServerEx, params);
		$.ajax({
			url: url + params,
			method: "get",
			success: function(data) {
				alert(data); 
				alert("ㅎㅇ");
			}
		});
		
		
	}
	
//	function fromServerHouse() {
//		//alert(xhr.readyState+", " + xhr.status);
//		if (xhr.readyState == 4 && xhr.status == 200) {
//			
//			var newDiv = document.createElement("div");
//			newDiv.innerHTML = xhr.responseText;
//			
//			var scrollView = document.getElementById("houseReview");
//			scrollView.appendChild(newDiv);
//		}
//	}
//	
//	function fromServerEx() {
//		//alert(xhr.readyState+", " + xhr.status);
//		if (xhr.readyState == 4 && xhr.status == 200) {
//			
//			var newDiv = document.createElement("div");
//			newDiv.innerHTML = xhr.responseText;
//			
//			var scrollView = document.getElementById("exReview");
//			scrollView.appendChild(newDiv);
//		}
//	}

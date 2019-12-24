/**
 * 
 */




var page = 1;  //페이징과 같은 방식이라고 생각하면 된다. 
var proot = null;
var status = "house";
var housePage = 1;
var exPage = 1;
var myHousePage = 1;
var myExPage = 1;

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
		$('#myHouseReview').css("display", "none");
		$('#myExReview').css("display", "none");
		status = "house";
	});
	$('#exBtn').click(function() {
		$('#houseReview').css("display", "none");
		$('#exReview').css("display", "block");
		$('#myHouseReview').css("display", "none");
		$('#myExReview').css("display", "none");
		status = "ex";
	});
	$('#myHouseBtn').click(function() {
		$('#houseReview').css("display", "none");
		$('#exReview').css("display", "none");
		$('#myHouseReview').css("display", "block");
		$('#myExReview').css("display", "none");
		status = "myHouseReview";
	});
	$('#myExBtn').click(function() {
		$('#houseReview').css("display", "none");
		$('#exReview').css("display", "none");
		$('#myHouseReview').css("display", "none");
		$('#myExReview').css("display", "block");
		status = "myExReview";
	});
}); 

$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
     if($(window).scrollTop() >= $(document).height() - $(window).height()){
    	 if (status == 'house') {
    		 getList(housePage,proot,status);
    		 housePage++; 
    	 }   
    	 if (status == 'ex') {
    		 getList(exPage,proot,status);
    		 exPage++;  
    	 }
    	 if (status == 'myHouseReview') {
    		 getList(myHousePage,proot,status);
    		 myHousePage++; 
    	 }   
    	 if (status == 'myExReview') {
    		 getList(myExPage,proot,status);
    		 myExPage++;  
    	 }
     } 
});
    
    function getList(page, root, status) {
    	//alert(root + page + status);
		var url = root + "/guestdelluna/scroll.do";
		var params = "page=" + page + "&status=" + status;
		if (status == 'house') sendRequest("GET", url, fromServerHouse, params);
		if (status == 'ex') sendRequest("GET", url, fromServerEx, params);
		if (status == 'myHouseReview') sendRequest("GET", url, fromServerMyHouse, params);
		if (status == 'myExReview') sendRequest("GET", url, fromServerMyEx, params);
	}
	
	function fromServerHouse() {
		//alert(xhr.readyState+", " + xhr.status);
		if (xhr.readyState == 4 && xhr.status == 200) {
			
			var newDiv = document.createElement("div");
			newDiv.innerHTML = xhr.responseText;
			
			var scrollView = document.getElementById("houseReview");
			scrollView.appendChild(newDiv);
		}
	}
	
	function fromServerEx() {
		//alert(xhr.readyState+", " + xhr.status);
		if (xhr.readyState == 4 && xhr.status == 200) {
			
			var newDiv = document.createElement("div");
			newDiv.innerHTML = xhr.responseText;
			
			var scrollView = document.getElementById("exReview");
			scrollView.appendChild(newDiv);
		}
	}
	function fromServerMyHouse() {
		//alert(xhr.readyState+", " + xhr.status);
		if (xhr.readyState == 4 && xhr.status == 200) {
			
			var newDiv = document.createElement("div");
			newDiv.innerHTML = xhr.responseText;
			
			var scrollView = document.getElementById("myHouseReview");
			scrollView.appendChild(newDiv);
		}
	}
	
	function fromServerMyEx() {
		//alert(xhr.readyState+", " + xhr.status);
		if (xhr.readyState == 4 && xhr.status == 200) {
			
			var newDiv = document.createElement("div");
			newDiv.innerHTML = xhr.responseText;
			
			var scrollView = document.getElementById("myExReview");
			scrollView.appendChild(newDiv);
		}
	}
	


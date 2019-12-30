/**
 * 
 */




var page = 1;  //페이징과 같은 방식이라고 생각하면 된다. 
var proot = null;
var status = "ex";
var housePage = 1;
var exPage = 1;

function rootPage(root, memberLevel) {
	proot = root;
	getList(exPage,proot,status);
	exPage++;
	
	status = "house";
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
		var url = root + "/guestdelluna/scroll.do?";
		var memberCode = document.getElementById("memberCode").value;
		//alert(memberCode);
		var params = "page=" + page + "&status=" + status + "&memberCode=" + memberCode;
		$.ajax({
			url: url + params,
			method: "get",
			async:false,
			success: function(data) {
				var json =data;
				console.log(json);
				for(var i=0;i<json.length;i++){
					var date=new Date("'"+json[i].revDate+"'");
					//alert(date.getFullYear());
					
					var tagData = '<div class="reviewDiv">'+
					'<div class="reviewL">'+
					'<p>'+ json[i].revDate+'</p>'+
					'<span class="reviewContent">'+json[i].revContent+'</span>'+
					'<a href="myInfo.do?memberCode='+ json[i].memberCode + '">' +
					'<div  class="reviewMemberImg">'+
					'<img alt="img loading"src="' + root + "/profileImg/" + json[i].memberImgName + '"/>' +
					'</div>'+
					'</a>' +
					'<span>' + json[i].memberName + '</span>'+
					'</div>'+
					'<div class="reviewR">'+
						'<a href="'+root+'/guestHousePage/guestHouse.do?houseCode='+ json[i].code + '">' +
						'<div class="reviewHouseImg">' +
							'<img alt="img loading" src="'+root+"/image/" + json[i].mainImgName + '"/>'+
						'</div>'+
						'</a>' +
						'<span>' + json[i].name+'</span>'+
					'</div>' +
				'</div>';
					if (status == 'house') {
						$("#houseReview").append(tagData);
					}
					if (status == 'ex') {
						$("#exReview").append(tagData);
					}
					
				}
			},
			error: function(jqXHR, textStatus, errorThrown){
				alert(jqXHR);
				alert(textStatus);
				alert(errorThrown);
			}
		
		});
		
		
	}
    
    
    

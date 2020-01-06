/**
 * 
 */

var page = 1; // 페이징과 같은 방식이라고 생각하면 된다.
var proot = null;
var status = "ex";
var housePage = 1;
var exPage = 1;

function rootPage(root, memberLevel) {
	proot = root;
	getList(exPage, proot, status);
	exPage++;

	status = "house";
	getList(housePage, proot, status);

	housePage++;
}
$(function() { // 페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.

	$('#houseBtn').click(function() {
		$('.houseReviewWrap').css("display", "block");
		$('.exReviewWrap').css("display", "none");
		$('#houseBtn').css("border-bottom", "0.2rem solid #008489");
		$('#exBtn').css("border-bottom", "none");
		status = "house";
	});
	$('#exBtn').click(function() {
		$('.houseReviewWrap').css("display", "none");
		$('.exReviewWrap').css("display", "block");
		$('#exBtn').css("border-bottom", "0.2rem solid #008489");
		$('#houseBtn').css("border-bottom", "none");
		status = "ex";
	});
	// //////////////////////////////////////////////////
	for (var i = 0; i < $('.house .houseDiv').length; i++) {
		$('.house .houseDiv').eq(i).css({
			'left' : i * 100 + '%'
		});
	}
	var index = 0;
	var width = $('.house .houseSlide').width();
	$('.house #btnL').click(function() {
		index--;
		console.log(index);
		$('.house .houseSlide').animate({
			'margin-left' : -index * width
		});
		if (index == 0)
			$('.house #btnL').hide();
		$('.house #btnR').show();
	});
	$('.house #btnR').click(function() {
		index++;
		console.log(index);
		$('.house .houseSlide').animate({
			'margin-left' : -index * width
		});
		if (index == ($('.houseList .houseDiv').length - 3))
			$('.house #btnR').hide();
		$('.house #btnL').show();
	});

	if (index == 0)
		$('.house #btnL').hide();
	if ($('.houseList .houseDiv').length < 4)
		$('.house #btnR').hide();
	// ////////////////////////////////////////////////

	for (var i = 0; i < $('.ex .houseDiv').length; i++) {
		$('.ex .houseDiv').eq(i).css({
			'left' : i * 100 + '%'
		});
	}
	var exIndex = 0;
	var width = $('.ex .houseSlide').width();
	$('.ex #btnL').click(function() {
		exIndex--;
		console.log(exIndex);
		$('.ex .houseSlide').animate({
			'margin-left' : -exIndex * width
		});
		if (exIndex == 0)
			$('.ex #btnL').hide();
		$('.ex #btnR').show();
	});
	$('.ex #btnR').click(function() {
		exIndex++;
		console.log(exIndex);
		$('.ex .houseSlide').animate({
			'margin-left' : -exIndex * width
		});
		if (exIndex == ($('.exList .houseDiv').length - 3))
			$('.ex #btnR').hide();
		$('.ex #btnL').show();
	});

	if (exIndex == 0)
		$('.ex #btnL').hide();
	if ($('.exList .houseDiv').length < 4)
		$('.ex #btnR').hide();
	// ///////////////////////////////////////////////////////
	if ($("#houseReview > .reviewDiv").length == 0)
		$('.houseReviewWrap > .moreViewDiv').hide();
	if ($("#exReview > .reviewDiv").length == 0)
		$('.exReviewWrap > .moreViewDiv').hide();

});

function moreView() {
	if (status == 'house') {
		getList(housePage, proot, status);
		housePage++;
	}
	if (status == 'ex') {
		getList(exPage, proot, status);
		exPage++;
	}
}

function getList(page, root, status) {
	var url = root + "/guestdelluna/scroll.do?";
	var memberCode = document.getElementById("memberCode").value;
	var houseReviewCount = document.getElementById("houseReviewCount").value;
	var exReviewCount = document.getElementById("exReviewCount").value;
	// alert(memberCode);
	var params = "page=" + page + "&status=" + status + "&memberCode="
			+ memberCode;
	$
			.ajax({
				url : url + params,
				method : "get",
				async : false,
				success : function(data) {
					var json = data;
					console.log(json);
					for (var i = 0; i < json.length; i++) {
						var day = new Date(json[i].revDate.toString());
						var code;
						var imgTag;
						var mainImgName;
						if (json[i].memberImgName == null) {
							imgTag = '<img alt="img loading"src="'
									+ root
									+ '/resources/css/host/user.png" style="margin-top: 1rem;"/>'
						}
						if (json[i].memberImgName != null) {
							imgTag = '<img alt="img loading"src="' + root
									+ "/profileImg/" + json[i].memberImgName
									+ '"/>'
						}
						if (status == 'house') {
							code = '<a href="'
									+ root
									+ '/guestHousePage/guestHouse.do?houseCode='
									+ json[i].code + '">';
							mainImgName = '<img alt="img loading" src="' + root
									+ "/image/" + json[i].mainImgName + '"/>';
						}
						if (status == 'ex') {
							code = '<a href="' + root
									+ '/experience/exPage.do?exCode='
									+ json[i].code + '">';
							mainImgName = '<img alt="img loading" src="' + root
									+ "/ex/" + json[i].mainImgName + '"/>';
						}
						var tagData = '<div class="reviewDiv">'
								+ '<div class="reviewL">' + '<p>'
								+ json[i].revDate
								+ '</p>'
								+ '<span class="reviewContent">'
								+ json[i].revContent
								+ '</span>'
								+ '<a href="myInfo.do?memberCode='
								+ json[i].memberCode
								+ '">'
								+ '<div  class="reviewMemberImg">'
								+ imgTag
								+ '</div>'
								+ '</a>'
								+ '<span>'
								+ json[i].memberName
								+ '</span>'
								+ '</div>'
								+ '<div class="reviewR">'
								+ code
								+ '<div class="reviewHouseImg">'
								+ mainImgName
								+ '</div>'
								+ '</a>'
								+ '<span>'
								+ json[i].name
								+ '</span>' + '</div>' + '</div>';
						if (status == 'house') {
							$("#houseReview").append(tagData);
							if ($("#houseReview > .reviewDiv").length == houseReviewCount) {
								$('.houseReviewWrap > .moreViewDiv').hide();
							}
						}
						if (status == 'ex') {
							$("#exReview").append(tagData);
							if ($("#exReview > .reviewDiv").length == exReviewCount) {
								$('.exReviewWrap > .moreViewDiv').hide();
							}
						}

					}

				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert(jqXHR);
					alert(textStatus);
					alert(errorThrown);
				}

			});

}

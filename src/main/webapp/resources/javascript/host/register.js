function profileUpload() {
	$("#profileImg").trigger("click");
}
$(document).ready(function(){
	$("#profileImg").on("change", function(e){
		var file = e.target.files[0];
		if (!file.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			return false;
		}
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#profileView').attr('src', e.target.result);
			$('.profileDiv').attr('background', none);
		}
		reader.readAsDataURL(file);
	});
});


function mainUpload() {
	$("#mainImg").trigger("click");
}
function mainImgPreview(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function(e) {
			var fileNm = $("#mainImg").val();
			var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();
			 
		    if (!(ext == "gif" || ext == "jpg" || ext == "png")) {
		        alert("확장자는 이미지 확장자만 가능합니다.");
		        $("#mainImgDiv").empty();
		        return false;
		    }else {
		    	$('#mainImgView').attr('src', e.target.result);
//		    	alert(e.target.result);
//		    	$('#mainImgView').css({
//		    		'width': '320px'
//		    	});
		    }
			// alert(e.target.result);
		}

		reader.readAsDataURL(input.files[0]);
	}
}


function subUpload() {
	$("#subImg").trigger("click");
}
var sel_files = [];
$(document).ready(function(){
		$("#subImg").on("change", handleImgFileSelect);
});

function handleImgFileSelect(e) {
	sel_files = [];
	$(".subImgDiv").empty();
	
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	var index = 0;
	
	filesArr.forEach(function(f) {
		if(!f.type.match("image.*")	) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			return false;
		}
		
		sel_files.push(f);
		
		var reader = new FileReader();
		reader.onload = function(e) {
			//var html = "<a href=\"javascript:void(0);\" onclick=\'deleteImageAction("+index+")'\" id=\img_id_"+index+"\"><img src=\""+ e.target.result + "\" data-file='"+f.name+"' class='selProductFile' tilte='Click to remove'></a>";
			var html = "<a href=\"javascript:void(0);\" onclick=\'deleteImageAction("+index+")'\" id=\img_id_"+index+"\><img src=\""+ e.target.result + "\" data-file='"+f.name+"' class='selProductFile' tilte='Click to remove'/></a>";
			$(".subImgDiv").append(html);
			index++;
		}
		reader.readAsDataURL(f);
	});
}

function houseNameCheck(root) {
	var houseName = document.getElementById('houseName');
	if (houseName.value == "") {
		alert("숙소이름을 입력해주세요.")
		houseName.focus();
		return false;
	}
	var url = root + "/host/houseNameCheck.do?";
	var params = "houseName=" + houseName.value;
	$.ajax({
		url: url + params,
		method: "get",
		success: function(data) {
			var text;
			if (data == 0) {
				text = '사용가능한 숙소 이름입니다.';
			} else {
				text = '이미 존재하는 숙소 이름입니다.';
				houseName.focus();
			}
			$('.houseCheckBox').text(text);
		},
		error: function(jqXHR, textStatus, errorThrown){
			alert(jqXHR);
			alert(textStatus);
			alert(errorThrown);
		}
	
	});
}

function register() {
	var profileImg = document.getElementById("profileImg");
	var memberInfo = document.getElementById("memberInfo");
	var houseName = document.getElementById("houseName");
	var zipCode = document.getElementById("zipCode");
	var roadAddress = document.getElementById("sample4_roadAddress");
	var jibunAddress = document.getElementById("sample4_jibunAddress");
	var detailAddress = document.getElementById("detailAddress");
	var mainImg = document.getElementById("mainImg");
	var subImg = document.getElementById("subImg");
	var people = document.getElementById("people");
	var bed = document.getElementById("bed");
	var bath = document.getElementById("bath");
	var explain = document.getElementById("explain");
	var checkInHH = document.getElementById("checkInHH");
	var checkInMM = document.getElementById("checkInMM");
	var checkOutHH = document.getElementById("checkOutHH");
	var checkOutMM = document.getElementById("checkOutMM");
	var bank = document.getElementById("bank");
	var account = document.getElementById("account");
	var price = document.getElementById("price");
	var etc = document.getElementById("etc");
	var regex= /[^0-9]/g;
	
	
	if (profileImg.value == "") {
		alert("프로필 사진을 선택해주세요");
		return false;
	}
	
	if (memberInfo.value.length < 10) {
		alert("소개를 10자 이상 입력해주세요.");
		memberInfo.focus();
		return false;
	}
	if (houseName.value.length < 5) {
		alert("숙소이름을 5자이상 입력해주세요");
		houseName.focus();
		return false;
	}
	if (zipCode.value == "") {
		alert("우편번호를 다시 선택해주세요.");
		zipCode.focus();
		return false;
	}
	if (detailAddress.value == "") {
		alert("상세주소를 입력해주세요.");
		detailAddress.focus();
		return false;
	}
	if (mainImg.value == "") {
	alert("숙소의 메인사진을 선택해주세요");
	return false;
	}
	if (subImg.files.length < 4) {
		alert("숙소의 사진을 4개이상 첨부해주세요.");
		return false;
	}
	if (people == "") {
		alert("인원 수를 입력해주세요.");
		people.focus();
		return false;
	}
	if (bed == "") {
		alert("침대 수를 입력해주세요.");
		bed.focus();
		return false;
	}
	if (bath == "") {
		alert("욕실 수를 입력해주세요.");
		bath.focus();
		return false;
	}
	if (explain.value.length < 10) {
	alert("설명을 10자 이상 입력해주세요.");
	explain.focus();
	return false;
	}
	if (checkInHH.value == "선택하세요" || checkInMM.value == "선택하세요" ||
			checkOutHH.value == "선택하세요" || checkOutMM.value == "선택하세요" ) {
		alert("체크인 - 체크아웃 시간을 정확하게 입력해주세요.");
		return false;
	}
	if (regex.test(account.value)) {
		alert("계좌번호는 "-"을 제외한 숫자만 입력해주세요.");
		account.focus();
		return false;
	}
	if (regex.test(price.value)) {
	alert("");
	account.focus();
	return false;
	}

}


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
			//alert(e.target.result);
			$('#profileView').css({
				'width': '300px'
			});
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
		    	//alert(e.target.result);
		    	$('#mainImgView').css({
		    		'width': '19rem'
		    			
		    	});
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
			var html = "<a href=\"javascript:void(0);\" onclick=\'deleteImageAction("+index+")'\" id=\img_id_"+index+"\><img src=\""+ e.target.result + "\" data-file='"+f.name+"' class='selProductFile' tilte='Click to remove' width='130px'/></a>";
			$(".subImgDiv").append(html);
			index++;
		}
		reader.readAsDataURL(f);
	});
}

function registerEx(){
	 //<!-- '${exName}','${exAddress}','${mainImg}','${subImg}','${exPeople}','${exTime}','${exExplain}','${exStartDateS}','${exEndDateS}','${exBank}','${exAccount}','${exPrice}' -->

		var exName = $('#exName').val();
		var exAddress = $('#exAddress').val();
		var mainImg = $('#mainImg').val();
		var subImg = $('#subImg').val();
		var exPeople = $('#exPeople').val();
		var exTime = $('#exTime').val();
		var exExplain = $('#exExplain').val();
		var exStartDateS = $('#exStartDateS').val();
		var exEndDateS = $('#exEndDateS').val();
		var exBank = $('#exBank').val();
		var exAccount = $('#exAccount').val();
		var exPrice = $('#exPrice').val();
	 
	 if(exName ==''){
			alert("체험 이름을 작성해주세요.");
			$('#exName').focus();
			return false;
		}else if(exAddress ==''){
			alert("주소를 선택해주세요.");
			return false;
		}else if(mainImg ==''){
			alert("체험의 메인 이미지를 선택해주세요.");
			return false;
		}else if(subImg ==''){
			alert("체험의 다양한 이미지를 선택해주세요.");
			return false;
		}else if(exPeople ==''){
			alert("체험인원을 작성해주세요.");
			$('#exPeople').focus();
			return false;
		}else if(exTime ==''){
			alert("체험 진행 시간을 작성해주세요.");
			$('#exTime').focus();
			return false;
		}else if(exExplain ==''){
			alert("체험에 대한 상세 설명을 작성해주세요.");
			$('#exExplain').focus();
			return false;
		}else if(exStartDateS ==''){
			alert("체험 시작 날짜를 선택해주세요.");
			return false;
		}else if(exEndDateS ==''){
			alert("체험 종료 날짜를 선택해주세요.");
			return false;
		}else if(exBank ==''){
			alert("입금을 받을 은행을 선택해주세요.");
			return false;
		}else if(exAccount ==''){
			alert("입금을 받을 계좌번호를 작성해주세요.");
			$('#exAccount').focus();
			return false;
		}else if(exPrice ==''){
			alert("이 체험의 가격을 작성해주세요.");
			$('#exPrice').focus();
			return false;
		}
}


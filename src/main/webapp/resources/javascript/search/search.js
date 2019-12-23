/**
 * 
 */
var root;
function setRoot(r){
	root=r;
}
function setCheckIn(checkIn){
	$("#checkIn").prop("placeholder",checkIn);
	$("#checkIn").prop("value",checkIn);
}

function setCheckOut(checkOut){
	$("#checkOut").prop("placeholder",checkOut);
	$("#checkOut").prop("value",checkOut);
}

function checkBoxSetting(){
	// 지역선택 체크박스 전체와 나머지 클릭했을 때 어떻게 동작할지 처리
	$(".all").click(function(){
		if($(".all:checkbox").is(":checked")){
			$(".etc:checkbox").prop("checked", false);
		}
	});
	$(".etc").click(function(){
		if($(".etc:checkbox").is(":checked")){
			$(".all:checkbox").prop("checked", false);
		}
	});
}

function dateToString(date){
	//date타입을 "yyyy-mm-dd"형식 문자열로 바꿔주는 함수
	return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
}

//하트 클릭
function heart(memberCode){
	if(memberCode!='') {
		$("._r0agyd").click(function(){
			var heart=$(this).attr("class").split(" ")[1];
			var data;
			if($("."+heart).children().attr("fill")=="currentColor"){
				$("."+heart).children().attr("fill", "#FF385C");
				$("."+heart).children().attr("fill-opacity", "1");
				$("."+heart).children().attr("stroke","#FF385C");
				$("."+heart).children().attr("stroke-width","1");
				data= { memberCode: memberCode, zzim: memberCode, houseCode: $(this).parent().children("div[class='houseCode']").text()};
			}else{
				$("."+heart).children().attr("fill", "currentColor");
				$("."+heart).children().attr("fill-opacity", "0");
				$("."+heart).children().attr("stroke","#222222");
				$("."+heart).children().attr("stroke-width","1.4");
				data= { memberCode: memberCode, houseCode: $(this).parent().children("div[class='houseCode']").text()};
			}
			//$(this).parent(".overlaybox").css("display","block");
			$.ajax({
				  method: "GET",
				  url: root+"/guestdelluna/zzim.do",
				  data: data,
				  success: function(){
				  },
				  error: function(){
				  }
				})
			
		});
	}else{
		$("._r0agyd").click(function(){
			//alert( $("#price" ).slider( "values" ));
			alert("로그인 해주세요");
			//로그인 모달 띄워주기
		});
	}
}
function heart2(memberCode){
	if(memberCode!='') {
		$("._r0agyd").click(function(){
			console.log($(this).parent().children("div[class='houseCode']").text());
			var data;
			if($(this).children().attr("fill")=="currentColor"){
				$(this).children().attr("fill", "#FF385C");
				$(this).children().attr("fill-opacity", "1");
				$(this).children().attr("stroke","#FF385C");
				$(this).children().attr("stroke-width","1");
				data= { memberCode: memberCode, zzim: memberCode, houseCode: $(this).parent().children("div[class='houseCode']").text()};
			}else{
				$(this).children().attr("fill", "currentColor");
				$(this).children().attr("fill-opacity", "0");
				$(this).children().attr("stroke","#222222");
				$(this).children().attr("stroke-width","1.4");
				data= { memberCode: memberCode, houseCode: $(this).parent().children("div[class='houseCode']").text()};
			}
			$(this).parent(".overlaybox").css("display","block");
			$.ajax({
				  method: "GET",
				  url: root+"/guestdelluna/zzim.do",
				  data: data,
				  success: function(){
				  },
				  error: function(){
				  }
				})
			
		});
	}else{
		$("._r0agyd").click(function(){
			alert("로그인 해주세요");
			//로그인 모달 띄워주기
		});
	}
}
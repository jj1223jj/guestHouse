/**
 * 
 */

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
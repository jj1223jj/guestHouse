/**
 * 
 */
var root;
function setRoot(r){
	root=r;
}


function setSearchType(searchType,form){
	console.log(form);
	var checkIn = form.checkIn.value;
	var checkOut = form.checkOut.value;
	var local = form.local.value;
	var people = form.people.value;
	//alert(checkIn);
	//alert(checkOut);
	//alert(local);
	//alert(people);
	//console.log(form.local);
    var guestHouseControl = document.getElementById('btnGuestHouse');
    var experienceControl = document.getElementById('btnExperience'); 
    if (searchType === 'guestHouse') {
    	location.href=root+'/search?checkIn='+checkIn+'&checkOut='+checkOut+'&local='+local+'&people='+people+'&searchHouseName=';
        //alert("to GuestHouse");
        //alert(window.location.href);
        //guestHouseControl.className = 'selected_btn';
        //experienceControl.className = '_exbtn';
    } else {
    	//alert("to Experience");
    	//alert(root+"/experience?"+window.location.href.substring(window.location.href.lastIndexOf("checkIn")));
    	location.href=root+'/experience?checkIn='+checkIn+'&checkOut='+checkOut+'&local='+local+'&people='+people+'&searchExName=';
        //experienceControl.className = 'selected_btn';
        //guestHouseControl.className = '_exbtn';
    }
}


function setMarker(house, map, num){
	var marker = [];
	var position = [];
	var bounds = new kakao.maps.LatLngBounds();
	
	var imageSrc = root+'/image/h'+num+'.png', // 마커이미지의 주소입니다
    imageSize = new kakao.maps.Size(50, 50), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(21,39)};
	
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	
	// 반복문 돌려서 집들의 위치 저장하기
	for(let i=0; i<house.length;i++){
		position[i]= new kakao.maps.LatLng(house[i].lat,house[i].lng);
		bounds.extend(position[i]);
		//alert(position[i]);
		
		marker[i]= new kakao.maps.Marker({
			map: map,
			position: position[i],
			image: markerImage,
		});
	}
	map.setBounds(bounds);
	map.setLevel(10);
	return marker;
	
}


function setHouseList(house, memberCode){
	for(let i=0;i<house.length;i++){
		var houseContent=
		'<div class="house house'+i+'">' +
		'		<div class="_gig1e7">' +
		'			<div class="_ylefn59">' +
		'				<div class="_houseCode" style="display:none;">'+house[i].houseCode+'</div>' +
		'				<div class="_houseImg">' +
		'					<div class="swiper-container">' +
		'						<div class="swiper-wrapper">';
		for(let j=0;j<house[i].fileList.length;j++){
			houseContent+=
		'							<div class="swiper-slide"><img style="max-width:100%; height:auto;" alt="img loading" src="'+root+'/image/'+house[i].fileList[j].fileName+'"/></div>';		
		}
		houseContent+=
		'						</div>' +
		'						<div class="swiper-pagination"></div>' +
		'						<div class="swiper-button-next"></div>' +
		'						<div class="swiper-button-prev"></div>' +
		'					</div>' +
		'					<div class="_heartButton _heartButton'+i+'">';
		if(memberCode>0){
			if(house[i].zzimed==null){
				houseContent+=
		'						<button aria-label="목록에 숙소 추가하기" type="button" class="_heart _r0agyd heart'+i+'"><svg viewBox="0 0 24 24" fill="currentColor" fill-opacity="0" stroke="#222222" stroke-width="1.4" focusable="false" aria-hidden="true" role="presentation" stroke-linecap="round" stroke-linejoin="round" style="height: 1.3rem; width: 1.3rem; display: block; overflow: visible;"><path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path></svg></button>';
			}else{
				houseContent+=
		'						<button aria-label="목록에 숙소 추가하기" type="button" class="_heart _r0agyd heart'+i+'"><svg viewBox="0 0 24 24" fill="#FF385C" fill-opacity="1" stroke="#FF385C" stroke-width="1" focusable="false" aria-hidden="true" role="presentation" stroke-linecap="round" stroke-linejoin="round" style="height: 1.3rem; width: 1.3rem; display: block; overflow: visible;"><path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path></svg></button>';
			}
		}else{
			houseContent+=
		'						<button data-toggle="modal" data-target="#login" aria-label="목록에 숙소 추가하기" type="button" class="_heart _r0agyd heart'+i+'"><svg viewBox="0 0 24 24" fill="currentColor" fill-opacity="0" stroke="#222222" stroke-width="1.4" focusable="false" aria-hidden="true" role="presentation" stroke-linecap="round" stroke-linejoin="round" style="height: 1.3rem; width: 1.3rem; display: block; overflow: visible;"><path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path></svg></button>';
		}
		houseContent+=
		'					</div>' +
		'				</div>' +
		'				<a href="'+root+'/guestHousePage/guestHouse.do?houseCode='+house[i].houseCode+'" style="display:block;">' +
		'					<div class="_houseInfo">' +
		'						<div class="_starRate"><span class="_60dc7z"><span class="_starImg"><svg viewBox="0 0 1000 1000" role="presentation" aria-hidden="true" focusable="false" style="height:0.75rem;width:0.75rem;fill:#FF385C"><path d="M972 380c9 28 2 50-20 67L725 619l87 280c11 39-18 75-54 75-12 0-23-4-33-12L499 790 273 962a58 58 0 0 1-78-12 50 50 0 0 1-8-51l86-278L46 447c-21-17-28-39-19-67 8-24 29-40 52-40h280l87-279c7-23 28-39 52-39 25 0 47 17 54 41l87 277h280c24 0 45 16 53 40z"></path></svg></span><span class="_reviewRate"> '+house[i].revRate+'</span><span class="_reviewCount">('+house[i].revCount+')</span></span></div>' +
		'						<div class="_houseName">'+ house[i].houseName +'</div>' +
		'						<div class="_houseFacilities" style="margin-top: 0.75rem">인원 '+house[i].people+'명 · 침대 '+house[i].bed+'개 · 욕실 '+house[i].bath+'개</div>' +
		'						<div class="_houseFacilities" style="margin-top: 0.25rem"> ';
		if(house[i].hotWater!=null){
			houseContent+= '온수';
		}
		if(house[i].parking!=null){
			houseContent+= ' · 무료주차공간';
		}
		if(house[i].aircon!=null){
			houseContent+= ' · 냉난방';
		}
		if(house[i].kitchen!=null){
			houseContent+= ' · 주방';
		}
		if(house[i].wifi!=null){
			houseContent+= ' · WIFI';
		}
		if(house[i].tv!=null){
			houseContent+= ' · TV';
		}
		if(house[i].mart!=null){
			houseContent+= ' · 마트';
		}
		if(house[i].safety!=null){
			houseContent+= ' · 안전시설';
		}
		houseContent+= 			'</div>' +
		'						<div class="_priceContainer"><span class="_price">₩'+house[i].price+'</span><span class="_oneNight">/1박</span></div>' +
		'					</div>' +
		'				</a>' +
		'			</div>' +
		'		</div>' +
		'</div>'
		
		$(".houseContainer").append(houseContent);
		
	}
	
}
function setExList(ex, memberCode, checkIn, checkOut, people){
	for(let i=0;i<ex.length;i++){
		var exContent=
			'<div class="house house'+i+'">' +
			'		<div class="_gig1e7">' +
			'			<div class="_ylefn59">' +
			'				<div class="_houseCode" style="display:none;">'+ex[i].exCode+'</div>' +
			'				<div class="_houseImg">' +
			'					<div class="swiper-container">' +
			'						<div class="swiper-wrapper">';
		for(let j=0;j<ex[i].exFileList.length;j++){
			exContent+=
				'							<div class="swiper-slide"><img style="max-width:100%; height:auto;" alt="img loading" src="'+root+'/ex/'+ex[i].exFileList[j].exFileName+'"/></div>';		
		}
		exContent+=
			'						</div>' +
			'						<div class="swiper-pagination"></div>' +
			'						<div class="swiper-button-next"></div>' +
			'						<div class="swiper-button-prev"></div>' +
			'					</div>' +
			'					<div class="_heartButton _heartButton'+i+'">';
		if(memberCode>0){
			if(ex[i].zzimed==null){
				exContent+=
					'						<button aria-label="목록에 숙소 추가하기" type="button" class="_heart _r0agyd heart'+i+'"><svg viewBox="0 0 24 24" fill="currentColor" fill-opacity="0" stroke="#222222" stroke-width="1.4" focusable="false" aria-hidden="true" role="presentation" stroke-linecap="round" stroke-linejoin="round" style="height: 1.3rem; width: 1.3rem; display: block; overflow: visible;"><path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path></svg></button>';
			}else{
				exContent+=
					'						<button aria-label="목록에 숙소 추가하기" type="button" class="_heart _r0agyd heart'+i+'"><svg viewBox="0 0 24 24" fill="#FF385C" fill-opacity="1" stroke="#FF385C" stroke-width="1" focusable="false" aria-hidden="true" role="presentation" stroke-linecap="round" stroke-linejoin="round" style="height: 1.3rem; width: 1.3rem; display: block; overflow: visible;"><path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path></svg></button>';
			}
		}else{
			exContent+=
				'						<button data-toggle="modal" data-target="#login" aria-label="목록에 숙소 추가하기" type="button" class="_heart _r0agyd heart'+i+'"><svg viewBox="0 0 24 24" fill="currentColor" fill-opacity="0" stroke="#222222" stroke-width="1.4" focusable="false" aria-hidden="true" role="presentation" stroke-linecap="round" stroke-linejoin="round" style="height: 1.3rem; width: 1.3rem; display: block; overflow: visible;"><path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path></svg></button>';
		}
		exContent+=
			'					</div>' +
			'				</div>' +
			'				<a href="'+root+'/experience/exPage.do?exCode='+ex[i].exCode+'&checkIn='+checkIn+'&checkOut='+checkOut+'&people='+people+'" style="display:block;">' +
			'					<div class="_houseInfo">' +
			'						<div class="_starRate"><span class="_60dc7z"><span class="_starImg"><svg viewBox="0 0 1000 1000" role="presentation" aria-hidden="true" focusable="false" style="height:0.75rem;width:0.75rem;fill:#FF385C"><path d="M972 380c9 28 2 50-20 67L725 619l87 280c11 39-18 75-54 75-12 0-23-4-33-12L499 790 273 962a58 58 0 0 1-78-12 50 50 0 0 1-8-51l86-278L46 447c-21-17-28-39-19-67 8-24 29-40 52-40h280l87-279c7-23 28-39 52-39 25 0 47 17 54 41l87 277h280c24 0 45 16 53 40z"></path></svg></span><span class="_reviewRate"> '+ex[i].revRate+'</span><span class="_reviewCount">('+ex[i].revCount+')</span></span></div>' +
			'						<div class="_houseName">'+ ex[i].exName +'</div>' +
			'						<div class="_houseFacilities" style="margin-top: 0.75rem">인원 '+ex[i].people+'명</div>' +
			'						<div class="_houseFacilities" style="margin-top: 0.25rem">일정 '+ex[i].exStartDate+' ~ '+ex[i].exEndDate+'</div>' +
			'						<div class="_houseFacilities" style="margin-top: 0.25rem">진행시간 '+ex[i].exTime+'h</div>' +
			'						<div class="_priceContainer"><span class="_price">₩'+ex[i].price+'</span><span class="_oneNight">/1회</span></div>' +
			'					</div>' +
			'				</a>' +
			'			</div>' +
			'		</div>' +
			'</div>'
			
			$(".houseContainer").append(exContent);
		
	}
	
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

function dateToString(fullDate){
	//date타입을 "yyyy-mm-dd"형식 문자열로 바꿔주는 함수
	var month=(fullDate.getMonth()+1).toString();
	var date=fullDate.getDate().toString();
	if(month.length==1){
		month="0"+month.toString();
	}
	if(date.length==1){
		date="0"+date.toString();
	}
	return fullDate.getFullYear()+"-"+month+"-"+date;
}

//하트 클릭
function heart(memberCode){
	
	$("._heartButton").attr('onclick', '').unbind('click');

	
	$("._heartButton").click(function(){
		if(memberCode!='') {
			var button = $(this).attr("class").split(" ")[1];
			var heart=$("."+button).children().children();
			console.log(heart);
			var data;
			var houseCode=$(this).parent().parent().children("div[class='_houseCode']").text();
			if(heart.attr("fill")=="currentColor"){
				heart.attr("fill", "#FF385C");
				heart.attr("fill-opacity", "1");
				heart.attr("stroke","#FF385C");
				heart.attr("stroke-width","1");
				data= { memberCode: memberCode, zzim: memberCode, houseCode: houseCode};
			}else{
				heart.attr("fill", "currentColor");
				heart.attr("fill-opacity", "0");
				heart.attr("stroke","#222222");
				heart.attr("stroke-width","1.4");
				data= { memberCode: memberCode, houseCode: houseCode};
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
			
		}else{
				//alert( $("#price" ).slider( "values" ));
				console.log("로그인해주세요");
				//로그인 모달 띄워주기
		}
	});
}
function exHeart(memberCode){
	
	$("._heartButton").attr('onclick', '').unbind('click');
	
	
	$("._heartButton").click(function(){
		if(memberCode!='') {
			var button = $(this).attr("class").split(" ")[1];
			var heart=$("."+button).children().children();
			console.log(heart);
			var data;
			var houseCode=$(this).parent().parent().children("div[class='_houseCode']").text();
			if(heart.attr("fill")=="currentColor"){
				heart.attr("fill", "#FF385C");
				heart.attr("fill-opacity", "1");
				heart.attr("stroke","#FF385C");
				heart.attr("stroke-width","1");
				data= { memberCode: memberCode, zzim: memberCode, houseCode: houseCode};
			}else{
				heart.attr("fill", "currentColor");
				heart.attr("fill-opacity", "0");
				heart.attr("stroke","#222222");
				heart.attr("stroke-width","1.4");
				data= { memberCode: memberCode, houseCode: houseCode};
			}
			//$(this).parent(".overlaybox").css("display","block");
			$.ajax({
				method: "GET",
				url: root+"/guestdelluna/exZzim.do",
				data: data,
				success: function(){
				},
				error: function(){
				}
			})
			
		}else{
			//alert( $("#price" ).slider( "values" ));
			console.log("로그인해주세요");
			//로그인 모달 띄워주기
		}
	});
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
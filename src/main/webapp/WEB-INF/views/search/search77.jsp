<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
        var map= setMap();
        var marker= setMarker(house,map);
        var content =
        '<div class="_overlaybox">' +
        '    <div class="_shadowOverlaybox">' +
        '        <div class="_houseCode" style="display:none;">'+house[0].houseCode+'</div>' +
         '        <div class="_overlayImgContainer">' +
        '            <div class="swiper-container">' +
        '                <div class="swiper-wrapper">'+
        '                    <div class="swiper-slide"><img style="max-width:100%; height:auto;" alt="img loading" src="'+root+'/image/house1.png"/></div>' +        
        '                </div>' +
        '                <div class="swiper-pagination"></div>' +
        '                <div class="swiper-button-next"></div>' +
        '                <div class="swiper-button-prev"></div>' +
        '            </div>' +
        '            <div class="_heartButton">' +
        '                <button aria-label="목록에 숙소 추가하기" type="button" class="_heart _r0agyd heart${index.index}"><svg viewBox="0 0 24 24" fill="currentColor" fill-opacity="0" stroke="#222222" stroke-width="1.4" focusable="false" aria-hidden="true" role="presentation" stroke-linecap="round" stroke-linejoin="round" style="height: 1.3rem; width: 1.3rem; display: block; overflow: visible;"><path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path></svg></button>' +
        '            </div>' +
         '        </div>' +
         '        <div class="_overlayInfoContainer">' +
         '            <div class="_overlayReviewContainer">' +
         '                <span class="_starImg"><svg viewBox="0 0 1000 1000" role="presentation" aria-hidden="true" focusable="false" style="height:0.75rem;width:0.75rem;fill:#FF385C"><path d="M972 380c9 28 2 50-20 67L725 619l87 280c11 39-18 75-54 75-12 0-23-4-33-12L499 790 273 962a58 58 0 0 1-78-12 50 50 0 0 1-8-51l86-278L46 447c-21-17-28-39-19-67 8-24 29-40 52-40h280l87-279c7-23 28-39 52-39 25 0 47 17 54 41l87 277h280c24 0 45 16 53 40z"></path></svg></span><span class="_reviewRate"> 4.5</span><span class="_reviewCount">(163)</span>' +
         '             </div>' +
         '            <div class="_houseName">지연게하</div>' +
         '            <div class="_houseFacilities">인원 3명</div>' +
         '        </div>' +
        '    </div>' +
        '    <div class="_overlayEdge"></div>' +
        '</div>';

        // 커스텀 오버레이가 표시될 위치입니다 
    


        });
        customOverlay.setMap(map);
        
        var overlayContent=[];
        for(let i=0; i<house.length;i++){
            overlayContent[i]=
                '<div class="_overlaybox">' +
                '    <div class="_shadowOverlaybox">' +
                '        <div class="_houseCode" style="display:none;">'+house[i].houseCode+'</div>' +
                 '        <div class="_overlayImgContainer">' +
                '            <div class="swiper-container">' +
                '                <div class="swiper-wrapper">';
                for(let j=0;j<house[i].fileList.length;j++){
                    overlayContent[i]+=
                '                    <div class="swiper-slide"><img style="max-width:100%; height:auto;" alt="img loading" src="'+root+'/image/'+house[i].fileList[j].fileName+'"/></div>';        
                }
                overlayContent[i]+=
                '                </div>' +
                '                <div class="swiper-pagination"></div>' +
                '                <div class="swiper-button-next"></div>' +
                '                <div class="swiper-button-prev"></div>' +
                '            </div>' +
                '            <div class="_heartButton _heartButton'+i+'">';

                if('${memberCode}'>0){
                    if(house[i].zzimed!=null){
                        overlayContent[i]+=
                '                <button aria-label="목록에 숙소 추가하기" type="button" class="_heart _r0agyd heart'+i+'"><svg viewBox="0 0 24 24" fill="#FF385C" fill-opacity="1" stroke="#FF385C" stroke-width="1" focusable="false" aria-hidden="true" role="presentation" stroke-linecap="round" stroke-linejoin="round" style="height: 1.3rem; width: 1.3rem; display: block; overflow: visible;"><path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path></svg></button>';
                    }else{
                        overlayContent[i]+=
                '                <button aria-label="목록에 숙소 추가하기" type="button" class="_heart _r0agyd heart'+i+'"><svg viewBox="0 0 24 24" fill="currentColor" fill-opacity="0" stroke="#222222" stroke-width="1.4" focusable="false" aria-hidden="true" role="presentation" stroke-linecap="round" stroke-linejoin="round" style="height: 1.3rem; width: 1.3rem; display: block; overflow: visible;"><path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path></svg></button>';
                }else{
                    overlayContent[i]+=
                '                <button data-toggle="modal" data-target="#login" aria-label="목록에 숙소 추가하기" type="button" class="_heart _r0agyd heart'+i+'"><svg viewBox="0 0 24 24" fill="currentColor" fill-opacity="0" stroke="#222222" stroke-width="1.4" focusable="false" aria-hidden="true" role="presentation" stroke-linecap="round" stroke-linejoin="round" style="height: 1.3rem; width: 1.3rem; display: block; overflow: visible;"><path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path></svg></button>';
                }
//                 overlayContent[i]+=
//                 '                <button aria-label="목록에 숙소 추가하기" type="button" class="_heart _r0agyd heart${index.index}"><svg viewBox="0 0 24 24" fill="currentColor" fill-opacity="0" stroke="#222222" stroke-width="1.4" focusable="false" aria-hidden="true" role="presentation" stroke-linecap="round" stroke-linejoin="round" style="height: 1.3rem; width: 1.3rem; display: block; overflow: visible;"><path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path></svg></button>';
                
                
                overlayContent[i]+=
                '            </div>' +
                 '        </div>' +
                 '        <a href="#'+house[i].houseCode+'" style="display:block;">' +
                 '            <div class="_overlayInfoContainer">' +
                 '                <div class="_overlayReviewContainer">' +
                 '                    <span class="_starImg"><svg viewBox="0 0 1000 1000" role="presentation" aria-hidden="true" focusable="false" style="height:0.75rem;width:0.75rem;fill:#FF385C"><path d="M972 380c9 28 2 50-20 67L725 619l87 280c11 39-18 75-54 75-12 0-23-4-33-12L499 790 273 962a58 58 0 0 1-78-12 50 50 0 0 1-8-51l86-278L46 447c-21-17-28-39-19-67 8-24 29-40 52-40h280l87-279c7-23 28-39 52-39 25 0 47 17 54 41l87 277h280c24 0 45 16 53 40z"></path></svg></span><span class="_reviewRate"> '+house[i].revRate+'</span><span class="_reviewCount">('+house[i].revCount+')</span>' +
                 '                 </div>' +
                 '                <div class="_houseName">'+house[i].houseName+'</div>' +
                 '                <div class="_houseFacilities">인원 '+house[i].people+'명</div>' +
                 '            </div>' +
                 '        </a>' +
                '    </div>' +
                '    <div class="_overlayEdge"></div>' +
                '</div>';
            kakao.maps.event.addListener(marker[i], 'click', function(){
                customOverlay.setPosition(new kakao.maps.LatLng(house[i].lat,house[i].lng));
                customOverlay.setContent(overlayContent[i]);
                swiper = setSwiper();


        //$(".overlaybox").css("display","block");
        var swiper = setSwiper();
        
        $("._overlaybox").css("display","none");
        //$("._overlaybox").css("display","none");
        
        
        
</script>

</body>
</html>
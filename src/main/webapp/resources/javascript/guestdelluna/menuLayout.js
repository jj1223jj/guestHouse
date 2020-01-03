/**
 * 
 */

$(function(){  
	$(window).scroll(function(){
		var scrollTop = $(document).scrollTop();
		if (scrollTop < '4rem') {
			scrollTop = '4rem';
		}
		$('.menuL').stop();
		$('.menuL').animate({
			'top' : scrollTop
		}, 700, "swing");
	});
});
    
    
    

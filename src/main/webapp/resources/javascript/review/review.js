
var starRating = function(){
var $star = $(".star-input"),
    $result = $star.find("output>input");
   
     $(document).on("focusin", ".star-input>.input", 
      function(){
          $(this).addClass("focus");
    })
       
      .on("focusout", ".star-input>.input", function(){
       var $this = $(this);
       setTimeout(function(){
            if($this.find(":focus").length === 0){
                $this.removeClass("focus");
            }
         }, 100);
     })
  
    .on("change", ".star-input :radio", function(){
    	 $result.val($(this).next().text());
     })
    .on("mouseover", ".star-input label", function(){
       $result.val($(this).text());
    })
    .on("mouseleave", ".star-input>.input", function(){
       var $checked = $star.find(":checked");
          if($checked.length === 0){
               $result.val("0");
             } else {
               $result.val($checked.next().text());
          }
     });
};

starRating();

function updateCheck(root, exReserveCode, memberCode){
	var url = root + "/experience/exReviewUpdate.do?exReserveCode="+ exReserveCode +"&memberCode="+memberCode;
	alert(url);

	var width="500";
	var height="300";
	
	 var left = Math.ceil(( window.screen.width - width )/3);
	 var top = Math.ceil(( window.screen.width - height )/2); 
	 

	
	window.open(url,"review update","width="+width+",height="+height+",left="+left+",top="+top);
}

function deleteCheck(root, exReserveCode, memberCode, currentPage){
	var url=root+"/experience/exReviewDelete.do?exReserveCode="+ exReserveCode +"&memberCode="+memberCode + "&pageNumber="+currentPage;
	alert(url);

	var value = confirm("정말로 삭제하시겠습니까?");
	if(value==true){
		location.href=url;
	}

}

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

	var value = confirm("후기를 삭제하시겠습니까?");
	if(value==true){
		location.href=url;
	}
}
/*function exReviewChk(root){
	var revContent = document.getElementById("revContentIn").value;
	var exReserveCode = document.getElementById(id)
	if(exReserveCode == 0 || exReserveCode == null){
		alert("예약자가 아니거나 이미 작성하셨으면 후기 작성이 불가능합니다.");
		var url = root+"/experience/exPage.do";
		loaction.href= url;
		
	} else{
		var url = root +"location.href='${root}/experience/exReviewOk.do?revContent="+revContent+"&revRate="+revRate;	
		alert(url);
		}
	}*/


function check(revContent, revRate) {
		var revContent = $('#revContent').val();
		var revRate = $('#revRate').val();
		
		if(revContent ==''){
			alert("후기 내용을 작성해주세요.");
			$('#revContent').focus();
			return false;
		}else if(revRate ==0){
			alert("별점을 선택해 주세요.");
			return false;
		}
	}




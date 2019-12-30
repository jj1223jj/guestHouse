
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

function updateCheck(root, exReserveCode, memberCode, revContent){
	var url = root + "/experience/exReviewUpdate.do?exReserveCode="+ exReserveCode +"&memberCode="+memberCode +"&revContent="+revContent ;
	alert(url);

	var width="500";
	var height="300";
	
	 var left = Math.ceil(( window.screen.width - width )/3);
	 var top = Math.ceil(( window.screen.width - height )/2); 
	 

	
	window.open(url,"review update","width="+width+",height="+height+",left="+left+",top="+top);
}

function deleteCheck(root, exReserveCode, memberCode, currentPage,exCode){
	var url=root+"/experience/exReviewDelete.do?exReserveCode="+ exReserveCode +"&memberCode="+memberCode + "&pageNumber="+currentPage + "&exCode="+exCode;
	alert(url);

	var value = confirm("후기를 삭제하시겠습니까?");
	if(value==true){
		location.href=url;
	}
}

function GHupdateCheck(root, reserveCode, memberCode, revContent){
	var url = root + "/guestHousePage/reviewUpdate.do?reserveCode="+ reserveCode +"&memberCode="+memberCode +"&revContent="+revContent ;
	alert(url);

	var width="500";
	var height="300";
	
	 var left = Math.ceil(( window.screen.width - width )/3);
	 var top = Math.ceil(( window.screen.width - height )/2); 
	 

	
	window.open(url,"review update","width="+width+",height="+height+",left="+left+",top="+top);
}

function GHdeleteCheck(root, reserveCode, memberCode, currentPage,houseCode){
	var url=root+"/guestHousePage/reviewDelete.do?reserveCode="+ reserveCode +"&memberCode="+memberCode + "&pageNumber="+currentPage + "&houseCode="+houseCode;
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
		}else if(revRate == 0){
			alert("별점을 선택해 주세요.");
			return false;
		}
	}

function checkUp() {
	
	var revContent = $('#revContent').val();
	var revRate = $('#revRate').val();
	
	if(revContent ==''){
		alert("후기 내용을 작성해주세요.");
		$('#revContent').focus();
		return false;
	}else if(revRate == 0){
		alert("별점을 선택해 주세요.");
		return false;
	}
}


// 리뷰 더보기
var proot = null;
function load(root ,emailSession, exCode){
	proot = root;
	moreView(proot,emailSession,exCode);
}


var pageNumber =0;
/*function moreView(root){
	++pageNumber;
	var url = root + "/experience/exReview.do?";
	var params = "pageNumber="+ pageNumber;
	$.ajax({
		url: url + params,
		method:"get",
		dataType: "JSON",
		success: function(data) {
			alert(data);
			console.log("data",data);
			
			//$("#exReview").html(data);
			var content =document.querySelector('#contentData');
			
			//alert(data.length);
			
			html = '<table>';
			html += '<tr><th>예약번호</th><th>이메일</th><th>작성일</th><th>내용</th><th>별점</th></tr>';
			for(var i in data){
				//var list =data[i];
			//alert(data[i].revContent);
				html +='<tr><td>'+ data[i].exReserveCode +'</td><td>'+ data[i].email +'</td><td>'
						+ data[i].revDate +'</td><td>'+data[i].revContent+'</td><td>'+data[i].revRate+'</td></tr>';
			
				
				$("#exReserveCode").html(data[i].exReserveCode);
			$("#emailJ").html(data[i].email);
			$("#revDateJ").html(data[i].revDate);
			$("#revContentJ").html(data[i].revContent);
			$("#revRateJ").html(data[i].revRate);
			}
			html += '</table>';
			content.innerHTML = html;
		}
	
	
		
	});
	
}
*/

function moreView(root,emailSession,exCode){
	++pageNumber;
	alert(emailSession);
	var url = root + "/experience/exReview.do?";
	var params = "pageNumber="+ pageNumber +"&exCode="+exCode;
	
	var indexNum = 0;
	/*var email = '<% (String)session.getAttribute("email")%>';
	alert(email);*/
	$.ajax({
		method: 'GET',
		url: url + params,
		dataType: "JSON",
		success: function(data) {
			console.log(data.reviewList[0]);
			
			alert(data.reviewList[0]);
			
			var htmls="";
			
			if(data.length<1){
				html.push("등록된 댓글이 없습니다.");
                alert("data < 1");
			}else{
				$(data.reviewList).each(function(){
					var day = new Date(data.reviewList[indexNum].revDate);
					
					var year = day.getFullYear();
                    var month = day.getMonth() + 1;
                    var date = day.getDate();
                    
                    var formatDate = year + "년 " + month + "월 " + date + "일 "; 

                    htmls += '<div class="num'+this.exReserveCode+'media text-muted pt-3" id="rid' + data.reviewList[indexNum] + '">';
                   

                    htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';

                    htmls += '<span class="d-block">';

                    htmls += '<strong class="text-gray-dark">' + this.email + '</strong>';
                    
                    htmls += '<span style="padding-left: 1rem;">'+ formatDate +'</span>';

                    htmls += '<span style="padding-left: 7px; font-size: 9pt">';
                    
                  
                   if (emailSession==this.email) {
					htmls += '<a href="javascript:updateCheck('+proot+'/,'+this.exReserveCode+','+this.memberCode+',\''+this.revContent+'\');">수정</a>';
					htmls += '<a href="javascript:deleteCheck('+proot+'/,'+this.exReserveCode+','+this.memberCode+','+pageNumber+','+exCode+')">삭제</a>';
					/*<a href="javascript:deleteCheck('${root}','${exReviewDto.exReserveCode}','${exReviewDto.memberCode}','${currentPage}','${experienceDto.exCode}')">삭제</a> 		*/
                   }
                    
                    
                    

                   /* htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' +this.exReserveCode + ', ' + this.memberCode + ', \'' + this.revContent + '\')" style="padding-right:5px">수정</a>';

                    htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.memberCode + ')" >삭제</a>';*/

                    htmls += '</span>';

                    htmls += '</span>';
                
                    htmls +=  '<span>' + this.revContent +'</span>' ;
                    
                    htmls+= '<br/>'
                    
                    if(this.revRate==1){
                    	htmls += '<img src="'+proot+'/resources/css/review/star1.PNG" style="width: 50px;">';
                    }else if(this.revRate==2){
                    	htmls += '<img src="'+proot+'/resources/css/review/star2.PNG" style="width: 50px;">';
                    }else if(this.revRate==3){
                    	htmls += '<img src="'+proot+'/resources/css/review/star3.PNG" style="width: 50px;">';
                    }else if(this.revRate==4){
                    	htmls += '<img src="'+proot+'/resources/css/review/star4.PNG" style="width: 50px;">';
                    }else if(this.revRate==5){
                    	htmls += '<img src="'+proot+'/resources/css/review/star5.PNG" style="width: 50px;">';
                    }

                    htmls += '</p>';

                    htmls += '</div>';
                    
                    $("#contentData").append(htmls);
                    htmls="";
                    indexNum++;
                    	


				});
			}
		},
		error:function(a,b,c){
			console.log(a);
			alert(b);
			alert(c);
		}
	});
}




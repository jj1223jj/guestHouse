
function starRating(){
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
function starRating2(){
	var $star = $(".mstar-input"),
	$result = $star.find("output>input");
	
	$(document).on("focusin", ".mstar-input>.minput", 
			function(){
		$(this).addClass("focus");
	})
	
	.on("focusout", ".mstar-input>.minput", function(){
		var $this = $(this);
		setTimeout(function(){
			if($this.find(":focus").length === 0){
				$this.removeClass("focus");
			}
		}, 100);
	})
	
	.on("change", ".mstar-input :radio", function(){
		$result.val($(this).next().text());
	})
	.on("mouseover", ".mstar-input label", function(){
		$result.val($(this).text());
	})
	.on("mouseleave", ".mstar-input>.minput", function(){
		var $checked = $star.find(":checked");
		if($checked.length === 0){
			$result.val("0");
		} else {
			$result.val($checked.next().text());
		}
	});
};



function updateCheck(root, exReserveCode, memberCode, revContent){
	var url = root + "/experience/exReviewUpdate.do?exReserveCode="+ exReserveCode +"&memberCode="+memberCode +"&revContent="+revContent ;
	//alert(url);

	var width="500";
	var height="300";
	
	 var left = Math.ceil(( window.screen.width - width )/3);
	 var top = Math.ceil(( window.screen.width - height )/2); 
	 

	
	window.open(url,"review update","width="+width+",height="+height+",left="+left+",top="+top);
}

function deleteCheck(root, exReserveCode, memberCode, currentPage,exCode){
	var url=root+"/experience/exReviewDelete.do?exReserveCode="+ exReserveCode +"&memberCode="+memberCode + "&pageNumber="+currentPage + "&exCode="+exCode;
	//alert(url);

	var value = confirm("후기를 삭제하시겠습니까?");
	if(value==true){
		location.href=url;
	}
}

function GHupdateCheck(root, reserveCode, memberCode, revContent){
	var url = root + "/guestHousePage/reviewUpdate.do?reserveCode="+ reserveCode +"&memberCode="+memberCode +"&revContent="+revContent ;
	//alert(url);

	var width="500";
	var height="300";
	
	 var left = Math.ceil(( window.screen.width - width )/3);
	 var top = Math.ceil(( window.screen.width - height )/2); 
	 

	
	window.open(url,"review update","width="+width+",height="+height+",left="+left+",top="+top);
}

function GHdeleteCheck(root, reserveCode, memberCode, currentPage,houseCode){
	var url=root+"/guestHousePage/reviewDelete.do?reserveCode="+ reserveCode +"&memberCode="+memberCode + "&pageNumber="+currentPage + "&houseCode="+houseCode;
	//alert(url);

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


function check(form) {
		
		
	var revContent = $('#revContent').val();
	var revRate = $('#revRate').val();
	//alert(revContent);
	//alert(revRate);
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
	
	
	/*if(emailSession ==null){
		moreView(proot,"qq",exCode);
	}else{
	}*/
	
}
function ghLoad(root, emailSession, houseCode){
//	alert(emailSession+houseCode);
	proot=root;
	ghMoreView(proot,emailSession,houseCode);
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
	//alert(emailSession +"," +exCode);
	var url = root + "/experience/exReview.do?";
	var params = "pageNumber="+ pageNumber +"&exCode="+exCode;

	var indexNum = 0;
	var count = 0;
	/*var email = '<% (String)session.getAttribute("email")%>';
	alert(email);*/
	$.ajax({
		method: 'GET',
		url: url + params,
		dataType: "JSON",
		success: function(data) {
			console.log(data.count);
			//console.log(data.reviewList[0]);
			//alert(data.reviewList[0]);
			
			var htmls="";
			var btn="";
			var cnt = data.count;
			//alert("cnt:" + cnt);
			
			
			if(data.count<1){
				htmls += '<div style="margin:10rem auto;"><strong class="text-gray-dark" style="font-size:1rem; magin-top:3rem;">' + "등록된 후기가 없습니다."  + '</strong></div>';
               // alert("data < 1");
				 $("#contentData").append(htmls);
				 $("#reviewBtn").css({
					display: "none"
				 });
				 
			}else {
				
					
				$(data.reviewList).each(function(){
					
					var day = new Date(data.reviewList[indexNum].revDate);
					
					var year = day.getFullYear();
                    var month = day.getMonth() + 1;
                    var date = day.getDate();
                    
                    var formatDate = year + "년 " + month + "월 " + date + "일 "; 

                    htmls += '<div style="border-bottom: 0.063rem solid #dee2e6!important;" class="num'+this.exReserveCode+'media text-muted pt-3" id="rid">';
                   
                    //
                   // htmls += '<p>' + data.length +'</p>'
                    //

                    htmls += '<p style="display:block; width:100%; height:2rem;" class="media-body pb-3 mb-0 small lh-125 ">';

                    htmls += '<span class="d-block" style="width:15rem; board:0.1rem solid red; float: left;">';

                    htmls += '<strong class="text-gray-dark" style="font-size:1rem;">' + this.email + '</strong>';
                    
                    htmls += '</span>';
                    
                   /* htmls += '<span style="padding-left: 1rem; border: 0.1rem dotted red; float:left;">'+ formatDate +'</span>';*/

                    htmls += '<span style="padding-left: 1rem; float:left;">'+ formatDate +'</span>';

                    htmls += '<span style="margin-left: 3rem; board: 0.1rem blue solid;text-align:left; width:20rem; height:2rem; float:left; font-size: 1rem;">';
                    
                    if(this.revRate==1){
                    	htmls += '<img src="'+proot+'/resources/css/review/star1.PNG" style="width: 7rem;">';
                    }else if(this.revRate==2){
                    	htmls += '<img src="'+proot+'/resources/css/review/star2.PNG" style="width: 7rem;">';
                    }else if(this.revRate==3){
                    	htmls += '<img src="'+proot+'/resources/css/review/star3.PNG" style="width: 7rem;">';
                    }else if(this.revRate==4){
                    	htmls += '<img src="'+proot+'/resources/css/review/star4.PNG" style="width: 7rem;">';
                    }else if(this.revRate==5){
                    	htmls += '<img src="'+proot+'/resources/css/review/star5.PNG" style="width: 7rem;">';
                    }
                    
                   htmls += '<input type="hidden" id="exReserveCode" name="exReserveCode" value="'+this.exReserveCode+'" />';
                  
                   if (emailSession==this.email) {
					/*htmls += '<a style="margin-left:3rem;" href="javascript:updateCheck('+proot+'/,'+this.exReserveCode+','+this.memberCode+',\''+this.revContent+'\');">수정</a>';*/
					/*htmls += '<a style="margin-left:1rem;" href="javascript:deleteCheck('+proot+'/,'+this.exReserveCode+','+this.memberCode+','+pageNumber+','+exCode+')">삭제</a>';*/
					htmls += '<div id="updateRe" style="width:3rem; float:left; padding-left:2rem; margin-left:45rem;"><button type="button" class="btn btn-light" data-toggle="modal" data-target="#updateModal"><i class="fa fa-pencil"></i></button></div>';
					htmls += '<div id="deleteRe"><button type="button" class="btn btn-light" onclick="deleteCheck('+proot+'/,'+this.exReserveCode+','+this.memberCode+','+pageNumber+','+exCode+')"><i class="fa fa-trash-o"></i></button></div>';
					
					/*<a href="javascript:deleteCheck('${root}','${exReviewDto.exReserveCode}','${exReviewDto.memberCode}','${currentPage}','${experienceDto.exCode}')">삭제</a> 		*/
                   }
                    
                    
                    

                   /* htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' +this.exReserveCode + ', ' + this.memberCode + ', \'' + this.revContent + '\')" style="padding-right:5px">수정</a>';

                    htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.memberCode + ')" >삭제</a>';*/


                    htmls += '</span>';
                
                    htmls +=  '<div style="width: 47rem; height:auto; word-break:break-all; margin-top:1rem; text-align:left;">' + this.revContent +'</div>' ;
                    
                   // htmls+= '<br/>'
                    
                   

                    htmls += '</p>';

                    htmls += '</div>';
                    
                   
                    
                    $("#contentData").append(htmls);
                    htmls="";
                    ++indexNum;
                    
                    //alert("개수: "+$('#rid').length);
                    if($('#rid').length != 1){
                    	 $("#reviewBtn").css({
               				display: "none"
               			 });
                    }
                    ++count;
                  
                 
                    
                    
                   // alert("indexNum: "+indexNum);
                    
                    
                    $('#updateRe button').on('click',function(){
            			var a = $(this).parent().parent();
            			var rese = $(this).closest('input');
            			var con = $(this).parent().next('div');
            			var tex = con.text();
            			//alert(tex);
            			
            			console.log(a);
            			
            			//var span = currentRow.closest('span');
            			
            			var revContent = a.find('div:eq(2)').text();
            			console.log(revContent);
            			
            			var modalReserveCode = a.find('#exReserveCode').val();
            			console.log(modalReserveCode);
            			//var revRate = currentRow.find('span:eq(2)').text();
            			//alert(modalReserveCode);
            			
            			//alert(revContent + "," + revRate);
            			
            			//console.log($('.modal #modalRevContent'));
            			$('.modal #modalRevContent').text(revContent);
            			//$('.modal #revRate').val(revRate);
            			$('.modal #exReserveCode').val(modalReserveCode);
            			starRating2();
            			});
                    
                  
                    
                    
                    
                   
				});
				 //alert("count: "+count); 
				 if(count ==0){
              	   $("#reviewBtn").css({
            				display: "none"
            			 });
                 }
			}
			
			
			
			
			/*if(indexNum <= cnt){
				btn += '<button type="button" class="btn btn-light" onclick="moreView('+proot+'/,'+emailSession+','+exCode+')">후기 더보기</button>'; 
				$("#moreReviewB").append(btn);
				btn="";
			}*/
		},
		error:function(a,b,c){
			console.log(a);
			alert(b);
			alert(c);
		}
	});
	starRating();
	
}

function reviewModalUpdate(form){
	console.log(form);
	var memberCode=form.memberCode.value;
	var exReserveCode =form.exReserveCode.value;
	var revContent = form.modalRevContent.value;
	var revRate = form.revRate.value;
	
	console.log(memberCode);
	console.log(exReserveCode);
	console.log(revContent);
	console.log(revRate);
	
	var url = proot+"/experience/exReviewUpdateOk.do?memberCode="+memberCode+"&exReserveCode="+exReserveCode+"&revRate="+revRate;
	var params = "&revContent="+revContent;
	
	$.ajax({
	
		method: 'GET',
		url: url + params,
		///guestdelluna/experience/exReviewUpdateOk.do?memberCode=42&exReserveCode=8&revContent=ㅂㅂ&mstar-input=5&revRate=5
		dataType: "JSON",
		success: function(data) {
			
			var div = $(".num"+exReserveCode+"media");
			var day = new Date();
			
			var year = day.getFullYear();
            var month = day.getMonth() + 1;
            var date = day.getDate();
            
            var formatDate = year + "년 " + month + "월 " + date + "일 ";
            
//            $('.')
            $($($(div.children()[0]).children()[2]).children("img")[0]).attr("src",proot+'/resources/css/review/star'+revRate+'.PNG');
			$($(div.children()[0]).children()[1]).text(formatDate);
			$(div.children("div")[2]).text(revContent);
			console.log($("#updateModal"));
			$("#updateModal").modal("hide");
			
		},
		error:function(a,b,c){
			console.log(a);
			alert(b);
			alert(c);
		}
	});
	
}

function ghMoreView(root,emailSession,houseCode){
	//alert("root:"+root+ emailSession+ houseCode);
	++pageNumber;
	//alert(emailSession +"," +exCode);
	var url = root + "/guestHousePage/review.do?";
	var params = "pageNumber="+ pageNumber +"&houseCode="+houseCode;

	var indexNum = 0;
	var count = 0;
	/*var email = '<% (String)session.getAttribute("email")%>';
	alert(email);*/
	$.ajax({
		method: 'GET',
		url: url + params,
		dataType: "JSON",
		success: function(data) {
			//console.log(data.count);
			//console.log(data.reviewList[0]);
			//alert(data.reviewList[0]);
			
			var htmls="";
			var btn="";
			var cnt = data.count;
			//alert("cnt:" + cnt);
			
			
			if(data.count<1){
				htmls += '<div style="margin:10rem auto;"><strong class="text-gray-dark" style="font-size:1rem; magin-top:3rem;">' + "등록된 후기가 없습니다."  + '</strong></div>';
               // alert("data < 1");
				 $("#contentData").append(htmls);
				 $("#reviewBtn").css({
					display: "none"
				 });
				 
			}else {
				
				$(data.reviewList).each(function(){
					
					var day = new Date(data.reviewList[indexNum].revDate);
					
					var year = day.getFullYear();
                    var month = day.getMonth() + 1;
                    var date = day.getDate();
                    
                    var formatDate = year + "년 " + month + "월 " + date + "일 "; 

                    htmls += '<div style="border-bottom: 0.063rem solid #dee2e6!important;" class="num'+this.reserveCode+'media text-muted pt-3" id="rid">';

                    htmls += '<p class="media-body pb-3 mb-0 small lh-125 ">';

                    htmls += '<span class="d-block" style="width:15rem; board:0.1rem solid red; float: left;">';

                    htmls += '<strong class="text-gray-dark" style="font-size:1rem;">' + this.email + '</strong>';
                    
                    htmls += '</span>';
                    
                   /* htmls += '<span style="padding-left: 1rem; border: 0.1rem dotted red; float:left;">'+ formatDate +'</span>';*/

                    htmls += '<span style="padding-left: 1rem; float:left;">'+ formatDate +'</span>';

                    htmls += '<span style="margin-left: 3rem; board: 0.1rem blue solid;text-align:left; width:20rem; height:2rem; float:left; font-size: 1rem;">';
                    
                    if(this.revRate==1){
                    	htmls += '<img src="'+proot+'/resources/css/review/star1.PNG" style="width: 7rem;">';
                    }else if(this.revRate==2){
                    	htmls += '<img src="'+proot+'/resources/css/review/star2.PNG" style="width: 7rem;">';
                    }else if(this.revRate==3){
                    	htmls += '<img src="'+proot+'/resources/css/review/star3.PNG" style="width: 7rem;">';
                    }else if(this.revRate==4){
                    	htmls += '<img src="'+proot+'/resources/css/review/star4.PNG" style="width: 7rem;">';
                    }else if(this.revRate==5){
                    	htmls += '<img src="'+proot+'/resources/css/review/star5.PNG" style="width: 7rem;">';
                    }
                    
                   htmls += '<input type="hidden" id="reserveCode" name="reserveCode" value="'+this.reserveCode+'" />';
                  
                   if (emailSession==this.email) {
					/*htmls += '<a style="margin-left:3rem;" href="javascript:updateCheck('+proot+'/,'+this.exReserveCode+','+this.memberCode+',\''+this.revContent+'\');">수정</a>';*/
					/*htmls += '<a style="margin-left:1rem;" href="javascript:deleteCheck('+proot+'/,'+this.exReserveCode+','+this.memberCode+','+pageNumber+','+exCode+')">삭제</a>';*/
					
                	htmls += '<div id="upAndDel" style="float: right; width:5.6rem; margin-top:1rem;"><div id="updateRe" style="width:3rem; float:left;"><button type="button" class="btn btn-light" data-toggle="modal" data-target="#updateModal"><i class="fa fa-pencil"></i></button></div>';
					htmls += '<div id="deleteRe"><button type="button" class="btn btn-light" onclick="GHdeleteCheck('+proot+'/,'+this.reserveCode+','+this.memberCode+','+pageNumber+','+houseCode+')"><i class="fa fa-trash-o"></i></button></div></div>';
					
					/*<a href="javascript:deleteCheck('${root}','${exReviewDto.exReserveCode}','${exReviewDto.memberCode}','${currentPage}','${experienceDto.exCode}')">삭제</a> 		*/
                   }

                    htmls += '</span>';
                
                    htmls +=  '<div id="contentReview" style="width: 38rem; height:auto; word-break:break-all; margin-top:1rem; margin-bottom:1rem; text-align:left; display:inline-block; padding:0.3rem;">' + this.revContent +'</div>' ;

                    htmls += '</p>';

                    htmls += '</div>';  

                    $("#contentData").append(htmls);
                    htmls="";
                    ++indexNum;
                    
                    //alert("개수: "+$('#rid').length);
                    if($('#rid').length != 1){
                    	 $("#reviewBtn").css({
               				display: "none"
               			 });
                    }
                    ++count;
 
                   // alert("indexNum: "+indexNum);
                    
                    $('#updateRe button').on('click',function(){
            			var a = $(this).parent().parent().parent();
            			var rese = $(this).closest('input');
            			var con = $(this).parent().next('div');
            			var tex = con.text();
            			//alert(tex);
            			
            			console.log(a);
            			
            			//var span = currentRow.closest('span');
            			
            			var revContent = a.find('#contentReview').text();
            			console.log(revContent);
            			
            			var modalReserveCode = a.find('#reserveCode').val();
            			console.log(modalReserveCode);
            			//var revRate = currentRow.find('span:eq(2)').text();
            			//alert(modalReserveCode);
            			
            			//alert(revContent + "," + revRate);
            			
            			//console.log($('.modal #modalRevContent'));
            			$('.modal #modalRevContent').text(revContent);
            			//$('.modal #revRate').val(revRate);
            			$('.modal #reserveCode').val(modalReserveCode);
            			starRating2();
            			});
				});
				 //alert("count: "+count); 
				 if(count ==0){
              	   $("#reviewBtn").css({
            				display: "none"
            			 });
                 }
			}
		},
		error:function(a,b,c){
			console.log(a);
			alert(b+"여기");
			alert(c);
		}
	});
	starRating();
	
}

function ghReviewModalUpdate(form){
	console.log(form);
	var memberCode=form.memberCode.value;
	var reserveCode =form.reserveCode.value;
	var revContent = form.modalRevContent.value;
	var revRate = form.revRate.value;
	
	console.log(memberCode);
	console.log(reserveCode);
	console.log(revContent);
	console.log(revRate);
	
	var url = proot+"/guestHousePage/reviewUpdateOk.do?memberCode="+memberCode+"&reserveCode="+reserveCode+"&revRate="+revRate;
	var params = "&revContent="+revContent;
	
	$.ajax({
	
		method: 'GET',
		url: url + params,
		dataType: "JSON",
		success: function(data) {
			
			var div = $(".num"+reserveCode+"media");
			var day = new Date();
			
			var year = day.getFullYear();
            var month = day.getMonth() + 1;
            var date = day.getDate();
            
            var formatDate = year + "년 " + month + "월 " + date + "일 ";
            
            $($($(div.children()[0]).children()[2]).children("img")[0]).attr("src",proot+'/resources/css/review/star'+revRate+'.PNG');
			$($(div.children()[0]).children()[1]).text(formatDate);
			$(div.children("div")[1]).text(revContent);
			console.log($("#updateModal"));
			$("#updateModal").modal("hide");
			
		},
		error:function(a,b,c){
			console.log(a);
			alert(b);
			alert(c);
		}
	});
	
}

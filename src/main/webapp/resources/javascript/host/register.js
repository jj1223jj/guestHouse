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
         alert(e.target.result);
         $('#profileView').css({
            'width': '300px'
         });
      }
      reader.readAsDataURL(file);
   });
});



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
             alert(e.target.result);
             $('#mainImgView').css({
                'width': '200px'
             });
          }
         // alert(e.target.result);
      }

      reader.readAsDataURL(input.files[0]);
   }
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
      if(!f.type.match("image.*")   ) {
         alert("확장자는 이미지 확장자만 가능합니다.");
         return false;
      }
      
      sel_files.push(f);
      
      var reader = new FileReader();
      reader.onload = function(e) {
         //var html = "<a href=\"javascript:void(0);\" onclick=\'deleteImageAction("+index+")'\" id=\img_id_"+index+"\"><img src=\""+ e.target.result + "\" data-file='"+f.name+"' class='selProductFile' tilte='Click to remove'></a>";
         var html = "<a href=\"javascript:void(0);\" onclick=\'deleteImageAction("+index+")'\" id=\img_id_"+index+"\"><img src=\""+ e.target.result + "\" data-file='"+f.name+"' class='selProductFile' tilte='Click to remove' width='130px'></a>";
         $(".subImgDiv").append(html);
         index++;
      }
      reader.readAsDataURL(f);
   });
}

function deleteImageAction(index) {
   console.log("index: " + index);
   sel_files.splice(index, 1);
   
   var img_id = "#img_id_" + index;
   $(img_id).remove();
}

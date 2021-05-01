<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GreenLight master</title>
<link href="/master/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/master/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {
    $(document).on('change',"#sdimgFile", function() {
       readURLTB(this);
    });
    //버튼 누를 시 파일 입력창 출력
    $(".sdimgBtn").on("click", function(){
     var target = $('.sdimgDiv');
     target.html("<input type=\"file\" class=\"form-control\" id=\"sdimgFile\"name=\"sdimgFile\" />");
     $(".sdimgBtn").hide();
     return false;
  });
 }); 

 function readURLTB(input) {
    if (input.files && input.files[0]) {
       var reader = new FileReader();

       reader.onload = function(e) {
          $('#sdImg').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]);
    }
 }
 //file 이미지 미리보기 eimg
      
</script>


<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
     .contents {
		padding-top:3%;
	}
   
    .header{
        height:6%;
    }
    .img {
          margin-top:-10px;
          margin-left:10px;
          height:50px;
          width:50px;
     }
     	.btnaction{
   		width:30%;
   	}
    
</style>
<style type="text/css"></style>
</head>
<body class="theme-black">
<%@ include file="../template/Container.jsp" %>
   
   <div class="w3-main contents" style="margin-left:300px;margin-top:60px;">
   <div class=" w3-container container">
     <%--  <h1>${title }페이지</h1> --%>
      <form action="${url }" enctype="multipart/form-data" method="post">
         <div class="form-group col-md-12">
         	<label for="eid" class="col-md-12 control-label"><h3>SLIDE DETAIL PAGE</h3></label>
         	&nbsp;
         	</div>
         	 <div class="form-group col-md-12">
            <label for="mainid" class="col-md-2 control-label">슬라이드 ID</label>
            <div class="col-md-10">
               <input type="text" class="form-control" id="mainid" name="mainid"
                  placeholder="슬라이드코드는 자동으로 작성됩니다." value="${bean.mainid }"
                  readonly="readonly">
            </div>
         </div> <!-- 슬라이드id -->
   
         
         <div class="form-group col-md-12">
            <label for="title" class="col-md-2 control-label">슬라이드 타이틀</label>
            <div class="col-md-10">
               <input type="text" class="form-control" id="title" name="title"
                  placeholder="슬라이드명을 작성하십시오." value="${bean.title }">
            </div>
         </div> <!-- 슬라이드 타이틀 -->
         
        
         <div class="form-group col-md-12">
         	<div class="row">
         	<div class="col-md-6" >
	            <label for="sdimgFile" class="col-md-4 control-label">슬라이드 이미지</label>
		             <div class="col-md-6 sdimgDiv" >
		               <button type="button" class="btn btn-info sdimgBtn form-control" style="margin-left:3%;" >슬라이드 이미지 ${title}</button> 
		               <input hidden="hidden" name="img" value="${bean.img }">
		               <!-- 파일 업로드 확인 필요! : 업로드된 파일있다면 받아오기 -->
		             </div>
		             
		   
		            
	            <label class="col-md-4 control-label" style="margin-top:2%;">확인 버튼</label>
		            <div class="col-md-8"  style="margin-top:2%;">
		           	 <button type="submit" class="btnaction btn btn-primary" style="margin-left:3%;" >${title}</button>
		           	 <button type="reset" class="btnaction btn btn-default" >취소</button>
		            </div>
            </div>
            
          	<div class="col-md-6" style="margin-left:-1.3%;" >
	             <label class="col-md-4 control-label">이미지미리보기</label>
	             <div class="col-md-8" >
	           	 <img alt="이벤트 상세 이미지" id="sdImg" 
	                  src="${pageContext.request.contextPath}/file/${bean.img}"
	                  class="img-slide img-thumbnail" width="350px">
            	</div>
            </div>
            </div>
         
       
         
      </form>
   </div>
</div>
</body>
</html>
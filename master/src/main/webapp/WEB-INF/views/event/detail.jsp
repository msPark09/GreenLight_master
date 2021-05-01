<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>GreenLight master</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>


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
<script type="text/javascript">
$(function() {
    $(document).on('change',"#eimgFile", function() {
       readURLTB(this);
    });
    //버튼 누를 시 파일 입력창 출력
    $(".eimgBtn").on("click", function(){
     var target = $('.eimgDiv');
     target.html("<input type=\"file\" class=\"form-control\" id=\"eimgFile\"name=\"eimgFile\" />");
     $(".eimgBtn").hide();
     return false;
  });
 }); 

 function readURLTB(input) {
    if (input.files && input.files[0]) {
       var reader = new FileReader();

       reader.onload = function(e) {
          $('#eImg').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]);
    }
 }
 //file 이미지 미리보기 eimg
</script>




<body class="theme-black">
<%@ include file="../template/Container.jsp" %>

   <div class="w3-main contents" style="margin-left:300px;margin-top:60px;">
   <div class=" w3-container container">
     <%--  <h1>${title }페이지</h1> --%>
      <form action="${url }" enctype="multipart/form-data" method="post">
         <div class="form-group col-md-12">
         <label for="eid" class="col-md-12 control-label"><h3>EVENT DETAIL PAGE</h3></label>
         </div>
         <div class="form-group col-md-12">
            <label for="eid" class="col-md-2 control-label">이벤트ID</label>
            <div class="col-md-10">
               <input type="text" class="form-control" id="eid" name="eid"
                  placeholder="이벤트코드는 자동으로 작성됩니다." value="${bean.eid }"
                  readonly="readonly">
            </div>
         </div> <!-- 이벤트id -->
         
         
         <div class="form-group col-md-12">
            <label for="ename" class="col-md-2 control-label">이벤트명</label>
            <div class="col-md-10">
               <input type="text" class="form-control" id="ename" name="ename"
                  placeholder="이벤트명을 작성하십시오." value="${bean.ename }">
            </div>
         </div> <!-- 이벤트명 -->
         
         <div class="form-group col-md-12">
            <label for="eexp" class="col-md-2 control-label">이벤트상세내용</label>
            <div class="col-md-10">
               <textarea class="form-control" rows="5" id="eexp" name="eexp"
                  placeholder="이벤트 상세내용 작성.">${bean.eexp }</textarea>
               <%-- <input type="text" class="form-control" id="exp" name="exp"
                  placeholder="상품 상세 설명 작성." rows="5" value="${bean.exp }"> --%>
            </div>
         </div> <!-- 이벤트상세내용 -->
         
         
         <div class="form-group col-md-12">
            <label for="eurl" class="col-md-2 control-label">관련URL</label>
            <div class="col-md-10">
               <input type="text" class="form-control" id="eurl" name="eurl"
                  placeholder="페이지 이동할URL을 적어주시기 바랍니다" value="${bean.eurl }">
            </div>
         </div> <!-- 관련url -->
         
         
         <div class="form-group col-md-12">
            <label for="eprio" class="col-md-2 control-label">우선순위</label>
            <div class="col-md-4">
               <input type="text" class="form-control" id="eprio" name="eprio"
                  placeholder="마켓팅팀 제공 우선순위 작성. 숫자 낮을 수록 상위 노출"
                  value="${bean.eprio }">
            </div>
            <label for="eduring" class="col-md-2 control-label">이벤트기간</label>
            <div class="col-md-4">
               <input type="date" class="form-control" id="eduring" name="eduring"
                  value="${bean.eduring }">
            </div>
         </div> <!-- 우선순위+이벤트기간 -->
         
  		
         <div class="form-group col-md-12">
         	<div class="row">
         	<div class="col-md-6" >
	            <label for="eimgFile" class="col-md-4 control-label">이벤트 상세이미지</label>
		             <div class="col-md-6 eimgDiv" >
		               <button type="button" class="btn btn-info eimgBtn form-control" style="margin-left:3%;" >이벤트 이미지 ${title}</button> 
		               <input hidden="hidden" name="eimg" value="${bean.eimg }">
		               <!-- 파일 업로드 확인 필요! : 업로드된 파일있다면 받아오기 -->
		             </div>
		             
		   
		            
	            <label for="eimgFile" class="col-md-4 control-label" style="margin-top:2%;">확인 버튼</label>
		            <div class="col-md-8"  style="margin-top:2%;">
		           	 <button type="submit" class="btnaction btn btn-primary" style="margin-left:3%;" >${title}</button>
		           	 <button type="reset" class="btnaction btn btn-default" >취소</button>
		            </div>
            </div>
            
          	<div class="col-md-6" style="margin-left:-1.3%;" >
	             <label for="eimgFile" class="col-md-4 control-label">이미지미리보기</label>
	             <div class="col-md-8" >
	           	 <img alt="이벤트 상세 이미지" id="eImg" 
	                  src="/master/file/${bean.eimg}"
	                  class="img-event img-thumbnail" width="350px">
            	</div>
            </div>
            </div>
         </div>
	    </form>
      </div>
   </div>
 
</body>
</html>
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
<script type="text/javascript">
   $(document).ready(function() {
      //입력된 값에 따라 미리 선택되어 있도록 하기 위한 js
      var cat = $("#cat").text();
      if (cat == "") {
         $(".catSel").val("핫딜").attr("selected", "selected");

      } else {

         $(".catSel").val(cat).attr("selected", "selected");
      }
      var event = $("#eventP").text();
      if (event == "") {
         $(".eventSel").val("0").attr("selected", "selected");

      } else {

         $(".eventSel").val(event).attr("selected", "selected");
      }//cat선택시 해당 지역을 노출하기 위한 js

      //file 이미지 미리보기 thumb
         $(document).on('change',"#thumbFile",  function() {
            readURLTB(this);
         });

      //file 이미지 미리보기 detail img

         $(document).on('change',"#imgFile", function() {
            readURLIM(this);
         });

      //비동기 통신으로 진행
      $(".catbtn").on("click", function() {
         var catname = $(".catSel").val();
         var target = $('.cat');
         /* var param= */
         $.ajax({
            "url" : "cat",
            "data" : {
               'catName' : catname
            },
            'success' : function(data, textStatus, jqXHR) {
               target.html("");
               data = data.replace(/\+/gi, '%20');
               data = decodeURIComponent(data);
               target.append(data);
            },
            "error" : function(jqXHR, textStatus) {
               alert("통신실패 " + textStatus + "(code): " + jqXHR.status);
            },

         });
         return false;
      });

      //버튼 누를 시 파일 입력창 출력
        $(".thumbBtn").on("click", function(){
         var target = $('.thumbDiv');
         target.html("<input type=\"file\" class=\"form-control\" id=\"thumbFile\"name=\"thumbFile\" />");
         $(".thumbBtn").hide();
         return false;
      });
      
        $(".imgBtn").on("click", function(){
            var target = $('.imgDiv');
            target.html("<input type=\"file\" class=\"form-control\" id=\"imgFile\" name=\"imgFile\" /> ");
            $(".imgBtn").hide();
            return false;
         });

   });
   function readURLTB(input) {
      if (input.files && input.files[0]) {
         var reader = new FileReader();

         reader.onload = function(e) {
            $('#thumbImg').attr('src', e.target.result);
         }
         reader.readAsDataURL(input.files[0]);
      }
   }//file 이미지 미리보기 thumb

   function readURLIM(input) {
      if (input.files && input.files[0]) {
         var reader = new FileReader();

         reader.onload = function(e) {
            $('#imgImg').attr('src', e.target.result);
         }
         reader.readAsDataURL(input.files[0]);
      }
   }//file 이미지 미리보기 detail img
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

</head>
<body class="theme-black">
<%@ include file="../template/Container.jsp" %>

<!-- !PAGE CONTENT! -->
<div class="w3-main contents" style="margin-left:300px;margin-top:60px;">

  <div class="w3-container container">
         <%-- <h1>${title }페이지</h1> --%>
      <form action="${url }" enctype="multipart/form-data" method="post">
         <div class="form-group col-md-12">
            <label for="eid" class="col-md-12 control-label"><h3>PRODUCT DETAIL PAGE</h3></label>
            <div class="col-md-12">
            <c:if test="${title eq '수정' }">
            <a role="button" class="btn btn-info" href="proDetail?id=${bean.proid }">출발일&항공편 입력하기</a>
            </c:if>         
            <c:if test="${title ne '수정' }">
            <a role="button" class="btn btn-info" href="proDetail?id=add">출발일&항공편 입력하기</a>
            </c:if>   
            <p>&nbsp;</p>   
            </div>
            <div class="col-md-4">
               <img alt="제품 썸네일 이미지" id="thumbImg"
                  src="${pageContext.request.contextPath}/file/${bean.thumb}"
                  class="img-thumbnail" width="300px">

            </div>
            <label for="thumbFile" class="col-md-2 control-label">썸네일
               이미지</label>
            <div class="col-md-6 thumbDiv">
               <!-- <input type="file" class="form-control" id="thumbFile"
                  name="thumbFile" /> -->
               <button type="button" class="btn btn-info thumbBtn form-control">썸네일 이미지 ${title}</button> 
               <input hidden="hidden" name="thumb" value="${bean.thumb }">
               <!-- 파일 업로드 확인 필요! : 업로드된 파일있다면 받아오기 : 불가 -->
            </div>
         </div>
         <div class="form-group col-md-12">
            <label for="proid" class="col-md-2 control-label">상품ID</label>
            <div class="col-md-10">
               <input type="text" class="form-control" id="proid" name="proid"
                  placeholder="상품코드는 자동으로 작성됩니다." value="${bean.proid }"
                  readonly="readonly">
            </div>
         </div>
         <div class="form-group col-md-12">
            <label for="proname" class="col-md-2 control-label">상품명</label>
            <div class="col-md-10">
               <input type="text" class="form-control" id="proname" name="proname"
                  placeholder="상품명을 작성하십시오." value="${bean.proname }">
            </div>
         </div>
         <div class="form-group col-md-12">
            <label for="catSel" class="col-md-2 control-label">카테고리</label>
            <p hidden="hidden" id="cat">${bean.cat }</p>
            <div class="col-md-9">
               <select name="cat" class="ms catSel form-control input-default">
                  <c:forEach items="${catList }" var="cat">
                     <option value="${cat.code }">${cat.name }</option>
                  </c:forEach>
               </select>
            </div>
            <div class="col-md-1">
               <button type="button" class="btn btn-info catbtn form-control">선택</button>
            </div>
         </div>
         <div class="form-group col-md-12">
            <label for="loc" class="col-md-2 control-label">지역</label>
            <div class="col-md-10 cat">
               <!-- js로 처리 예정 -->
               <input type="text" class="form-control" id="loc" name="loc"
                  placeholder="카테고리를 선택하세요." value="${bean.loc }">

            </div>
         </div>
         <div class="form-group col-md-12 ${errs.price }">
            <label for="price" class="col-md-2 control-label">가격</label>
            <div class="col-md-10">
               <input type="text" class="form-control" id="price" name="price"
                  placeholder="상품 가격(기준 : 원)" value="${bean.price }">
            </div>
         </div>
         <div class="form-group col-md-12">
            <label for="minp" class="col-md-2 control-label">최소 인원</label>
            <div class="col-md-4 ${errs.minp }">
               <input type="text" class="form-control" id="minp" name="minp"
                  placeholder="최소인원" value="${bean.minp }">
            </div>
            <label for="maxp" class="col-md-2 control-label">최대 인원</label>
            <div class="col-md-4 ${errs.maxp }">
               <input type="text" class="form-control" id="maxp" name="maxp"
                  placeholder="최대인원" value="${bean.maxp }">
            </div>
         </div>
         <div class="form-group col-md-12">
            <label for="peris" class="col-md-2 control-label">기간</label>
            <div class="col-md-10 ${errs.peris }">
               <input type="text" class="form-control" id="peris" name="peris"
                  placeholder="몇박몇일의 형식으로 작성해주십시오." value="${bean.peris }">
            </div>
         </div>
         <div class="form-group col-md-12">
            <label for="exp" class="col-md-2 control-label">상품상세내역</label>
            <div class="col-md-10">
               <textarea class="form-control" rows="5" id="exp" name="exp"
                  placeholder="상품 상세 설명 작성.">${bean.exp }</textarea>
               <%-- <input type="text" class="form-control" id="exp" name="exp"
                  placeholder="상품 상세 설명 작성." rows="5" value="${bean.exp }"> --%>
            </div>
         </div>
         <div class="form-group col-md-12">
            <label for="discount" class="col-md-2 control-label">할인율</label>
            <div class="col-md-4 ${errs.discount }">
               <input type="text" class="form-control" id="discount"
                  name="discount" placeholder="마켓팅팀 제공 할인율 작성. 10%->0.10 형식으로 작성"
                  value="${bean.discount }">
            </div>
            <label for="point" class="col-md-2 control-label">평점</label>
            <div class="col-md-4 ${errs.point }">
               <input type="text" class="form-control" id="point" name="point"
                  placeholder="고객 평가 점수 0.00 형식" value="${bean.point }">
            </div>
         </div>
         <div class="form-group col-md-12">
            <label for="prio" class="col-md-2 control-label">우선순위</label>
            <div class="col-md-4">
               <input type="text" class="form-control" id="prio" name="prio"
                  placeholder="마켓팅팀 제공 우선순위 작성. 숫자 낮을 수록 상위 노출"
                  value="${bean.prio }">
            </div>
            <label for="event" class="col-md-2 control-label">이벤트</label>
            <div class="col-md-4">
               <p hidden="hidden" id="eventP">${bean.event }</p>
               <%-- <input type="text" class="form-control" id="event" name="event"
                  placeholder="마켓팅팀 제공 관련 이벤트 작성" value="${bean.event }"> --%>
               <select class="ms eventSel form-control input-default" name="event">
                  <option value="0">진행 event 없음</option>
                  <option value="1">핫딜</option>
                  <option value="2">마감임박</option>
                  <option value="3">신규상품</option>
                  <option value="4">매진임박</option>
               </select>
            </div>
         </div>
         <div class="form-group col-md-12">
            <div class="col-md-4">
               <img alt="제품 상세 이미지" id="imgImg"
                  src="${pageContext.request.contextPath}/file/${bean.img}"
                  class="img-thumbnail" width="350px">
            </div>
            <label for="imgFile" class="col-md-2 control-label">상품 상세
               이미지</label>
            <div class="col-md-6 imgDiv">
               <!-- <input type="file" class="form-control" id="imgFile" name="imgFile" /> -->
               <!-- 파일 업로드 확인 필요! : 업로드된 파일있다면 받아오기:불가 -->
               <button type="button" class="btn btn-info imgBtn form-control">상세이미지 이미지 ${title}</button> 
               <input hidden="hidden" name="img" value="${bean.img }">
            </div>
         </div>         
         <div class="form-group col-md-12">
            <button type="submit" class="btn btn-primary">${title}</button>
            <button type="reset" class="btn btn-default">취소</button>      
         </div>
      </form>
   </div>
</div>
</body>
</html>
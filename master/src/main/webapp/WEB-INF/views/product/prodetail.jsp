<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
$(function(){
         $('#transMsg').text("");
         $('#startMsg').text("");
   $('#prodetail').submit(function(){
      var startday = $('#startday').val();
      var trans = $('#trans').val();
      if(startday == ""){
         $('#startMsg').text("출발일이 비었습니다.");
         $('#transMsg').text("");
         return false;
      }else if(trans == ""){
         $('#startMsg').text("");
         $('#transMsg').text("교통편이 비었습니다.");         
         return false;
      }else{
         $('#transMsg').text("");
         $('#startMsg').text("");
         $('#prodetail').submit();
      }
   });
});



</script>
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

<!-- 
      //prodetail : 항공편 & 출발일
      -->
<body class="theme-black">
<%@ include file="../template/Container.jsp" %>

   
   <!-- !PAGE CONTENT! -->
   <div class="w3-main contents" style="margin-left: 300px; margin-top: 60px;">

      <div class="w3-container container">
         <%-- <h1>${title }페이지</h1> --%>
         <div class="col-md-12">
            <form action="insertDetail" method="post" id="prodetail">
               <div class="col-md-4">
                  <label>상품 코드 : ${id }</label> <input hidden="hidden" value="${id}"
                     name="proid" id="proid">
               </div>
               <div class="form-group col-md-8">
                  <label for="startday" class="col-md-2 control-label">출발일</label>
                  <div class="col-md-4">
                     <input type="date" class="form-control" id="startday"
                        name="startday" min="${sysdate }">
                        <div class="col-md-12 text-danger" id="startMsg">
                        </div>
                  </div>
                  <label for="trans" class="col-md-2 control-label">교통편</label>
                  <div class="col-md-4">
                     <input type="text" class="form-control" id="trans"
                        name="trans" placeholder="교통편을 작성해 주십시오.">
                        <div class="col-md-12 text-danger" id="transMsg">
                        </div>
                  </div>
               </div>
               <div class="form-group col-md-8">
                  <button type="submit" class="btn btn-primary">입력</button>
                  <button type="reset" class="btn btn-default">취소</button>
                  <c:if test="${id eq 'add' }">
               <a role="button" class="btn btn-info" href="detail?id=add">입력으로 돌아가기</a>
               </c:if>
                  <c:if test="${id ne 'add'}">
               <a role="button" class="btn btn-info" href="detail?id=${id }">상품으로 돌아가기</a>
               </c:if>
               </div>
            </form>
         </div>
         <div class="col-md-12">
            <table class="table table-hover">
               <tr>
                  <th>출발일</th>
                  <th>항공편</th>
                  <th>&nbsp;</th>
               </tr>
               <c:forEach items="${pdlist }" var="bean">
                  <tr>
                     <td>${bean.startday }</td>
                     <td>${bean.trans }</td>
                     <td><a role="button" class="btn btn-default" href="delDetail?proid=${id}&startday=${bean.startday}&trans=${bean.trans}">삭제</a>
                     </td>
                  </tr>
               </c:forEach>
            </table>
         </div>
      </div>
      </div>
</body>

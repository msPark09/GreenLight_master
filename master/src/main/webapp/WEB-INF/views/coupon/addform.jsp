
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
	$(document).ready(function() {
		$(".searchBtn").on("click", function() {
			var target = $('.searchDiv');
			var id = $("#search").val();
			$.ajax({
				"url" : "searchUser",
				"data" : {
					'id' : id
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
		$(document).on('click', '.useridBtn', function() {
			var id = $(this).attr("id");
			$("#customid").attr("value", id);
		});
		$(".reset").on("click", function() {
			$("#customid").attr("value", "");
			$("#cupname").val("");
			$("#percent").val("");
			$("#cupperi").val("");
			$('.searchDiv').html("");
		});

	});
</script>
<style type="text/css">
@import
	url("//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css")
	;
</style>

<body class="theme-black">
<%@ include file="../template/Container.jsp" %>


	<!-- !PAGE CONTENT! -->
	<div class="w3-main contents" style="margin-left: 300px; margin-top: 60px;">
		<div class="w3-container container">
			<!-- <h1>쿠폰 입력 페이지</h1> -->
			<div class="row">
				<c:if test="${success ne null }">
					<div class="col-md-12 panel panel-success">
						<div class="panel-heading">${success }</div>
						<div class="panel-body">${successMSG }</div>
					</div>
				</c:if>
			</div>
			<div class="row">
				<div class="col-md-12">
					 <label for="eid" class="col-md-12 control-label"><h3>COUPON PAGE</h3></label>
        	 			
					<form action="./" method="post">
						<!--쿠폰생성 폼-->
					
						<div class="form-group col-md-12">
							<label for="cupid" class="col-md-2 control-label">쿠폰ID</label>
							<div class="col-md-10">
								<input type="text" class="form-control" id="cupid" name="cupid"
									value="${cupid }" readonly="readonly">
							</div>
						</div>
					
						<div class="form-group col-md-12">
							<label for="cupname" class="col-md-2 control-label">쿠폰명</label>
							<div class="col-md-10">
								<input type="text" class="form-control" id="cupname"
									name="cupname" placeholder="해당 쿠폰명을 작성해 주십시오.">
							</div>
						</div>
						
						<div class="form-group col-md-12 ${errs.percent }">
							<label for="percent" class="col-md-2 control-label">적용률</label>
							<div class="col-md-4">
								<input type="text" class="form-control" id="percent"
									name="percent" placeholder="적용될 할인율 작성. 10%->0.10 형식으로 작성">

							</div>
								<div class="col-md-1">&nbsp;</div>
							<label for="cupperi" class="col-md-1 control-label">기한</label>
							<div class="col-md-4">
								<input type="date" class="form-control" id="cupperi"
									name="cupperi" min="${sysdate }">

							</div>
						</div>
						
						<div class="form-group col-md-12">
							<label for="customid" class="col-md-2 control-label">타겟</label>
							<div class="col-md-10">
								<input type="text" class="form-control" id="customid"
									name="customid" placeholder="아래 검색을 통해 입력하세요."
									readonly="readonly">
							</div>
						</div>
						<!--고객 리스트-->
						<div class="form-group col-md-12">
							<label for="search"class="col-md-2 control-label">고객 검색</label>
							<div class="col-md-5 form gropu">
								<input type="text" class="form-control col-md-7" id="search"
									name="search" placeholder="아이디 검색">
								<button type="button"
									class="btn btn-info form-control searchBtn">
									<span class="glyphicon glyphicon-search"></span> 검색
								</button>	
							</div>
							<div class="col-md-5">&nbsp;</div>
						</div>
						
						
						<div class="form-group col-md-12">
							<p class="col-md-2" style="margin-left:1.2%;">&nbsp;</p>
							<button type="submit" class="btn btn-primary col-md-2">입력</button>
							<button type="button" class="btn btn-default col-md-2 reset">취소</button>
							<p class="col-md-3">&nbsp;</p>
						</div>
					</form>
					<div class="col-md-12 searchDiv"></div>
				</div>
			</div>
		</div>
		</div>
</body>
</html>

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


<body class="theme-black">
<%@ include file="../template/Container.jsp" %>


<!-- !PAGE CONTENT! -->
<div class="w3-main contents" style="margin-left:300px;margin-top:60px;">
  <div class="w3-container container">
			<div class="row">
				<div class="col-md-12">
					<h3>FAQ PAGE</h3>
						<p>&nbsp;</p>
					<a class="btn btn-primary addBtn" href="detailFAQ?id=add"
						role="button">입력</a>
				</div>
			</div>
			<div class="row">
				<div class="panel-group" id="accordion" role="tablist"
					aria-multiselectable="true">
					<c:forEach items="${vlist }" var="bean">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#${bean.vocid }"><strong>${bean.vocid} : </strong>${bean.voctitle }</a>
								</h4>
							</div>
							<div id="${bean.vocid }" class="panel-collapse collapse">
								<div class="panel-body">${bean.voccontent }</div>
								<div class="panel-body">
									<strong>Answer : </strong>${bean.answer }
								</div>
								<div class="panel-body">
									<a class="btn btn-primary" href="detailFAQ?id=${bean.vocid }"
										role="button">수 정</a><a class="btn btn-default"
										href="del?id=${bean.vocid }&field=FAQ" role="button">삭 제</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
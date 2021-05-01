
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
   	.slideimg{
   		height:100%;
   		width:100%;
   	}

</style>

<body class="theme-black">
<%@ include file="../template/Container.jsp" %>


<!-- !PAGE CONTENT! -->
<div class="w3-main contents" style="margin-left:300px;margin-top:60px;">
  <div class="w3-container container">
		<div class="row">
			<div class="col-md-12">
					<h3>SLIDE PAGE</h3>
					<div>
						&nbsp;
					</div>
						<a class="btn btn-primary" href="detail?id=add" role="button">입력</a>
					</div>
					<table class="table table-hover" >
					<tr>
						<th>타이틀</th>
						<th>이미지</th>
						<th>&nbsp;</th>
					</tr>

					<c:forEach items="${sdlist }" var="bean">
						<tr>
							<td>${bean.title }</td>
							<td><img class="slideimg img-thumbnail" width="350px" height="500px" src="/master/file/${bean.img }"/></td>
							<td><a class="btn btn-info" href="detail?id=${bean.mainid }" role="button">수 정</a> 
								<a class="btn btn-default" href="del?id=${bean.mainid }"
								role="button">삭 제</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
    </div>
</body>
</html>

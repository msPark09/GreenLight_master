
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
			<label for="eid" class="col-md-12 control-label"><h3>1:1 PAGE</h3></label>
        	 			<h3>&nbsp;</h3>
				<table class="table table-condensed">
					<c:forEach items="${vlist }" var="bean">
						<tr>
							<th rowspan="2">${bean.vocid }</th>
							<th>고객 Id</th>
							<td colspan="2">${bean.customid }</td>
							<th>삭제</th>
							<td><a class="btn btn-default" href="del?id=${bean.vocid }&field=OneQ" role="button">삭제</a></td>
						</tr>
						<tr>
							<th>문의 제목</th>
							<td colspan="2">${bean.voctitle }</td>
							<th>답글 여부</th>
							<c:if test="${bean.answer ne null }">
								<td>
									<a class="btn btn-info" href="detail?id=${bean.vocid }&field=OneQ" role="button">수정</a>
								</td>
							</c:if>
							<c:if test="${bean.answer eq null }">
								<td>
									<a class="btn btn-primary" href="detail?id=${bean.vocid }&field=OneQ" role="button">입력</a>
								</td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
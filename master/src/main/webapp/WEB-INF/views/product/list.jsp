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
  
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
		<!-- <h1>상품 리스트 페이지-헤더 푸터 메뉴 적용 예정</h1> -->
		<div class="row">
			<div class="col-md-12">
					<h3>PRODUCT PAGE</h3>
					<div>
						&nbsp;
					</div>
						<a class="btn btn-primary" href="detail?id=add" role="button" >입력</a>
				<table class="table ">
					<tr>
						<th rowspan="2">상품코드</th>
						<th>상품명</th>
						<th>카테고리</th>
						<th>지역</th>
						<th>가격</th>
						<th rowspan="2">&nbsp;</th>
					</tr>
					<tr>
						<th>할인율</th>
						<th>별점</th>
						<th>우선순위</th>
						<th>이벤트 항목</th>
					</tr>

					<c:forEach items="${plist }" var="bean">

						<tr>
							<td rowspan="2">${bean.proid }</td>
							<td>${bean.proname }</td>
							<td>${bean.name }</td>
							<td>${bean.loc }</td>
							<td><fmt:formatNumber value="${(bean.price*(1-bean.discount))-((bean.price*(1-bean.discount))%10) }" type="currency" currencySymbol="￦" /></td>
							<td rowspan="2"><a class="btn btn-info"
								href="detail?id=${bean.proid }" role="button">수 정</a> <a
								class="btn btn-default" href="del?id=${bean.proid }"
								role="button">삭 제</a></td>
						</tr>
						<tr>
							<td><fmt:formatNumber value="${bean.discount }"
									type="percent" /></td>
							<td><fmt:formatNumber value="${bean.point }" pattern=".00" /></td>
							<td>${bean.prio }</td>
							<!-- 핫딜 : 1 / 마감임박 : 2 /신규상품 : 3 /매진임박:인원수가 최대-4일 경우 -->
							<c:if test="${bean.event eq(0) }">
								<td>진행 이벤트 없음</td>
							</c:if>
							<c:if test="${bean.event eq(1) }">
								<td>핫딜</td>
							</c:if>
							<c:if test="${bean.event eq(2) }">
								<td>마감임박</td>
							</c:if>
							<c:if test="${bean.event eq(3) }">
								<td>신규상품</td>
							</c:if>
							<c:if test="${bean.event eq(4) }">
								<td>매진임박</td>
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
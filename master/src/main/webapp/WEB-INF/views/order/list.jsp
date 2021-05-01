
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
	//상품 최대 인원수, 주문된 인원수 ajax
	$(document).on("click", ".proBtn", function() {
		var bean = $(this).text();		
		var target = $(".proDiv");
		$.ajax({
			"url" : "selpo",
			"data" : {
				'bean' : bean,
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
	//상품 최대 인원수, 주문된 인원수 ajax

	//주문 취소
	$(document)
			.on(
					'click',
					'.delBtn',
					function() {
						//취소 승인
						var id = $(this).attr("id");
						var userid = $("." + id).eq(0).text();
						var price = $("." + id).eq(1).text();
						var r = window
								.confirm("주문을 취소하시겠습니까?\n구매자로부터 취소 승인이 되거나\n유선상으로 취소 요청이 들어 온 경우에만 확인 버튼을 눌러주십시오.");
						if (r == true) {
							location.href = "del?id=" + id + "&userid="
									+ userid + "&price=" + price;
						}
						return false;
					});

	//인원 수 수정 + 결제일 sysdate 처리 ajax upBtn
	$(document)
			.on(
					'click',
					'.upBtn',
					function() {
						//인원 수 수정 승인
						var id = $(this).attr("id");
						var userid = $("." + id).eq(0).text();
						var price = $("." + id).eq(1).text();
						var gop = $("#" + id + "go").val();
						var r = window
								.confirm("인원수를 조정하시겠습니까?\n추가 금액 결제 후 인원 수 조정이 가능합니다.\n추가 금액이 결제 완료 되었는지를 확인 후 승인하시길 바랍니다.");
						//alert(url+" href : "+"./insertagreed?"+url);
						if (r == true) {
							location.href = "update?id=" + id + "&userid="
									+ userid + "&gop=" + gop + "&price="
									+ price;
						}
						return false;
					});
</script>


<body class="theme-black">
<%@ include file="../template/Container.jsp" %>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main contents" style="margin-left: 300px; margin-top: 60px;">

		<div class="w3-container container">
			<div class="row">
				<div class="col-md-12">
						<h3>ORDER PAGE</h3>
						
						<div>
							&nbsp;
							<a href="https://www.sandbox.paypal.com/webscr">paypal 이동 > </a>
						</div>
					<div class="proDiv">
						<!-- 주문의 최대인원,주문된 인원 보여줄 예정 -->
					</div>
					<table class="table table-hover">
						<tr>
							<th colspan="2">상품코드</th>
						</tr>
						<tr>
							<th>주문자</th>
							<th>결제일</th>
						</tr>
						<tr>
							<th>신청인원</th>
							<th>결제 금액</th>
						</tr>
						<tr>
							<th colspan="2">삭제</th>
						</tr>
						<c:if test="${empty olist}">
							<td colspan="6">주문목록이 없습니다.</td>
						</c:if>
						<c:if test="${!empty olist}">
							<c:forEach items="${olist }" var="bean">
								<tr>
									<td colspan="2"><button class="proBtn btn btn-default"
											type="button" id="${bean.proid}">${bean.proid}_${bean.startday }_${bean.trans }</button></td>
								</tr>
								<tr>
									<td class="${bean.orderid}">${bean.customid}</td>
									<td>${bean.payd }</td>
								</tr>
								<tr>
									<td><div class="col-md-6">
											<input type="text" id="${bean.orderid}go" name="goperson"
												value="${bean.goperson }" class="form-control">
										</div></td>
									<td class="${bean.orderid}">${bean.paycash }</td>
								</tr>
								<tr>
									<td colspan="2"><button class="btn upBtn btn-info" type="button"
											id="${bean.orderid }">수 정</button>
										<button class="btn delBtn btn-default" type="button"
											id="${bean.orderid }">주문 취소</button></td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
			</div>
		</div>
		</div>
</body>
</html>
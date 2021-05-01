<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<title>GreenLight master</title>
<!-- Jquery Core Js -->
<script src="/master/plugins/jquery/jquery.min.js"></script>

<!-- Bootstrap Core Js -->
<script src="/master/plugins/bootstrap/js/bootstrap.js"></script>

<!-- Select Plugin Js -->
<script src="/master/plugins/bootstrap-select/js/bootstrap-select.js"></script>

<!-- Slimscroll Plugin Js -->
<script src="/master/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

<!-- Waves Effect Plugin Js -->
<script src="/master/plugins/node-waves/waves.js"></script>

<!-- Jquery CountTo Plugin Js -->
<script src="/master/plugins/jquery-countto/jquery.countTo.js"></script>

<!-- Morris Plugin Js -->
<script src="/master/plugins/raphael/raphael.min.js"></script>
<script src="/master/plugins/morrisjs/morris.js"></script>

<!-- ChartJs -->
<script src="/master/plugins/chartjs/Chart.bundle.js"></script>

<!-- Flot Charts Plugin Js -->
<script src="/master/plugins/flot-charts/jquery.flot.js"></script>
<script src="/master/plugins/flot-charts/jquery.flot.resize.js"></script>
<script src="/master/plugins/flot-charts/jquery.flot.pie.js"></script>
<script src="/master/plugins/flot-charts/jquery.flot.categories.js"></script>
<script src="/master/plugins/flot-charts/jquery.flot.time.js"></script>

<!-- Sparkline Chart Plugin Js -->
<script src="/master/plugins/jquery-sparkline/jquery.sparkline.js"></script>

<!-- Custom Js -->
<script src="/master/js/admin.js"></script>
<script src="/master/js/pages/index.js"></script>

<!-- Demo Js -->
<script src="/master/js/demo.js"></script>

<!-- Favicon-->
<link rel="icon" href="favicon.ico" type="image/x-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" type="text/css">

<!-- Bootstrap Core Css -->
<link href="/master/plugins/bootstrap/css/bootstrap.css"
	rel="stylesheet">

<!-- Waves Effect Css
    <link href="/master/plugins/node-waves/waves.css" rel="stylesheet" /> -->

<!-- Animation Css 
    <link href="/master/plugins/animate-css/animate.css" rel="stylesheet" />-->

<!-- Morris Chart Css
    <link href="/master/plugins/morrisjs/morris.css" rel="stylesheet" />-->

<!-- Custom Css -->
<link href="/master/css2/style.css" rel="stylesheet">

<!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
<link href="/master/css2/themes/all-themes.css" rel="stylesheet" />



</head>





<title>Insert title here</title>
<link href="" rel="stylesheet">
<script type="text/javascript">
	$(document).ready(function() {
		var id = '${sessionScope.id}';
		if (id == "") {
			window.location.replace("/master/test/error");
		}
	});
</script>
<style>
.imglogo {
	height: 20%;
	width: 20%;
}

@media screen and (min-width: 800px) {
	#hidden {
		display: none;
	}
}
</style>
</head>

<body class="theme-black">

	<!-- Overlay For Sidebars -->
	<div class="overlay"></div>
	<!-- #END# Overlay For Sidebars -->
	<!-- 헤더 -->

	<nav class="navbar">
		<div class="container-fluid w3-card-4 ">
			<div class="navbar-header">
				<a href="javascript:void(0);" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar-collapse"
					aria-expanded="false"></a>
				<!-- 마켓페이지,로그아웃할부분 -->
				<a href="javascript:void(0);" class="bars"></a> <!-- hidden 메뉴  --><a
					class="navbar-brand" href="/master/voc/list?field=OneQ">GREENLIGHT - ADMIN PAGE</a>

			</div>
			<div class="collapse navbar-collapse" id="navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<!-- 모바일 마켓페이지,로그아웃 -->
					<li><a href="#" class="js-search" data-close="true"><i
							class="material-icons">&nbsp;</i> <span>&nbsp;</span></a></li>
					<!-- 모바일 마켓페이지, 로그아웃 -->
					<li><a href="http://203.236.209.210:8080/market/"
						class="js-search" data-close="true"><i class="material-icons">home</i>
							<span>MARKET</span></a></li>
					<!--  모바일 마켓페이지, 로그아웃 -->
					<li><a href="/master/test/logout" class="js-search"
						data-close="true"><i class="material-icons">input</i><span>
								LOG-OUT</span></a></li>
					<!-- 모바일 마켓페이지, 로그아웃 -->
					<li><a href="#" class="js-search" data-close="true"><i
							class="material-icons">&nbsp;</i> <span>&nbsp;</span></a></li>
					<!-- 모바일 마켓페이지, 로그아웃 -->
					<li id="hidden"><a data-target="javascript:void(0);"
						class="js-search" data-close="true"><span> 접어두기</span></a></li>
					<!--  모바일 마켓페이지, 로그아웃 -->
					<!-- 모바일 마켓페이지, 로그아웃 -->
				</ul>
			</div>
		</div>
	</nav>

	<!-- #헤더 -->


	<section>
		<!-- 전체 사이드바 -->
		<aside id="leftsidebar" class="sidebar">
			<!-- ADMIN 환영합니다 -->
			<div class="user-info">
				<div class="image">
					<img src="/master/file/vixx.JPG" width="80" height="90" alt="User" />
					<div>&nbsp;</div>
					<!-- <div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">관리자님 환영합니다</div>  -->
				</div>
			</div>
			<!-- #ADMIN 환영합니다 -->


			<!-- 메뉴들 -->
			<div class="menu">
				<ul class="list">
					<li class="header">ADMIN MENU</li>
					<li class="active"><a
						href="http://203.236.209.210:8080/market/"> <i
							class="material-icons">home</i> <span>마켓홈페이지</span>
					</a></li>
					<li><a href="/master/slide/list"> <i
							class="material-icons">burst_mode</i> <span>슬라이드관리</span>
					</a></li>

					<li><a href="/master/product/list"> <i
							class="material-icons">shop</i> <span>상품관리</span>
					</a></li>
					<li><a href="/master/event/list"> <i
							class="material-icons">event</i> <span>이벤트관리</span>
					</a>
					<li><a href="/master/coupon/"> <i class="material-icons">card_giftcard</i>
							<span>쿠폰관리</span>
					</a></li>
					<li><a href="/master/customer/list"> <i
							class="material-icons">people</i> <span>고객관리</span>
					</a></li>
					<li><a href="/master/notice/"> <i class="material-icons">notifications</i>
							<span>공지사항관리</span>
					</a></li>

					<li><a href="javascript:void(0);" class="menu-toggle"> <i
							class="material-icons">payment</i> <span>주문관리</span>
					</a>
						<ul class="ml-menu">
							<li><a href="/master/order/total ">전체주문 관리</a></li>
							<li><a href="/master/order/cancel">취소주문건 관리</a></li>
						</ul></li>
					<li><a href="javascript:void(0);" class="menu-toggle"> <i
							class="material-icons">ring_volume</i> <span>VOC관리</span>
					</a>
						<ul class="ml-menu">
							<li><a href="/master/voc/list?field=FAQ ">FAQ관리</a></li>
							<li><a href="/master/voc/list?field=OneQ">1대1문의</a></li>
							<li><a href="/master/voc/list?field=ProQ">상품문의</a></li>
						</ul>
				</ul>
			</div>
			<!-- #메뉴들 -->

			<!-- 사이드바 footer -->
			<div class="legal">
				<div class="copyright">
					&copy; 2016 <a href="javascript:void(0);">GREENLIGTH <b>Version:
					</b> 1.0.0
					</a>
				</div>

			</div>
			<!-- #사이드바 footer-->
			<!-- #전체 사이드바 -->
		</aside>
	</section>




</body>

</html>
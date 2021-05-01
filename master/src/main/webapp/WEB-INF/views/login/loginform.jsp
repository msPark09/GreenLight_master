
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=1,initial-scale=1,user-scalable=1" />
	 <title>GreenLight master</title>
	<link href="http://fonts.googleapis.com/css?family=Lato:100italic,100,300italic,300,400italic,400,700italic,700,900italic,900" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="/master/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/master/css/styles.css" />
	<style>
	.error{
		
	}
	
	</style>

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

</head>
	<body>
		
	<section class="container login-form">
		<section>
			<form action="welcome" enctype="multipart/form-data" method="post">
				<img src="/master/images/lo_go.png" alt="" class="img-responsive" />
			
				<div class="form-group">
					<input type="text" required class="form-control" placeholder="아이디를 입력해주세요"  id="mid" name="mid"/>
					
				</div>
				
				<div class="form-group">
					<input type="password"  required class="form-control" placeholder="비밀번호를 입력해주세요" id="mpw" name="mpw" />
					
				</div>
				
				<button type="submit" name="go" class="btn btn-primary btn-block">로그인</button>
				
				
			</form>
								
				 <p>${error }</p>

		
		</section>
	</section>
	
	</body>
</html>


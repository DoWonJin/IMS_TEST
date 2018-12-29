<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css?ver='1'" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<link href="${pageContext.request.contextPath}/css/styles.css?ver='1'" rel="stylesheet">
<style>
	.intro{
		margin-left:10%;
	}
	.intro h2,h4{line-height: 2em;}
	.intro strong{color:#2ecc71;}
	.inf{margin-left:5%;}
	.joinButton{
		margin:0 auto;
		width:80%;
		height:100%;
	}
	.joinButton button{
		width:30%;
		height:8em;
		padding:3em 10px;
		margin:3%;
		border-radius:15px;
		background: linear-gradient(#2ecc71 0%, #5fffa2 10%, #2ecc71 20%,  #2ecc71 80%, #5fffa2 90%, #2ecc71 100%);
		color:#ffffff;
		text-align: center;
		font-size:30px;
	}
</style>
</head>
<body>
	<header>
		<div class="container">
			
			<div class="page-header">
				<h1>회원가입</h1>
				
			</div>
		</div>
	</header>
	<div class="intro">
		<h2><strong>앞으로의 약국</strong></h2>
		<h4><strong>손안에 약국</strong>에 오신 걸 환영합니다.</h4>
	</div>
	<div class="pull-right">
		<a href="${pageContext.request.contextPath }/loginForm">
			<span class="h6">메인으로</span>
		</a>
	</div>
	<div class="caption"><br><br></div>
	<div class="inf">
		<h5>회원 유형을 선택해주세요</h5>
	</div>
	<br><br>
	<div class="joinButton">
		<a href="${pageContext.request.contextPath }/joinGeneralMemberForm1?userType=1">
			<button type="button" id="patient"><strong style="font-size:100%;">일반<br>회원</strong><br><br></button>
		</a>
		<a href="${pageContext.request.contextPath }/joinGeneralMemberForm1?userType=0">
			<button type="button" id="seller"><strong style="font-size:80%;">판매자/약사<br>/관리자</strong><br><br></button>
		</a>
	</div>

</body>
</html>
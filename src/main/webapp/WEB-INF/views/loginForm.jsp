<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%-- <link href="${pageContext.request.contextPath}/css/patHeader.css?after" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/patScript.css" rel="stylesheet"> --%>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css?ver='1'" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<link href="${pageContext.request.contextPath}/css/styles.css?ver='1'" rel="stylesheet">
<style>
	#wrapper{
		padding:2em;
		margin: 0 30%;
	}
	.container{
		width:100%;
	}
</style>
</head>
<body>
<div id="wrapper">
	<header>
		<div class="container">
			<div class="page-header">
				<h1>로그인</h1>
			</div>
		</div>
	</header>
	<div id='col-lg-6'>
		<form class="form-horizontal well" action='${pageContext.request.contextPath}/loginFormAction' method='post'>
			<div style="text-align: center;">
       		<div class="row" style="display: inline-block;">
	       		<div class="col-lg-12">
	       			<input type="text" class="form-control" placeholder="아이디" name='member_id' style="float:left;">
	       			<div class="nav-tabs"><br></div>
	       		</div>
	       	</div>
	       	<div><br></div>
	       	<div class="row" style="display: inline-block;">
	       		<div class="col-lg-12">
	       			<input type="password" class="form-control" name='member_pw' placeholder="패스워드">
	       			<div class="nav-tabs"><br></div>
	       		</div>
	       	</div>
	       	<div class="row"><br></div>
       		<button type="submit" class="btn btn-default">Sign in</button>
	       	</div>
    	</form>
      	<div class="form-horizontal well">
      		처음이신가요? <a href='${pageContext.request.contextPath}/joinMemberClassification'>회원가입</a><br><br>
      		아이디나 비밀번호를 잊어 버리셨나요? <br>
      		<a href="${pageContext.request.contextPath }/findMemberIDPW">아이디/비밀번호 찾기</a>
      	</div>
	</div>
</div>
</body>
</html>






<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
	<style>
		#wrapper{
			margin: 0 auto;
			border : 1px solid black;
			width: 400px;
		}
	</style>
</head>
<body>

<div id='wrapper'>
	<h3>로그인</h3>
	<form action='${pageContext.request.contextPath}/loginFormAction' method='post'>
		ID : <input type='text' name='member_id'><br>
		PW : <input type='text' name='member_pw'><br>
		<input type='submit' value='로그인'> <a href='${pageContext.request.contextPath}/joinMemberClassification'>회원가입</a>
	</form>
</div>


<button type='button' onclick='${pageContext.request.contextPath}/loginAsChe'>약사로 로그인하기</button>
		<button type='button' onclick='${pageContext.request.contextPath}/loginAsPat'>일반 회원으로 로그인하기</button><br> --%>
		<%-- <div id="login_or_find_form">
			<form action='${pageContext.request.contextPath}/loginFormAction' method="post">
				<input type="text" placeholder="아이디" name="member_id"><br>
				<img src="${pageContext.request.contextPath}/img/line_login.png"><br><br>
				<input type="password" placeholder="비밀번호" name='member_pw'><br>
				<img src="${pageContext.request.contextPath}/img/line_login.png"><br>
				<div class="nav-tabs"></div>
				<input type="image" src="${pageContext.request.contextPath}/img/login_button.png"><br>
			</form>
			<div id="find_form">
				<a href='${pageContext.request.contextPath}/findMemberIDPW'>아이디/비밀번호 찾기</a><br>
				<div class="nav-tabs"></div>
				<img src="${pageContext.request.contextPath}/img/line_find.png"><br>
			</div>
			<br><br><br><br><br><br><br>
			<div id="join_before_login">
				처음이신가요? <a href='${pageContext.request.contextPath}/joinMemberClassification'>회원가입</a>
			</div>
		</div> 


</body>
</html> --%>




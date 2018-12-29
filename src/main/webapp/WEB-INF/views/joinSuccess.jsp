<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 성공!</title>
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
	.form-horizontal.well p{text-align: center;}
</style>
</head>
<body>
<div id="wrapper">
	<div id='col-lg-8'>
		<div class="form-horizontal well">
			<p><strong><c:out value="${m_nick }"/>님</strong>가입이 완료되었습니다.</p><br>
			<a href="${pageContext.request.contextPath}/loginForm" class="pull-right">메인으로</a>
		</div>
	</div>
</div>
</body>
</html>
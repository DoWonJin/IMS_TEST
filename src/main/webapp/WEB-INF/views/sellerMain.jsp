<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css?ver='1'" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<link href="${pageContext.request.contextPath}/css/styles.css?ver='1'" rel="stylesheet">
<style>
	.pull-right.navImg{
		font-weight:bold;
		margin-bottom:1em;
		font-size:2.5em;
		width:250px;
		margin-right:0;
		text-align: right;
	}
	.pull-right.navImg span{color:#2ecc71;}
	.navImg:hover a{text-decoration: none;}
	.navImg:hover span{
		color:#5fffa2;
	}
</style>
</head>
<body>
<div id="wrapper">
	<header>
		<div class="container">
			<div class="page-header">
				<h1>처방기록</h1>
			</div>
		</div>
		<section id="name" style="padding-left: 30px;">
			<h3><c:out value="${SUD.member_nick }"/> 님 환영합니다 </h3>
			<a href="${pageContext.request.contextPath}/logout" style="float:right;padding-right:30px;">로그아웃</a>
		</section>
	</header>
	<br><br>
	<hr>
	<%-- <div class="row">
		<div class="pull-left" style="padding-left:50px;">
			<h1>약사</h1>
		</div>
		<div style="width: 30%;padding-right:50px;padding-top:1em;" class="pull-right">
			<div class="pull-right navImg">
				<a href="${pageContext.request.contextPath}/storage">
					<span>재고</span>
				</a>
			</div>
			<div class="pull-right navImg">	
				<a href="${pageContext.request.contextPath}/disease">
					<span>질병관리</span>
				</a>
			</div>
			<div class="pull-right navImg">	
				<a href="${pageContext.request.contextPath}/medicine">
					<span>약품추가하기</span>
				</a>
			</div>
			<div class="pull-right navImg">	
				<a href="${pageContext.request.contextPath}/prescriptionUpdate">
					<span>처방전</span>
				</a>
			</div>
		</div>
	</div> --%>
	<hr>
	<div class="row">
		<div class="pull-left" style="padding-left:50px;">
			<h1>판매자</h1>
		</div>
		<div style="width: 30%;padding-right:50px;padding-top:1em;" class="pull-right">
			<div class="pull-right navImg">
				<a href="${pageContext.request.contextPath}/storage">
					<span>재고</span>
				</a>
			</div>
			<div class="pull-right navImg">	
				<a href="${pageContext.request.contextPath}/product">
					<span>상품추가하기</span>
				</a>
			</div>
			<%-- <div class="pull-right navImg">
				<a href="${pageContext.request.contextPath}/showOrderList">
					<span>주문내역조회</span>
				</a>
			</div> --%>
			<%-- <div class="pull-right navImg">
				<a href="${pageContext.request.contextPath}/questionListForSeller">
					<span>문의내역조회</span>
				</a>
			</div> --%>
		</div>
	</div>
	<%-- <hr>
	<div class="row">
		<div class="pull-left" style="padding-left:50px;">
			<h1>관리자</h1>
		</div>
		<div style="width: 30%;padding-right:50px;padding-top:1em;" class="pull-right">
			<div class="pull-right navImg">
				<a href="${pageContext.request.contextPath}/dCategory">
					<span>질병카테고리</span>
				</a>
			</div>
			<div class="pull-right navImg">	
				<a href="${pageContext.request.contextPath}/productCategory1">
					<span>상품카테고리</span>
				</a>
			</div>
			<div class="pull-right navImg">	
				<a href="${pageContext.request.contextPath}/productCategory2">
					<span>상품카테고리2</span>
				</a>
			</div>
			<div class="pull-right navImg">	
				<a href="${pageContext.request.contextPath}/pharmacy">
					<span>약국관리</span>
				</a>
			</div>
			<div class="pull-right navImg">	
				<a href="${pageContext.request.contextPath}/medicine">
					<span>약품관리</span>
				</a>
			</div>
		</div>
	</div> --%>
	<div class="row">
		<br><br>
	</div>
</div>
</body>
</html>
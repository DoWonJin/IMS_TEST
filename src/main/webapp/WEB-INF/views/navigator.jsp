<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
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
<body>
<div id="col-lg-8">
	<header>
		<div class="container">
			<%-- <a href="${pageContext.request.contextPath}/navigator"><img alt="메뉴" src="${pageContext.request.contextPath}/img/navigator.png"></a> --%>
			<div class="page-header">
				<h1>CATEGORY</h1>
				<%-- <a href="${pageContext.request.contextPath}/myPrescriptionAll"><img alt="홈으로" src="${pageContext.request.contextPath}/img/home_pat.png"></a> --%>
			</div>
		</div>
	</header>
	<div class="row">
		<div class="pull-left" style="padding-left:50px;">
			<h1>SICK</h1>
		</div>
		<div style="width: 30%;padding-right:50px;padding-top:1em;" class="pull-right">
			<div class="pull-right navImg">
				<!-- 처방기록 -->
				<a href="${pageContext.request.contextPath}/myPrescriptionAll">
					<span>처방기록</span>
				</a>
			</div>
			<div class="pull-right navImg">
				<!-- 아플때 -->
				<a href="${pageContext.request.contextPath}/diseaseCategoryList">
					<span>자가진단</span>
				</a>
			</div>
			<div class="pull-right navImg">	
				<!-- 상품구매 -->
				<a href="${pageContext.request.contextPath}/buyProductList">
					<span>상품구매</span>
				</a>
			</div>
			<div class="pull-right navImg">	
				<!-- 주문기록 -->
				<a href="${pageContext.request.contextPath}/orderList">
					<span>주문내역</span>
				</a>
			</div>
		</div>
	</div>
	<div><hr></div>
	<div class="row">
		<div class="pull-left" style="padding-left:50px;">
			<h1>MYINFO</h1>
		</div>
		<div style="width: 30%;padding-right:50px;padding-top:1em;" class="pull-right">
			<div class="pull-right navImg">
				<!-- 마이페이지 -->
				<a href="${pageContext.request.contextPath}/myInfo">
					<span>마이페이지</span>
				</a>
			</div>
			<div class="pull-right navImg">
				<!-- 장바구니 -->
				<a href="${pageContext.request.contextPath}/basketList">
					<span>장바구니</span>
				</a>
			</div>
			<div class="pull-right navImg">	
				<!-- QNA -->
				<a href="${pageContext.request.contextPath}/questionList">
					<span>1:1 문의</span>
				</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>
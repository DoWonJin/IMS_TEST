<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link href="${pageContext.request.contextPath}/css/patHeader.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/diseaseCategory.css" rel="stylesheet"> --%>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css?ver='1'" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<link href="${pageContext.request.contextPath}/css/styles.css?ver='1'" rel="stylesheet">
<style>
	.row{
		display: inline;
		width:100%;
	}
	.inline{
		float:left;
		width:10em;
		height:10em;
		margin:0;
		margin-left:10%;
		margin-bottom:5em;
		background-color:#2ecc71;
		padding:10px;
		text-align:center;
		border-radius:50%;
	}
	.inline a{
		color:#fff;
		font-weight:bold;
		font-size:2em;
		height:100%;
		width:100%;
	}
	.inline:hover{background-color:#5fffa2;}
	.inline a:hover{text-decoration:none;}
</style>
</head>
<body>
<div id="wrapper">
	<header>
		<section>
			<div class="container">
				<nav class="navbar navbar-inverse" role="navigation">
			        <!-- Brand and toggle get grouped for better mobile display -->
			        <div class="navbar-header">
			          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
			            <span class="sr-only">Toggle navigation</span>
			            <span class="icon-bar"></span>
			            <span class="icon-bar"></span>
			            <span class="icon-bar"></span>
			          </button>
			          <a class="navbar-brand" href="#">Nav</a>
			        </div>
		      
		        	<!-- Collect the nav links, forms, and other content for toggling -->
			        <div class="collapse navbar-collapse navbar-ex1-collapse">
			          <ul class="nav navbar-nav">
			            <li><a href="${pageContext.request.contextPath}/myPrescriptionAll">처방기록</a></li>
			            <li class="active"><a href="${pageContext.request.contextPath}/diseaseCategoryList">자가진단</a></li>
			            <li><a href="${pageContext.request.contextPath}/buyProductList">상품구매</a></li>
			            <li><a href="${pageContext.request.contextPath}/orderList">주문내역</a></li>
			            <li><a href="${pageContext.request.contextPath}/myInfo">마이페이지</a></li>
			            <li><a href="${pageContext.request.contextPath}/basketList">장바구니</a></li>
			            <li><a href="${pageContext.request.contextPath}/questionList">1:1 문의</a></li>
			          </ul>
			          <ul class="nav navbar-nav navbar-right">
			            <li><a href="#">Link</a></li>
			          </ul>
			        </div><!-- /.navbar-collapse -->
		    	</nav>
			</div>
		</section>
		<div class="container">
			<%-- <a href="${pageContext.request.contextPath}/navigator"><img alt="메뉴" src="${pageContext.request.contextPath}/img/navigator.png"></a> --%>
			<div class="page-header">
				<span class="h1">
				<a href="${pageContext.request.contextPath}/diseaseCategoryList">질병 카테고리</a>
				</span>
				&nbsp;>&nbsp;
				 <span class='h3'>상분류 : ${dieaseDetailVO.diseaseCategoryName}</span>
				<%-- <a href="${pageContext.request.contextPath}/myPrescriptionAll"><img alt="홈으로" src="${pageContext.request.contextPath}/img/home_pat.png"></a> --%>
			</div>
		</div>
		<br>
	</header>
	<div class="row">
		
		<c:forEach var="disease" items="${dieaseDetailVO.diseaseList }">
			<div class="inline"><a  href="${pageContext.request.contextPath}/diseaseInfo?c_idx=${c_idx }&c_name=${dieaseDetailVO.diseaseCategoryName}&d_idx=${disease.d_idx }"><br>${disease.d_name}</a></div>
		</c:forEach>
	</div>
</div>
<%-- <div id="wrapper">
	<header>
		<div id="pat_board_title">
			<a href="${pageContext.request.contextPath}/navigator"><img alt="메뉴" src="${pageContext.request.contextPath}/img/navigator.png"></a>
			<div id="pat_board_title_word">
				질병 카테고리
				<a href="${pageContext.request.contextPath}/myPrescriptionAll"><img alt="홈으로" src="${pageContext.request.contextPath}/img/home_pat.png"></a>
			</div>
		</div>
	</header>
	<div>
		상분류 : ${dieaseDetailVO.diseaseCategoryName}
		<c:forEach var="disease" items="${dieaseDetailVO.diseaseList }">
			<div><a href="${pageContext.request.contextPath}/diseaseInfo?d_idx=${disease.d_idx }">${disease.d_name}</a></div>
		</c:forEach>
	</div>
</div> --%>
</body>
</html>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/patHeader.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/diseaseCategory.css" rel="stylesheet">
</head>
<body>
<div id="wrapper">
	<header>
		<div id="pat_board_title">
			<a href="${pageContext.request.contextPath}/navigator"><img alt="메뉴" src="${pageContext.request.contextPath}/img/navigator.png"></a>
			<div id="pat_board_title_word">
				질병 카테고리
				<a href="${pageContext.request.contextPath}/myPrescriptionAll"><img alt="홈으로" src="${pageContext.request.contextPath}/img/home_pat.png"></a>
			</div>
		</div>
	</header>
	<div>
		상분류 : ${dieaseDetailVO.diseaseCategoryName}
		<c:forEach var="disease" items="${dieaseDetailVO.diseaseList }">
			<div><a href="${pageContext.request.contextPath}/diseaseInfo?d_idx=${disease.d_idx }">${disease.d_name}</a></div>
		</c:forEach>
	</div>
</div>
</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문리스트</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css?ver='1'" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<link href="${pageContext.request.contextPath}/css/styles.css?ver='1'" rel="stylesheet">
</head>
<style>
	.row{
		margin:0 5em;
		padding:1em;
		font-size:15px;
		background-color: #fff;
		border-radius: 5px;
		box-shadow: .5px .5px gray inset;
	}
	a{font-size:small;}
</style>
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
			            <li><a href="${pageContext.request.contextPath}/diseaseCategoryList">자가진단</a></li>
			            <li><a href="${pageContext.request.contextPath}/buyProductList">상품구매</a></li>
			            <li class="active"><a href="${pageContext.request.contextPath}/orderList">주문내역</a></li>
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
			<div class="page-header">
				<h1>주문목록</h1>
			</div>
		</div>
		<br>
	</header>
	
	<div class="form-horizontal well">
		<div>
		<c:forEach var="orderListVO" items="${orderListVOList }">
		<div class="row">
			<div class="col-xs-12">
				<span><strong>주문일 : ${orderListVO.o_date }</strong></span>
				<a href="${pageContext.request.contextPath}/orderInfo?o_idx=${orderListVO.o_idx}" class="pull-right">주문상세보기</a>
			</div>
			<br><br>
			<div class="col-lg-11">
				<p id="order_img">주문번호 :  ${orderListVO.o_idx}</p>
				<p id="float_right">총 가격 : ${orderListVO.total_price }원<br></p>
			</div>
		</div>
		<div><br></div>
		</c:forEach>
		</div>
	</div>
</div>
</body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/patHeader.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/orderScript.css" rel="stylesheet">
</head>
<body>
<div id="wrapper">
	<header>
		<div id="pat_board_title">
			<a href="${pageContext.request.contextPath}/navigator"><img alt="메뉴" src="${pageContext.request.contextPath}/img/navigator.png"></a>
			<div id="pat_board_title_word">
				주문목록
				<a href="${pageContext.request.contextPath}/myPrescriptionAll"><img alt="홈으로" src="${pageContext.request.contextPath}/img/home_pat.png"></a>
			</div>
		</div>
	</header>
	<a href="${pageContext.request.contextPath}/buyProductList">물품구매 Go</a>
	<a href="${pageContext.request.contextPath}/basketList">장바구니 Go</a>
	<c:forEach var="orderListVO" items="${orderListVOList }">
		<div>
			주문일 ${orderListVO.o_date } <a href="${pageContext.request.contextPath}/orderInfo?o_idx=${orderListVO.o_idx}">주문상세보기</a>
			<div id="board_blue_box">
				<span id="order_img">주문번호 : ${orderListVO.o_idx}</span>
				<span id="float_right">총 가격 : ${orderListVO.total_price }<br></span>
				<div id="float_clear"><a href="">교환신청</a> <a href="">반품신청</a> <a href="">배송조회</a></div>
			</div>
		</div>
	</c:forEach>
</div>
</body>
</html> --%>







<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/patHeader.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/orderScript.css" rel="stylesheet">
</head>
<body>
<div id="wrapper">
	<header>
		<div id="pat_board_title">
			<a href="${pageContext.request.contextPath}/navigator"><img alt="메뉴" src="${pageContext.request.contextPath}/img/navigator.png"></a>
			<div id="pat_board_title_word">
				주문목록
				<a href="${pageContext.request.contextPath}/myPrescriptionAll"><img alt="홈으로" src="${pageContext.request.contextPath}/img/home_pat.png"></a>
			</div>
		</div>
	</header>
	<a href="${pageContext.request.contextPath}/buyProductList">물품구매 Go</a>
	<a href="${pageContext.request.contextPath}/basketList">장바구니 Go</a>
	<c:forEach var="orderListVO" items="${orderListVOList }">
		<div>
			주문일 ${orderListVO.o_date } <a href="${pageContext.request.contextPath}/orderInfo?o_idx=${orderListVO.o_idx}">주문상세보기</a>
			<div id="board_blue_box">
				<span id="order_img">주문번호 : ${orderListVO.o_idx}</span>
				<span id="float_right">총 가격 : ${orderListVO.total_price }<br></span>
				<div id="float_clear"><a href="">교환신청</a> <a href="">반품신청</a> <a href="">배송조회</a></div>
			</div>
		</div>
	</c:forEach>
</div>
</body>
</html> --%>
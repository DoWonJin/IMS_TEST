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
<style>
	#wrapper{margin:0 auto;}
</style>
</head>
<body>
	<div id='wrapper'>
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
				            <li><a href="${pageContext.request.contextPath}/orderList">주문내역</a></li>
				            <li><a href="${pageContext.request.contextPath}/myInfo">마이페이지</a></li>
				            <li><a href="${pageContext.request.contextPath}/basketList">장바구니</a></li>
				            <li class="active"><a href="${pageContext.request.contextPath}/questionList">1:1 문의</a></li>
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
					<h1>1:1문의</h1>
				</div>
			</div>
			<br>
		</header>
		<div class="form-horizontal well">
			<h3>질문</h3>
			<div>질문: ${qna.questionVO.q_content }</div>
			<div>작성자: ${SUD.member_name }</div>
			<div>질문날짜 : ${qna.questionVO.q_date }</div>
		</div>
		<div class="form-horizontal well">
			<h3>답변</h3>
			<div>답변: ${qna.answerVO.a_content }</div>
			<div>답변자: ${qna.answerVO.a_name }</div>
			<div>답변날짜 : ${qna.answerVO.a_date }</div>
		</div>
	</div>
</body>
</html>
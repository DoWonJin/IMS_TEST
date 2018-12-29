<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link href="${pageContext.request.contextPath}/css/patHeader.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/orderScript.css" rel="stylesheet"> --%>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css?ver='1'" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<link href="${pageContext.request.contextPath}/css/styles.css?ver='1'" rel="stylesheet">
<style type="text/css">
	.row{font-size: 20px;}
	.row .pull-left{
		max-width: 60%;
		line-height: 2.5em;
	}
	.infoTitle{
		font-weight:bold;
		color:#2ecc71;
	}
	.col-lg-11{padding:10px;}
	input{max-height:30px;}
	input::value,textarea::value{font-size:17px;}
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
			            <li><a href="${pageContext.request.contextPath}/diseaseCategoryList">자가진단</a></li>
			            <li><a href="${pageContext.request.contextPath}/buyProductList">상품구매</a></li>
			            <li><a href="${pageContext.request.contextPath}/orderList">주문내역</a></li>
			            <li class="active"><a href="${pageContext.request.contextPath}/myInfo">마이페이지</a></li>
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
				<h1>내 정보 관리</h1>
			</div>
		</div>
		<br>
	</header>
			
	<form action="${pageContext.request.contextPath}/modifyMemberAction" method="post" class="form-horizontal well">
		<input type="hidden" name="member_idx" value="${SUD.member_idx }">
		<div class="row">
			<div class="pull-left">
				<div class="col-lg-11">
					<span class="infoTitle">고객명 : </span>${SUD.member_name }
				</div>
				<div class="col-lg-11">
					<span class="infoTitle">비밀번호 : </span>
					<input type="password" name="member_pw" value="${memberVO.member_pw }">
				</div>
				<div class="col-lg-11">
					<span class="infoTitle">닉네임 : </span>
					<input type="text" name="member_nick" value="${memberVO.member_nick }">
				</div>
				<div class="col-lg-11">
					<span class="infoTitle">신분 : </span>일반회원
				</div>
				<div class="col-lg-11">
					<span class="infoTitle">연락처 : </span>
					<input type="text" name="member_phone" value="${memberVO.member_phone }">
				</div>
				<div class="col-lg-11">
					<span class="infoTitle">배송주소 : </span><br>
					<textarea class="form-control input-xlarge" name="member_address" rows="2" cols="30" >${memberVO.member_address }</textarea>
				</div>
			</div>
			<div class="pull-right" style="padding-right: 10%;">
				<div>
					<button type="submit">수정 완료</button>
				</div>
			</div>
		</div>
	</form>
	 <div class="form-horizontal well">
		  <div class="col-xe-12" style="text-align: center;font-size:1.6em;color:green;">
			  <ul class="breadcrumb">
				  <li class="active"><a href="#">주문목록</a> <span class="divider"></span></li>
				  <li class="active"><a href="#">1:1문의내역</a> <span class="divider"></span></li>
		      </ul>
	      </div>
	  </div>
</div>
<%-- <div id="wrapper">
	<header>
		<div id="pat_board_title">
			<a href="${pageContext.request.contextPath}/navigator"><img alt="메뉴" src="${pageContext.request.contextPath}/img/navigator.png"></a>
			<div id="pat_board_title_word">
				내 정보 관리
				<a href="${pageContext.request.contextPath}/myPrescriptionAll"><img alt="홈으로" src="${pageContext.request.contextPath}/img/home_pat.png"></a>
			</div>
		</div>
	</header>
	<div id="board_blue_box">
		<span>${SUD.member_name }</span><a href="${pageContext.request.contextPath}/logout">로그아웃></a>
	</div>
	<div id="board_blue_box">
		<div>회원정보 <span id="float_right"></span></div>
		<img src="${pageContext.request.contextPath}/img/line_login.png">
		<form action="${pageContext.request.contextPath}/modifyMemberAction" method="post">
			<input type="hidden" name="member_idx" value="${SUD.member_idx }">
			고객명 : ${SUD.member_name }<br>
			신분: ${memberVO.member_identity }<br>
			비밀번호 : <input type="password" name="member_pw" value="${memberVO.member_pw }"><br>
			닉네임:<input type="text" name="member_nick" value="${memberVO.member_nick }"><br>
			연락처 : <input type="text" name="member_phone" value="${memberVO.member_phone }"><br>
			배송 주소 : <input type="text" name="member_address" value="${memberVO.member_address }"><br>
			<input type="submit" value="수정하기">
		</form>
	</div>
</div> --%>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	.col-xs-offset-2{
		font-size:30px;
		font-weight:bold;
		
		text-align:center;
		display:inline-block;
		max-height:3em;
		width:80%;
	}
	.col-xs-offset-2 div{
		float:left;
		width:30%;
	}
	.col-xs-offset-2 div a{
		color:#2ecc71;
		text-decoration:none;
	}
	.col-xs-offset-2 div a:hover{
		color:#5fffa2;
		text-decoration:none;
	}
	.col-xs-offset-2 div.active{
		text-decoration:underline;
	}
	div.list{width:150px; vertical-align:middle; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;}
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
	<div class="col-xs-offset-2">
		<div>
			<a href="${pageContext.request.contextPath }/questionList">1:1문의</a>
		</div>
		<div> 
			<a href="${pageContext.request.contextPath }/proposeList">질문·건의</a>
		</div>
		<div class="active"> 
			<a href="${pageContext.request.contextPath }/noticeList">공지사항</a>
		</div>
	</div>
	<br><br><br>
	<div class="col-xs-10 col-xs-offset-1">
		<div>
			<strong class="h3">공지사항</strong>
		</div>
		<br>
		<div class="form-horizontal well">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>내용</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td><div class="list">공지사항입니다.</div></td>
					</tr>
					<tr>
						<td>2</td>
						<td><div class="list">공지사항입니다.</div></td>
					</tr>
					<tr>
						<td>3</td>
						<td><div class="list">공지사항입니다.</div></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>
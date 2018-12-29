<!--컨트롤은 BuyController임  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제직전페이지</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css?ver='1'" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<link href="${pageContext.request.contextPath}/css/styles.css?ver='1'" rel="stylesheet">
<script type="text/javascript">
	
	
</script>
<style>
	span{
		font-size:20px;
		font-weight:bold;
		color:#2ecc71;
	}
	table{margin:0 auto;}
	.col-xs-offset-5{height:3em;}
	button{font-size:15px;padding:8px;border-radius:5px;background-color: whitesmoke;}
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
			            <li class="active"><a href="${pageContext.request.contextPath}/buyProductList">상품구매</a></li>
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
			<div class="page-header">
				<h1>결제</h1>
			</div>
		</div>
		<br>
	</header>
	<div>
		<div class="col-xs-12">
			<form action="${pageContext.request.contextPath}/payComplete" class="form-horizontal well">
				<span>
					총 가격
				</span> 
				:
				<span>
					${total_price }원
				</span>
				<br><br>
				<table class="table table-stripe" style="width:80%;background-color: #fff;">
					<tr>
						<th> 순서</th>
						<th> 상품이름</th>
						<th> 상품가격</th>
						<th> 신청수량 </th>
						<th> 도착일</th>
					</tr>
					<c:forEach var="payStepVO" items="${payStepVOList}" varStatus="loop">
					<tr>
						<td>${loop.index+1 }</td>
						<td>${payStepVO.m_name }</td>
						<td>${payStepVO.finalPs_price }</td>
						<td>${payStepVO.itemNum }</td>
						<td>${arrival }</td>
					</tr>
					<input type="hidden" name="st_idx"  value="${payStepVO.st_idx }">
					<input type="hidden" name="itemNum" value="${payStepVO.itemNum }">
					</c:forEach>
				</table>
				<br><br>
				<%-- <span>주소명단:</span><br><br>
				<c:forEach var="addressVO" items="${addressVOList }">
					${addressVO.address } <br>
				</c:forEach> --%>
				<span>주소:</span>
				<input type="text" name="address" class="form-control input-xlarge" value="${memberVO.member_address}">
				<input type="hidden" name="total_price" value="${total_price }">
				<br>
				<div class="col-xs-offset-5" >
					<button type="submit">결제</button>
				</div>
				<br>
			</form>
			
		</div>
	</div>
</div>
</body>
</html>

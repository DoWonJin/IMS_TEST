<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>처방기록</title>
<title>처방기록</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css?ver='1'" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<link href="${pageContext.request.contextPath}/css/styles.css?ver='1'" rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js?ver='1'"></script>
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
			          <a class="navbar-brand" href="${pageContext.request.contextPath}/navigator">Nav</a>
			        </div>
		      
		        	<!-- Collect the nav links, forms, and other content for toggling -->
			        <div class="collapse navbar-collapse navbar-ex1-collapse">
			          <ul class="nav navbar-nav">
			            <li class="active"><a href="${pageContext.request.contextPath}/myPrescriptionAll">처방기록</a></li>
			            <li><a href="${pageContext.request.contextPath}/diseaseCategoryList">자가진단</a></li>
			            <li><a href="${pageContext.request.contextPath}/buyProductList">상품구매</a></li>
			            <li><a href="${pageContext.request.contextPath}/orderList">주문내역</a></li>
			            <li><a href="${pageContext.request.contextPath}/myInfo">마이페이지</a></li>
			            <li><a href="${pageContext.request.contextPath}/basketList">장바구니</a></li>
			            <li><a href="${pageContext.request.contextPath}/questionList">1:1 문의</a></li>
			          </ul>
			          <ul class="nav navbar-nav navbar-right">
			            <li><a href="${pageContext.request.contextPath}/navigator">Link</a></li>
			          </ul>
			        </div><!-- /.navbar-collapse -->
		    	</nav>
			</div>
		</section>
		<div class="container">
			<%-- <a href="${pageContext.request.contextPath}/navigator"><img alt="메뉴" src="${pageContext.request.contextPath}/img/navigator.png"></a> --%>
			<div class="page-header">
				<h1>처방기록</h1>
				<%-- <a href="${pageContext.request.contextPath}/myPrescriptionAll"><img alt="홈으로" src="${pageContext.request.contextPath}/img/home_pat.png"></a> --%>
			</div>
		</div>
		<br>
	</header>
	<section id="name" style="padding-left: 30px;">
		<h3>${SUD.member_nick}님 안녕하세요 </h3>
		<a href="${pageContext.request.contextPath}/logout" style="float:right;padding-right:30px;">로그아웃</a>
	</section>
	<div class="row"><br><br><br></div>
	<section id="table" style="padding-left: 30px;">
		
	
		<c:forEach var="VisitPharmVO_InDay" items="${prescriptionVO_AllDay}">
			
			<c:forEach var="VisitPharmVO" items="${VisitPharmVO_InDay.visitPharmVOList }">
				
			<div class="col-md-4">
				
			 	 <table class="table table-bordered table-striped table-hover">
				    <thead>
				      <tr style="height:43px">
				        <th>${VisitPharmVO.pharmName } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${VisitPharmVO.v_date }</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr style="height:50px">
				        <td>
					        <c:forEach var="x" items="${VisitPharmVO.disease }">
					      		${x }&nbsp;
					        </c:forEach>
				        </td>
				      </tr>
				      <tr>
				      	<td class="pull-right" style="border-color:transparent;">
				      		<a href="${pageContext.request.contextPath}/prescription?p_name=${VisitPharmVO.pharmName }&v_idx=${VisitPharmVO.v_idx }<c:forEach var="x" items="${VisitPharmVO.disease }">&disease=${x }</c:forEach>">
				      		자세히보기></a>
				      	</td>
				      </tr>
				    </tbody>
				  </table>
			</div>
			</c:forEach>
	  </c:forEach>
	</section>
	<br>
	<br>
	</div>
</body>
</html>

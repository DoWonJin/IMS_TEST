<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세정보</title>
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
				<h1>배송조회</h1>
			</div>
		</div>
		<br>
	</header>
	<div class="form-horizontal well">
		<div class="row">
			<div class="col-xs-12">
				<span><strong>주문일 :  ${orderInfoBoardVO.o_date}</strong></span>
				<table>
					<tr>
						<td>배송완료 <span id="float_right">${out_date} 도착</span></td>
					</tr>
					<tr>
						<td id="td_left">총 금액</td><td id="td_right"> ${orderInfoBoardVO.total_price +2500}</td>
					</tr>
				</table>
			</div>
		</div>
		<br><br>
		<div class="row">
			<div class="col-xs-12">
				<table class="table table-striped" style="width:50%;margin:0 auto">
					<c:forEach var="orderInfoItem" items="${orderInfoBoardVO.orderInfoItemVOList}">
						<tr>
							<td style="width:30%;">
								<img src="${orderInfoItem.m_path}">
							</td>
							<td style="text-align:right;padding-right:10%;">
								${orderInfoItem.m_name} ${orderInfoItem.itemNum}개<br>
								${orderInfoItem.ps_price}원
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
			<br><br>
		<div class="row">
			받는사람 : ${SUD.member_name}<br>
			연락처 : ${memberVO.member_phone}<br>
			배송지 : ${memberVO.member_address}<br>
		</div>
		<div><br></div>
	</div>
</div>
</body>
</html>



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
   
	<div>
		주문일 ${orderInfoBoardVO.o_date}
		<table>
			<tr>
				<td>배송완료 <span id="float_right">${out_date} 도착</span></td>
			</tr>
			<tr>
				<td id="td_left">총 금액</td><td id="td_right"> ${orderInfoBoardVO.total_price}</td>
			</tr>
		</table>
	</div>
	<c:forEach var="orderInfoItem" items="${orderInfoBoardVO.orderInfoItemVOList}">
	<div id="board_blue_box">
		<div id="order_img">${orderInfoItem.m_path}</div>
		<div>${orderInfoItem.m_name} ${orderInfoItem.itemNum}개<br></div>
		<div>${orderInfoItem.ps_price}원<br></div>
		<div><span>교환신청</span> <span>반품신청</span> <span>배송조회</span></div>
	</div>
	</c:forEach>
	<br><br>
	<div id="board_blue_box">
		받는사람 : ${SUD.member_name}<br>
		연락처 : ${memberVO.member_phone}<br>
		배송지 : ${memberVO.member_address}<br>
	</div>
</div>
</body>
</html> --%>



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<a href="${pageContext.request.contextPath}/orderList"><img alt="뒤로가기" src="${pageContext.request.contextPath}/img/prev.png"></a>
			<div id="pat_board_title_word">
				배송조회
				<a href="${pageContext.request.contextPath}/patScript"><img alt="홈으로" src="${pageContext.request.contextPath}/img/home_pat.png"></a>
			</div>
		</div>
	</header>
	<div>
		주문일 ${orderInfoBoardVO.o_date}
		<table>
			<tr>
				<td>배송완료 <span id="float_right">${out_date} 도착</span></td>
			</tr>
			<tr>
				<td id="td_left">총 금액</td><td id="td_right"> ${orderInfoBoardVO.total_price}</td>
			</tr>
		</table>
	</div>
	<c:forEach var="orderInfoItem" items="${orderInfoBoardVO.orderInfoItemVOList}">
	<div id="board_blue_box">
		<div id="order_img">${orderInfoItem.m_path}</div>
		<div>${orderInfoItem.m_name} ${orderInfoItem.itemNum}개<br></div>
		<div>${orderInfoItem.ps_price}원<br></div>
		<div><span>교환신청</span> <span>반품신청</span> <span>배송조회</span></div>
	</div>
	</c:forEach>
	<br><br>
	<div id="board_blue_box">
		받는사람 : ${SUD.member_name}<br>
		연락처 : ${memberVO.member_phone}<br>
		배송지 : ${memberVO.member_address}<br>
	</div>
</div>
</body>
</html> --%>

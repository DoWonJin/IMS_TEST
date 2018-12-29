<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<style type="text/css">
	.row{font-size: 20px;}
	.row .pull-left{
		max-width: 60%;
		line-height: 2.5em;
	}
	#profileImg{
		background-color: #fff;
		font-weight:bold;
		font-size:.8em;
		min-height: 8em;
		min-width: 8em;
		text-align: center;
	}
	.infoTitle{
		font-weight:bold;
		color:#2ecc71;
	}
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
			<%-- <a href="${pageContext.request.contextPath}/navigator"><img alt="메뉴" src="${pageContext.request.contextPath}/img/navigator.png"></a> --%>
			<div class="page-header">
				<h1>내 정보 관리</h1>
				<%-- <a href="${pageContext.request.contextPath}/myPrescriptionAll"><img alt="홈으로" src="${pageContext.request.contextPath}/img/home_pat.png"></a> --%>
			</div>
		</div>
		<br>
	</header>
	<form class="form-horizontal well" action="${pageContext.request.contextPath}/uploadPatientPicture" 
			method="post"
			enctype="multipart/form-data">
		<div class="row">
			<div class="pull-left">
				<div class="col-lg-11">
					<span class="infoTitle">고객명 : </span> ${SUD.member_name }
				</div>
				<div class="col-lg-11">
					<span class="infoTitle">비밀번호 : </span>****
				</div>
				<div class="col-lg-11">
					<span class="infoTitle">닉네임 : </span>${memberVO.member_nick }
				</div>
				<div class="col-lg-11">
					<span class="infoTitle">신분 : </span>
					<c:if test="${memberVO.member_identity == 1 }">
					일반회원
					</c:if>
					<c:if test="${memberVO.member_identity == 4 }">
					판매자회원
					</c:if>
					
				</div>
				<div class="col-lg-11">
					<span class="infoTitle">연락처 : </span>${memberVO.member_phone }
				</div>
				<div class="col-lg-11">
					<span class="infoTitle">배송주소 : </span>${memberVO.member_address }
				</div>
			</div>
			<div class="pull-right" style="padding-right: 10%;">
				<div id="picture">
					<label for="upload">
						<c:choose>
							<c:when test="${empty memberVO.member_pic_root}">
								<div class="img-circle" id="profileImg"><br><br><br>사진 </div>
							</c:when>
							<c:otherwise>
								<div class="img-circle"
									id="profileImg"
									style="background-image: url('${memberVO.member_pic_root }');
										background-size: 100% 100%">
								</div>
							</c:otherwise>
						</c:choose>
				        <input type="file" id="upload" name="file" onchange="this.form.submit()" style="display:none">
					</label>
				</div>
				<br>
				<div>
					<a href="${pageContext.request.contextPath}/modifyMemberForm"><button type="button">내 정보 수정</button></a>
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
		<form action="${pageContext.request.contextPath}/uploadPatientPicture" 
			method="post"
			enctype="multipart/form-data">
			<label for="upload">
				<c:choose>
					<c:when test="${empty memberVO.member_pic_root}">
						<div id="profile_pic">사진 </div>
					</c:when>
					<c:otherwise>
						<div id="profile_pic" style="background-image: url('${pageContext.request.contextPath}${memberVO.member_pic_root }');
													 background-size: 100% 100%"></div>
					</c:otherwise>
				</c:choose>
		        <input type="file" id="upload" name="file" onchange="this.form.submit()" style="display:none">
			</label>
		</form>
		<span>${SUD.member_name }</span><a href="${pageContext.request.contextPath}/logout">로그아웃></a>
	</div>
	<div id="board_blue_box">
		<div>회원정보 <span id="float_right"><a href="${pageContext.request.contextPath}/modifyMemberForm">회원정보 수정</a></span></div>
		<img src="${pageContext.request.contextPath}/img/line_login.png"><br>
		고객명 : ${SUD.member_name }<br>
		비밀번호 : ****<br>
		닉네임: ${memberVO.member_nick }<br>
		신분: ${memberVO.member_identity }<br>
		연락처 : ${memberVO.member_phone }<br>
		배송 주소 : ${memberVO.member_address }<br>
		<img src="${pageContext.request.contextPath}/img/line_login.png">
		수령인 : ${SUD.member_name } <span id="float_right">주소 관리</span><br>
		주소 : ${memberVO.member_address }<br>
		연락처 : 010-1234-1234<br>
		<img src="${pageContext.request.contextPath}/img/line_login.png"><br>
		<a href="${pageContext.request.contextPath}/orderList">주문목록</a><br>
		<a href="${pageContext.request.contextPath}/">취소/반품 목록</a><br>
		<a href="${pageContext.request.contextPath}/">1:1 문의내역</a><br>
	</div>
</div> --%>
</body>
</html>



 

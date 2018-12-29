<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	p{margin-left:10%;}
	p.h4{
		color:#2ecc71;
		font-weight:bold;
	}
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
	.row select{width:40%;float:left;margin:2%;}
	.button{
		font-size:15px;
		padding:8px;
		border-radius:5px;
		background-color: whitesmoke;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	/* $("#propose_type").on("change", function(){
		// value 값으로 선택
		$(this).val("1").prop("selected", true);
	 
		// OR option 순서값으로 선택
		$(this).find("option:eq(0)").prop("selected", true);
	}); */
	
	$(function(){
		$("#propose_product_type").hide();
		$("#propose_type").on("change",function(){
			// value 값으로 선택
			if($(this).val()=="1" || $(this).val()=="3") {
				$("#propose_product_type").show();
			} else{
				$("#propose_product_type").hide();
			}
		});
		$("#submit").on("click",function(){
			if($("#propose_type").val()=="none"){
				alert("문의유형을 선택하세요!");
				return false;
			} else if($("#propose_type").val()=="1" || $("#propose_type").val()=="3"){
				if($("#propose_product_type").val=""){
					alert("상품내역을 선택하세요!");
					return false;
				}
			}
		});
	});
</script>
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
		<div class="active"> 
			<a href="${pageContext.request.contextPath }/proposeList">질문·건의</a>
		</div>
		<div> 
			<a href="${pageContext.request.contextPath }/noticeList">공지사항</a>
		</div>
	</div>
	<br><br><br>
	<div class="col-xs-10 col-xs-offset-1">
		<div>
			<strong class="h3">질문·건의</strong>
		</div>
		<br>
		<div class="form-horizontal well">
			<p class="h4">손안의 약국 </p>
			<p class="h5">med@naver.com</p>
			<form action="${pageContext.request.contextPath}/newQuestion" method="post">
				<div class="row" style="margin-left:10%;">
					<select id="propose_type" name='q_type' class="form-control">
						<option value="none" selected>문의유형을 선택하세요</option>
						<option value="1">상품</option>
						<option value="2">시스템</option>
						<option value="3">결제</option>
					</select>
					<select id="propose_product_type" name='st_idx' class="form-control">
						<option value="" selected>상품내역을 선택하세요</option>
						<c:forEach var="prod" items="${productQuestionList }">
							<option value="${prod.st_idx}">${prod.m_name} / ${prod.itemNum}개 / ${prod.o_date}</option>
						</c:forEach>
						<!--
						주문번호 / 상품명 / 주문수량 / 주문날짜 /게시물번호
						
						  -->
					</select>
				</div>
				<br>
				<div style="margin:0 10%;">
					<textarea class="form-control input-xlarge" rows="10" cols="7" placeholder="고객님의 의견을 입력해주세요" name='q_content'></textarea>
					<!-- 이미지 첨부 : <input type="file"> -->
				</div>
				<div class="row"><br></div>
				<div class="col-xs-offset-5">
					<br>
					<button type="submit" id="submit" class="button">보내기</button>
					<br><br>
				</div>
			</form>
		</div>
	</div>
	<%-- <div>
	
	<div>
		손안의 약국 <br>
		med@naver.com<br>
		<form action="${pageContext.request.contextPath}/newQuestion" method="post">
			<select id="propose_type" name='q_type'>
				<option value="none" selected>문의유형을 선택하세요</option>
				<option value="1">상품</option>
				<option value="2">시스템</option>
				<option value="3">결제</option>
			</select>
			<select id="propose_product_type" name='st_idx'>
				<option value="" selected>상품내역을 선택하세요</option>
				<c:forEach var="prod" items="${productQuestionList }">
					<option value="${prod.st_idx}">${prod.m_name} / ${prod.itemNum}개 / ${prod.o_date}</option>
				</c:forEach>
				<!--
				주문번호 / 상품명 / 주문수량 / 주문날짜 /게시물번호
				
				  -->
			</select>
			<div id="propose_textarea">
				<textarea rows="10" cols="30" placeholder="고객님의 의견을 입력해주세요" name='q_content'></textarea>
				<!-- 이미지 첨부 : <input type="file"> -->
			</div>
			<input type="submit" value="보내기" id="submit">
		</form>
	</div> --%>
</div>
</body>
</html>
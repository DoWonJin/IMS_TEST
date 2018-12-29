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
	.col-xs-offset-1{
		background-color: #fff;
		border-radius: 5px;
		margin-right:10%;
		font-size:15px;
	}
	h3{margin-left:10%;}
	.well{margin:0 auto;}
	.form-control{width:20%;display:inline-block;}
	.button{
		font-size:15px;
		padding:8px;
		border-radius:5px;
		background-color: whitesmoke;
	}
</style>
</head>
<body>
	<div id='wrapper'>
		<nav class="manager-navbar">
			<ul>
				<li class="active"><a href="${pageContext.request.contextPath}/sellerMain">Nav</a></li>
				<li><a href="${pageContext.request.contextPath}/storage">재고</a></li>
				<%-- <li class="active"><a href="${pageContext.request.contextPath}/disease">질병 </a></li>
				<li><a href="${pageContext.request.contextPath}/productCategory1">상품카테고리1 </a></li>
				<li><a href="${pageContext.request.contextPath}/productCategory2">상품카테고리2 </a></li>
				<li><a href="${pageContext.request.contextPath}/pharmacy">약국 </a></li>
				<li><a href="${pageContext.request.contextPath}/medicine">약품  추가하기</a></li> --%>
				<li><a href="${pageContext.request.contextPath}/product">상품  추가하기</a></li>
				<%-- <li><a href="${pageContext.request.contextPath}/prescriptionUpdate">처방전 </a></li> --%>
				<li class="active"><a href="${pageContext.request.contextPath}/questionListForSeller">1:1문의</a></li>
			</ul>
		</nav>
		<br>
		<div class="form-horizontal well">
			<h3>질문</h3><hr>
			<div class="col-xs-offset-1">
				<div>질문: ${question.q_content }</div><br>
				<div>질문날짜 : ${question.q_date }</div><br>
			</div>
		</div>
		<div class="form-horizontal well">
			<h3>답변</h3><hr>
			<form action="${pageContext.request.contextPath }/answerForQuestionAction" method="post" class="col-xs-offset-1">
				<br>
				<div style="margin:0 20%">
					<textarea rows=5; cols=50; placeholder="답변을 입력해 주세요" name="a_content"></textarea>
				</div>
				<input type="hidden" name="q_idx" value="${question.q_idx}"><br>
				<div class="col-xs-offset-5">
					<button type="submit" class="button">답변등록</button>
				</div>
				<br>
			</form>
		</div>
	</div>
</body>
</html>
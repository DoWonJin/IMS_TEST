<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script type="text/javascript">
	function checkOverlap() {

		var st_idx = document.getElementById("st_idx").value;
		
		var xmlhttp = new XMLHttpRequest();
		 xmlhttp.onreadystatechange = function(){
	            //콜백함수...
	            if(xmlhttp.readyState == 4 && xmlhttp.status ==200){
	            	
	            	var content = xmlhttp.responseText; // 1인경우: 장바구니에 이미 있음, 0인경우: 없음

	            	if(content=="1") {
	            		alert("장바구니에 이미 있는 상품입니다.");
	            	}else {
	            		basketOrOrder(1);
	            	}
	               
	            }
	         };
		xmlhttp.open("POST","${pageContext.request.contextPath}/checkOverlap", true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send('st_idx=' + st_idx); 
	}

	function basketOrOrder(index) {
		
		if(index==1) {
			document.myForm.action='${pageContext.request.contextPath}/addBasket';
		}else if(index==2) {
			document.myForm.action='${pageContext.request.contextPath}/order';
		}
		
		document.myForm.submit();
	}
	//수량 변경시 알아오는 정보
	function changeCount(st_idx,tag){
		console.log("st_idx : " + st_idx);
		  var orderCount = tag.value;
		  console.log("orderCount : " + orderCount);
		//ajax..
         var xmlhttp = new XMLHttpRequest();
         xmlhttp.onreadystatechange = function(){
            //콜백함수...
            if(xmlhttp.readyState == 4 && xmlhttp.status ==200){
            	var result = xmlhttp.responseText;
				console.log("result : " + result);
				if(result == '0'){
					alert("재고가 부족합니다.");
					tag.value = tag.value - 1;
				}
            }
         };
         
         xmlhttp.open("POST","${pageContext.request.contextPath}/orderCountCheck", true);
         xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
         xmlhttp.send('st_idx=' + st_idx + '&orderCount=' + orderCount);
	}
	
</script>
<style>
	table{margin:0 auto;}
	table tr td{
		min-width:5em;
</style>
</head>
<body>
<div id="wrapper">
	<header>
		<input type="hidden" value="${page }" id="page_idx">
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
		
		<c:set var="now" value="<%=new java.util.Date()%>" />
		<c:set var="sysDate"><fmt:formatDate value="${now}" pattern="yy-MM-dd" type="date"/></c:set> 
		
		<div class="container">
			<div class="page-header">
				<span class="h1">상품정보</span>
				<a style="float:right;padding-right:30px;">뒤로가기</a>
			</div>
		</div>
		<br>
	</header>
	<div class="form-horizontal well">
		<div>
			<ul class="breadcrumb">
		        <li><a href="#">쿠팡홈</a> <span class="divider"></span></li>
		        <li><a href="#">식품</a> <span class="divider"></span></li>
		        <li class="active">건강음료</li>
		    </ul>
		</div>
		<div class="row col-xs-offset-1">
			<table class="table table-striped">
				<tr>
					<td rowspan="6">
						<img src="${productDetail_And_QA.productDetailVO.m_path}">
					</td>
					<td class="h3">상품명 : ${productDetail_And_QA.productDetailVO.m_name }</td>
				</tr>
				<tr>
					<td>${productDetail_And_QA.productDetailVO.ps_price }원(100ml당 638원)</td>
				</tr>
				<tr>
					<td>배송료 : 2500원</td>
				</tr>
				<tr>
					<td>${productDetail_And_QA.productDetailVO.m_duration }일 뒤 도착 예정</td>
				</tr>
				<tr>
					<td>판매자 : ${productDetail_And_QA.productDetailVO.ps_name }</td>
				</tr>
				<tr>
					<td style="align:right;">
						<form name="myForm" method="post">
							<input type="hidden" id= "ps_price" name="ps_price" 
								value="${productDetail_And_QA.productDetailVO.ps_price}">
							
							<input type="hidden" id= "st_idx" name="st_idx" value="${st_idx }">
						
							<input type="number" name="itemNum" onchange="changeCount('${st_idx}',this)" 
								style="font-size:10pt; float:left; width:50px; margin:1px;" placeholder="1">
								
							<input type="button" value="장바구니 담기" onclick="checkOverlap()"
								style="font-size:10pt; float:left; margin:1px;">
							
							<input type="button" value="바로구매" onclick="basketOrOrder(2)"
							style="font-size:10pt; float:left; margin:1px;">
						</form>
					</td>
				</tr>
			</table>
		</div>
		<div>
		상품설명<br><br>
		${productDetail_And_QA.productDetailVO.m_description}<br><br>
		
		사용법<br><br>
		${productDetail_And_QA.productDetailVO.m_howtotake}
		</div>
		<div id="goods_qna"> 
			QnA
			<br>
			<c:forEach var="question" items="${productDetail_And_QA.questionAndAnswerVO }">
				${question.questionVO.q_idx }.&nbsp; ${question.questionVO.q_identity } ${question.questionVO.q_content } ${question.questionVO.q_date  }<br>
				&nbsp;&nbsp;${question.answerVO.a_content } ${question.answerVO.a_date }<br>
			</c:forEach>
			
			<form action="${pageContext.request.contextPath}/questionAboutProduct" method="get">
				<textarea rows="3" cols="60" name="content"></textarea>
				<input type="hidden" value="${SUD.member_idx }" name="member_idx">
				<input type="hidden" value="${st_idx }" name="st_idx">
				<input type="submit" value="글 남기기">
			</form>
			
		</div>
	</div>
</div>
<%-- 
	<div> <!--id="board_blue_box" -->
		
		
		
		
		
		
		<div id="goods_qna">
		
		<p>효능: <br>${productDetail_And_QA.productDetailVO.m_description }</p><br>
		<p>복용법: <br>${productDetail_And_QA.productDetailVO.m_howtotake }</p>
		
		</div>
		
		
	</div>
</div> --%>
</body>
</html>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/patHeader.css?ver=2" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/goodsCategory.css?ver=4" rel="stylesheet">
<script type="text/javascript">
	function checkOverlap() {

		var st_idx = document.getElementById("st_idx").value;
		
		var xmlhttp = new XMLHttpRequest();
		 xmlhttp.onreadystatechange = function(){
	            //콜백함수...
	            if(xmlhttp.readyState == 4 && xmlhttp.status ==200){
	            	
	            	var content = xmlhttp.responseText; // 1인경우: 장바구니에 이미 있음, 0인경우: 없음

	            	if(content=="1") {
	            		alert("장바구니에 이미 있는 상품입니다.");
	            	}else {
	            		basketOrOrder(1);
	            	}
	               
	            }
	         };
	         
		xmlhttp.open("POST","${pageContext.request.contextPath}/checkOverlap", true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send('st_idx=' + st_idx  		); 
		
	}

	function basketOrOrder(index) {
		
		if(index==1) {
			document.myForm.action='${pageContext.request.contextPath}/addBasket';
		}else if(index==2) {
			document.myForm.action='${pageContext.request.contextPath}/order';
		}
		
		document.myForm.submit();
	}
	//수량 변경시 알아오는 정보
	function changeCount(st_idx,tag){
		console.log("st_idx : " + st_idx);
		  var orderCount = tag.value;
		  console.log("orderCount : " + orderCount);
		//ajax..
         var xmlhttp = new XMLHttpRequest();
         xmlhttp.onreadystatechange = function(){
            //콜백함수...
            if(xmlhttp.readyState == 4 && xmlhttp.status ==200){
            	var result = xmlhttp.responseText;
				console.log("result : " + result);
				if(result == '0'){
					alert("재고가 부족합니다.");
					tag.value = tag.value - 1;
				}

            }
         };
         
         xmlhttp.open("POST","${pageContext.request.contextPath}/orderCountCheck", true);
         xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
         xmlhttp.send('st_idx=' + st_idx + '&orderCount=' + orderCount);
         
		
		
	}
	
   </script>
</head>
<body>
<div id="wrapper">
	<header>
		<div id="pat_board_title">
			<a href="${pageContext.request.contextPath}/navigator"><img alt="메뉴" src="${pageContext.request.contextPath}/img/navigator.png"></a>
			<div id="pat_board_title_word">
				상품설명
				<a href="${pageContext.request.contextPath}/myPrescriptionAll"><img alt="홈으로" src="${pageContext.request.contextPath}/img/home_pat.png"></a>
			</div>
		</div>
		<br>
	</header>
	<div> <!--id="board_blue_box" -->
		<c:set var="now" value="<%=new java.util.Date()%>" />
		<c:set var="sysDate"><fmt:formatDate value="${now}" pattern="yy-MM-dd" type="date"/></c:set> 
		<table>
			<tr>
				<td id="goods_img">
				 		<img src="${pageContext.request.contextPath}/${productDetail_And_QA.productDetailVO.m_path }">
				</td>
				<td id="goods_detail_info">
					${productDetail_And_QA.productDetailVO.m_name }<br>
					${productDetail_And_QA.productDetailVO.ps_price }원(100ml당 638원)<br>
					-----------------------------<br>
					배송료 : 2500원<br>
					${productDetail_And_QA.productDetailVO.m_duration }일 뒤 도착 예정<br>
					-----------------------------<br>
					판매자 : ${productDetail_And_QA.productDetailVO.ps_name }<br>
					-----------------------------<br>
				</td>
			</tr>
			<tr id="buyItem">
				<td colspan="2" align="right">
				
				<form name="myForm" method="post">
					<input type="hidden" id= "ps_price" name="ps_price" 
					value="${productDetail_And_QA.productDetailVO.ps_price}">
					
					<input type="hidden" id= "st_idx" name="st_idx" value="${st_idx }">
					
						<input type="number" name="itemNum" onchange="changeCount('${st_idx}',this)" 
							style="font-size:10pt; float:left; width:50px; margin:1px;" placeholder="1">
							
						<input type="button" value="장바구니 담기" onclick="checkOverlap()"
							style="font-size:10pt; float:left; margin:1px;">
						
						<input type="button" value="바로구매" onclick="basketOrOrder(2)"
						style="font-size:10pt; float:left; margin:1px;">
						
				</form>
				</td>
			</tr>
		</table>
		<div id="goods_qna">
		
		<p>효능: <br>${productDetail_And_QA.productDetailVO.m_description }</p><br>
		<p>복용법: <br>${productDetail_And_QA.productDetailVO.m_howtotake }</p>
		
		</div>
		
		<div id="goods_qna"> 
			QnA
			<br>
			<c:forEach var="question" items="${productDetail_And_QA.questionAndAnswerVO }">
				${question.questionVO.q_idx }.&nbsp; ${question.questionVO.q_identity } ${question.questionVO.q_content } ${question.questionVO.q_date  }<br>
				&nbsp;&nbsp;${question.answerVO.a_content } ${question.answerVO.a_date }<br>
			</c:forEach>
			
			<form action="${pageContext.request.contextPath}/questionAboutProduct" method="get">
				<textarea rows="10" cols="10" name="content"></textarea>
				<input type="hidden" value="${SUD.member_idx }" name="member_idx">
				<input type="hidden" value="${st_idx }" name="st_idx">
				<input type="submit" value="글 남기기">
			</form>
			
		</div>
	</div>
</div>
</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품구매</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css?ver='1'" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<link href="${pageContext.request.contextPath}/css/styles.css?ver='1'" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/d3js/5.7.0/d3.min.js"></script>
<script type="text/javascript">
	   window.onload=function(){
		   goodsSortAndNumOption();
		  };
		  function numberClick(page){
			  document.getElementById('page_idx').value = page;
			  goodsSortAndNumOption();
	      }	  
		  
	   function goodsSortAndNumOption() {
	     var page = document.getElementById('page_idx').value;
   	     var numOption = document.getElementById('numOption').value;
         var sortOption = document.getElementById('sortOption').value;
 		 var categoryNum = 1;
         var p1_idx = ${p1_idx};
         //ajax..
         var xmlhttp = new XMLHttpRequest();
         xmlhttp.onreadystatechange = function(){
            //콜백함수...
            if(xmlhttp.readyState == 4 && xmlhttp.status ==200){
            	var content = xmlhttp.responseText;
            	document.getElementById("goods_list").innerHTML = content;
            }
         };
         
         xmlhttp.open("POST","${pageContext.request.contextPath}/orderOption", true);
         xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
         xmlhttp.send('numOption=' +numOption
        		 + '&sortOption=' + sortOption 
        		 + '&categoryNum=' + categoryNum
        		 + '&p1_idx=' + p1_idx
        		 + '&page=' + page);
      }
   </script>
 <style>
	img{
		width:100%;
		height:100%;
		border-radius: 15px;
	}
	.divider{
		font-size:120%;
	}
	.navDiv{height:120px;}
	.orderDropdown{
		font-size:14px;
		border-radius:15px;
		border:1px solid #ccc;
		border:1px solid rgba(0,0,0,.15);
		padding:10px;
		float:right;
		margin-right:5px;
	}
	.col-lg-4{
		margin-bottom:3em;
	}
	.card{border-radius: 15px;}
	
	.card-footer{
		text-align: center;
		background-color: #ccc;
		font-size:14px;
		padding:1em;
		border-radius: 15px 15px 0 0;
	}

</style>
</head>
<body>
	<div id="wrapper">
		<header>
			<section>
				<div class="container">
						<input type="hidden" value="${page }" id="page_idx">
				
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
				<%-- <a href="${pageContext.request.contextPath}/navigator"><img alt="메뉴" src="${pageContext.request.contextPath}/img/navigator.png"></a> --%>
				<div class="page-header">
					<a href="${pageContext.request.contextPath}/buyProductList">
						<span class="h1" style="max-width:40%;">
							상품구매 
						</span>
					</a>
					<span class="h2" style="max-width:40%;">
						<span class="divider">
							>
						</span>
						${p1_name }  
					</span>
					<a href="${pageContext.request.contextPath}/buyProductList" style="text-decoration: none;float:right;padding-right:30px;">뒤로가기</a>
					<%-- <a href="${pageContext.request.contextPath}/myPrescriptionAll"><img alt="홈으로" src="${pageContext.request.contextPath}/img/home_pat.png"></a> --%>
				</div>
			</div>
			<br>
		</header>
		<div>
			<div class="navDiv">
				<div class="container">
					<nav class="navbar" role="navigation">
				        <!-- Brand and toggle get grouped for better mobile display -->
				        <div class="navbar-header navbar-right" style="margin-top:15px;">
				          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
				            <span class="sr-only">Toggle navigation</span>
				            <span class="icon-bar"></span>
				            <span class="icon-bar"></span>
				            <span class="icon-bar"></span>
				          </button>
				          <a href="#" class="dropdown-toggle" data-toggle="dropdown">전체보기 <b class="caret"></b></a>
				              <ul class="dropdown-menu">
				                <li><a href="#">SICK</a></li>
				                <li><a href="#">MYINFO</a></li>
				              </ul>
				        </div>
				        <div class="collapse navbar-collapse navbar-ex1-collapse">
				          <ul class="nav navbar-nav">
				            <c:forEach var="product_Category2" items="${product_Category2VOlist }">
				            	<li><a href="${pageContext.request.contextPath}/secondCondition?p2_idx=${product_Category2.p2_idx}&p1_idx=${p1_idx}&p1_name=${p1_name}">${product_Category2.p2_name}</a></li>
			   				</c:forEach>
				          </ul>
				        </div><!-- /.navbar-collapse -->
				</nav>
			</div>
		<div class="dropdownSet">
			<select class="orderDropdown" id="numOption" onchange="goodsSortAndNumOption()">
				<option value="0">5개씩</option>
				<option value="1" selected="selected">10개씩</option>
				<option value="2">20개씩</option>
				<option value="3">30개씩</option>
				<option value="4">40개씩</option>
			</select>
			<select class="orderDropdown" id="sortOption" onchange="goodsSortAndNumOption()">
				<option value="name" selected="selected">이름순</option>
				<option value="best" >추천순</option>
				<option value="lowprice">가격 낮은순</option>
				<option value="highprice">가격 높은순</option>
			</select>
			
		</div>
		</div>
		<div class="row" id="goods_list">
			<!--Ajax -->
			
			
			
			
		  <div class="row"><br><br></div>
		  
		</div>
		</div>
	</div>




</body>
</html>



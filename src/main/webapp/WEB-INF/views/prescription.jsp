<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link href="${pageContext.request.contextPath}/css/patHeader.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/patScript.css" rel="stylesheet"> --%>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css?ver='1'" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<link href="${pageContext.request.contextPath}/css/styles.css?ver='1'" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7edf78014ef8ab21ce19b9ab8934c96a"></script>
<script type="text/javascript">
	function setMap(x, y) {
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(x, y),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
	}
	function showMap() {
		
		var ps_idx= document.getElementById("ps_idx").value;
		
		var xmlhttp = new XMLHttpRequest();
		
        xmlhttp.onreadystatechange = function(){
           //콜백함수...
           if(xmlhttp.readyState == 4 && xmlhttp.status ==200){
           	var xy = JSON.parse(xmlhttp.responseText);
           	console.log(xy);
           	document.getElementById("placeMap").innerHTML = '<div id="map" style="width:300px;height:250px;"></div>';
           	setMap(xy.ps_latitude, xy.ps_longitude);
           }
        };
        
        xmlhttp.open("POST","${pageContext.request.contextPath}/map", true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send('ps_idx=' + ps_idx); 
		
	}
</script>
<style>
	table{
		border-collapse: separate;
		border-spacing:30px;
		margin:0 auto;
	}
	.table-bordered{border:1px solid #fff;}
	.table>tbody>tr>td{vertical-align: middle}
	table td{
		font-size:15px;
		height:8em;
		border-radius: 10px;
		margin-left:10px;
	}
	td.caption{width:30%;}
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
			            <li class="active"><a href="${pageContext.request.contextPath}/myPrescriptionAll">처방기록</a></li>
			            <li><a href="${pageContext.request.contextPath}/diseaseCategoryList">자가진단</a></li>
			            <li><a href="${pageContext.request.contextPath}/buyProductList">상품구매</a></li>
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
				<h1>처방상세내역</h1>
			</div>
		</div>
		<br>
	</header>
	<section id="vday" style="padding-left: 30px;">
		<h3>${prescriptionVO.patientVO.v_date } (월) </h3>
		<div>
			<p>병명 &nbsp;: 
			<c:forEach var = "disease" items = "${diseaseList}" varStatus="loop">
				&nbsp;${disease} &nbsp;&nbsp; 
								
			</c:forEach> <br></p><br>
			<p>약품명 : </p>
		</div>
	</section>
	<section id="table" style="padding-left: 30px;">
		<table class="table table-bordered table-striped">
			<c:forEach var="medicineVO" items="${prescriptionVO.medicineVOList }">
			<tr>
				<td id="pat_script_medicine_file" class="caption"><img src="${medicineVO.m_path }"></td>
				<td>
					<p><strong>${medicineVO.m_name }</strong></p>
					<p>${medicineVO.m_description }</p>
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td id="pat_script_howto" colspan="2">${prescriptionVO.patientVO.howtotake }</td>
			</tr>
		</table>
		<div>총 금액 : ${totalPrice}</div>
		<div id="around_pharmacy"> ${pharmacySellerVO.p_name }: ${pharmacySellerVO.p_lo1} ${pharmacySellerVO.p_lo2}
			<input type="button" onclick="showMap()" value="위치 확인하기">
				<input type="hidden" id="ps_idx" value="${pharmacySellerVO.ps_idx }">
				<div id="placeMap">
				<!-- 지도 나올 위치 -->
			</div> 
		</div>
		<br><br>
	</section>
</div>
</body>
</html>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

		
	</div>
	<div id="around_pharmacy"> ${pharmacySellerVO.p_name }: ${pharmacySellerVO.p_lo1} ${pharmacySellerVO.p_lo2}
		<input type="button" onclick="showMap()" value="->지도로 위치 확인하기">
			<input type="hidden" id="ps_idx" value="${pharmacySellerVO.ps_idx }">
			<div id="placeMap">
			<!-- 지도 나올 위치 -->
			</div> 
		</div>
	</div>
</div>
</body>
</html> --%>
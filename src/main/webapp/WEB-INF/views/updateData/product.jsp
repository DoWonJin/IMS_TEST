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
<style>
	.well{margin:0 auto;}
	.form-control{width:20%;display:inline-block;margin-bottom:1em;}
	.textarea-block div{
		display:inline-block;
		margin:5%;
	}
</style>
</head>
<body>
<div id="wrapper">
	<nav class="manager-navbar">
		<ul>
			<li class="active"><a href="${pageContext.request.contextPath}/sellerMain">Nav</a></li>
			<li><a href="${pageContext.request.contextPath}/storage">재고</a></li>
			<%-- <li class="active"><a href="${pageContext.request.contextPath}/disease">질병 </a></li>
			<li><a href="${pageContext.request.contextPath}/productCategory1">상품카테고리1 </a></li>
			<li><a href="${pageContext.request.contextPath}/productCategory2">상품카테고리2 </a></li>
			<li><a href="${pageContext.request.contextPath}/pharmacy">약국 </a></li>
			<li><a href="${pageContext.request.contextPath}/medicine">약품  추가하기</a></li> --%>
			<li class="active"><a href="${pageContext.request.contextPath}/product">상품  추가하기</a></li>
			<%-- <li><a href="${pageContext.request.contextPath}/prescriptionUpdate">처방전 </a></li> --%>
			<li><a href="${pageContext.request.contextPath}/questionListForSeller">1:1문의</a></li>
		</ul>
	</nav>
	<form action="${pageContext.request.contextPath}/medicineInputAction" method="POST" enctype="multipart/form-data" class="form-horizontal well">
		<br><br>
		상품 이름 : <input type="text" name="m_name"  size="10" autofocus="autofocus" class="form-control"><br><br>
		처방전 유무 : 
		<select name="m_pre" class="form-control">
			<option value="0" selected="selected">0</option>
		</select><br><br>
		가격 : <input type="number" name="m_price" class="form-control"><br><br>
		사진 : <input type="file"	name="medicinePic"><br><br>
		소속 카테고리2 : <br>		 
			<c:forEach var="productCategory2VO" items="${productCategory2VOList}">
				<input type="radio" name="p2_idx" value="${productCategory2VO.p2_idx}" > ${productCategory2VO.p2_name}
			</c:forEach><br><br>
		보관기간 :<input type="number" name="m_duration" class="form-control sm">일<br><br>
		<div class="textarea-block">
			<div>효능 :<br><textarea name="m_description" rows="4" cols="20"></textarea></div>
			<div>복용방법 :<br><textarea name="m_howtotake" rows="4" cols="20"></textarea></div>
		</div>
		<div class="col-xs-offset-5">
			<input type="submit" value="추가">
		</div>
		</form>
	<br><br>
	<div class="form-horizontal well">
	<c:forEach var="medicineVO" items="${medicineVOList }">
		<form action="${pageContext.request.contextPath}/medicineDeleteAction" method="POST">
		상품 번호   : <input type="text" name="m_idx" value="${medicineVO.m_idx }" size="10" class="form-control sm">
		상품 이름   : <input type="text" name="m_name" value="${medicineVO.m_name}" size="10" class="form-control">
		처방전 필요 유무 : <input type="number" name="m_pre" value="${medicineVO.m_pre}" size="2" class="form-control sm" disabled="disabled">
		원가 : <input type="text" value="${medicineVO.m_price }" size="15" class="form-control" disabled> 
		<div class="textarea-block">
			<div>사진 :<br><img src="${pageContext.request.contextPath}/medicineImg/${medicineVO.m_path }"></div>
			<div>효능 :<br><textarea rows="3" cols="15" disabled="disabled">${medicineVO.m_description }</textarea></div>
			<div>복용방법 :<br><textarea rows="3" cols="15" disabled="disabled">${medicineVO.m_howtotake}</textarea></div>
		</div>
		<br>
		</form>
	</c:forEach>
	</div>
	<br><br>
</div>	
	<%-- <form action="${pageContext.request.contextPath}/medicineInputAction" method="POST" enctype="multipart/form-data">
		상품 이름 : <input type="text" name="m_name"  size="10" autofocus="autofocus"><br><br>
		처방전 유무 : 
		<select name="m_pre">
			<option value="0" selected="selected">0</option>
		</select><br><br>
		가격 : <input type="number" name="m_price"><br><br>
		사진 : <input type="file"	name="medicinePic"><br><br>
		소속 카테고리2 : <br>		 
			<c:forEach var="productCategory2VO" items="${productCategory2VOList}">
				<input type="radio" name="p2_idx" value="${productCategory2VO.p2_idx}" > ${productCategory2VO.p2_name}
			</c:forEach><br><br>
		보관기간 :<input type="number" name="m_duration">일<br><br>
		효능 :<textarea name="m_description" rows="4" cols="20"></textarea>
		복용방법 :<textarea name="m_howtotake" rows="4" cols="20"></textarea>
		<input type="submit" value="추가">
	</form>
	
	<br><br>
	
	<c:forEach var="medicineVO" items="${medicineVOList }">
		<form action="${pageContext.request.contextPath}/medicineDeleteAction" method="POST">
		상품 번호   : <input type="text" name="m_idx" value="${medicineVO.m_idx }" size="10">
		상품 이름   : <input type="text" name="m_name" value="${medicineVO.m_name}" size="10">
		처방전 필요 유무 : <input type="number" name="m_pre" value="${medicineVO.m_pre}" size="2" disabled="disabled">
		원가 : <input type="text" value="${medicineVO.m_price }" size="15" disabled> 
		사진 : <br><img src="${pageContext.request.contextPath}/medicineImg/${medicineVO.m_path }">
		효능 : <textarea rows="3" cols="15" disabled="disabled">${medicineVO.m_description }</textarea>
		복용방법 : <textarea rows="3" cols="15" disabled="disabled">${medicineVO.m_howtotake}</textarea>
		<br>
		</form>
	</c:forEach>
	<a href="${pageContext.request.contextPath}/dCategory">질병카테고리</a> &nbsp;
	<a href="${pageContext.request.contextPath}/dCategory">질병카테고리</a> &nbsp;
		<a href="${pageContext.request.contextPath}/disease">질병 </a>&nbsp;
		<a href="${pageContext.request.contextPath}/productCategory1">상품카테고리1 </a>&nbsp;
		<a href="${pageContext.request.contextPath}/productCategory2">상품카테고리2 </a>&nbsp;
		<a href="${pageContext.request.contextPath}/medicine">약품  추가하기</a>&nbsp;
		<a href="${pageContext.request.contextPath}/product">상품  추가하기</a>&nbsp;
		<a href="${pageContext.request.contextPath}/prescriptionUpdate">처방전 </a>&nbsp;
	 --%>
</body>
</html>
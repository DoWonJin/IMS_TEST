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
	.form-control{width:20%;display:inline-block;}
</style>
</head>
<body>
<div id="wrapper">
	<nav class="manager-navbar">
		<ul>
			<li class="active"><a href="${pageContext.request.contextPath}/sellerMain">Nav</a></li>
			<li class="active"><a href="${pageContext.request.contextPath}/storage">재고</a></li>
			<%-- <li class="active"><a href="${pageContext.request.contextPath}/disease">질병 </a></li>
			<li><a href="${pageContext.request.contextPath}/productCategory1">상품카테고리1 </a></li>
			<li><a href="${pageContext.request.contextPath}/productCategory2">상품카테고리2 </a></li>
			<li><a href="${pageContext.request.contextPath}/pharmacy">약국 </a></li>
			<li><a href="${pageContext.request.contextPath}/medicine">약품  추가하기</a></li> --%>
			<li><a href="${pageContext.request.contextPath}/product">상품  추가하기</a></li>
			<%-- <li><a href="${pageContext.request.contextPath}/prescriptionUpdate">처방전 </a></li> --%>
			<li><a href="${pageContext.request.contextPath}/questionListForSeller">1:1문의</a></li>
		</ul>
	</nav>
	<form action="${pageContext.request.contextPath}/storageInputAction" method="POST" enctype="multipart/form-data" class="form-horizontal well">
		<br><br>
		약 이름 : 
		<select name = 'm_idx' autofocus="autofocus" class="form-control">
			<c:forEach var="medicineVO" items="${medicineVOList }">
				<option value='${medicineVO.m_idx }'>${medicineVO.m_name}</option>
			</c:forEach>
		</select>
		수량 :
		<input type="number" name="m_storage" size="5" class="form-control">
		납품가 : 
		<input type="number" name="ps_price" size="5" class="form-control">
		<br><br>
		<div class="row" style="margin-left:40%;">
			<input type="submit" value="재고 등록" class="form-control">
		</div>
	</form>
	<br><br>
	<div class="form-horizontal well">
	<c:forEach var="storageVO" items="${storageVOList }">
		<form action="${pageContext.request.contextPath}/storageDeleteAction" method="POST">
		재고번호   : <input type="text" name="st_idx" value="${storageVO.st_idx }" size="4" class="form-control">
		약 이름   : <input type="text" name="m_idx" value="${storageVO.m_name}" size="4" class="form-control">
		갯수 : <input type="text" value="${storageVO.m_storage}" size="15" class="form-control" disabled> 
		<input type="submit" value="재고 삭제">
		</form>
		<br>
	</c:forEach>
	</div>
	<br><br>
</div>	
</body>
</html>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="${pageContext.request.contextPath}/storageInputAction" method="POST" enctype="multipart/form-data">
		약 이름 : 
		<select name = 'm_idx' autofocus="autofocus">
			<c:forEach var="medicineVO" items="${medicineVOList }">
				<option value='${medicineVO.m_idx }'>${medicineVO.m_name}</option>
			</c:forEach>
		</select>
		수량 :
		<input type="number" name="m_storage" size="5">
		납품가 : 
		<input type="number" name="ps_price" size="5">
		<input type="submit" value="재고 등록">
	</form>
	<br><br>
	<c:forEach var="storageVO" items="${storageVOList }">
		<form action="${pageContext.request.contextPath}/storageDeleteAction" method="POST">
		재고번호   : <input type="text" name="st_idx" value="${storageVO.st_idx }" size="4">
		약 이름   : <input type="text" name="m_idx" value="${storageVO.m_name}" size="4">
		갯수 : <input type="text" value="${storageVO.m_storage}" size="15" disabled> 
		<input type="submit" value="재고 삭제">
		</form>
	</c:forEach>
	
		<a href="${pageContext.request.contextPath}/dCategory">질병카테고리</a> &nbsp;
		<a href="${pageContext.request.contextPath}/disease">질병 </a>&nbsp;
		<a href="${pageContext.request.contextPath}/productCategory1">상품카테고리1 </a>&nbsp;
		<a href="${pageContext.request.contextPath}/productCategory2">상품카테고리2 </a>&nbsp;
		<a href="${pageContext.request.contextPath}/pharmacy">약국 </a>&nbsp;
		<a href="${pageContext.request.contextPath}/medicine">약품  추가하기</a>&nbsp;
		<a href="${pageContext.request.contextPath}/product">상품  추가하기</a>&nbsp;
		<a href="${pageContext.request.contextPath}/prescriptionUpdate">처방전 </a>&nbsp;
</body>
</html> --%>
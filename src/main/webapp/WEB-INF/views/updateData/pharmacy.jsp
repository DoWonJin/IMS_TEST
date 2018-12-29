<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/pharmacyInputAction" method="POST">
		약국이름 : <input type = "text" name = "p_name" autofocus="autofocus">
		위도 :  <input type = "text" name = "ps_latitude" >
		경도 :  <input type = "text" name = "ps_longitude">	
				 
		<input type="submit" value="추가">
	</form>
	<c:forEach var="pharmacyVO" items="${pharmacyVOList }">
		<form action="${pageContext.request.contextPath}/pharmacyDeleteAction" method="POST">
		약국번호 : <input type="text" width="3" name="ps_idx" value="${pharmacyVO.ps_idx}" >
		약국이름 : <input type="text" value="${pharmacyVO.p_name }" disabled>
	 	<input type="submit" value="삭제">
		<br>
		</form>
	</c:forEach>

		
		<a href="${pageContext.request.contextPath}/dCategory">질병카테고리</a> &nbsp;
		<a href="${pageContext.request.contextPath}/disease">질병 </a>&nbsp;
		<a href="${pageContext.request.contextPath}/productCategory1">상품카테고리1 </a>&nbsp;
		<a href="${pageContext.request.contextPath}/productCategory2">상품카테고리2 </a>&nbsp;
		<a href="${pageContext.request.contextPath}/medicine">약품  추가하기</a>&nbsp;
		<a href="${pageContext.request.contextPath}/product">상품  추가하기</a>&nbsp;
		<a href="${pageContext.request.contextPath}/prescriptionUpdate">처방전 </a>&nbsp;	
	
	
	
</body>
</html>
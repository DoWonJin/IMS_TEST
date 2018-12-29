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
	
	<form action="${pageContext.request.contextPath}/productCategory2InputAction" method="POST">
		소속 카테고리1 입력 :<br> 
			<c:forEach var="productCategory1VO" items="${productCategory1VOList}">
				<input type="radio" name="p1_idx" value="${productCategory1VO.p1_idx}" autofocus="autofocus">${productCategory1VO.p1_name}
				<br>
			</c:forEach>
			<br><br>
		소속 카테고리2 입력 :<input type="text" name="p2_name"  size="10" ><br><br>
		<input type="submit" value="추가">
	</form>
	
	<br><br>
	
	<c:forEach var="productCategory2VO" items="${productCategory2VOList }">
		<form action="${pageContext.request.contextPath}/productCategory2DeleteAction" method="POST">
		소속 카테고리2 번호 : <input type="text" name="p2_idx" value="${productCategory2VO.p2_idx }">
		소속 카테고리2 이름  : <input type="text" value="${productCategory2VO.p2_name}" disabled> 
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
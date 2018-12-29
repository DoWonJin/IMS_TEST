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
	<form action="${pageContext.request.contextPath}/dCategoryInputAction" method="POST">
		진료과목 입력 : <input type = "text" name = "c_name" autofocus="autofocus"> 
		<input type="submit" value="추가">
	</form>
	<c:forEach var="dCategoryVO" items="${dCategoryVOList }">
		<form action="${pageContext.request.contextPath}/dCategoryDeleteAction" method="POST">
		진료과목번호 : <input type="text" width="3" name="c_idx" value="${dCategoryVO.c_idx }" >
		진료과목이름 : <input type="text" value="${dCategoryVO.c_name }" disabled> 
	 	<input type="submit" value="삭제">
		<br>
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
</html>
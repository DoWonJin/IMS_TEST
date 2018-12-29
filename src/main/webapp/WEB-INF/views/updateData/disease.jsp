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
	
	<form action="${pageContext.request.contextPath}/diseaseInputAction" method="POST">
		소속 진료과목 입력 : 
			<c:forEach var="dCategoryVO" items="${dCategoryVOList}">
				<input type="radio" name="c_idx" value="${dCategoryVO.c_idx}"  autofocus="autofocus"> ${ dCategoryVO.c_name}
			</c:forEach>
			<br><br>
		질병 :<input type="text" name="d_name"  size="10"><br><br>
		증상 :<textarea name="d_symptom" rows="4" cols="20"></textarea>
		예방 :<textarea name="d_prevention" rows="4" cols="20"></textarea>
		<input type="submit" value="추가">
	</form>
	
	<br><br>
	
	<c:forEach var="diseaseVO" items="${diseaseVOList }">
		<form action="${pageContext.request.contextPath}/diseaseDeleteAction" method="POST">
		진료과목번호 : <input type="text" name="c_idx" value="${diseaseVO.c_idx }">
		질병번호 : <input type="text" name="d_idx" value="${diseaseVO.d_idx }">
		질병이름 : <input type="text" value="${diseaseVO.d_name }" disabled> 
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
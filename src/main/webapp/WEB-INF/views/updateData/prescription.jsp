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
	
	<form action="${pageContext.request.contextPath}/prescriptionInputAction" method="POST">
		환자 : 
		<select name="member_idx">
			<c:forEach var="patientVO " items="${patientVOList }">
				<option value="patientVO.m_idx">${patientVO.m_name }</option>
			</c:forEach>
				
		</select><br><br>
		
		담당 약사<input type="text" value="${chemistVO.member_nick }" name="m_nick">
		<input type="hidden" value="${chemistVO.ps_idx }" name="ps_idx"><br>
				
		<c:forEach var="medicineVO" items="${medicineVOList}"> 
			<input type="checkbox" name="m_idx" value="${medicineVO.m_idx }">${medicineVO.m_name }
			<input type="number" name="v_count" value="1"><br>
		</c:forEach>
		
		보관기간 :<input type="number" name="m_duration"><br><br>
		효능 :<textarea name="m_description" rows="4" cols="20"></textarea>
		복용방법 :<textarea name="m_howtotake" rows="4" cols="20"></textarea>
		<input type="submit" value="추가">
	</form>
	
	<br><br>
	
	<c:forEach var="medicineVO" items="${medicineVOList }">
		<form action="${pageContext.request.contextPath}/medicineDeleteAction" method="POST">
		약 번호   : <input type="text" name="m_idx" value="${medicineVO.m_idx }" size="10">
		약 이름   : <input type="text" name="m_name" value="${medicineVO.m_name}" size="10">
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
	
</body>
</html>
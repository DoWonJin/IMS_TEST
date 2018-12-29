<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <!-- 날짜 -->
     			 
게시물 건수 : 
			<c:choose>
				<c:when test="${totalCount != 0 }">
					${productWithSellerVOList_segment.size() } 개
				</c:when>
				<c:when test="${totalCount == 0 }">
					0 개
				</c:when>
			</c:choose>

 		<div class="row" id='goods_list'>
			<c:forEach var="product" items="${productWithSellerVOList_segment}" varStatus="loop">
				<div class="col-lg-4">
	         <div class="card">
	         		<div class="card-footer">
		             <div class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</div>
		           </div>
	         		<c:if test="${!empty product.m_path }">
						<a href="${pageContext.request.contextPath}/productDetail?st_idx=${product.st_idx}">
				 			<img class="card-img-top" src="${product.m_path}">
				 		</a>
					</c:if>
					<c:if test="${empty product.m_path }">
						<a href="${pageContext.request.contextPath}/productDetail?st_idx=${product.st_idx}">
							<img class="card-img-top" src="http://placehold.it/700x400" alt="">
						</a>
					</c:if>
	           
		           <div class="card-body">
		             <h4 class="card-title">
		               <a href="${pageContext.request.contextPath}/productDetail?st_idx=${product.st_idx}">${product.m_name }</a>
		             </h4>
		             <h5>${product.ps_price }원</h5>
		             <!-- 날짜 -->
		             <jsp:useBean id="ourDate" class="java.util.Date"/>
     				 <c:set var="duration" value="${product.m_duration}"/>
     			 	 <jsp:setProperty name="ourDate" property="time" value="${ourDate.time + 86400000*duration}"/>
     			 	 
		             <p class="card-text">도착 시간 : <fmt:formatDate value="${ourDate}" pattern="yyyy-MM-dd"/></p>
		             
		           </div>
		           
	       		</div>
	     	</div>
     		</c:forEach>
     	</div>		
		<a href="${pageContext.request.contextPath}/buyProductList?page=1">처음</a>
		<a href="#" onclick="numberClick(${page-1})">이전</a>
		<c:forEach var = "i" begin="1" end="${totalPage }">
			<a href="#" onclick="numberClick(${i})">${i }</a>
		</c:forEach>
		<a href="#" onclick="numberClick(${page+1})">이전</a>
		<a href="${pageContext.request.contextPath}/buyProductList?page=${totalPage}">끝</a>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


게시물 건수 : 
			<c:choose>
				<c:when test="${not empty productWithSellerVOList_segment }">
					${productWithSellerVOList_segment.size() } 개
				</c:when>
				<c:when test="${empty productWithSellerVOList_segment }">
					0 개
				</c:when>
			</c:choose>
<table>
			<c:forEach var="product" items="${productWithSellerVOList_segment}" varStatus="loop">
				
     			 <!-- 날짜 -->
     			 <jsp:useBean id="ourDate" class="java.util.Date"/>
     			 <c:set var="duration" value="${product.m_duration}"/>
     			 <jsp:setProperty name="ourDate" property="time" value="${ourDate.time + 8400000*duration}"/>

			<tr>
				<td>
				 	<a href="${pageContext.request.contextPath}/productDetail?st_idx=${product.st_idx}">
				 		<img src="${pageContext.request.contextPath}/${product.m_path}">
				 	</a>
				 	<c:if test="${loop.index <=5 && orderOption eq 'best' }">
				 		<img src="${pageContext.request.contextPath}/img/test.png">
				 	</c:if>
				 	
				</td>
			</tr>
			<tr>
				<td id="goods_inf">
					${product.m_name}<br>${product.ps_price}원<br>
					<fmt:formatDate value="${ourDate}" pattern="yyyy-MM-dd"/>도착<br>
					★★★★☆
				</td>
			</tr>
			</c:forEach>
		</table>
		
		<a href="${pageContext.request.contextPath}/buyProductList?page=1">처음</a>
		<a href="">이전</a>
		<c:forEach var = "i" begin="1" end="${totalPage }">
			<a href="#" onclick="numberClick(${i})">${i }</a>
		</c:forEach>
		<a href="">다음</a>
		<a href="${pageContext.request.contextPath}/buyProductList?page=${totalPage}">끝</a>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDate"><fmt:formatDate value="${now}" pattern="yy-MM-dd" type="date"/></c:set> 
<table>
			<c:forEach var="product" items="${productWithSellerVOList}">
				<fmt:parseNumber var="arrival" value="${timeNum +product.m_duration  }" integerOnly="true"/>
				<fmt:parseDate  var="arrivalDate" value="${product.m_duration}" pattern="yy-MM-dd" type="date"/>
				<fmt:parseDate value="${product.m_duration}" var="dateFmt" pattern="yyyymmdd"/>
     			 <fmt:formatDate value="${dateFmt}"  pattern="yyyy-mm-dd"/></td> 
				<tr>
					<td>
					 <a href="${pageContext.request.contextPath}/productDetail?st_idx=${product.st_idx}">
						<img src ="${pageContext.request.contextPath}/${product.m_path}">
					 </a>
					</td>
				</tr>
				<tr>
					<td id="goods_inf">${product.m_name}<br>${product.ps_price}<br>${sysDate}도착<br>★★★★☆</td>
				</tr>
			</c:forEach>

</table> --%>
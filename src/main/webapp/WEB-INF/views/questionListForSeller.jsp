<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css?ver='1'" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/styles.css?ver='1'" rel="stylesheet">
<style>
	.col-xs-offset-2{
		font-size:30px;
		font-weight:bold;
		
		text-align:center;
		display:inline-block;
		max-height:3em;
		width:80%;
	}
	.col-xs-offset-2 div{
		float:left;
		width:30%;
	}
	.col-xs-offset-2 div a{
		color:#2ecc71;
		text-decoration:none;
	}
	.col-xs-offset-2 div a:hover{
		color:#5fffa2;
		text-decoration:none;
	}
	.col-xs-offset-2 div.active{
		text-decoration:underline;
	}
	div.list{width:150px; vertical-align:middle; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;}
</style>
<script type="text/javascript">
</script>
</head>
<body>
<div id="wrapper">
	<header>
		<div class="container">
			<div class="page-header">
				<h1>1:1 문의목록</h1>
			</div>
		</div>
		<br>
	</header>
	<br><br><br>
	<div class="col-xs-10 col-xs-offset-1">
		<div>
			<strong class="h3">1:1 문의사항</strong>
		</div>
		<br>
		<div class="form-horizontal well">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>유형</th>
						<th>질문</th>
					</tr>
				</thead>
				<tbody>
					 <c:forEach var="question" items="${myQuestionList }" varStatus="loop">
						<tr>
							<td>${loop.index}</td>
							<td>
							<c:choose>
								<c:when test="${question.q_type==1 }">상품</c:when>
								<c:when test="${question.q_type==2 }">시스템</c:when>
								<c:when test="${question.q_type==3 }">결제</c:when>
							</c:choose>
							</td>
							<td>
									<div class="list">
										<a href="${pageContext.request.contextPath}/Answer?q_idx=${question.q_idx }">${question.q_content }</a>
									</div>
							</td>
						</tr>
						</c:forEach>
					<%-- <tr>
						<td>1</td>
						<td>
							<div class="list">
								<a>질문질문질문ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ</a>
							</div>
						</td>
						<td><a href="${pageContext.request.contextPath}/deleteQuestion?q_idx=${question.q_idx }">삭제</a></td>
					</tr>
					<tr>
						<td>3</td>
						<td><div class="list">safasfsaffasfㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ</div></td>
						<td><a href="${pageContext.request.contextPath}/deleteQuestion?q_idx=${question.q_idx }">삭제</a></td>
					</tr>
					<tr>
						<td>3</td>
						<td><div class="list">질ㄴ</div></td>
						<td><a href="${pageContext.request.contextPath}/deleteQuestion?q_idx=${question.q_idx }">삭제</a></td>
					</tr> --%>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/patHeader.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/QnAList.css" rel="stylesheet">
<style>
	table{text-align:center;}
	div.list{width:150px; vertical-align:middle; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;}
</style>
<script type="text/javascript">
	function wait(){
		alert('아직 답변이 없습니다.')
	}
</script>
</head>
<body>
<div id="wrapper">
	<header>
		<div id="pat_board_title">
			<a href="${pageContext.request.contextPath}/navigator"><img alt="메뉴" src="${pageContext.request.contextPath}/img/navigator.png"></a>
			<div id="pat_board_title_word">
				1:1문의
				<a href="${pageContext.request.contextPath}/myPrescriptionAll"><img alt="홈으로" src="${pageContext.request.contextPath}/img/home_pat.png"></a>
			</div>
		</div>
	</header>
	<div>
		<input type="text" placeholder="질문 검색">
	</div>
	<br><br>
	<div id="qna_button_img">
	<a href="${pageContext.request.contextPath}/questionList"><img src="${pageContext.request.contextPath}/img/qna_pat_1.png"></a>
		<a href="${pageContext.request.contextPath}/proposeList"><img src="${pageContext.request.contextPath}/img/propose_pat.png"></a>
		<a href="${pageContext.request.contextPath}/noticeList"><img src="${pageContext.request.contextPath}/img/notice_pat.png"></a>
	</div>
	<br>
	<div>
		<table>
			<c:forEach var="question" items="${myQuestionList }">
				<tr>
					<td>
					<c:choose>
						<c:when test="${question.q_type==1 }">상품</c:when>
						<c:when test="${question.q_type==2 }">시스템</c:when>
						<c:when test="${question.q_type==3 }">결제</c:when>
					</c:choose>
					</td>
					<td>
					<c:choose>
						<c:when test="${question.a_identity!=0 }">
							<div class="list">
								<a href="${pageContext.request.contextPath}/questionAndAnswer?q_idx=${question.q_idx }">${question.q_content }</a>
							</div>
						</c:when>
						<c:otherwise>
							<div id="wait" onclick="wait()" class="list">${question.q_content }</div>
						</c:otherwise>
					</c:choose>
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/deleteQuestion?q_idx=${question.q_idx }">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
</body>
</html> --%>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/patHeader.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/QnAList.css" rel="stylesheet">
<style>
	table{text-align:center;}
	div.list{width:150px; vertical-align:middle; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;}
</style>
<script type="text/javascript">
	function wait(){
		alert('아직 답변이 없습니다.')
	}
</script>
</head>
<body>
<div id="wrapper">
	<header>
		<div id="pat_board_title">
			<a href="${pageContext.request.contextPath}/navigator"><img alt="메뉴" src="${pageContext.request.contextPath}/img/navigator.png"></a>
			<div id="pat_board_title_word">
				1:1문의
				<a href="${pageContext.request.contextPath}/myPrescriptionAll"><img alt="홈으로" src="${pageContext.request.contextPath}/img/home_pat.png"></a>
			</div>
		</div>
	</header>
	<div>
		<input type="text" placeholder="질문 검색">
	</div>
	<br><br>
	<div id="qna_button_img">
	<a href="${pageContext.request.contextPath}/questionList"><img src="${pageContext.request.contextPath}/img/qna_pat_1.png"></a>
		<a href="${pageContext.request.contextPath}/proposeList"><img src="${pageContext.request.contextPath}/img/propose_pat.png"></a>
		<a href="${pageContext.request.contextPath}/noticeList"><img src="${pageContext.request.contextPath}/img/notice_pat.png"></a>
	</div>
	<br>
	<div>
		<table>
			<c:forEach var="question" items="${myQuestionList }">
				<tr>
					<td>
					<c:choose>
						<c:when test="${question.q_type==1 }">상품</c:when>
						<c:when test="${question.q_type==2 }">시스템</c:when>
						<c:when test="${question.q_type==3 }">결제</c:when>
					</c:choose>
					</td>
					<td>
					<c:choose>
						<c:when test="${question.a_identity!=0 }">
							<div class="list">
								<a href="${pageContext.request.contextPath}/questionAndAnswer?q_idx=${question.q_idx }">${question.q_content }</a>
							</div>
						</c:when>
						<c:otherwise>
							<div id="wait" onclick="wait()" class="list">${question.q_content }</div>
						</c:otherwise>
					</c:choose>
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/deleteQuestion?q_idx=${question.q_idx }">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
</body>
</html> --%>
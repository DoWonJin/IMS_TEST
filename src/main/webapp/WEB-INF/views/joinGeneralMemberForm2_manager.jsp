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
<script type="text/javascript">
		var confirmIDValue=0;
		var confirmNickValue=0;
		
		
		function confirmed() {

			if(confirmIDValue == 1 && confirmNickValue == 1) {
				document.forms["joinMemberFormAction"].submit();
			}else if(confirmIDValue == 1 && confirmNickValue == 0) {
				alert("아이디 중복");
				return;
			}else if(confirmIDValue == 0 && confirmNickValue == 1){
				alert("닉네임 중복");
				return;
			}else {
				alert("아이디 와 닉네임 중복");
				return;
			}
			
		}
		
		function confirmNick(obj){
			//전달 값 세팅...
			var nick = obj.value;
			var xmlhttp = new XMLHttpRequest();

			xmlhttp.onreadystatechange = function(){
				//콜백 함수...
	            if(xmlhttp.readyState == 4 &&
	            		xmlhttp.status == 200){
	            	//정상 응답일때 처리...
					var confirmData = 
						JSON.parse(xmlhttp.responseText);
					var alert = document.getElementById("alert");	            	
	            	if(confirmData.confirmNick == true && nick.length > 0 ){
	            		alert.innerHTML = "이미 존재하는 닉네임 입니다.";
	            		alert.style.color = "red";
	            		alert.style.fontWeight = "bold";
	            		confirmNickValue=0;
	            	}else if(confirmData.confirmNick == false && nick.length > 0 ){
	            		alert.innerHTML = "사용가능합니다.";
	            		alert.style.color = "black";
	            		alert.style.fontWeight = "normal";
	            		confirmNickValue=1;
	            	}else {
	            		alert.innerHTML = "중복 불가능합니다";
	            		alert.style.color = "black";
	            		alert.style.fontWeight = "normal";
	            		confirmNickValue=0;
	            	}
	            }
			};
			
			xmlhttp.open("POST" , "${pageContext.request.contextPath}/confirmNick" , true);
			xmlhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");			
			xmlhttp.send("member_nick=" + nick);
			
			
		}
		
		function confirmEmail(){
			var alert = document.getElementById("confirmEmail");
			var email_front = document.getElementById("email_front").value;
			var email_back = document.getElementById("email_back").value;;
			var exptext1 = /^[A-Za-z0-9_\.\-]+/;
			var exptext2 = /[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			
			var email_full = email_front + '@' + email_back;
			//AJAX...
			var xmlhttp = new XMLHttpRequest();

			xmlhttp.onreadystatechange = function(){
				//콜백 함수...
	            if(xmlhttp.readyState == 4 &&
	            		xmlhttp.status == 200){
	            	//정상 응답일때 처리...
					var confirmData = 
						JSON.parse(xmlhttp.responseText);
	            	if(confirmData.confirmID == true && email_front.length > 0 && email_back.length > 0 ){
	            		alert.innerHTML = "이미 존재하는 이메일 입니다.";
	            		alert.style.color = "red";
	            		alert.style.fontWeight = "bold";
	            		confirmIDValue=0;
	            	}else if(confirmData.confirmID == false ){
	            		if(exptext1.test(email_front)==false || exptext2.test(email_back)==false){
	                		alert.innerHTML = "이메일 형식이 맞지 않습니다.";
	                		return;
	        			}
	            		alert.innerHTML = "사용가능합니다.";
	            		alert.style.color = "black";
	            		alert.style.fontWeight = "normal";
	            		confirmIDValue=1;
	            	}else {
	            		alert.innerHTML = "중복 불가능합니다";
	            		alert.style.color = "black";
	            		alert.style.fontWeight = "normal";
	            		confirmIDValue=0;
	            	}
	            }
			};
			
			xmlhttp.open("POST" , "${pageContext.request.contextPath}/confirmEmail" , true);
			xmlhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");			
			xmlhttp.send("member_id=" + email_full);
			
			
		}
		
		//이메일 옵션
		function emailAddress(obj){
			var m_id2_option = obj.value;
			var member_id2 = document.getElementById("email_back");
			if(m_id2_option == "direct" ){
				member_id2.value = "";	
			}else{
				member_id2.value = m_id2_option;
			}
			confirmEmail();
		}
		
		
		
		
		
		
		//주소API
		//document.domain = "http://localhost:8181/ims/joinGeneralMemberForm2";
		function goPopup(){
			// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		    var pop = window.open("${pageContext.request.contextPath}/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		    
			// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
		}
		/** API 서비스 제공항목 확대 (2017.02) **/
		function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
								, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			document.form.roadAddrPart1.value = roadAddrPart1;
			document.form.roadAddrPart2.value = roadAddrPart2;
			document.form.addrDetail.value = addrDetail;
			document.form.zipNo.value = zipNo;
		}
		
		
		
		
	</script>
<style>
	#wrapper{
		padding:2em;
		margin: 0 20%;
	}
	.container{
		width:100%;
	}
	.col-lg-10{margin-left:10px;}
	.col-lg-10 input{
		margin-bottom:1em;
		width: 60%;
		float:right;
	}
	input#email_front{
		width:100%;
	}
	input#email_back{
		width:55%;
	}
	.col-lg-10 span{
		float:left;
		font-size:17px;
		font-weight:bold;
		margin-left:10px;
		color:#2ecc71;
	}
	.row.button{margin-left:40%;}
</style>
</head>
<body>
<div id="wrapper">
	<header>
		<div class="container">
			<%-- <a href="${pageContext.request.contextPath}/navigator"><img alt="메뉴" src="${pageContext.request.contextPath}/img/navigator.png"></a> --%>
			<div class="page-header">
				<h1>회원가입</h1>
				<%-- <a href="${pageContext.request.contextPath}/myPrescriptionAll"><img alt="홈으로" src="${pageContext.request.contextPath}/img/home_pat.png"></a> --%>
			</div>
		</div>
	</header>
	<div>
		<form class="form-horizontal well"  id="joinMemberFormAction" action="${pageContext.request.contextPath}/joinMemberFormAction_manager" method='post'>
			<div class="form">
	       		<div class="row" style="display: inline-block;width: 100%">
	       			<br>
		       		<div class="col-lg-10">
		       			<span>아이디 : </span><br><br>
		       		</div>
			       	<div class="row" style="display:inline-block;padding-left:1em;margin-left:5em;">
			       		<div class="col-lg-5" style="margin-right:5px;">
				       		<input type ='text' class="form-control" name='member_id1' size=6 id="email_front" autofocus="autofocus" onkeyup="confirmEmail()" placeholder="이메일"> 
				       	</div>
				       	<div class="col-lg-1"  style="width:1%;padding:3px;text-align:center;">@</div>
				       		<div class="col-lg-6">
				       			 <select name='email_back_option' onchange="emailAddress(this)" class="form-control" style="float:right;margin:0 3px;width:40%;">
									<option value="direct" selected="selected">직접입력</option>
									<option value="naver.com" >naver.com</option>
									<option value="daum.net" >daum.net</option>
									<option value="google.com" >google.com</option>
								</select>
								<input type ='text' class="form-control" name='member_id2' id='email_back' size=6 onkeyup="confirmEmail()">
							</div>
			       		<br><br>
						<div id="confirmEmail" style="padding-left:2em;">중복 불가능합니다</div><br>
						<br>
		       		</div>
		       		<div class="col-lg-10">
			       		<span>닉네임 : </span>
			       		<input type="text" name='member_nick' onkeyup="confirmNick(this)" size=4 class="form-control" placeholder="닉네임"><br><br>
			       		<div id="alert" style="display:inline-block;padding-left:40%;">중복 불가능합니다</div><br><br>
		       		</div>
		       		<div class="col-lg-10">
			       		<span>비밀번호 : </span>
			       		<input type="password" name='member_pw' size=4 class="form-control" placeholder="비밀번호"><br>
		       		</div>
		       		<div class="col-lg-10">
		       			<span>이름 : </span>
		       			<input type="text" disabled class="form-control" name='member_name' value="${userName}"><br>
		       		</div>
		       		<div class="col-lg-10">
		       			<span>소속 : </span>
		       		</div>
		       		<div class="row">
		       			<div class="col-lg-6" style="margin-left:34%;">
				       		<select name="member_identity" onchange="group(this)" class="form-control">
								<option value="4">판매자 </option>
								<option value="2">약사 </option>
								<option value="5">관리자 </option>
							</select>
							
						</div>
		       		</div>
		       		<br><br>
		       		<div class="col-lg-10">
			       		<span>전화번호 : </span>
		       			<input type="text" class="form-control" name="member_phone" placeholder="전화번호"><br>
		       		</div>
		       		<div class="col-lg-10">
			       		<span>배송주소 : </span>
			       		<input type="text" name="member_address" class="form-control" placeholder="배송주소"><br>
		       		</div>
		       		 <input type='hidden' name='citi_idx' value='${citi_idx }'>
		       	</div>
		       	<br>
		       	<div class="nav-tabs"></div>
		       	<br><br>
		       	<div class="row button">
		       		<input type='button' class="btn btn-default" value='회원 가입' onclick="confirmed()">	
			       	<!-- <button type="submit" class="btn btn-default" onclick="confirmCitizen()">회원가입</button> -->
		       	</div>
	       		<br><br>
	       </div>
		</form>
		<div class="pull-right" style="height:3em;">
			<a href="${pageContext.request.contextPath}/joinMemberClassification">뒤로가기</a>/
			<a href="${pageContext.request.contextPath}/loginForm">메인으로</a>
		</div>
	</div>
</div>

<%-- <form name="form" id="form" method="post">
	<table >
			<colgroup>
				<col style="width:20%"><col>
			</colgroup>
			<tbody>
				<tr>
					<th>우편번호</th>
					<td>
					    <input type="hidden" id="confmKey" name="confmKey" value=""  >
						<input type="text" id="zipNo" name="zipNo" readonly style="width:100px">
						<input type="button"  value="주소검색" onclick="goPopup();">
					</td>
				</tr>
				<tr>
					<th>도로명주소</th>
					<td><input type="text" id="roadAddrPart1" style="width:85%"></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td>
						<input type="text" id="addrDetail" style="width:40%" value="">
						<input type="text" id="roadAddrPart2"  style="width:40%" value="">
					</td>
				</tr>
			</tbody>
		</table>
</form> --%>

</body>
</html>



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
	<script type="text/javascript">
		var confirmValue=0;
		function confirmed() {

			if(confirmValue==1) {
				document.forms["joinMemberFormAction"].submit();
			}else {
				alert("아이디 중복확인 다시하도록! ^^");
			}
			
		}
		
		function confirmID(){
			//전달 값 세팅...
			var valueID = document.getElementById("member_id").value;
			//AJAX...
			var xmlhttp = new XMLHttpRequest();

			xmlhttp.onreadystatechange = function(){
				//콜백 함수...
	            if(xmlhttp.readyState == 4 &&
	            		xmlhttp.status == 200){
	            	//정상 응답일때 처리...
	            	
					var confirmData = 
						JSON.parse(xmlhttp.responseText);
	            	
	            	if(confirmData.confirmID == true){
	            		alert("이미 존재하는 아이디 입니다.");
	            	}else{
	            		alert("사용 가능한 아이디 입니다.");
	            		confirmValue=1;
	            	}
	            }
			};
			
			xmlhttp.open("POST" , "${pageContext.request.contextPath}/confirmID" , true);
			xmlhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");			
			xmlhttp.send("member_id=" + valueID);
			
			
		}
	</script>


	<style>
		#wrapper{
			margin: 0 auto;
			border : 1px solid black;
			width: 400px;
		}
	</style>
</head>
<body>
	<div id='wrapper'>
		<h3>회원 가입</h3>
		<form id="joinMemberFormAction" action="${pageContext.request.contextPath}/joinMemberFormAction" method='post'>
			<input type='hidden' name='member_identity' value='${userType }'>
			닉네임: <input type ='text' name='member_nick'><br>
			아이디 : <input type ='text' name='member_id' id='member_id'>
					<button type="button" onclick="confirmID()">중복 확인</button><br>
			비밀번호 : <input type='text' name='member_pw'><br>
			이름 : <input type='text' name='member_name' value='${userName }'><br><!-- 이름은 형식용 -->
			전화번호 : <input type='text' name='member_phone'><br>
			배송주소 : <input type='text' name='member_address'><br>
			<input type='text' name='citi_idx' value='${citi_idx }'>
			<!-- ps_idx 는 null-->
			
			<input type='button' value='회원 가입' onclick="confirmed()">		
		</form>	
	</div>
</body>
</html>
 --%>








<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/patHeader.css?ver=2" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/addrlinkSample.css" rel="stylesheet">
<script type="text/javascript">
		var confirmIDValue=0;
		var confirmNickValue=0;
		
		
		function confirmed() {

			if(confirmIDValue == 1 && confirmNickValue == 1) {
				document.forms["joinMemberFormAction"].submit();
			}else if(confirmIDValue == 1 && confirmNickValue == 0) {
				alert("아이디 중복");
				return;
			}else if(confirmIDValue == 0 && confirmNickValue == 1){
				alert("닉네임 중복");
				return;
			}else {
				alert("아이디 와 닉네임 중복");
				return;
			}
			
		}
		
		function confirmNick(obj){
			//전달 값 세팅...
			var nick = obj.value;
			var xmlhttp = new XMLHttpRequest();

			xmlhttp.onreadystatechange = function(){
				//콜백 함수...
	            if(xmlhttp.readyState == 4 &&
	            		xmlhttp.status == 200){
	            	//정상 응답일때 처리...
					var confirmData = 
						JSON.parse(xmlhttp.responseText);
					var alert = document.getElementById("alert");	            	
	            	if(confirmData.confirmNick == true && nick.length > 0 ){
	            		alert.innerHTML = "이미 존재하는 닉네임 입니다.";
	            		alert.style.color = "red";
	            		alert.style.fontWeight = "bold";
	            		confirmNickValue=0;
	            	}else if(confirmData.confirmNick == false && nick.length > 0 ){
	            		alert.innerHTML = "사용가능합니다.";
	            		alert.style.color = "black";
	            		alert.style.fontWeight = "normal";
	            		confirmNickValue=1;
	            	}else {
	            		alert.innerHTML = "중복 불가능합니다";
	            		alert.style.color = "black";
	            		alert.style.fontWeight = "normal";
	            		confirmNickValue=0;
	            	}
	            }
			};
			
			xmlhttp.open("POST" , "${pageContext.request.contextPath}/confirmNick" , true);
			xmlhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");			
			xmlhttp.send("member_nick=" + nick);
			
			
		}
		
		function confirmEmail(){
			var alert = document.getElementById("confirmEmail");
			var email_front = document.getElementById("email_front").value;
			var email_back = document.getElementById("email_back").value;;
			var exptext1 = /^[A-Za-z0-9_\.\-]+/;
			var exptext2 = /[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			
			var email_full = email_front + '@' + email_back;
			//AJAX...
			var xmlhttp = new XMLHttpRequest();

			xmlhttp.onreadystatechange = function(){
				//콜백 함수...
	            if(xmlhttp.readyState == 4 &&
	            		xmlhttp.status == 200){
	            	//정상 응답일때 처리...
					var confirmData = 
						JSON.parse(xmlhttp.responseText);
	            	if(confirmData.confirmID == true && email_front.length > 0 && email_back.length > 0 ){
	            		alert.innerHTML = "이미 존재하는 이메일 입니다.";
	            		alert.style.color = "red";
	            		alert.style.fontWeight = "bold";
	            		confirmIDValue=0;
	            	}else if(confirmData.confirmID == false ){
	            		if(exptext1.test(email_front)==false || exptext2.test(email_back)==false){
	                		alert.innerHTML = "이메일 형식이 맞지 않습니다.";
	                		return;
	        			}
	            		alert.innerHTML = "사용가능합니다.";
	            		alert.style.color = "black";
	            		alert.style.fontWeight = "normal";
	            		confirmIDValue=1;
	            	}else {
	            		alert.innerHTML = "중복 불가능합니다";
	            		alert.style.color = "black";
	            		alert.style.fontWeight = "normal";
	            		confirmIDValue=0;
	            	}
	            }
			};
			
			xmlhttp.open("POST" , "${pageContext.request.contextPath}/confirmEmail" , true);
			xmlhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");			
			xmlhttp.send("member_id=" + email_full);
			
			
		}
		
		//이메일 옵션
		function emailAddress(obj){
			var m_id2_option = obj.value;
			var member_id2 = document.getElementById("email_back");
			if(m_id2_option == "direct" ){
				member_id2.value = "";	
			}else{
				member_id2.value = m_id2_option;
			}
			confirmEmail();
		}
		
		
		
		
		
		
		//주소API
		//document.domain = "http://localhost:8181/ims/joinGeneralMemberForm2";
		function goPopup(){
			// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		    var pop = window.open("${pageContext.request.contextPath}/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		    
			// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
		}
		/** API 서비스 제공항목 확대 (2017.02) **/
		function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
								, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			document.form.roadAddrPart1.value = roadAddrPart1;
			document.form.roadAddrPart2.value = roadAddrPart2;
			document.form.addrDetail.value = addrDetail;
			document.form.zipNo.value = zipNo;
		}
		
		
		
		
	</script>
</head>
<body>
<div id="wrapper">
	<header>
		<div id="pat_board_title">
			<a href="${pageContext.request.contextPath}/loginForm"><img alt="뒤로가기" src="${pageContext.request.contextPath}/img/prev.png"></a>
			<div id="pat_board_title_word">
				회원가입
				<a href="${pageContext.request.contextPath}/patScript"><img alt="홈으로" src="${pageContext.request.contextPath}/img/home_pat.png"></a>
			</div>
		</div>
	</header>
	<form id="joinMemberFormAction" action="${pageContext.request.contextPath}/joinMemberFormAction_Manager" method='post'>
			<div>1.  정보입력</div>
				
				아이디 : <input type ='text' name='member_id1' size=6 id="email_front" autofocus="autofocus" onkeyup="confirmEmail()"> 
				@ <input type ='text' name='member_id2' id='email_back' size=6 onkeyup="confirmEmail()">
				<select name='email_back_option' onchange="emailAddress(this)">
					<option value="direct" selected="selected">직접입력</option>
					<option value="naver.com" >naver.com</option>
					<option value="daum.net" >daum.net</option>
					<option value="google.com" >google.com</option>
				</select>
				<br>
				<div id="confirmEmail">중복 불가능합니다</div><br>
				<br>
				닉네임: <input type ='text' name='member_nick' onkeyup="confirmNick(this)" size=4  >
				<div id="alert" style="display:inline-block;">중복 불가능합니다</div><br>
				비밀번호 : <input type="password" name='member_pw' size=4><br>
				이름 : <input type='text' name='member_name' value='${userName }' size=4><br><!-- 이름은 형식용 -->
				소속 : <br>
				<select name="member_identity" onchange="group(this)">
					<option value="4">판매자 </option>
					<option value="2">약사 </option>
					<option value="5">관리자 </option>
				</select>
				
				#약사의 경우# <br>
				소속약국: <br>
				<select name="ps_idx" onchange="group(this)">
					<c:forEach var="pharmacySellerVO" items="${pharmacySellerVOList}">
					<option value="${pharmacySellerVO.ps_idx }">${pharmacySellerVO.p_name } </option>
					</c:forEach>
				</select>
				
		
				소속약국 : <br>
				<select name="ps_idx">
					<c:forEach var="pharmacySellerVO" items="pharmacySellerVOList">
						<option value="${pharmacySellerVO.ps_idx }">${pharmacySellerVO.ps_name }</option>
					</c:forEach>
				</select>
			<div>1.  선택입력</div>
				전화번호 : <input type='text' name='member_phone' ><br>
				배송주소 : <input type='text' name='address'><br>
				<input type='hidden' name='citi_idx' value='${citi_idx }'>
				<input type='button' value='회원 가입' onclick="confirmed()">	
				

	</form>
</div>
<form name="form" id="form" method="post">
	<table >
			<colgroup>
				<col style="width:20%"><col>
			</colgroup>
			<tbody>
				<tr>
					<th>우편번호</th>
					<td>
					    <input type="hidden" id="confmKey" name="confmKey" value=""  >
						<input type="text" id="zipNo" name="zipNo" readonly style="width:100px">
						<input type="button"  value="주소검색" onclick="goPopup();">
					</td>
				</tr>
				<tr>
					<th>도로명주소</th>
					<td><input type="text" id="roadAddrPart1" style="width:85%"></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td>
						<input type="text" id="addrDetail" style="width:40%" value="">
						<input type="text" id="roadAddrPart2"  style="width:40%" value="">
					</td>
				</tr>
			</tbody>
		</table>
</form>

</body>
</html>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
	<script type="text/javascript">
		var confirmValue=0;
		function confirmed() {

			if(confirmValue==1) {
				document.forms["joinMemberFormAction"].submit();
			}else {
				alert("아이디 중복확인 다시하도록! ^^");
			}
			
		}
		
		function confirmID(){
			//전달 값 세팅...
			var valueID = document.getElementById("member_id").value;
			//AJAX...
			var xmlhttp = new XMLHttpRequest();

			xmlhttp.onreadystatechange = function(){
				//콜백 함수...
	            if(xmlhttp.readyState == 4 &&
	            		xmlhttp.status == 200){
	            	//정상 응답일때 처리...
	            	
					var confirmData = 
						JSON.parse(xmlhttp.responseText);
	            	
	            	if(confirmData.confirmID == true){
	            		alert("이미 존재하는 아이디 입니다.");
	            	}else{
	            		alert("사용 가능한 아이디 입니다.");
	            		confirmValue=1;
	            	}
	            }
			};
			
			xmlhttp.open("POST" , "${pageContext.request.contextPath}/confirmID" , true);
			xmlhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");			
			xmlhttp.send("member_id=" + valueID);
			
			
		}
	</script>


	<style>
		#wrapper{
			margin: 0 auto;
			border : 1px solid black;
			width: 400px;
		}
	</style>
</head>
<body>
	<div id='wrapper'>
		<h3>회원 가입</h3>
		<form id="joinMemberFormAction" action="${pageContext.request.contextPath}/joinMemberFormAction" method='post'>
			<input type='hidden' name='member_identity' value='${userType }'>
			닉네임: <input type ='text' name='member_nick'><br>
			아이디 : <input type ='text' name='member_id' id='member_id'>
					<button type="button" onclick="confirmID()">중복 확인</button><br>
			비밀번호 : <input type='text' name='member_pw'><br>
			이름 : <input type='text' name='member_name' value='${userName }'><br><!-- 이름은 형식용 -->
			전화번호 : <input type='text' name='member_phone'><br>
			배송주소 : <input type='text' name='member_address'><br>
			<input type='text' name='citi_idx' value='${citi_idx }'>
			<!-- ps_idx 는 null-->
			
			<input type='button' value='회원 가입' onclick="confirmed()">		
		</form>	
	</div>
</body>
</html>







 --%>
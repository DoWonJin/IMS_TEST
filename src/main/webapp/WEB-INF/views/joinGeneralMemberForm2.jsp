
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
			       		<span>전화번호 : </span>
		       			<input type="text" class="form-control" name="member_phone" placeholder="전화번호"><br>
		       		</div>
		       		<div class="col-lg-10">
			       		<span>배송주소 : </span>
			       		<input type="text" name="member_address" class="form-control" placeholder="배송주소"><br>
		       		</div>
		       		 <input type='hidden' name='member_identity' value='${userType }'>
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
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css?ver=2" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/styles.css?ver=2" rel="stylesheet">
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
			<a href="${pageContext.request.contextPath}/navigator"><img alt="메뉴" src="${pageContext.request.contextPath}/img/navigator.png"></a>
			<div class="page-header">
				<h1>회원가입</h1>
				<a href="${pageContext.request.contextPath}/myPrescriptionAll"><img alt="홈으로" src="${pageContext.request.contextPath}/img/home_pat.png"></a>
			</div>
		</div>
	</header>
	<div>
		<form class="form-horizontal well"  id="joinMemberFormAction" action="${pageContext.request.contextPath}/joinMemberFormAction" method='post'>
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
				       			 <select name='email_back_option' onchange="emailAddress(this)" style="float:right;margin:0 3px;width:40%;">
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
			       		<span>전화번호 : </span>
		       			<input type="text" class="form-control" placeholder="전화번호"><br>
		       		</div>
		       		<div class="col-lg-10">
			       		<span>배송주소 : </span>
			       		<input type="text" class="form-control" placeholder="배송주소"><br>
		       		</div>
		       		 <input type='hidden' name='member_identity' value='${userType }'>
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
</body>
</html>
	 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본인 확인</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css?ver='1'" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<link href="${pageContext.request.contextPath}/css/styles.css?ver='1'" rel="stylesheet">

   <script type="text/javascript">
      function focusToIdentify2(){
     	 var citi_identify1 = document.getElementById("citi_identify1").value;
     	 if(citi_identify1.length >= 6){
     		 document.getElementById("citi_identify2").focus();
     	 }
       }
      function focusToButton(){
 		  var name = document.getElementById("citi_name");
    	  var citi_identify1 = document.getElementById("citi_identify1");
    	  var citi_identify2 = document.getElementById("citi_identify2");
    	  if(citi_identify2.value.length == 7){
             //ajax..
             var xmlhttp = new XMLHttpRequest();
             xmlhttp.onreadystatechange = function(){
                //콜백함수...
                if(xmlhttp.readyState == 4 && xmlhttp.status ==200){
                   var confirmData = JSON.parse(xmlhttp.responseText);
                   if(confirmData.existCitizen == true){
                      document.getElementById("citi_idx").value = confirmData.citizenIdx;
                      alert("본인인증 성공.");
                      document.forms["joinForm"].submit();
                   }else {
                	   name.value = "";
                	   citi_identify1.value = "";
                 	   citi_identify2.value = "";
                 	   name.focus();
                	   alert("본인인증 실패.");
                   }
                }
             };
             
             xmlhttp.open("POST","${pageContext.request.contextPath}/confirmCitizen",true);
             xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
             xmlhttp.send('citi_name='+name.value + '&citi_identify1='+citi_identify1.value + '&citi_identify2='+citi_identify2.value);
    		 
    	 }
      }
      
   </script>
<style>
	#wrapper{
		padding:2em;
		margin: 0 25%;
	}
	.container{
		width:100%;
	}
	.col-lg-4 p{
		font-size:15px;
		font-weight:bold;
		line-height:3em;
	}
	.hidden{padding:2em;}
</style>
</head>
<body>
<div id="wrapper">
	<header>
		<div class="container">
			<div class="page-header">
				<h1>본인인증</h1>
			</div>
		</div>
	</header>
	<form id='joinForm' class="form-horizontal well" action="${pageContext.request.contextPath}/joinGeneralMemberForm2" method="post">
		<input type="hidden" value="${userType }" name="userType">
		<div class="row">
		<div class="col-lg-4" style="float:left;">
			<p>이름 : </p>
			<p>주민번호 : </p>
		</div>
		<div class="col-lg-8" style="text-align: center;float:right">
       		<div class="row" style="display: inline-block;">
	       		<div class="col-lg-12" style="float:left">
	       			<input type="text" class="form-control" name="citi_name" id="citi_name" placeholder="이름" style="float:left;">
	       			<div class="nav-tabs"><br></div>
	       		</div>
	       	</div>
	       	<div><br></div>
	       	<div class="row" style="display: inline-block;">
	       		<div class="col-lg-5" style="padding:0 5px;float:left" >
	       			<input type="text" class="form-control" name="citi_identify1" id="citi_identify1" size=3 onkeyup="focusToIdentify2()">
	       		</div>
	       		<div class="col-lg-1" style="width:1%;padding:3px;text-align:center;">-</div>
	       		<div class="col-lg-6" style="padding:0 5px">
	       			<input type="text" class="form-control" name="citi_identify2" id="citi_identify2" size=4 onkeyup="focusToButton()">
	       			<!-- <input type="text" class="form-control" placeholder="주민번호"> -->
	       		</div>
	       	</div>
	       	<br><br>
       </div>
      		<!-- <div class="nav-tabs" style="margin-top: 8em;"><br></div>
	       	<div class="row" style="display: flex;align-items: center;justify-content: center;margin-top:1em;"><br>
       		<button type="submit" class="btn btn-default" onclick="confirmCitizen()">본인인증</button>
       		</div>
       		<br><br> -->
    		<div class="hidden">
    		<!-- <div> -->
    			<input type='text' name="citi_idx" id="citi_idx">
    		</div>
       </div>
	</form>
	<div class="pull-right" style="height:3em;">
		<a href="${pageContext.request.contextPath}/joinMemberClassification">뒤로가기</a>/
		<a href="${pageContext.request.contextPath}/loginForm">메인으로</a>
	</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID/PW 찾기</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css?ver='1'" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<link href="${pageContext.request.contextPath}/css/styles.css?ver='1'" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/d3js/5.7.0/d3.min.js"></script>
	<script type="text/javascript">
      function findID() {
         var valueName = document.getElementById("id_citi_name").value;
         var valueIdentity = document.getElementById("id_member_identity").value;
         var valuePhone = document.getElementById("id_member_phone").value;
         //alert(valueName+','+valueIdentity+','+valuePhone);
		
         //ajax..
         var xmlhttp = new XMLHttpRequest();
         xmlhttp.onreadystatechange = function(){
            //콜백함수...
            if(xmlhttp.readyState == 4 && xmlhttp.status ==200){
            	
              var member_idList = JSON.parse(xmlhttp.responseText);
             /*  for(var id=0; id<member_idList.length;id++){
            	  alert(member_idList[id]);
              } */
               //var member_id = xmlhttp.responseText;
              // alert("member_idList="+member_idList);
               if(member_idList != ""){
                  alert("회원님의 아이디는 "+member_idList+" 입니다."); 
                  
                  //document.forms["joinForm"].submit();
                  
               }else{
                  alert("회원님의 아이디가 존재하지 않습니다!");
               }
            }
         };
         
         xmlhttp.open("POST","${pageContext.request.contextPath}/findID",true);
         xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
         xmlhttp.send('citi_name='+valueName+ '&member_identity='+valueIdentity+ '&member_phone='+valuePhone);
         
      
      }
      
      function findPW() {
          var valueID = document.getElementById("pw_member_id").value;
          var valueName = document.getElementById("pw_citi_name").value;
          var valueIdentify = document.getElementById("pw_citi_identify").value;
          //alert(valueID+','+valueName+','+valueIdentify);
 		
          //ajax..
          var xmlhttp = new XMLHttpRequest();
          xmlhttp.onreadystatechange = function(){
             //콜백함수...
             /* alert("xmlhttp.readyState:"+xmlhttp.readyState);
             alert("xmlhttp.status:"+xmlhttp.status); */
             if(xmlhttp.readyState == 4 && xmlhttp.status ==200){
             	var member_pw = xmlhttp.responseText;
             	//alert("member_pw:"+member_pw);
               //var member_idList = JSON.parse(xmlhttp.responseText);
              /*  for(var id=0; id<member_idList.length;id++){
             	  alert(member_idList[id]);
               } */
                //var member_id = xmlhttp.responseText;
               // alert("member_idList="+member_idList);
                if(member_pw != ""){
                   alert("회원님의 비밀번호는 "+member_pw+" 입니다."); 
                   
                   //document.forms["joinForm"].submit();
                   
                }else{
                   alert("회원님의 정보를 다시 확인해주세요!");
                }
             }
          };
          
          xmlhttp.open("POST","${pageContext.request.contextPath}/findPW",true);
          xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
          xmlhttp.send('member_id='+valueID+ '&citi_name='+valueName+ '&citi_identify='+valueIdentify);
          
       
       }
   </script>
<style>
	.row{
		padding-left:5%;
		padding-right:10%;
	}
	.form-control{
		width:40%;
		display:inline;
		margin-bottom:1em;
		float:right;
	}
	span{
		font-weight:bold;
		color:#2ecc71;
	}
	button{
		font-size:15px;
		padding:3px;
		border-radius:5px;
		background-color: whitesmoke;
	}
</style>
</head>
<body>
<header>
	<div class="container">
		<div class="page-header">
			<h1>아이디/비밀번호 찾기</h1>
		</div>
	</div>
	<br>
</header>
<div id="wrapper">
	<div class="row pull-right">
		<a href="${pageContext.request.contextPath }/loginForm">메인으로</a>
	</div>
	<div class="form-horizontal well">
		<div class="row">
			<h3>아이디 찾기</h3>
			<br><br>
			<div class="row">
				<span>이름 : </span>
				<input type='text' id='id_citi_name' class="form-control"><br>
			</div>
			<div class="row">
				<span>신분 : </span>
				<select id='id_member_identity' class="form-control">
					<option value="1" selected>일반회원</option>
					<option value="2">약사</option>
					<option value="4">판매자</option>
				</select>
			<br>
			</div>
			<div class="row">
				<span>전화번호 : </span>
				<input type='text' id='id_member_phone' class="form-control"><br>
			</div>
			<br>
			<div class="row">
				<span>아이디 : </span>
				<button type='button' onclick="findID()" class="button">찾기</button>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="form-horizontal well">
		<div class="row">
			<h3>비밀번호 찾기</h3>
			<br><br>
			<div class="row">
				<span>아이디 : </span>
				<input type='text' id='pw_member_id' class="form-control"><br>
			</div>
			<div class="row">
				<span>이름 : </span>
				<input type='text' id='pw_citi_name' class="form-control"><br>
			</div>
			<div class="row">
				<span>주민등록번호 : </span>
				<input type='text' id='pw_citi_identify' class="form-control"><br>
				<p class="h6">(주민등록번호 뒷자리를 입력해주세요!)</p>
			<br>
			</div>
			<div class="row">
				<span>비밀번호 : </span>
				<button type='button' onclick="findPW()" class="button">찾기</button>
			</div>
		</div>
	</div>
	<br><br><br>
</div>
</body>
</html>
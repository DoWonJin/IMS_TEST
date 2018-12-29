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
var Allchecked = 1;
var st_idxTagList;



window.onload=function(){
	st_idxTagList = document.getElementsByName("st_idx[]");
  };
function checkAll(){
	if(Allchecked == 1){
		for (var i = 0; i < st_idxTagList.length; i++) {
			st_idxTagList[i].checked = false;
			console.log(i +" : " + st_idxTagList[i].checked);
	    }
		Allchecked = 0;
	}else{  			
		for (var i = 0; i < st_idxTagList.length; i++) {
			st_idxTagList[i].checked  = true; 
			console.log(i +" : " + st_idxTagList[i].checked);
	    }	
		Allchecked = 1;
	}
	calculateTotalPrice();
}

function checkEach(obj){
	var checkBoxAll =  document.getElementById("checkBoxAll");
	if(obj.checked == false){
		checkBoxAll.checked = false;
		Allchecked = 0;
	}
	
	var test = 1;//선택이 다되었을 떄
	//var test = 2;//선택 비선택 섞였을 떄
	//var test = 3;//선택이 모두 안됐을 떄
	for(var i = 0; i < st_idxTagList.length; i++){
		if(st_idxTagList[i].checked == false)test = 2; 
	}
	if(test == 1){
		checkBoxAll.checked = true;
		Allchecked = 1;
	}
	calculateTotalPrice();
	
}

//수량 변경시 재고물량보다 많은지 체크 + 아래 합계자동계산하기
function changeCount(st_idx,m_name,tag){
	  var orderCount = tag.value;
	  //console.log(" : " + );
	if(orderCount < 0){
		alert("수량확인부탁합니다");
		tag.value = 0;
	}else{
		//ajax..
         var xmlhttp = new XMLHttpRequest();
         xmlhttp.onreadystatechange = function(){
            //콜백함수...
            if(xmlhttp.readyState == 4 && xmlhttp.status ==200){
            	var storage = parseInt(JSON.parse(xmlhttp.responseText));
				var apply = parseInt(tag.value);
				if(storage < apply){
					var st_idx_tmp = String(st_idx);
					console.log(st_idx_tmp);
					alert(  m_name 
							+ "의 수량이 재고보다 많습니다."
							+ "재고갯수 : " 
							+ storage);
					tag.value = storage;
				}
            }
         };
         xmlhttp.open("POST","${pageContext.request.contextPath}/orderCountCheck", true);
         xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
         xmlhttp.send('st_idx=' + st_idx);
	}			  
	calculateTotalPrice();         
}


//선택한 것 삭제하기
function deleteSelectedItems(){
	if(st_idxTagList.length == 0) {
		alert("선택된 상품이 없습니다.")
		return;
	}
    var form = document.getElementById("form");
    form.action = "${pageContext.request.contextPath}/removeSelectedItems";
    form.submit();
}

//결제하기
function purchaseItems(total_price){
	var notice = "";
	var f = document.getElementById("form");
   	var countState = 1; //모두 수량을 적은 상태로 가정    1:수량 모두 적음   / 0: 하나라도 수량이 없음
   	
   		console.log("length" + f.elements['st_idx[]'].length);
   		for (i=0; i<f.elements['st_idx[]'].length; i++)
       {
   			console.log(i + " : " +f.elements['itemNumList[]'][i]);
   			console.log(i + " : " +f.elements['itemNumList[]'][i].value);
       		if (f.elements['st_idx[]'][i].checked==true){
	       		if(f.elements['itemNumList[]'][i].value == 0){
					notice += f.elements['m_name'][i].value;
					notice += ", ";
					countState = 0;
				}
            }
       		if (f.elements['st_idx[]'][i].checked==false){
               f.elements['itemNumList[]'][i].disabled=true;
            }
       }
		if(countState == 0){
	       notice = notice.substring(0,notice.length-2);
		   notice += "의 수량을 정하지 않았습니다.";
		   alert(notice);
		   return;	
		   for (i=0; i<f.elements['st_idx[]'].length; i++)
	       {
	               f.elements['itemNumList[]'][i].disabled=false;
	       }
		}
  
	document.getElementById("final_totalPrice_inputTag").value = total_price; 
	form.submit();	
}

function calculateTotalPrice(){
	//선택된 상품 총 금액 변경되도록....
	var priceList = document.getElementsByName("finalPs_price");
	var countList = document.getElementsByName("itemNumList[]");
	var total = 0;
	//console.log(" : " + );
	for(var i=0; i < priceList.length; i++){
		var price = priceList[i].value;
		var count = countList[i].value; 
		total += price * count; 
	}

	for(var i = 0; i < st_idxTagList.length; i++){
		if(st_idxTagList[i].checked == false){
			var price = priceList[i].value;
			var count = countList[i].value; 
			total -= price * count; 
		} 
	}
	
	var total_str = total.toString() + " 원";

	var priceTag = document.getElementById("totalPrice");
	var spanTag = document.getElementById("final_totalPrice_spanTag");
	var inputTag = document.getElementById("final_totalPrice_inputTag");
	priceTag.innerHTML = total_str;
	
	if(total != 0){
		if(total >= 15000){
			total += 0; //배송비 추가하기
			document.getElementById("deliver_fee").innerHTML = "0 원";

		}else{
			total += 2500; //배송비 추가하기	
			document.getElementById("deliver_fee").innerHTML = "2500 원";

		}
	}else{ // 어떤 상품도 선택하지 않았을 때
		document.getElementById("deliver_fee").innerHTML = "0 원";
	}
	
	//var test = 1;//선택이 다되었을 떄
	//var test = 2;//선택 비선택 섞였을 떄
	var test = 3;  //선택이 모두 안됐을 떄
	for(var i = 0; i < st_idxTagList.length; i++){
		if(st_idxTagList[i].checked == true)test = 2; 
	}
	if(test == 3){
		//checkBoxAll.checked = false;
		Allchecked = 0;
		total = 0;	
	}
	spanTag.innerHTML = total.toString() + " 원";
	inputTag.value = total;
}		
</script>
<style>
	img{
		width:100%;
		height:100%;
		border-radius: 15px;
	}
	.col-lg-4{
		margin-bottom:3em;
	}
	.card-head{
		border-radius: 15px;
		background-color: #777;
		min-height:3em;
	}
	.card-head a{
		text-decoration:none;
		color:#fff;
	}
	.col-xs-11{font-size:15px;padding-left:10%;}
	.button{
		font-size:15px;
		padding:8px;
		border-radius:5px;
		background-color: whitesmoke;
	}
</style>
</head>
<body>
<header>
	<section>
		<div class="container">
			<nav class="navbar navbar-inverse" role="navigation">
		        <!-- Brand and toggle get grouped for better mobile display -->
		        <div class="navbar-header">
		          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
		            <span class="sr-only">Toggle navigation</span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		          </button>
		          <a class="navbar-brand" href="#">Nav</a>
		        </div>
	      
	        	<!-- Collect the nav links, forms, and other content for toggling -->
		        <div class="collapse navbar-collapse navbar-ex1-collapse">
		          <ul class="nav navbar-nav">
		           	<li><a href="${pageContext.request.contextPath}/myPrescriptionAll">처방기록</a></li>
		            <li><a href="${pageContext.request.contextPath}/diseaseCategoryList">자가진단</a></li>
		            <li><a href="${pageContext.request.contextPath}/buyProductList">상품구매</a></li>
		            <li><a href="${pageContext.request.contextPath}/orderList">주문내역</a></li>
		            <li><a href="${pageContext.request.contextPath}/myInfo">마이페이지</a></li>
		            <li class="active"><a href="${pageContext.request.contextPath}/basketList">장바구니</a></li>
		            <li><a href="${pageContext.request.contextPath}/questionList">1:1 문의</a></li>
		          </ul>
		          <ul class="nav navbar-nav navbar-right">
		            <li><a href="#">Link</a></li>
		          </ul>
		        </div><!-- /.navbar-collapse -->
	    	</nav>
		</div>
	</section>
	<div class="container">
		<div class="page-header">
			<h1>장바구니</h1>
		</div>
	</div>
	<br>
</header>
<div class="wrapper">
	<div class="form-horizontal well">
		<div class="pull-left">
			<input type="checkbox" id="checkBoxAll" onchange="checkAll()" checked 
			       style="float:left;margin-right:15px;">
			<span style="float:left;margin-right:15px;font-size: 15px;">전체선택</span>
			
			
			<button type="button" onclick="deleteSelectedItems()" style="float:left;margin-right:15px;">삭제</button>
			
			<br>
		</div>
		<div class="pull-right">
			<a href="${pageContext.request.contextPath}/buyProductList">물품구매로</a>
		</div>
		<br>
		<br>
	</div>
	<c:set var="sum" value="0"/>
	
	<div class="form-horizontal well">
	<form action="${pageContext.request.contextPath}/payStep" method="post" id="form">
		<input type="hidden" name="total_price" id="final_totalPrice_inputTag"><!-- 총 가격 -->
		<div class="row">
			<c:forEach var="basketVO" items="${basketVOList}">
				 <div class="col-lg-4">
			         <div class="card">
			         <div class="card-head">
			         	<input type="checkbox" id="check" name="st_idx[]" value="${basketVO.st_idx  }" checked width="50px" onchange="checkEach(this)">
			         	<a href="${pageContext.request.contextPath}/productDetail?st_idx=${basketVO.st_idx   }">${basketVO.m_name }</a>	
			           	<a href="#"><img class="card-img-top" src="${pageContext.request.contextPath}/${basketVO.m_path}" alt=""></a>
			         </div>
			         <div class="card-body">
			             <h4 class="card-title">
			             </h4>
			             <h5>${basketVO.ps_price}원</h5>
			             <h5>${basketVO.m_duration}일 뒤 도착예정</h5>
			        	 
			             <p class="card-text">
			         
					<label for="check"> 
			             	수량 :<input type="number" id="check" name="itemNumList[]" value="${basketVO.itemNum }" onchange="changeCount('${basketVO.st_idx }','${basketVO.m_name }',this)"> <!-- st_idx필요함 -->
					</label> 
			            
			             </p>
			         </div>
			           <div class="card-footer">
			             <div class="text-muted">
			             	<a href="${pageContext.request.contextPath}/removeOneItem?st_idx=${basketVO.st_idx}">삭제</a>
			             </div>
			           </div>
			       	</div>
			      	<div class="row">
						<br>
						<input type="hidden" name="finalPs_price" value="${basketVO.ps_price }">
						<input type="hidden" name="m_name" value="${basketVO.m_name }">
						<input type="hidden" name="m_duration" value="${basketVO.m_duration}">
						<br>
					</div>
			     </div>
			</c:forEach>
		</div>
	</form>
			 
		
	</div>
	<div class="form-horizontal well">
		<div class="row">
		
			<div class="col-xs-11">
				<c:forEach var="basketVO" items="${basketVOList}">
					<c:set var="ps_price" value="${basketVO.ps_price}"/>
					<c:set var="itemNumList" value="${basketVO.itemNum}"/>
					<c:set var="sum" value="${sum+ ps_price*itemNumList}"/>
					
				</c:forEach>
				
				선택한 상품 합계 <span id="totalPrice"><c:out value="${sum }"/>원</span><br>
				
				<div class="row"></div>
				 배송비 <span class="float_right" id="deliver_fee">2500원</span><br>
				<div class="col-xs-pull-8">
					<hr style="border-color:#ccc;box-shadow: 0 1px 1px rgba(0,0,0,.05);">
				</div>
				총 결제금액 
				<span class="float_right" id="final_totalPrice_spanTag">
					<c:out value="${sum+2500}"/>원
				</span><br>
						
				<div class="col-xs-offset-5">
					<br>
					<button type="button" onclick="purchaseItems(${sum+2500})" class="button">결제</button>
					<br><br>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>


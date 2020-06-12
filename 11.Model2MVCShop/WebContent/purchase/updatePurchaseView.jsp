<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<title>구매정보수정</title>

<script type="text/javascript" src="../javascript/calendar.js">
</script>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
   <style>
	  body {
            padding-top : 70px;
        }
        .navbar-inverse {
		    background-image: -webkit-linear-gradient(top,#EEDCC6 0,#EEDCC6 100%)!important;
		    background-image: -o-linear-gradient(top,#EEDCC6 0,#EEDCC6 100%) !important;
		    background-image: -webkit-gradient(linear,left top,left bottom,from(#EEDCC6),to(#EEDCC6))!important;
		    background-image: linear-gradient(to bottom,#EEDCC6 0,#EEDCC6 0%);
		    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#EEDCC6', endColorstr='#EEDCC6', GradientType=0)!important;
		    filter: progid:DXImageTransform.Microsoft.gradient(enabled=false)!important;
		    background-repeat: repeat-x;
		    border-radius: 4px;
		}
		.navbar-inverse {
		    background-color: #EEDCC6;
		    border-color: #EEDCC6;
		}
		.navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form {
		    border-color:#EEDCC6;
		}
		.navbar-inverse .navbar-brand:focus, .navbar-inverse .navbar-brand:hover {
		    color: white;

		}
		.navbar-inverse .navbar-brand {
		    color:black;
		}
		.navbar-inverse .navbar-nav>li>a:focus, .navbar-inverse .navbar-nav>li>a:hover {
		    color: white;

		}
		.navbar-inverse .navbar-brand, .navbar-inverse .navbar-nav>li>a {
		    text-shadow: 0 -1px 0 rgba(0,0,0,.25);
		}
		.navbar-inverse .navbar-nav>li>a, .navbar-inverse .navbar-nav>li {
		    color:black;
		}
		
    </style>
<script type="text/javascript">


function fncAddPurchase(){
	//Form 유효성 검증
 	//var name = document.detailForm.prodName.value;
	var receiverName = $("input[name='receiverName']").val();
	//var detail = document.detailForm.prodDetail.value;
	var receiverPhone = $("input[name='receiverPhone']").val();
	//var manuDate = document.detailForm.manuDate.value;
	var divyAddr = $("input[name='divyAddr']").val();

	if(receiverName == null || receiverName.length<1){
		alert("구매자 이름은 반드시 입력하여야 합니다.");
		return;
	}
	if(receiverPhone == null || receiverPhone.length<1){
		alert("연락처는 반드시 입력하여야 합니다.");
		return;
	}
	if(divyAddr == null || divyAddr.length<1){
		alert("배송받을 주소는 반드시 입력하셔야 합니다.");
		return;
	}

	$("form").attr("method", "POST").attr("action", "/purchase/updatePurchase").submit();
	//document.detailForm.action='product/updateProduct';
	//document.detailForm.submit();
}

	$(function(){
		
		 $( ".btn-default:contains('수정')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('수정')" ).html() );
				fncAddPurchase();
			});
		 
		 $( ".btn-default:contains('취소')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
				history.go(-1);
			});
		 
		 $("#calendar").on("click", function(){
				
			 show_calendar('document.updatePurchase.divyDate', document.updatePurchase.divyDate.value);
			 
		 });
		 
		 $(".glyphicon-search").on("click", function(){
			 
			 
			 new daum.Postcode({
			        oncomplete: function(data) {
			        	
			        	$("input[name=divyAddr]").val(data.address);
			        	
			        }
			   }).open();
		 
		 });
		 
	});
 </script>
</head>

<jsp:include page="/layout/toolbar.jsp" />


	<div class="container">
		<div class="row">
		<div class="page-header">
	       <h3 class=" text-info">구매정보수정</h3>
	    </div>
	    
	    <div class="col-md-4">
		 <div class="well well-lg">
			<c:if test="${!empty purchase.purchaseProd.fileName}">
				<p align="center"><img src="../images/uploadFiles/${purchase.purchaseProd.fileName}" style="width:250" class="img-rounded"/></p>
			</c:if>
			<c:if test="${empty purchase.purchaseProd.fileName}">
			<img src="/images/uploadFiles/../../images/empty.GIF" style="width:300" class="img-rounded"/>
			</c:if>
		 </div>

		</div>
		
		
	 <form class="form-horizontal" name="detailForm">

		<div class="col-md-6">
		  <div class="form-group" >
		    <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label"> 구매자 아이디 
		    <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		    </label>
		    <div class="col-sm-4">
			 <input type="text" class="form-control" readonly name="buyerId" value="${purchase.buyer.userId}">
			 <input type="hidden" name="tranNo" value="${purchase.tranNo }">
			</div>
		  </div>
	
		
		 <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매 방법
		    <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		    </label>
		    <div class="col-sm-4">
			      <div class="custom-control custom-radio">
						<input type="radio" name="paymentOption" id="jb-radio-1" value="1" class="custom-control-input">
						<label class="custom-control-label" for="jb-radio-1">현금구매</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" name="paymentOption" id="jb-radio-2" value="2" class="custom-control-input">
						<label class="custom-control-label" for="jb-radio-2">신용구매</label>
					</div>
			</div>
		  </div>
		  
		  <div class="form-group" >
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label"> 구매자 이름 
		    <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		    </label>
		    <div class="col-sm-4">
			 <input type="text" class="form-control" name="receiverName" value="${purchase.receiverName}">
			</div>
		  </div>
		  
		   <div class="form-group" >
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label"> 구매자 연락처 
		    <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		    </label>
		    <div class="col-sm-4">
			 <input type="text" class="form-control" name="receiverPhone" value="${purchase.receiverPhone }">
			</div>
		  </div>
		  
		  <div class="form-group" >
		    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label"> 구매자 주소
		    <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		    </label>
		    <div class="col-sm-4">
			 <input type="text" class="form-control" name="divyAddr" value="${purchase.divyAddr }">
			 <span class="glyphicon glyphicon-search">주소찾기</span>
			</div>
		  </div>
		  
		  <div class="form-group" >
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label"> 배송요청사항		 
		    </label>
		    <div class="col-sm-4">
			 <input type="text" class="form-control" name="divyRequest" value="${purchase.divyRequest }">
			</div>
		  </div>
		  
		  <div class="form-group" >
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label"> 배송희망일
		    </label>
		    <div class="col-sm-4">
			 <input type="date" class="form-control" name="divyDate">
			</div>
		  </div>
		  </div>
		  

 		<div class="form-group" >
		 <div class="col-md-6 text-right" style="float:right ">				
			<button class="btn btn-default">수정</button>
			<button class="btn btn-default">취소</button>
		</div>
		</div>	
	
</form>

</div>

</body>
</html>
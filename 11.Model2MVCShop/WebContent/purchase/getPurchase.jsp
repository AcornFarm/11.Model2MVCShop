<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<title>주문상세조회</title>

<script type="text/javascript" src="../javascript/calendar.js">
</script>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
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
		
		.row {
		margin-left: auto; margin-right: auto;
		
		}
    </style>
	<script type="text/javascript">
	
	$(function(){
		
		$( ".btn-default:contains('확인')" ).on("click" , function() {

			self.location="/purchase/listPurchase";
		});
		
		$( ".btn-default:contains('수정')" ).on("click" , function() {
			
			var tranNo = ${purchase.tranNo}
			self.location="/purchase/updatePurchase?tranNo="+tranNo;
		});

		
	});
	


	</script>
</head>



<body bgcolor="#ffffff" text="#000000">


<jsp:include page="/layout/toolbar.jsp" />


<div class="container">
		<div class="row">
		<div class="page-header">
	       <h3 class=" text-info">주문상세조회</h3>
	    </div>
		
		<div class="row text-center">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>물품번호</strong></div>
			<div class="col-sm-4">${purchase.purchaseProd.prodNo}</div>
		</div>
		<hr/>
		<div class="row text-center">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>구매자아이디</strong></div>
			<div class="col-sm-4">${purchase.buyer.userId}</div>
		</div>
		<hr/>
		<div class="row text-center">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>구매방법</strong></div>
			<div class="col-sm-4">
			<c:if test="${!empty purchase.paymentOption}">
				${ fn:contains(purchase.paymentOption, '1')? '현금구매' : '신용카드' }
			</c:if>
			</div>
		</div>
		<hr/>
		<div class="row text-center">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>구매자이름</strong></div>
			<div class="col-sm-4">${purchase.receiverName}</div>
		</div>
		<hr/>
		<div class="row text-center">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>구매자연락처</strong></div>
			<div class="col-sm-4">${purchase.receiverPhone}</div>
		</div>
		<hr/>
		<div class="row text-center">
			<div class="col-sm-offset-1 col-sm-3"><strong>구매자주소</strong></div>
			<div class="col-sm-4">${purchase.divyAddr}</div>
		</div>
		<hr/>
		<div class="row text-center">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>구매요청사항</strong></div>
			<div class="col-sm-4">${purchase.divyRequest}</div>
		</div>
		<hr/>
		<div class="row text-center">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>배송희망일자</strong></div>
			<div class="col-sm-4">${purchase.divyDate}</div>
		</div>
		<hr/>
		<div class="row text-center">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>주문일시</strong></div>
			<div class="col-sm-4">${purchase.orderDate}</div>
		</div>
		
		
		</div>
		
		<div class="col-sm-offset-1 col-sm-3 text-center" style="float:right;">				
				<button class="btn btn-default">수정</button>
				<button class="btn btn-default">확인</button>
		</div>	
</div>
	
	

</body>
</html>
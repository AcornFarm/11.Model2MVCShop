<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html>
<head>
<title>addPurchase</title>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
        .navbar-inverse {
		    background-image: -webkit-linear-gradient(top,#CCB08C 0,#CCB08C 100%)!important;
		    background-image: -o-linear-gradient(top,#CCB08C 0,#CCB08C 100%) !important;
		    background-image: -webkit-gradient(linear,left top,left bottom,from(#CCB08C),to(#CCB08C))!important;
		    background-image: linear-gradient(to bottom,#CCB08C 0,#CCB08C 0%);
		    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#CCB08C', endColorstr='#CCB08C', GradientType=0)!important;
		    filter: progid:DXImageTransform.Microsoft.gradient(enabled=false)!important;
		    background-repeat: repeat-x;
		    border-radius: 4px;
		}
		.navbar-inverse {
		    background-color: #CCB08C;
		    border-color: #CCB08C;
		}
		.navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form {
		    border-color:#CCB08C;
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
	

	$(function(){
		
		$( ".btn-default:contains('확인')" ).on("click" , function() {
		
			self.location="/product/listProduct?menu=search";
			
		});
		
	});
	


	</script>
</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />

<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">구매해주셔서 감사합니다.</h3>
	       <h5 class="text-muted"><strong class="text-danger">주문내역조회</strong>에서 구매내역을 확인하실 수 있습니다.</h5>
	    </div>

		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>물품번호</strong></div>
			<div class="col-sm-4">${purchase.purchaseProd.prodNo}</div>
		</div>
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>구매자아이디</strong></div>
			<div class="col-sm-4">${purchase.buyer.userId}</div>
		</div>
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>구매방법</strong></div>
			<div class="col-sm-4">
			<c:if test="${!empty purchase.paymentOption}">
				${ fn:contains(purchase.paymentOption, '1')? '현금구매' : '신용카드' }
			</c:if>
			</div>
		</div>
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>구매자이름</strong></div>
			<div class="col-sm-4">${purchase.receiverName}</div>
		</div>
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>구매자연락처</strong></div>
			<div class="col-sm-4">${purchase.receiverPhone}</div>
		</div>
		<div class="row">
			<div class="col-sm-offset-1 col-sm-3"><strong>구매자주소</strong></div>
			<div class="col-sm-4">${purchase.divyAddr}</div>
		</div>
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>구매요청사항</strong></div>
			<div class="col-sm-4">${purchase.divyRequest}</div>
		</div>
		<div class="row">
	  		<div class="col-sm-offset-1 col-sm-3"><strong>배송희망일자</strong></div>
			<div class="col-sm-4">${purchase.divyDate}</div>
		</div>
	
		
		<div class="col-sm-offset-1 col-sm-3 text-center" style="float:right ">				
				<button class="btn btn-default">확인</button>
		</div>	
	</div>	



</body>
</html>
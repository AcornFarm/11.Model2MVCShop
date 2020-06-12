<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>상품등록</title>

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
    </style>
    <script type="text/javascript">	
	

	$(function(){
		
		$( ".btn-default:contains('확인')" ).on("click" , function() {
		
			self.location="/product/listProduct?menu=search";
			
		});
		
		$( ".btn-default:contains('추가등록')" ).on("click" , function() {

			self.location="/product/addProductView.jsp";
		});
		
		
	});
	


	</script>

</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />


		<div class="row">
		<div class="container">
			
				<div class="page-header">
		       		<h3 class=" text-info">상품등록</h3>
			</div>

		<div class="row">
	  		<div class="col-xs-6 col-md-3"><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-8">${pvo.prodName}</div>
		</div>	
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-6 col-md-3"><strong>상품상세정보</strong></div>
			<div class="col-xs-8 col-md-8">${pvo.prodDetail}</div>
		</div>	
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-6 col-md-3"><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-8">${pvo.manuDate}</div>
		</div>	
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-6 col-md-3"><strong>가격</strong></div>
			<div class="col-xs-8 col-md-8">${pvo.price}</div>
		</div>	
		<hr/>
		</div>
		</div>

		<div class="col-md-3 text-right" style="float:right ">				
	

				<button class="btn btn-default">추가등록</button>
	
				<button class="btn btn-default">확인</button>
				
		</div>	

</body>
</html>

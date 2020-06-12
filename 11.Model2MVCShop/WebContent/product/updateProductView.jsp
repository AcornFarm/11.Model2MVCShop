<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<html>
<head>
<title>회원정보수정</title>

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

function fncAddProduct(){
	//Form 유효성 검증
 	//var name = document.detailForm.prodName.value;
	var name = $("input[name='prodName']").val();
	//var detail = document.detailForm.prodDetail.value;
	var detail = $("input[name='detail']").val();
	//var manuDate = document.detailForm.manuDate.value;
	var manuDate = $("input[name='manuDate']").val();
	//var price = document.detailForm.price.value;
	var price = $("input[name='price']").val();

	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}
	
	$("form").attr("enctype", "multipart/form-data").attr("method", "POST").attr("action", "/product/updateProduct").submit();
	//document.detailForm.action='product/updateProduct';
	//document.detailForm.submit();
}

 $(function(){
	
	 $( ".btn-default:contains('수정')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('수정')" ).html() );
			fncAddProduct();
		});
	 
	 $( ".btn-default:contains('취소')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
			history.go(-1);
		});
	 
	 
 });
 
 

</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />

<div class="container">
		<div class="row">
		<div class="page-header">
	       <h3 class=" text-info">상품수정</h3>
		</div>
	
	<form class="form-horizontal" name="detailForm">

	
		  <div class="form-group" >
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상 품 명 
		    <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		    </label>
		    <div class="col-sm-4">
		    	  <input type="hidden" name="prodNo" value="${pvo.prodNo}"/>
			      <input type="text" class="form-control"  name="prodName" value="${pvo.prodName }">
			</div>
		  </div>

		

		 <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품 상세정보 </label>
		    <div class="col-sm-4">
			      <input type="text" class="form-control" name="prodDetail" value="${pvo.prodDetail }">
			</div>
		  </div>
		  
		   <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자
		   <!--  &nbsp;<img id="calendar" src="../images/ct_icon_date.gif" width="15" height="15" /> -->
		    </label>
		    <div class="col-sm-4">
			      <input type="date" class="form-control" name="manuDate" value="${pvo.manuDate}">
			</div>
		  </div>
		  
		
		<div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">상품 가격 
		    <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		    </label>
		    <div class="col-sm-4">
			      <input type="text" class="form-control" name="price" value="${pvo.price }">
			</div>
		 </div>
	

		  <div class="form-group">
		    <label for="uploadFile" for="price" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <input type="file" name="uploadFile">
		    <p class="help-block col-sm-3 control-label">10MB 미만의 파일만 업로드 가능합니다.</p>
		  </div>
		  
		</form>  
		
		 </div>
</div>



		<div class="col-md-3 col-sm-offset-1 text-right" style="float:right ">
		
			<button class="btn btn-default">수정</button>
			<button class="btn btn-default">취소</button>
	
		</div>


</body>
</html>
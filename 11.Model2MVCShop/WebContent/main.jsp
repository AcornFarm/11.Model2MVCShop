<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
        body {
            padding-top : 70px;
        }

        
       .jumbotron{
        	background-color: #EEDCC6;
        
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
		.well {
		    background-image: linear-gradient(to bottom,#D9EDF2 0,#D9EDF2 100%);
		    background-repeat: repeat-x;
		    border-color: #D9EDF2;
		    box-shadow: inset 0 1px 3px rgba(0,0,0,.05), 0 1px 0 rgba(255,255,255,.1);
		}

		h3> a{
		 color:white;

		}
   	</style>
   	<script type="text/javascript">
   	
	$( function(){
		
		
		$.ajax( 
				{
					url : "/product/json/listProduct",
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {
						console.log(JSONData);
						
						var mainImage1 = 
							
						"<img class='img-responsive center-block mainImeage' src='..//images//uploadFiles//"+JSONData[0].fileName+"' style='height:400px' >"
					     +"<div class='carousel-caption cap1'><h3><a href='/product/getProduct?menu=search&prodNo="+JSONData[0].prodNo+"'>"
					 		+JSONData[0].prodName+"</a></h3></div>";
					 		
				 		var mainImage2 = 
							
							"<img class='img-responsive center-block mainImeage' src='..//images//uploadFiles//"+JSONData[1].fileName+"' style='height:400px' >"
						     +"<div class='carousel-caption cap1'><h3><a href='/product/getProduct?menu=search&prodNo="+JSONData[1].prodNo+"'>"
						 		+JSONData[1].prodName+"</h3></div>";
						 		
				 		var mainImage3 = 
							
							"<img class='img-responsive center-block mainImeage' src='..//images//uploadFiles//"+JSONData[2].fileName+"' style='height:400px' >"
						     +"<div class='carousel-caption cap1'><h3><a href='/product/getProduct?menu=search&prodNo="+JSONData[1].prodNo+"'>"
						 		+JSONData[2].prodName+"</h3></div>";
					 		
						
						$(".mainImeage1").html(mainImage1);
				 		$(".mainImeage2").html(mainImage2);
				 		$(".mainImeage3").html(mainImage3);
						
					}
					
		


			});
		
		
	});
	
	$(function(){
	
		$(".carousel").carousel({ interval:2500 });
		
	});
	
   	
   	
   	
   	
   	</script>
   	
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	 	
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  아래의 내용은 http://getbootstrap.com/getting-started/  참조 -->	
   	 
   	 
   	 <div class="container">
		<div class="row">
		<div class="col-md-2 col-xs-4">
		 <div class="well well-lg" >
		 <p> 환영합니다!</p>
			 <strong>${user.userName}</strong>님
		 <hr/>
		 <a href="/user/getUser?userId=${user.userId}">내정보보기</a>
		 <br/>
		 <a href="/purchase/listPurchase?userId=${user.userId}">주문내역조회</a>
		 <p>
		 </div>
		</div>
		
		<div class="col-md-9">
	     
	        <p style="text-align:center; vertical-align: middle;"><img src="/images/titleImage.png" ></p>
	       	
	       
	       	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			  <!-- Indicators -->
			  <ol class="carousel-indicators">
			    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
			  </ol>
			
			  <!-- Wrapper for slides -->
			  <div class="carousel-inner" role="listbox">
			    <div class="item active mainImeage1">
			      
			    </div>
			    <div class="item mainImeage2">
			      
			    </div>
			   
			    <div class="item mainImeage3">
			      
			    </div>
			  </div>
			
			  <!-- Controls -->
			  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
	       	

  		 </div>
 	</div>
 </div>
		
</body>

</html>
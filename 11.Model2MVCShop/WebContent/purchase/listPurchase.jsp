<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html>
<head>
<title>�ֹ�������ȸ</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
 	<link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<style>
	  body {
            padding-top : 50px;
            
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
		table *{
			font-size: 14px;
		
		}
    </style>

<script type="text/javascript">
	function fncGetUserList(currentPage) {
   	
   	$("#currentPage").val(currentPage);
   	$("form").attr("method", "POST").attr("action", "/purchase/listPurchase").submit();
   	
	}
	
	 $(function() {
		 
			
			$( "td:nth-child(7) > i" ).on("click" , function() {
				
					var tranNo = $(this).parent().prev().prev().prev().prev().prev().prev().text().trim();
					$.ajax( 
							{
								url : "/purchase/json/getPurchase/"+tranNo,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {
									
									var displayValue = "<h6>"
																+"��ǰ ��ȣ : "+JSONData.purchaseProd.prodNo+"<br/>"
																+"��ǰ �� : "+JSONData.purchaseProd.prodDetail+"<br/>"
																+"���� : "+JSONData.purchaseProd.price+"<br/>"
																+"������ �̸� : "+JSONData.receiverName+"<br/>"
																+"������ ����ó : "+JSONData.receiverPhone+"<br/>"
																+"������ �ּ� : "+JSONData.divyAddr+"<br/><h6>";
																
																
									$("h6").remove();
									$("#"+tranNo+"").html(displayValue);  
									
									
									
								}
							
							
						});
					
					
			});
			
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			$(".ct_list_pop:nth-child( 3n)" ).css("background-color" , "whitesmoke");
		});	

	
	
	
	
	
</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />







	<div class="container">
		
				<div class="page-header text-info">	
					<h3>�ֹ� ���� ��ȸ</h3>
				</div>
			
	<div class="row">
 			<div class="col-md-6 text-left">
		    	<p class="text-primary">
		    	��ü ${resultPage.totalCount }�Ǽ�, ���� ${resultPage.currentPage}������
		    	</p>
		    </div>
	  </div>
	  
	<table class="table table-hover table-striped" >
		      
		<thead>	    
			<tr>
				<th align="center">No</th>
				<th align="left" >��ǰ��</th>
		        <th align="left">ȸ����</th>
		        <th align="left">��ȭ��ȣ</th>
		        <th align="left">�����Ȳ</th>
		        <th align="left">���º���</th>
		        <th align="left">��������</th>
			</tr>
		</thead>
		
		<tbody>
			<c:set var="i" value="0"/>
			<c:forEach var="puvo" items="${list}">

	
				<tr>
					<td align="center">
						<c:choose>
							<c:when test="${empty puvo.tranCode || fn:contains(puvo.tranCode, '1')}">
								<a href="/purchase/getPurchase?tranNo=${puvo.tranNo}">${puvo.tranNo}</a>
							</c:when>
							<c:otherwise>
							${puvo.tranNo }
							</c:otherwise>
						</c:choose>
					</td>
		
				<td align="center">
					${puvo.purchaseProd.prodName}
			  	
				</td>
				
				<td align="left">${user.userName}  	
				
			  	</td>
		
				<td align="left">${puvo.receiverPhone}</td>
		
				<td align="left">����
						
							<c:if test="${empty puvo.tranCode }">
							
							</c:if>
							<c:if test="${fn:contains(puvo.tranCode, '1') }">
							���ſϷ� 
							</c:if>
							<c:if test="${fn:contains(puvo.tranCode, '2')}">
							�����
							</c:if>
							<c:if test="${fn:contains(puvo.tranCode, '3')}">
							��ۿϷ�
							</c:if>
		
						���� �Դϴ�.</td>
		
						<td align="left">
				
							<c:if test="${fn:contains(puvo.tranCode, '1') }">
							����غ���
							</c:if>
							<c:if test="${fn:contains(puvo.tranCode, '2')}">
							<a href="/purchase/updateTranCode?prodNo=${puvo.purchaseProd.prodNo}&tranCode=3">����Ȯ��</a>	
							</c:if>
							</td>
							<td>
							 <i class="glyphicon glyphicon-search" id= "${puvo.tranNo}">
							</i>
							<input type="hidden" value="${puvo.tranNo}"></input>
							</td>
			</tr>
			
		</c:forEach>
	</tbody>
	
</table>
</div>

		

<!--  ������ Navigator �� -->
	

</div>

		<jsp:include page="../common/pageNavigator_new.jsp"/>

</body>
</html>
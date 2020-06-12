<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html>
<head>
<title>��ǰ ���</title>




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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
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

/* function fncGetUserList(currentPage) {
	document.getElementById("currentPage").value = currentPage;
   	document.detailForm.submit();		
} */
	

	
	function fncGetUserList(currentPage){
		
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit();
	}

	function fncGetProductList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage);
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit();		
	}

	$(function() {
		
		
	 
	 $( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
		fncGetProductList(1);
	});
	
	 
	$("td:nth-child(2)").on("click", function(){
	  	
		
		var prodNo = $(this).prev().text();
		self.location ="/product/getProduct?prodNo="+prodNo+"&menu=${param.menu}"; 
		
		
	});
	 
	$( "td:nth-child(2)" ).css("color" , "#202729");

	
	//==> �Ʒ��� ���� ������ ������ ??
	$("td:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	
	
	$(".tranCodeSet:contains('��ǰ���')").on("click", function(){
		
		var prodNo = $(this).parent().prev().prev().prev().prev().text().trim();
		alert(prodNo);
		self.location ="/purchase/updateTranCode?prodNo="+prodNo+"&tranCode=2";
		
	});

	
	
	
});	

</script>
</head>

<body>

<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->


 
	<div class="container">

				<div class="page-header text-info">	
					<h3>
					<c:choose>
						<c:when test="${param.menu=='search'}">
						��ǰ �����ȸ
						</c:when>
						<c:otherwise>
						��ǰ ����
						</c:otherwise>
					</c:choose>
					</h3>
					<span class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    		</span>
				 </div>
		
		<div class="row">
	    <form class="form-inline" name="detailForm">
		    <div class="col-md-5 text-left" style="width:200px">
			    <select class="form-control" name="sortingCondition" onchange="fncGetProductList('1')">
				 <option value="0"  ${ ! empty search.sortingCondition && search.sortingCondition==0 ? "selected" : "" }>���� ����</option>
				 <option value="1"  ${ ! empty search.sortingCondition && search.sortingCondition==1 ? "selected" : "" }>�ֽŵ�ϼ�</option>
				 <option value="2"  ${ ! empty search.sortingCondition && search.sortingCondition==2 ? "selected" : "" }>���ݳ�����</option>
				 <option value="3"  ${ ! empty search.sortingCondition && search.sortingCondition==3 ? "selected" : "" }>���ݳ�����</option>
				</select>
			</div>
		    
		<div class="col-md-offset-6 text-right">
		
			
			 <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
					</select>
			</div>
			 <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
						<input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 	value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
			 
			</div>

		
		 	<button type="button" class="btn btn-default">�˻�</button>
 			<input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
		</div>
		</form>
	    	
	    	
	    	</div>
			
			
			<table class="table table-hover table-striped" >
		      
		        <thead>
		          <tr>
		            <th align="center">No</th>
		            <th align="left" >��ǰ��</th>
		            <th align="left">����</th>
		            <th align="left">�����</th>
		            <th align="left">�������</th>
		          </tr>
		        </thead>
			
			<tbody>
		
			<c:set var="i" value="0"/>
			<c:forEach var="pvo" items="${list}">
				<c:set var="i" value="${i+1 }"/>
			<tr>
			<td align="center">${pvo.prodNo}
			 <input id="prodNo" value="${pvo.prodNo}" type="hidden"/> 
			</td>
			<c:if test="${empty pvo.proTranCode }">
				<td id="onSale" align="center">
					<c:if test="${!empty pvo.fileName}">
				<p align="center"><img src="../images/uploadFiles/${pvo.fileName}" style="width:200" class="img-rounded"/></p>
			</c:if>
			<c:if test="${empty pvo.fileName}">
			<img src="/images/uploadFiles/../../images/empty.GIF" style="width:200" class="img-rounded"/>
			</c:if>
						<strong>${pvo.prodName}</strong>
						</td>
			</c:if>
			<c:if test="${!empty pvo.proTranCode }">
						<td id="soldOut" align="center">
						<c:if test="${!empty pvo.fileName}">
				<p align="center"><img src="../images/uploadFiles/${pvo.fileName}" style="width:200" class="img-rounded"/></p>
			</c:if>
			<c:if test="${empty pvo.fileName}">
			<img src="/images/uploadFiles/../../images/empty.GIF" style="width:200" class="img-rounded"/>
			</c:if>
						<strong>${pvo.prodName}</strong>
						</td>
			</c:if>
					 <td align="left">${pvo.price}</td>
					  <td align="left">${pvo.regDate}</td>
				  
					  <td align="left">
			<c:if test="${param.menu=='search'}">
						<c:choose>
							<c:when test="${empty pvo.proTranCode}">
								�Ǹ���
							</c:when>
							<c:otherwise>
								������
							</c:otherwise>
						</c:choose>
			</c:if>
				
			<c:if test="${param.menu=='manage'}">
						<c:if test="${empty pvo.proTranCode }">
						�Ǹ���
						</c:if>
						<c:if test="${!empty pvo.proTranCode }">
	
							<c:if test="${fn:contains(pvo.proTranCode, '1') }">
							���ſϷ�  &nbsp; <a class="tranCodeSet">��ǰ���</a>
							</c:if>
							<c:if test="${fn:contains(pvo.proTranCode, '2')}">
							�����
							</c:if>
							<c:if test="${fn:contains(pvo.proTranCode, '3')}">
							��ۿϷ�
							</c:if>

						</c:if>
					</c:if>
					  </td>
					</tr>
		          </c:forEach>
				
				</tbody>
			</table>
			</div>
		
		<jsp:include page="../common/pageNavigator_new.jsp"/>



</body>
</html>
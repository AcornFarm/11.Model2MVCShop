<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>

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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
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
/* 
function fncAddPurchase() {
	document.addPurchase.submit();
}
 */
function fncAddPurchase(){
	//Form ��ȿ�� ����
 	//var name = document.detailForm.prodName.value;
	var receiverName = $("input[name='receiverName']").val();
	//var detail = document.detailForm.prodDetail.value;
	var receiverPhone = $("input[name='receiverPhone']").val();
	//var manuDate = document.detailForm.manuDate.value;
	var divyAddr = $("input[name='divyAddr']").val();

	if(receiverName == null || receiverName.length<1){
		alert("������ �̸��� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(receiverPhone == null || receiverPhone.length<1){
		alert("����ó�� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(divyAddr == null || divyAddr.length<1){
		alert("��۹��� �ּҴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}

	$(".form-horizontal").attr("method", "post").attr("action", "/purchase/addPurchase").submit();
	//document.detailForm.action='product/updateProduct';
	//document.detailForm.submit();
}

$(function(){
	

	 $( "button:contains('����')" ).on("click" , function() {
			
			fncAddPurchase();
		});
	 
	 $( "button:contains('����')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('���')" ).html() );
			history.go(-1);
		});
	 
	 $("#calendar").on("click", function(){
			
		 show_calendar('document.detailForm.divyDate', document.detailForm.divyDate.value);
		 
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

<body>

<jsp:include page="/layout/toolbar.jsp" />


	<div class="container">
		<div class="row">
		<div class="page-header">
	       <h3 class=" text-info">���������Է�</h3>
	    </div>
	    
	    <div class="col-md-4">
		 <div class="well well-lg">
			<c:if test="${!empty pvo.fileName}">
				<p align="center"><img src="../images/uploadFiles/${pvo.fileName}" style="width:250" class="img-rounded"/></p>
			</c:if>
			<c:if test="${empty pvo.fileName}">
			<img src="/images/uploadFiles/../../images/empty.GIF" style="width:300" class="img-rounded"/>
			</c:if>
		 </div>
		 <div class="row" style="height: 10px">
	  		<div class="col-xs-6 col-md-4"><small><strong>��ǰ��ȣ</strong></small></div>
			<div class="col-xs-8 col-md-8"><small>${pvo.prodNo}</small></div>
		</div>

		<hr/>
		<div class="row" style="height: 10px">
	  		<div class="col-xs-6 col-md-4"><small><strong>��ǰ��</strong></small></div>
			<div class="col-xs-8 col-md-8"><small>${pvo.prodName}</small></div>
		</div>	
		<hr/>
		
		<div class="row" style="height: 10px">
	  		<div class="col-xs-6 col-md-4"><small><strong>��ǰ������</strong></small></div>
			<div class="col-xs-8 col-md-8"><small>${pvo.prodDetail}</small></div>
		</div>	
		<hr/>
		
		<div class="row" style="height: 10px">
	  		<div class="col-xs-6 col-md-4"><small><strong>��������</strong></small></div>
			<div class="col-xs-8 col-md-8"><small>${pvo.manuDate}</small></div>
		</div>	
		<hr/>
		
		<div class="row" style="height: 10px">
	  		<div class="col-xs-6 col-md-4"><small><strong>����</strong></small></div>
			<div class="col-xs-8 col-md-8"><small>${pvo.price}</small></div>
		</div>	
		<hr/>
		</div>
		
		
		<div class="col-md-8 col-xs-12">
		
		
	 <form class="form-horizontal" name="detailForm">

			
		  <div class="form-group" >
		    <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label"> ������ ���̵� 
		    <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		    </label>
		    <div class="col-sm-4">
			 <input type="text" class="form-control" readonly name="buyerId" value="${user.userId}">
			 <input type="hidden" name="prodNo" value="${pvo.prodNo}" />
			</div>
		  </div>
	
		
		 <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���� ���
		    <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		    </label>
		    <div class="col-sm-4">
			      <div class="custom-control custom-radio">
						<input type="radio" name="paymentOption" id="jb-radio-1" value="1" class="custom-control-input">
						<label class="custom-control-label" for="jb-radio-1">���ݱ���</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" name="paymentOption" id="jb-radio-2" value="2" class="custom-control-input">
						<label class="custom-control-label" for="jb-radio-2">�ſ뱸��</label>
					</div>
			</div>
		  </div>
		  
		  <div class="form-group" >
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label"> ������ �̸� 
		    <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		    </label>
		    <div class="col-sm-4">
			 <input type="text" class="form-control" name="receiverName" value="${user.userName}">
			</div>
		  </div>
		  
		   <div class="form-group" >
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label"> ������ ����ó 
		    <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		    </label>
		    <div class="col-sm-4">
			 <input type="text" class="form-control" name="receiverPhone" value="${user.phone }">
			</div>
		  </div>
		  
		  <div class="form-group" >
		    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label"> ������ �ּ�
		    <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		    </label>
		    <div class="col-sm-4">
			 <input type="text" class="form-control" name="divyAddr">
			 <span class="glyphicon glyphicon-search" >�ּ�ã��</span>
			</div>
		  </div>
		  
		  <div class="form-group" >
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label"> ��ۿ�û����		 
		    </label>
		    <div class="col-sm-4">
			 <input type="text" class="form-control" name="divyRequest">
			</div>
		  </div>
		  
		  <div class="form-group" >
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label"> ��������
		    </label>
		    <div class="col-sm-4">
			 <input type="date" class="form-control" name="divyDate">
			</div>
		  </div>
		  
		  
		
		 <div class="form-group" >
		 <div class="col-md-6 text-right" style="float:right ">				
			<button class="btn btn-default">����</button>
			<button class="btn btn-default">����</button>
		</div>
		</div>	
		</form>
	
		</div>
		
	 </div>
	 
	</div>

</body>
</html>
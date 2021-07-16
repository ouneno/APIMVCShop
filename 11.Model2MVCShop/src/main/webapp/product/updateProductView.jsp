<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	
	<!--  ///////////////////////// Bootstrap, css ////////////////////////// -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// calendar.js ////////////////////////// -->
	<script type="text/javascript" src="../javascript/calendar.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	// ������ Form ��ȿ�� �˻� /////////////////////////////////////////////////////////
	function fncAddProduct(){

	 	var name = document.detailForm.prodName.value;
		var detail = document.detailForm.prodDetail.value;
		var manuDate = document.detailForm.manuDate.value;
		var price = document.detailForm.price.value;
	
		if(name == null || name.length<1){
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(detail == null || detail.length<1){
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if(price == null || price.length<1){
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		
		$("form").attr("method" , "GET").attr("action" , "/product/updateProduct?prodNo=${product.prodNo}").submit();
		
	}
	
	// "����" �� "���" �� Event /////////////////////////////////////////////////////////
	$(function() {
		
		// "����" Click event
		 $( "button.btn.btn-primary" ).on("click" , function() {
			self.location = "/product/updateProduct?prodNo=${product.prodNo}"
		});
		
		// "���" Click event
		$("a[href='#']").on("click" , function() {
			self.location = "/product/listProduct?menu=manage"
		});	
		 
	});
	
	</script>
</head>

<body>
<!-- // ToolBar Start ///////////////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">11.Model2MVCShop</a>
   		</div>
   	</div>
<!-- // ToolBar End /////////////////////////////////////////////////-->

<!-- // ȭ�鱸�� div ////////////////////////////////////////////////// -->
	<div class="container">
	
		<h1 class="bg-primary text-center">�� ǰ �� ��</h1>
		
		<div class="page-header text-center">
	       <h5 class="text-muted">��ǰ������ ���ϽŴٸ� �Է� ��
	       <strong class="text-danger">����</strong>�� �����ֽð�, ��ǰ���� ������� ���ư��� ���
	       <strong class="text-danger">���</strong>�� �����ּ���</h5>
	    </div>	

<!-- // form Start ////////////////////////////////////////////////// -->
	<form class="form-horizontal" name=updateProductView>

<!-- // ��ǰ���Է� /////////////////////////////////////////////////////-->
	<div class="form-group">
		<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�� ǰ ��</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}">
		</div>
	</div>

<!-- // ��ǰ������ /////////////////////////////////////////////////////-->
 	<div class="form-group">
		<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail}">
		</div>
	</div>

<!-- // �������� /////////////////////////////////////////////////////-->
 	<div class="form-group">
		<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��������</label>
			<img src="../images/ct_icon_date.gif" width="15" height="15" 
			onclick="show_calendar('document.updateProductView.manuDate', document.updateProductView.manuDate.value)"/>
		<div class="col-sm-4">
			<input type="text" class="form-control" id="manuDate" name="manuDate" value="${product.manuDate}">
		</div>
	</div>
	
<!-- // ���� /////////////////////////////////////////////////////-->
  	<div class="form-group">
		<label for="price" class="col-sm-offset-1 col-sm-3 control-label">�� ��</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" id="price" name="price" value="${product.price}">
		</div>
	</div>
 	
<!-- // ��ǰ�̹��� /////////////////////////////////////////////////////-->
  	<div class="form-group">
		<label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">�� ��</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" id="fileName" name="fileName" value="${product.fileName}">
		</div>
	</div>
 	
<!-- // ����, ��� ��ư ///////////////////////////////////////////////--> 		  
	  <div class="form-group">
	    <div class="col-sm-offset-4  col-sm-4 text-center">
	      <button type="button" class="btn btn-primary">��&nbsp;��</button>
		  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
	    </div>
	  </div>
	</form> 
	
	
	</div>

</body>
</html>
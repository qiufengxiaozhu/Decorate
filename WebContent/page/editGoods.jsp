<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    
	<title>编辑商品</title>
	
</head>
 <body>
 
  	<!-- 头部导航栏 -->
 	<%@include file="top.jsp" %>
 	
 	
    <!-- 正文部分 -->
    
    <!--  提示部分 -->
	<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=all" class="btn" style="background-color: #EEF395;">
		<img src="${pageContext.request.contextPath}/images/back.png" style="width:20px;height:20px;"/> 返回
	</a>
    <span>
		<img src="${pageContext.request.contextPath}/images/mushroom.png" />
	</span>
	<label style="color:red;">请谨慎完成此操作！</label>	 
	
    <!-- 表单部分 -->
    <div class="panel panel-info">
	  <!-- Default panel contents -->
	  <div class="panel-heading">装饰品表单</div>
	</div>
	
	 <!-- Form -->
	<form id="formid" action="${pageContext.request.contextPath}/EditGoodsServlet?flag=edit&id=${Decorate.id}" enctype="multipart/form-data" 
		method="post" onsubmit="return check()" >
		
		<div class="form-group col-md-12">
			<label class="col-sm-2 control-label" style="text-align: right; font-size: 20px;">
				图&nbsp;&nbsp;&nbsp;片&nbsp;<span style="color:red;">*</span>：
			</label> 										
			<div class="col-sm-10 form-group has-feedback" id="div-photo" style="width:50%;">	
				
				<div class="media">
				  <div class="media-left">
				    <img alt="" src="${fn:substring(Decorate.photo, 40, -1)}" style="max-width:200px;max-height:120px;">
				  </div>
				  <div class="media-body">
				    <input type="button" class="btn btn-info" id="edit-photo" value="更换图片" style="float:left;margin-right:10px;">					  
					<input type="button" class="btn btn-danger" id="cancel-photo" value="取消" style="float:left;display:none">		
					<br><br><br>			  
					<input type="file" name="photo" id="photo" class="form-control" style="display:none;"/>
					<span class="glyphicon glyphicon-remove form-control-feedback" style="width:13%; display:none;margin-top:60px;"></span>
					<label id="label-photo-1" class="control-label" style="display: none;">图片不能为空</label>
					<label id="label-photo-2" class="control-label" style="display: none;">上传格式不正确，只能是图片格式</label>	
				</div>
			  </div>	
			</div>
		</div>
		
		<div class="form-group col-md-12">
			<label class="col-sm-2 control-label" style="text-align: right; font-size: 20px;">
				名&nbsp;&nbsp;&nbsp;称&nbsp;<span style="color:red;">*</span>：
			</label> 										
			<div class="col-sm-10 form-group has-feedback" id="div-name" style="width:30%;">						  
				<input type="text" name="name" id="name" class="form-control" value="${Decorate.name }"/>
				<span class="glyphicon glyphicon-remove form-control-feedback"  style=" width:20%; display:none;"></span>
				<label id="label-name-1" class="control-label" style="display: none;">名称不能为空</label>
				<label id="label-name-2" class="control-label" style="display: none;">输入的格式不正确，字数限制在20个字符内</label>						
			</div>
		</div>
		
		<div class="form-group col-md-12">
			<label class="col-sm-2 control-label" style="text-align: right; font-size: 20px;">
				描&nbsp;&nbsp;&nbsp;述&nbsp;<span style="color:red;">*</span>：
			</label> 										
			<div class="col-sm-10 form-group has-feedback" id="div-descript" style="width:30%;">						  
				<%-- <input type="text" name="descript" id="descript" class="form-control" value="${Decorate.descript }"/> --%>
				<textarea rows="4" name="descript" id="descript" class="form-control" style="border-radius:3px;">${Decorate.descript }
	            </textarea>
				<label id="label-descript-1" class="control-label" style="display: none;">描述不能为空</label>
				<label id="label-descript-2" class="control-label" style="display: none;">输入的格式不正确，字数限制在50字符内</label>						
			</div>
		</div>
		
		<div class="form-group col-md-12">
			<label class="col-sm-2 control-label" style="text-align: right; font-size: 20px;">
				材&nbsp;&nbsp;&nbsp;料&nbsp;<span style="color:red;">*</span>：
			</label> 										
			<div class="col-sm-10 form-group has-feedback" id="div-category" style="width:30%;">						  
				<select id="category" name="category" class="form-control">					
					<c:forEach items="${CategoryList}" var="category">	
						<c:if test="${Decorate.categoryId == category.id }">
							<option value="${category.id}" selected>${category.category}</option>	
						</c:if>
						<c:if test="${Decorate.categoryId != category.id }">
							<option value="${category.id}" >${category.category}</option>	
						</c:if>			
					</c:forEach>
				</select>						
			</div>
		</div>
		
		<div class="form-group col-md-12">
			<label class="col-sm-2 control-label" style="text-align: right; font-size: 20px;">
				风&nbsp;&nbsp;&nbsp;格&nbsp;<span style="color:red;">*</span>：
			</label> 										
			<div class="col-sm-10 form-group has-feedback" id="div-style" style="width:30%;">						  
				<select id="style" name="style" class="form-control">	
					<c:if test="${Decorate.style != '' }">								
						<option value="${Decorate.style}" selected>${Decorate.style}</option>	
					</c:if>								
					<option value="现代简约风格" >现代简约风格</option>									
					<option value="田园风格" >田园风格</option>									
					<option value="中式风格" >中式风格</option>									
				</select>						
			</div>
		</div>
				
		<div class="form-group col-md-12">
			<label class="col-sm-2 control-label" style="text-align: right; font-size: 20px;">
				单&nbsp;&nbsp;&nbsp;价&nbsp;<span style="color:red;">*</span>：
			</label> 										
			<div class="col-sm-10 form-group has-feedback" id="div-price" style="width:30%;">						  
				<input type="text" name="price" id="price" class="form-control" value="${Decorate.price }"/>
				<span class="glyphicon glyphicon-remove form-control-feedback"  style=" width:20%; display:none;"></span>
				<label id="label-price-1" class="control-label" style="display: none;">销售价格不能为空，小数点后默认保留两位有效数字</label>
				<label id="label-price-2" class="control-label" style="display: none;">输入的格式不正确，只能输入数字，小数点后默认保留两位</label>						
			</div>
		</div>
		
		<div class="form-group col-md-12">
			<label class="col-sm-2 control-label" style="text-align: right; font-size: 20px;">
				库&nbsp;&nbsp;&nbsp;存&nbsp;<span style="color:red;">*</span>：
			</label> 										
			<div class="col-sm-10 form-group has-feedback" id="div-number" style="width:30%;">						  
				<input type="text" name="number" id="number" class="form-control" value="${Decorate.number }"/>
				<span class="glyphicon glyphicon-remove form-control-feedback"  style=" width:20%; display:none;"></span>
				<label id="label-number-1" class="control-label" style="display: none;">库存数量不能为空</label>
				<label id="label-number-2" class="control-label" style="display: none;">输入的格式不正确，只能输入自然数</label>						
			</div>
		</div>
		
		<div class="form-group col-md-12">
			<div class="col-md-2"></div>
			<input type="button" class="col-md-1 btn btn-info" id="save-1" value="提交">
			<div class="col-md-1"></div>
			<input type="button" class="col-md-1 btn btn-danger" id="cancel-1"value="撤销">
		</div>
				
	</form>
	
	<!-- 模态框，让用户确认操作 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">正在上传商品信息&hellip;</h4>
	      </div>
	      <div class="modal-body" style="height:200px;">
	      			
	      	<h3>您确定要提交此份表单吗？</h3><br>
	      	<div class="progress">
			 <div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" style="width: 60%">
			    <span class="sr-only">60% Complete</span>
			  </div>
			</div>
	      	<div style="color:#36AE23;">您可以点击<i style="color:blue"> 确认提交 </i>按钮完成操作。</div><br>
	      	<div style="color:#CB339B;">或者觉得有信息需要再进行确认，请点击<i style="color:#D94D2D;"> 返回核对 </i>！</div>
	     	
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">返回核对</button>
	        <button type="button" class="btn btn-primary"  id="save-2" onclick="onSubmit()">确认提交</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

    
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>

	<script type="text/javascript">
		$(document).ready(function() {
	
			//点击更换图片
			$("#edit-photo").click(function(){
				
				$("#cancel-photo,#photo").css("display","block");
			});
			
			//撤销更换图片
			$("#cancel-photo").click(function(){
				
				$("#photo").val("");
				$("#photo").next().css("display","none");
				$("#div-photo").removeClass("has-error");	
				$("#cancel-photo,#photo,#label-photo-1,#label-photo-2").css("display","none");				
			});
			
			
			//点击提交
			$("#save-1").click(function(){
				
				//初始化
				flag = true;
				$("#div-photo, #div-name, #div-descript, #div-price, #div-number").removeClass("has-error");	
				$("#photo, #name, #price, #number").next().css("display","none");
				$("#photo, #name, #descript, #price, #number").next().next().css("display","none");
				$("#photo, #name, #descript, #price, #number").next().next().next().css("display","none");
				
				//获取上传文件的后缀名[bmp,jpg,png,tif,gif,pcx,tga,exif,fpx,svg,psd,cdr,pcd,dxf,ufo,eps,ai,raw,WMF,webp]
				var path = $("#photo").val();		
				var suffixName = path.substr(path.lastIndexOf("."));
				if(suffixName != ""){
					var arr = new Array(".bmp",".jpg",".png",".tif",".gif",".svg",".psd",".WMF",".webp");
					for(var i = 0; i < arr.length; i++){
						if(arr[i].toLowerCase() == suffixName.toLowerCase()){
							//alert("格式正确");
							$("#label-photo-1").css("display","none");
							flag = true;
							break;
						}
						flag = false;	
					} 
					//如果匹配失败
					if(!flag){
						//alert("格式错误");
						$("#div-photo").addClass("has-error");	
						$("#photo").next().css("display","block");
						$("#label-photo-2").css("display","block");
					}
				}
				
				//名称的表单验证
				if($("#name").val()==''){
					
					//alert("空");
					$("#div-name").addClass("has-error");	
					$("#name").next().css("display","block");
					$("#label-name-1").css("display","block");
					flag = false;
				}
				else{
					//判断名称不超过20个字符
					var reg1 = new RegExp(/^([A-Za-z0-9\u4e00-\u9fa5\w\W]{1,20})$/);
					//alert("格式错误");
					if(!reg1.test($("#name").val())){
						$("#div-name").addClass("has-error");	
						$("#name").next().css("display","block");
						$("#label-name-2").css("display","block");
						flag = false;
					}					
				}
				
				//描述的表单验证
				if($("#descript").val()==''){
					
					//alert("空");
					$("#div-descript").addClass("has-error");	
					$("#label-descript-1").css("display","block");
					flag = false;
				}
				else{
					//判断描述不超过50个字符
					var reg1 = new RegExp(/^([A-Za-z0-9\u4e00-\u9fa5\w\W]{1,50})$/);
					//alert("格式错误");
					if(!reg1.test($("#descript").val().trim())){
						$("#div-descript").addClass("has-error");	
						$("#label-descript-2").css("display","block");
						flag = false;
					}					
				}
				
				//单价的表单验证
				if($("#price").val()==''){
					
					//alert("空");
					$("#div-price").addClass("has-error");	
					$("#price").next().css("display","block");
					$("#label-price-1").css("display","block");
					flag = false;
				}
				else{
					//判断价格只能使数字
					var reg1 = new RegExp(/^([0-9]+)\.([0-9]{1,2})$/);
					//alert("格式错误");
					if(!reg1.test($("#price").val())){
						$("#div-price").addClass("has-error");	
						$("#price").next().css("display","block");
						$("#label-price-2").css("display","block");
						flag = false;
					}					
				}
				
				//库存的表单验证
				if($("#number").val()==''){
					
					//alert("空");
					$("#div-number").addClass("has-error");	
					$("#number").next().css("display","block");
					$("#label-number-1").css("display","block");
					flag = false;
				}
				else{
					//判断库存只能使数字
					var reg1 = new RegExp(/^([0-9]{1,10})$/);
					//alert("格式错误");
					if(!reg1.test($("#number").val())){
						$("#div-number").addClass("has-error");	
						$("#number").next().css("display","block");
						$("#label-number-2").css("display","block");
						flag = false;
					}					
				}
				
				//alert("成功通过验证！");
				if(flag == true){
			    	
			    	$('#myModal').modal("show");
			    }
				
				
			});

		});
		
		//确认提交
		function onSubmit(){
	
	    	document.getElementById("formid").submit();
		}
		
		//表单验证通过返回true
		function check(){
			//alert(flag);
			return flag;
		};
	</script>

</body>
</html>
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
    <!-- 下面的是五星好评用到的 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/star-rating.min.css">
	<title>添加评论</title>
	
</head>
 <body>
 
 	<!-- 头部导航栏 两种方式均可-->
	<%@include file="top.jsp" %>   <!-- 先包含，后编译 -->
	
	<!-- 正文内容 -->
	
	<!--  提示部分 -->
	<a onclick="javascript :history.back(-1);" class="btn" style="background-color: #ABF559;">
		<img src="${pageContext.request.contextPath}/images/back.png" style="width:20px;height:20px;"/> 返回
	</a>	 
	
    <!-- 表单部分 -->
    <div class="panel panel-info">
	  <!-- Default panel contents -->
	  <div class="panel-heading">装饰品表单</div>
	</div>
	
		
	<div class="container-fluid">
	  <div class="row-fluid">
	    <div class="col-md-6" style="padding-top:10px;width:40%;height:470px;border:solid #ccc;border-width: 0 1px 0 0;">
	      <!--Sidebar content-->
	      
			<div class="form-group col-md-12">
				<label class="col-sm-3 control-label" style="text-align: right; font-size: 20px;">
					图&nbsp;&nbsp;&nbsp;片&nbsp;：
				</label> 										
				<div class="col-sm-9 form-group has-feedback" id="div-photo" style="width:66%;">						  
					<img alt="" src="${fn:substring(Decorate.photo, 40, -1)}" style="max-width:200px;max-height:120px;">					
				</div>
			</div>
			
			<div class="form-group col-md-12">
				<label class="col-sm-3 control-label" style="text-align: left; font-size: 20px;">
					名&nbsp;&nbsp;&nbsp;称&nbsp;：
				</label> 										
				<div class="col-sm-9 form-group has-feedback" id="div-name" style="width:66%;">						  
					<input type="text" name="name" id="name" class="form-control" value="${Decorate.name }" readonly="readonly"/>						
				</div>
			</div>
			
			<div class="form-group col-md-12">
				<label class="col-sm-3 control-label" style="text-align: left; font-size: 20px;">
					描&nbsp;&nbsp;&nbsp;述&nbsp;：
				</label> 										
				<div class="col-sm-9 form-group has-feedback" id="div-descript" style="width:66%;">						  
					<!-- <input type="text" name="descript" id="descript" class="form-control" /> -->
					<textarea rows="4" name="descript" id="descript" class="form-control" style="border-radius:3px;" readonly="readonly">                   
${Decorate.descript }
		            </textarea>						
				</div>
			</div>
			
			<div class="form-group col-md-12">
				<label class="col-sm-3 control-label" style="text-align: left; font-size: 20px;">
					材&nbsp;&nbsp;&nbsp;料&nbsp;：
				</label> 										
				<div class="col-sm-9 form-group has-feedback" id="div-category" style="width:66%;">	
					<input type="text" name="category" id="category" class="form-control" value="${Decorate.category }" readonly="readonly"/>					  						
				</div>
			</div>
			
			<div class="form-group col-md-12">
				<label class="col-sm-3 control-label" style="text-align: left; font-size: 20px;">
					风&nbsp;&nbsp;&nbsp;格&nbsp;：
				</label> 										
				<div class="col-sm-9 form-group has-feedback" id="div-style" style="width:66%;">
					<input type="text" name="style" id="style" class="form-control" value="${Decorate.style }" readonly="readonly"/>									  						
				</div>
			</div>
			
		</div>
		
	    <div class="col-md-6" style="padding-top:30px;width:50%;height:470px;">
	      <!--Body content-->
	      
      	    <span>
				<img src="${pageContext.request.contextPath}/images/addComment.png" />
			</span>
			<label style="color:#29C2E7;">欢迎您进行评论及打分٩(๑>◡<๑)۶ </label>
	      	<hr>
	      	
	      	<!-- Form -->
			<form id="formid" action="${pageContext.request.contextPath}/CommentServlet?flag=add&id=${Decorate.id}" method="post">
		      	
		      	<div class="form-group col-md-12">
					<label class="col-sm-3 control-label" style="text-align: left; font-size: 20px;">
						评&nbsp;&nbsp;&nbsp;价&nbsp;<span style="color:red;">*</span>：
					</label> 										
					<div class="col-sm-9 form-group has-feedback" id="div-comment" style="width:66%;">						  

						<textarea rows="5" name="comment" id="comment" class="form-control" style="border-radius:3px;">                   
	
			            </textarea>
						<label id="label-comment-1" class="control-label" style="display: none;">描述不能为空</label>
						<label id="label-comment-2" class="control-label" style="display: none;">输入的格式不正确，字数限制在200字符内</label>						
					</div>
				</div>
		      
		      	<div class="form-group col-md-12">
					<label class="col-sm-3 control-label" style="text-align: left; font-size: 18px;">
						产品描述<span style="color:red;">*</span>：
					</label> 										
					<div class="col-sm-9 form-group has-feedback" id="comment-descript" style="width:66%;">	
						<input id="comment-descript" name="comment-descript" value="5" type="text" class="rating" 
				        	data-min=0 data-max=5 data-step=0.5 data-size="sm" title="" />
					</div>
				</div>
				
				<div class="form-group col-md-12">
					<label class="col-sm-3 control-label" style="text-align: left; font-size: 18px;">
						产品质量<span style="color:red;">*</span>：
					</label> 										
					<div class="col-sm-9 form-group has-feedback" id="comment-quality" style="width:66%;">
						<input id="comment-quality" name="comment-quality" value="5" type="text" class="rating" 
			        		data-min=0 data-max=5 data-step=0.5 data-size="sm" title="" />
					</div>
				</div>
				
				<div class="form-group col-md-12" style="margin-top:10px;">
					<div class="col-md-4"></div>
					<input type="button" class="col-md-2 btn btn-info" id="save" value="提交">
					<div class="col-md-2"></div>
					<input type="button" class="col-md-2 btn btn-danger" id="cancel"value="撤销">
				</div>
			
			</form>
			
	      </div>	      
	  </div>
	</div>
				
	<!-- 提示用户提交评论 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" style="color:#5CB6E6;">
	        	<img alt="" src="${pageContext.request.contextPath}/images/tip.png" style="margin-top:-3px;"/>
	        	友情提示&hellip;
	        </h4>
	      </div>
	      <div class="modal-body" style="font-size: 15px;">
	      
	      	<img alt="" src="${pageContext.request.contextPath}/images/thanks.png" style="margin-top:0px;"/>
	        <p style="color:#00aaff;">
	        	
	        	感谢您提出的宝贵意见，我们会以更优质的产品及服务让您下次购物更加愉快，Thanks♪(･ω･)ﾉ
	        </p>	       	

	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary"  id="removeSure"  onclick="sure()">确定提交</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/star-rating.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
			//点击撤销按钮
			$("#cancel").click(function(){
				
				flag = true;
				$("#comment").val("");
				$("#div-comment").removeClass("has-error");
				$("#label-comment-1, #label-comment-2").css("display","none");
			});
			
			//点击提交按钮
			$("#save").click(function(){
				

				flag = true;
				$("#div-comment").removeClass("has-error");
				$("#label-comment-1, #label-comment-2").css("display","none");
				
				if($("#comment").val().trim() == ""){
					//评价框不能为空
					
					$("#div-comment").addClass("has-error");
					$("#label-comment-1").css("display","block");
					flag = false;
				}
				else{
					
					//判断评论不超过200个字符
					var reg1 = new RegExp(/^([A-Za-z0-9\u4e00-\u9fa5\w\W]{1,200})$/);
					//alert("格式错误");
					if(!reg1.test($("#comment").val().trim())){
						$("#div-comment").addClass("has-error");	
						$("#label-comment-2").css("display","block");
						flag = false;
					}
				}
				
				if(flag){
					
					$('#myModal').modal("show");
				}
			});
		});
		
		//确认提交
		function sure(){
			
			document.getElementById("formid").submit();
		}
	</script>
</body>
</html>
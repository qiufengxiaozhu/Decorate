<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    
	<title>用户详情</title>
	
</head>
 <body>
 
  	<!-- 头部导航栏 -->
 	<%@include file="top.jsp" %>
 	
    <!-- 正文部分 -->

	<!--  提示部分 -->
	<a onclick="javascript :history.back(-1);" class="btn" style="background-color: #ABF559;">
		<img src="${pageContext.request.contextPath}/images/back.png" style="width:20px;height:20px;"/> 返回
	</a>	
	<hr>
	
	<div class="container-fluid">
	  <div class="row-fluid">
	    <div class="col-md-6" style="padding-top:10px;width:40%;height:470px;border:solid #ccc;border-width: 0 1px 0 0;">
	      <!--Sidebar content-->
	      
			
			<span class="label" style="font-size: 18px;color:black;vertical-align: top;">
	    		<img alt="" src="${pageContext.request.contextPath}/images/goodsPhoto.png" style="margin-top:-10px;"> 用户头像：
	      	</span>
	      	<c:if test="${fn:length(UserDetails.photo) > 40}">
  				<img alt="" src="${fn:substring(UserDetails.photo, 40, -1)}" style="max-width:65%;max-height:40%;">	
  			</c:if>
  			<c:if test="${fn:length(UserDetails.photo) <= 40}">
  				<img alt="" src="${UserDetails.photo}" style="max-width:65%;max-height:40%;">	
  			</c:if>
  			
  			<hr>
  			
  			<div class="alert alert-warning " style=" width:50%;margin-bottom:3%; cursor:pointer; ">
				会员等级：${UserDetails.member }
			</div>
			
			<div class="alert alert-danger " style=" width:50%;margin-bottom:3%; cursor:pointer; ">
				总消费：${UserDetails.total } 元
			</div>
	      	
	      	
	    </div>
		
	    <div class="col-md-6" style="padding-top:30px;width:50%;height:470px;">
	      <!--Body content-->
	      
			<div class="form-group col-md-12">
				<label class="col-sm-3 control-label" style="text-align: right; font-size: 20px;">
					账&nbsp;&nbsp;&nbsp;号&nbsp;：
				</label> 										
				<div class="col-sm-9 form-group has-feedback" id="div-name" style="width:50%;">						  
					<input type="text" name="name" id="name" class="form-control" value="${UserDetails.account }" readonly="readonly"/>						
				</div>
			</div>
			
			<div class="form-group col-md-12">
				<label class="col-sm-3 control-label" style="text-align: right; font-size: 20px;">
					姓&nbsp;&nbsp;&nbsp;名&nbsp;：
				</label> 										
				<div class="col-sm-9 form-group has-feedback" id="div-name" style="width:50%;">						  
					<input type="text" name="name" id="name" class="form-control" value="${UserDetails.name }" readonly="readonly"/>						
				</div>
			</div>
			
			<div class="form-group col-md-12" >
				<label for="" class="col-sm-3 control-label" style="text-align: right; font-size: 20px; ">
					性&nbsp;&nbsp;&nbsp;别&nbsp;：
				</label> 
				<div class="col-sm-9 form-group  has-feedback" id="div-sex">	
					<c:if test="${UserDetails.sex == '男' }">						
				  		<img src="${pageContext.request.contextPath}/images/Male.gif" > 
				  		<label for="sex_radio_1" id="label-sex"> 男 </label>
					</c:if>			  							  	
				  	<c:if test="${UserDetails.sex == '女' }">						
						<img src="${pageContext.request.contextPath}/images/Female.gif"> 
						<label for="sex_radio_2" id="label-sex"> 女 </label>
					</c:if>				  							  	
				</div>
			</div>
			
			<div class="form-group col-md-12">
				<label class="col-sm-3 control-label" style="text-align: right; font-size: 20px;">
					邮&nbsp;&nbsp;&nbsp;箱&nbsp;：
				</label> 										
				<div class="col-sm-9 form-group has-feedback" id="div-name" style="width:50%;">						  
					<input type="text" name="name" id="name" class="form-control" value="${UserDetails.mail }" readonly="readonly"/>						
				</div>
			</div>
			
			<div class="form-group col-md-12">
				<label class="col-sm-3 control-label" style="text-align: right; font-size: 20px;">
					注册时间：
				</label> 										
				<div class="col-sm-9 form-group has-feedback" id="div-name" style="width:50%;">						  
					<input type="text" class="form-control" value="${fn:substringBefore(UserDetails.createTime , '.')}" readonly="readonly"/>						
				</div>
			</div>
			
			<div class="form-group col-md-12">
				<label class="col-sm-3 control-label" style="text-align: right; font-size: 20px;">
					用户权限：
				</label> 										
				<div class="col-sm-9 form-group has-feedback" id="div-name" style="width:50%;">						  
					<input type="text" name="name" id="name" class="form-control" value="${UserDetails.role }" readonly="readonly"/>						
				</div>
			</div>
	      
	    </div>
	  </div>
	</div>


    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>

	<script type="text/javascript">
		$(document).ready(function() {
	

		});
	</script>
</body>
</html>
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
    
	<title>商品详情</title>
	
</head>
 <body>
 
 	<!-- 头部导航栏 两种方式均可-->
	<%@include file="top.jsp" %>   <!-- 先包含，后编译 -->
	
	<!-- 正文内容 -->
	
	<div class="container-fluid">
	  <div class="row-fluid">
	    <div class="col-md-4" style="padding-top:50px;width:40%;height:550px;border:solid #ccc;border-width: 0 1px 0 0;">
	      <!--Sidebar content-->
	      
          	<span class="label" style="font-size: 18px;color:black;vertical-align: top;">
	    		<img alt="" src="${pageContext.request.contextPath}/images/goodsPhoto.png" style="margin-top:-10px;">  商品图片：
	      	</span>
		
		  	<img alt="" src="${fn:substring(Decorate.photo, 40, -1)}" style="max-width:65%;max-height:40%;">
	      
	      	<hr>
	      	
	      	<!-- 用户评论： -->
	      	<span class="label" style="font-size: 18px;color:black;vertical-align: bottom;">
	    		<img alt="" src="${pageContext.request.contextPath}/images/userComment.png">  用户评论：
	    		<span class="label btn-success" id="more" style="float:right;cursor:pointer;font-size: 13px;margin-top:10px;"> 更多 » </span>
	      	</span>
	      	
	      	<div class="panel-group" id="accordion" role="tablist" >
	      	
	      	  <c:forEach items="${CommentList }" var="list" varStatus="id">
	      	  
				  <div class="panel panel-info">
				    <div class="panel-heading" role="tab" id="headingOne">
				      <h4 class="panel-title">
				        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#${id.index }" >
				          	<span class="badge badge-info">${id.index + 1}</span> 
				          	✧ 用户：<i style="color:#3AA427;">${list.account }</i> &nbsp;&nbsp;
				          	✧评分：<i style="color:red;">${list.descript + list.quality }</i> 分 				          	
				        </a>
				      </h4>
				    </div>
				    <c:if test="${id.index == 0}">
					    <div id="${id.index }" class="panel-collapse collapse in" role="tabpanel" >
					      <div class="panel-body">
								评论内容：<span style="color:#32C8C0">${list.comment }</span><br/>
								评论时间：<span style="color:#F041F2">${fn:substringBefore(list.publicTime , ".")}</span>		      
						  </div>
					    </div>
				    </c:if>
				    <c:if test="${id.index != 0}">
					    <div id="${id.index }" class="panel-collapse collapse " role="tabpanel" >
					      <div class="panel-body">
								评论内容：<span style="color:#2D98C0">${list.comment }</span><br/>
								评论时间：<span style="color:#F041F2">${fn:substringBefore(list.publicTime , ".")}</span>				      
						  </div>
					    </div>
				    </c:if>
				  </div>
			  </c:forEach>
			</div>
				      	
	    </div>
	    <div class="col-md-8" style="padding-top:30px;width:58%;height:550px;">
	      <!--Body content-->

		  <!-- Form -->
		  <form id="formid" action=" " enctype="multipart/form-data" method="post" onsubmit="return check()" >
			
			<div class="form-group col-md-12">
				<label class="col-sm-2 control-label" style="text-align: right; font-size: 20px;">
					名&nbsp;&nbsp;&nbsp;称&nbsp;<span style="color:red;">*</span>：
				</label> 										
				<div class="col-sm-10 form-group has-feedback" id="div-name" style="width:50%;">						  
					<input type="text" name="name" id="name" class="form-control" value="${Decorate.name }"/>						
				</div>
			</div>
			
			<div class="form-group col-md-12">
				<label class="col-sm-2 control-label" style="text-align: right; font-size: 20px;">
					描&nbsp;&nbsp;&nbsp;述&nbsp;<span style="color:red;">*</span>：
				</label> 										
				<div class="col-sm-10 form-group has-feedback" id="div-descript" style="width:50%;">						  
					<textarea rows="4" name="descript" id="descript" class="form-control" style="border-radius:3px;">${Decorate.descript }	
		            </textarea>						
				</div>
			</div>
			
			<div class="form-group col-md-12">
				<label class="col-sm-2 control-label" style="text-align: right; font-size: 20px;">
					材&nbsp;&nbsp;&nbsp;料&nbsp;<span style="color:red;">*</span>：
				</label> 										
				<div class="col-sm-10 form-group has-feedback" id="div-category" style="width:50%;">						  
					<input type="text" name="category" id="category" class="form-control" value="${Decorate.category }"/>	
				</div>
			</div>
			
			<div class="form-group col-md-12">
				<label class="col-sm-2 control-label" style="text-align: right; font-size: 20px;">
					风&nbsp;&nbsp;&nbsp;格&nbsp;<span style="color:red;">*</span>：
				</label> 										
				<div class="col-sm-10 form-group has-feedback" id="div-style" style="width:50%;">						  
					<input type="text" name="style" id="style" class="form-control" value="${Decorate.style }"/>						
				</div>
			</div>
					
			<div class="form-group col-md-12">
				<label class="col-sm-2 control-label" style="text-align: right; font-size: 20px;">
					单&nbsp;&nbsp;&nbsp;价&nbsp;<span style="color:red;">*</span>：
				</label> 										
				<div class="col-sm-10 form-group has-feedback" id="div-price" style="width:50%;">						  
					<input type="text" name="price" id="price" class="form-control" value="${Decorate.price } 元"/>				
				</div>
			</div>
			
			<div class="form-group col-md-12">
				<label class="col-sm-2 control-label" style="text-align: right; font-size: 20px;">
					库&nbsp;&nbsp;&nbsp;存&nbsp;<span style="color:red;">*</span>：
				</label> 										
				<div class="col-sm-10 form-group has-feedback" id="div-number" style="width:50%;">						  
					<input type="text" name="number" id="number" class="form-control" value="${Decorate.number } 件"/>						
				</div>
			</div>
			
			<div class="form-group col-md-12">
				<div class="col-md-2"></div>
				<input type="button" class="col-md-2 btn btn-info" id="buy" value="购 买" onclick="buyGoods(${Decorate.id})">
				<div class="col-md-1"></div>
				<input type="button" class="col-md-2 btn btn-danger" id="back" value="返 回" onclick="javascript :history.back(-1);">
			</div>
					
		  </form>
			
	    </div>
	  </div>
	</div>
	
	<%-- 模态框 --%>
	<%@include file="tip.jsp" %>
	
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			
			//点击更多按钮
			$("#more").click(function() {
				
				//跳往该商品所有评论页面
				location.href="${pageContext.request.contextPath}/CommentServlet?flag=all&id=${Decorate.id}";
			});
		});
		
		//详情页面点击购买按钮
		function buyGoods(e){
			
			//判断用户是否登录账号
			if("${User}" == ""){
				
				//跳出模态框，提醒用户应该登录账号
				$('#myModal-1').modal("show");
			}
			else{

				//跳往支付页面
				location.href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=pay&id="+e;
			}
		}
	</script>

</body>
</html>
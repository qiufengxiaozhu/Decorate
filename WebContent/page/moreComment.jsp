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
    
	<title>更多评论</title>
	
</head>
<body>
 
 	<!-- 头部导航栏 两种方式均可-->
	<%@include file="top.jsp" %>   <!-- 先包含，后编译 -->
	
	<!-- 正文内容 -->
	
	<a onclick="javascript :history.back(-1);" class="btn" style="background-color: #CEF089;">
		<img src="${pageContext.request.contextPath}/images/back.png" style="width:20px;height:20px;"/> 
		返回
	</a>
	
	<div class="container-fluid">
	  <div class="row-fluid">
	    <div class="col-md-4" style="padding-top:50px;width:40%;height:250px;border:solid #ccc;border-width: 0 1px 0 0;">
	      <!--Sidebar content-->
	      
          	<span class="label" style="font-size: 18px;color:black;vertical-align: top;">
	    		<img alt="" src="${pageContext.request.contextPath}/images/goodsPhoto.png" style="margin-top:-10px;">  商品图片：
	      	</span>
		
		  	<img alt="" src="${fn:substring(Decorate.photo, 40, -1)}" style="max-width:65%;max-height:200px;">
	      
	      		      		      	
	    </div>
	    <div class="col-md-8" style="padding-top:50px;width:58%;height:200px;">
	      <!--Body content-->

			<span class="label" style="font-size: 18px;color:black;vertical-align: top;">
	    		<img alt="" src="${pageContext.request.contextPath}/images/attribute.png" style="margin-top:-10px;">  商品属性：
	      	</span>
	      	
	      	<br><br>
			<div class="form-group col-md-12">
				<label class="col-sm-4 control-label" style="text-align: right; font-size: 20px;">
					名&nbsp;&nbsp;&nbsp;称&nbsp;<span style="color:red;">*</span>：
				</label> 										
				<div class="col-sm-8 form-group has-feedback" id="div-name" style="width:50%;">						  
					<input type="text" name="name" id="name" class="form-control" value="${Decorate.name }"/>						
				</div>
			</div>
			
			<div class="form-group col-md-12">
				<label class="col-sm-4 control-label" style="text-align: right; font-size: 20px;">
					描&nbsp;&nbsp;&nbsp;述&nbsp;<span style="color:red;">*</span>：
				</label> 										
				<div class="col-sm-8 form-group has-feedback" id="div-descript" style="width:50%;">						  
					<textarea rows="4" name="descript" id="descript" class="form-control" style="border-radius:3px;">${Decorate.descript }                   
	
		            </textarea>						
				</div>
			</div>
			
	    </div>
	  </div>
	</div>
	<hr>
	<div class="panel-group" id="accordion" role="tablist" >
	      	
      <c:forEach items="${PageInfo.list }" var="list" varStatus="id">
    	  
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
		    
		    <div id="" class="panel-collapse collapse in" role="tabpanel" >
		      <div class="panel-body">
					评论内容：<span style="color:#32C8C0">${list.comment }</span><br/>
					评论时间：<span style="color:#F041F2">${fn:substringBefore(list.publicTime , ".")}</span>		      
			  </div>
		    </div>	    
		    
		  </div>
	  </c:forEach>
	  
	</div>
	
	<!-- 分页操作 -->
    <!-- 分页操作 -->
    <!-- 分页操作 -->
    <!-- 分页操作 -->
	<div class="page" style="float:left; ">
		&nbsp;&nbsp;共<i style="color:blue;"> - &gt; ${PageInfo.total} &lt; - </i>页，
		当前显示第 <i style="color:blue;">[ ${PageInfo.pageNumber} ] </i>页，
		每页显示
		<select id="pageSize" name="pageSize" class="">					
			<c:if test="${PageInfo.pageSize != ''}" >					
				<option value="${PageInfo.pageSize}"> 					
					${PageInfo.pageSize}		 
				</option>								
			</c:if>
			<option value="2" > 2 </option>				
			<option value="5" > 5 </option>				
			<option value="7" > 7 </option>				
			<option value="10" > 10 </option>
		</select> 条 
		<input type="button" class="btn btn-default" id="pSize" value="确定" style="height:20px;line-height:5px;">
	</div>

	<nav aria-label="Page navigation" style="float:right;margin-right:1%; margin-top:-20px;">
	  <ul class="pagination">
	  
	  	<!-- 上一页 -->
	  	<!-- 上一页 -->
	  	<!-- 上一页 -->
	  	<c:if test="${PageInfo.pageNumber <= 1 }">
		    <li class="disabled">		      
		        <span>&laquo;</span>		      
		    </li>
	    </c:if>
	    <c:if test="${PageInfo.pageNumber > 1 }">
	    	<li>
			    <a href="${pageContext.request.contextPath}/CommentServlet?flag=all&pageNumber=${PageInfo.pageNumber-1}">
			        <span>&laquo;</span>
			    </a>
		    </li>
	    </c:if>
	    
	    <!-- 指定页数翻页 -->
	    <!-- 指定页数翻页 -->
	    <!-- 指定页数翻页 -->
	    <!-- 当页数大于5页时 -->
	    <c:if test="${PageInfo.total > 5 }">
	    	
    		<!-- 当第一页被选中时 -->
    		<c:if test="${PageInfo.pageNumber == 1}">
	    		<li class="active">
	    			<a onclick="javascript:return false;" > 1 </a>
	    		</li>
	    		<li>
	    			<a href="${pageContext.request.contextPath}/CommentServlet?flag=all&pageNumber=2" > 2 </a>
	    		</li>
	    		<li>
	    			<a href="${pageContext.request.contextPath}/CommentServlet?flag=all&pageNumber=3" > 3 </a>
	    		</li>
	    		<li>
	    			<a onclick="javascript:return false;" > &hellip; </a>
	    		</li>
    		</c:if>
    		<!-- 当第一页未被选中时 -->
    		<c:if test="${PageInfo.pageNumber > 1}">
	    		<li>
	    			<a href="${pageContext.request.contextPath}/CommentServlet?flag=all&pageNumber=1" > 1 </a>
	    		</li>
    		</c:if>
    		
    		<!-- 当选中的既不是第一页也不是最后一页时 -->
    		<!-- 当选中的既不是第一页也不是最后一页时 -->
    		
    		<c:if test="${PageInfo.pageNumber > 1 && PageInfo.pageNumber < PageInfo.total }">
    			<c:if test="${PageInfo.pageNumber-2 > 1}">
	    			<li>
		    			<a onclick="javascript:return false;" > &hellip; </a>
		    		</li>
		    	</c:if>
    			<c:if test="${PageInfo.pageNumber-1 > 1}">
	    			<li>
		    			<a href="${pageContext.request.contextPath}/CommentServlet?flag=all&pageNumber=${PageInfo.pageNumber -1}" > ${PageInfo.pageNumber -1} </a>
		    		</li>
		    	</c:if>
    			<li class="active">
	    			<a onclick="javascript:return false;" > ${PageInfo.pageNumber} </a>
	    		</li>
	    		<c:if test="${PageInfo.pageNumber+1 < PageInfo.total}">
		    		<li>
		    			<a href="${pageContext.request.contextPath}/CommentServlet?flag=all&pageNumber=${PageInfo.pageNumber +1}" > ${PageInfo.pageNumber +1} </a>
		    		</li>
	    		</c:if>
	    		<c:if test="${PageInfo.pageNumber+2 < PageInfo.total}">
	    			<li>
		    			<a onclick="javascript:return false;" > &hellip; </a>
		    		</li>
		    	</c:if>
    		</c:if>
    		
    		
    		<!-- 当最后一页被选中时 -->
    		<c:if test="${PageInfo.pageNumber == PageInfo.total}">
	   			<li>
	    			<a onclick="javascript:return false;" > &hellip; </a>
	    		</li>
    			<li>
	    			<a href="${pageContext.request.contextPath}/CommentServlet?flag=all&pageNumber=${PageInfo.pageNumber -2}" > ${PageInfo.pageNumber -2} </a>
	    		</li>
	    		<li>
	    			<a href="${pageContext.request.contextPath}/CommentServlet?flag=all&pageNumber=${PageInfo.pageNumber -1}" > ${PageInfo.pageNumber -1} </a>
	    		</li>
	    		<li class="active">
	    			<a onclick="javascript:return false;" > ${PageInfo.pageNumber} </a>
	    		</li>
    		</c:if>
    		<!-- 当最后一页未被选中时 -->
    		<c:if test="${PageInfo.pageNumber < PageInfo.total}">
	    		<li>
	    			<a href="${pageContext.request.contextPath}/CommentServlet?flag=all&pageNumber=${PageInfo.total}" > ${PageInfo.total} </a>
	    		</li>
    		</c:if>

	    </c:if>
	    <!-- 当页数小于等于5页时 -->
	    <c:if test="${PageInfo.total <= 5 }">
	    	<c:forEach begin="1" end="${PageInfo.total }" step="1" var="pNumber" varStatus="id">
	    		<c:if test="${PageInfo.pageNumber == id.index}">
		    		<li class="active">
		    			<a onclick="javascript:return false;" > ${pNumber} </a>
		    		</li>
	    		</c:if>
	    		<c:if test="${PageInfo.pageNumber != id.index }">
		    		<li>
		    			<a href="${pageContext.request.contextPath}/CommentServlet?flag=all&pageNumber=${pNumber}" > ${pNumber} </a>
		    		</li>
	    		</c:if>
	    	</c:forEach>
	    </c:if>
	    
	    <!-- 下一页 -->
	    <!-- 下一页 -->
	    <!-- 下一页 -->
	    <c:if test="${PageInfo.pageNumber >= PageInfo.total }">
		    <li class="disabled">	      
		        <span>&raquo;</span>	      
		    </li>
	    </c:if>
	    <c:if test="${PageInfo.pageNumber < PageInfo.total }">
	    	<li>
	    		<a href="${pageContext.request.contextPath}/CommentServlet?flag=all&pageNumber=${PageInfo.pageNumber+1}">	      
	        		<span>&raquo;</span>	
	        	</a>      
	    	</li>
	    </c:if>
	  </ul>
	</nav>
	

	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			
			//设置页面大小
			$("#pSize").click(function(){
				
				var value = $("#pageSize option:selected").val();
				//alert(value);
				location.href="${pageContext.request.contextPath}/CommentServlet?flag=all&pageNumber="+${PageInfo.pageNumber}+"&pageSize="+value;
			});
		});
	</script>

</body>
</html>
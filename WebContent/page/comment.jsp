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
    
	<title>评论管理</title>
	
</head>
 <body>
 
  	<!-- 头部导航栏 -->
 	<%@include file="top.jsp" %>

    <!-- 正文部分 -->
	<div class="panel panel-success">
	  <!-- Default panel contents -->
	  <div class="panel-heading">
	  	<img alt="" src="${pageContext.request.contextPath}/images/comment.png" style="width:20px;height:20px;">
	  	<span style="color:#0CDCD1;">评论列表</span>
	  </div>	  
	</div>	
		
	<c:forEach items="${PageInfo.list }" var="list" varStatus="id">
		<div class="media ">	  
		  
		  <div class="media-left" style="height:200px;vertical-align:middle;border:dotted #ccc;border-width: 0px 1px 0px 0px;">
		    <a href="#">
		      <img alt="" src="${fn:substring(list.photo, 40, -1)}" style="max-width:180px;max-height:180px;margin-left:5px;">
		    </a>
		  </div>
		  
		  <div class="media-body" style="padding-left:10px;">
		    <h4 class="media-heading">商品名称:<i style="color:red;"> ${list.name }</i></h4><br>
		    
		    <c:if test="${list.flag == 1 }">
				<div class="panel panel-info" style="width:80%;">
				    <div class="panel-heading" role="tab" id="headingOne">
				      <h4 class="panel-title">
				        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#${id.index }" >
				          	<span class="badge badge-info">${id.index + 1}</span> 	
				          	✧评分：<i style="color:#37C629;">${list.descript + list.quality }</i> 分 	&nbsp;&nbsp;			          	
				          	✧发布时间：<span style="color:#F041F2">${fn:substringBefore(list.publicTime , ".")}</span>			          	
				        </a>
				      </h4>
				    </div>			    
				    <div id="" class="panel-collapse collapse in" role="tabpanel" >
				      <div class="panel-body">
							评论内容：<span style="color:#32C8C0">${list.comment }</span><br/>								      
					  </div>
				    </div>	    			    
				 </div>
			 </c:if>
		    <c:if test="${list.flag == 0 }">
				<div class="panel panel-danger" style="width:80%;">
				    
				    <div class="panel-body">
				    	<img alt="" src="${pageContext.request.contextPath}/images/delete-big.png">
				     	<span style="color:red;">对不起，此商品已经下架，暂时无法查看相关信息！ </span>
				     </div> 			    
				</div>
			 </c:if>
			 
		   </div>	
		   <hr>  
		</div>
	</c:forEach>
	
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
			    <a href="${pageContext.request.contextPath}/CommentServlet?flag=select&pageNumber=${PageInfo.pageNumber-1}">
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
	    			<a href="${pageContext.request.contextPath}/CommentServlet?flag=select&pageNumber=2" > 2 </a>
	    		</li>
	    		<li>
	    			<a href="${pageContext.request.contextPath}/CommentServlet?flag=select&pageNumber=3" > 3 </a>
	    		</li>
	    		<li>
	    			<a onclick="javascript:return false;" > &hellip; </a>
	    		</li>
    		</c:if>
    		<!-- 当第一页未被选中时 -->
    		<c:if test="${PageInfo.pageNumber > 1}">
	    		<li>
	    			<a href="${pageContext.request.contextPath}/CommentServlet?flag=select&pageNumber=1" > 1 </a>
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
		    			<a href="${pageContext.request.contextPath}/CommentServlet?flag=select&pageNumber=${PageInfo.pageNumber -1}" > ${PageInfo.pageNumber -1} </a>
		    		</li>
		    	</c:if>
    			<li class="active">
	    			<a onclick="javascript:return false;" > ${PageInfo.pageNumber} </a>
	    		</li>
	    		<c:if test="${PageInfo.pageNumber+1 < PageInfo.total}">
		    		<li>
		    			<a href="${pageContext.request.contextPath}/CommentServlet?flag=select&pageNumber=${PageInfo.pageNumber +1}" > ${PageInfo.pageNumber +1} </a>
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
	    			<a href="${pageContext.request.contextPath}/CommentServlet?flag=select&pageNumber=${PageInfo.pageNumber -2}" > ${PageInfo.pageNumber -2} </a>
	    		</li>
	    		<li>
	    			<a href="${pageContext.request.contextPath}/CommentServlet?flag=select&pageNumber=${PageInfo.pageNumber -1}" > ${PageInfo.pageNumber -1} </a>
	    		</li>
	    		<li class="active">
	    			<a onclick="javascript:return false;" > ${PageInfo.pageNumber} </a>
	    		</li>
    		</c:if>
    		<!-- 当最后一页未被选中时 -->
    		<c:if test="${PageInfo.pageNumber < PageInfo.total}">
	    		<li>
	    			<a href="${pageContext.request.contextPath}/CommentServlet?flag=select&pageNumber=${PageInfo.total}" > ${PageInfo.total} </a>
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
		    			<a href="${pageContext.request.contextPath}/CommentServlet?flag=select&pageNumber=${pNumber}" > ${pNumber} </a>
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
	    		<a href="${pageContext.request.contextPath}/CommentServlet?flag=select&pageNumber=${PageInfo.pageNumber+1}">	      
	        		<span>&raquo;</span>	
	        	</a>      
	    	</li>
	    </c:if>
	  </ul>
	</nav>

	<%-- 模态框 --%>
	<%@include file="tip.jsp" %>

	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>

	<script type="text/javascript">
		$(document).ready(function() {
	
			//设置页面大小
			$("#pSize").click(function(){
				
				var value = $("#pageSize option:selected").val();
				//alert(value);
				location.href="${pageContext.request.contextPath}/CommentServlet?flag=select&pageNumber="+${PageInfo.pageNumber}+"&pageSize="+value;
			});
		});
	</script>
</body>
</html>
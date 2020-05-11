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
    
	<title>风格分类</title>
	
</head>
<body>
 
 	<!-- 头部导航栏 -->
    <%@include file="top.jsp" %>
    
    <!-- 正文部分 -->
    
    <!-- 搜索框 -->
     <span>
		<img src="${pageContext.request.contextPath}/images/category.png" />
	</span>
	<label style="color:red;">装饰材料分类：</label>
	<select id="categoryId" name="categoryId" style="width:80px;">	
		<option value="0" selected >所有材料</option>	
		<c:forEach items="${CategoryList }" var="list" varStatus="id">
			<c:if test="${list.id == CategoryId }">
				<option value="${list.id }" selected >${list.category }</option>	
			</c:if>
			<c:if test="${list.id != CategoryId }">
				<option value="${list.id }" >${list.category }</option>
			</c:if>
			
		</c:forEach>						
	</select>	
	<a id="search">
		<img src="${pageContext.request.contextPath}/images/search.png" style="width:20px;height:20px; cursor: pointer;margin-left:5px;"/>	
	</a>		
	<span class="alert-info " style="margin-left: 20px;">当前风格：${Style }</span>		
	<hr>
	
	<!-- 分页循环所有商品 -->
	<c:forEach items="${PageInfo.list }" var="list" varStatus="id">
		<div class="col-sm-4 col-md-2" style="margin-left:-1px;">
		  <div class="thumbnail">
		    <a class="thumbnail"><img src="${fn:substring(list.photo, 40, -1)}" alt="..." class=""style="width:190px;height:130px;"></a>
		    <hr color="#E4EB3C">
		    <div class="caption" style="margin-top:-30px;">
		      <p style="height:30px;">名称：
	        	<i style="color:#36ADD5">
	        		<c:if test="${fn:length(list.name) > 15}">  
						${ fn:substring(list.name, 0, 15)}&hellip;
					</c:if>
					<c:if test="${fn:length(list.name) <= 15}"> 
						${list.name }
					</c:if>	
	        	</i>
	          </p>
			  <p>单价：<i style="color:red">${list.price }元</i></p>
		      <p>
		      	<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=one&id=${list.id}" 
		      		class="btn btn-success" role="button" style="font-size: 10px;margin-bottom:2px;"> 查 看 详 情 </a> 
		      	<a href="#" class="btn btn-info" role="button" style="font-size: 10px;" onclick="jump(${list.id})">加入购物车</a>
		      </p>
		    </div>
		  </div>
		</div>
	</c:forEach>	
	
    <hr>
    
	<!-- 分页操作 -->
	<div class="col-md-12">
		<hr style="margin-top:-10px;">
		<div class="page" style="float:left; ">
			&nbsp;&nbsp;共<i style="color:blue;"> - &gt; ${PageInfo.total} &lt; - </i>页，
			当前显示第 <i style="color:blue;">[ ${PageInfo.pageNumber} ] </i>页
			<%-- 每页显示
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
			<input type="button" class="btn btn-default" id="pSize" value="确定" style="height:20px;line-height:5px;"> --%>
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
				    <a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=style&pageNumber=${PageInfo.pageNumber-1}">
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
		    			<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=style&pageNumber=2" > 2 </a>
		    		</li>
		    		<li>
		    			<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=style&pageNumber=3" > 3 </a>
		    		</li>
		    		<li>
		    			<a onclick="javascript:return false;" > &hellip; </a>
		    		</li>
	    		</c:if>
	    		<!-- 当第一页未被选中时 -->
	    		<c:if test="${PageInfo.pageNumber > 1}">
		    		<li>
		    			<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=style&pageNumber=1" > 1 </a>
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
			    			<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=style&pageNumber=${PageInfo.pageNumber -1}">
			    				${PageInfo.pageNumber -1} 
			    			</a>
			    		</li>
			    	</c:if>
	    			<li class="active">
		    			<a onclick="javascript:return false;" > ${PageInfo.pageNumber} </a>
		    		</li>
		    		<c:if test="${PageInfo.pageNumber+1 < PageInfo.total}">
			    		<li>
			    			<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=style&pageNumber=${PageInfo.pageNumber +1}"> 
			    				${PageInfo.pageNumber +1} 
			    			</a>
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
		    			<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=style&pageNumber=${PageInfo.pageNumber -2}"> 
		    				${PageInfo.pageNumber -2} 
		    			</a>
		    		</li>
		    		<li>
		    			<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=style&pageNumber=${PageInfo.pageNumber -1}"> 
		    				${PageInfo.pageNumber -1} 
		    			</a>
		    		</li>
		    		<li class="active">
		    			<a onclick="javascript:return false;" > ${PageInfo.pageNumber} </a>
		    		</li>
	    		</c:if>
	    		<!-- 当最后一页未被选中时 -->
	    		<c:if test="${PageInfo.pageNumber < PageInfo.total}">
		    		<li>
		    			<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=style&pageNumber=${PageInfo.total}"> 
		    				${PageInfo.total} 
		    			</a>
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
			    			<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=style&pageNumber=${pNumber}"> 
			    				${pNumber} 
			    			</a>
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
		    		<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=style&pageNumber=${PageInfo.pageNumber+1}">	      
		        		<span>&raquo;</span>	
		        	</a>      
		    	</li>
		    </c:if>
		  </ul>
		</nav>
    </div>
    
    <%-- 模态框 --%>
    <%@include file="tip.jsp" %>


	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>

	<script type="text/javascript">
		$(document).ready(function() {
	
			//根据材料分类搜索
			$("#search").click(function(){
				
				var value = $("#categoryId option:selected").val();
				//alert(value);
				location.href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=style&categoryId="+value;
			});
			
		});
	</script>
</body>
</html>
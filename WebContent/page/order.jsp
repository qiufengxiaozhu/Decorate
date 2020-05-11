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
    
	<title>订单管理</title>
	
</head>
 <body>
 
  	<!-- 头部导航栏 -->
 	<%@include file="top.jsp" %>
 	
    <!-- 正文部分 -->

    <!-- 搜索框 -->
    <span>
		<img src="${pageContext.request.contextPath}/images/order.png" />
	</span>
	<label style="color:red;">下单时间：</label>
	<input type="text" id="order-time" value="${Time }" style="color:green;">
	<img src="${pageContext.request.contextPath}/images/search.png" id="searchTime" style="width:20px;height:20px; cursor: pointer;"/>	
		
	<hr>

	<!-- 分页循环所有商品 -->
	<div class="panel panel-info">
	  <!-- Default panel contents -->
	  <div class="panel-heading">订单列表</div>
	
	  <!-- Table -->
	  <table class="table table-bordered table-striped table-hover">
	  	<thead>
		  	<tr>
			  	<th>编号</th>
			  	<th>图片</th>
			  	<th>名称</th>
			  	<th>购买数量</th>
			  	<th>应付金额</th>
			  	<th>会员折扣</th>
			  	<th>实付金额</th>
			  	<th>下单时间</th>
			  	<th>操作</th>
		  	</tr>
	  	</thead>
	  	<tbody>
	  		<c:forEach items="${PageInfo.list}" var="list" varStatus="id">
		  		<tr>
		  			<td>${id.index + 1 }</td>
		  			<td><img alt="" src="${fn:substring(list.photo, 40, -1)}" style="max-width:65px;max-height:40px;"></td>
		  			<td>${list.decorateName }</td>
		  			<td>${list.number }</td>
		  			<td>${list.needTotal } 元</td>
		  			<c:if test="${list.discount == 1.00 }">
		  				<td>无折扣</td>
		  			</c:if>
		  			<c:if test="${list.discount != 1.00 }">
		  				<td>${fn:substringBefore(list.discount * 100, ".")} 折</td>
		  			</c:if>
		  			
		  			<td>${list.actuallyTotal } 元</td>
		  			<td>${fn:substringBefore(list.orderTime , ".")}</td>
		  			<td>
		  				<c:if test="${list.flag == 0 }">
		  					<a onclick="disable()"  style="cursor:pointer">
								<img src="${pageContext.request.contextPath}/images/details.png" style="width:20px;height:20px;"/>
								<label style="margin-right:10px;">查看详情</label>
							</a>
							<label>┇</label>
							<a onclick="disable()" style="cursor:pointer">
								<img src="${pageContext.request.contextPath}/images/addComment.png" style="width:25px;height:25px;"/>
								<label style="">添加评论</label>
							</a>
		  				</c:if>
		  				<c:if test="${list.flag == 1 }">
		  					<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=one&id=${list.decorateId}" style="cursor:pointer">
								<img src="${pageContext.request.contextPath}/images/details.png" style="width:20px;height:20px;"/>
								<label style="margin-right:10px;">查看详情</label>
							</a>
							<label>┇</label>
							<a href="${pageContext.request.contextPath}/CommentServlet?flag=edit&id=${list.decorateId}" style="cursor:pointer">
								<img src="${pageContext.request.contextPath}/images/addComment.png" style="width:25px;height:25px;"/>
								<label style="">添加评论</label>
							</a>
		  				</c:if>
		  				
					</td>
		  		</tr>
	  		</c:forEach>
	  	</tbody>
	  </table>
	</div>
	
	<hr>
    
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
			    <a href="${pageContext.request.contextPath}/OrderServlet?flag=all&pageNumber=${PageInfo.pageNumber-1}">
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
	    			<a href="${pageContext.request.contextPath}/OrderServlet?flag=all&pageNumber=2" > 2 </a>
	    		</li>
	    		<li>
	    			<a href="${pageContext.request.contextPath}/OrderServlet?flag=all&pageNumber=3" > 3 </a>
	    		</li>
	    		<li>
	    			<a onclick="javascript:return false;" > &hellip; </a>
	    		</li>
    		</c:if>
    		<!-- 当第一页未被选中时 -->
    		<c:if test="${PageInfo.pageNumber > 1}">
	    		<li>
	    			<a href="${pageContext.request.contextPath}/OrderServlet?flag=all&pageNumber=1" > 1 </a>
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
		    			<a href="${pageContext.request.contextPath}/OrderServlet?flag=all&pageNumber=${PageInfo.pageNumber -1}" > ${PageInfo.pageNumber -1} </a>
		    		</li>
		    	</c:if>
    			<li class="active">
	    			<a onclick="javascript:return false;" > ${PageInfo.pageNumber} </a>
	    		</li>
	    		<c:if test="${PageInfo.pageNumber+1 < PageInfo.total}">
		    		<li>
		    			<a href="${pageContext.request.contextPath}/OrderServlet?flag=all&pageNumber=${PageInfo.pageNumber +1}" > ${PageInfo.pageNumber +1} </a>
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
	    			<a href="${pageContext.request.contextPath}/OrderServlet?flag=all&pageNumber=${PageInfo.pageNumber -2}" > ${PageInfo.pageNumber -2} </a>
	    		</li>
	    		<li>
	    			<a href="${pageContext.request.contextPath}/OrderServlet?flag=all&pageNumber=${PageInfo.pageNumber -1}" > ${PageInfo.pageNumber -1} </a>
	    		</li>
	    		<li class="active">
	    			<a onclick="javascript:return false;" > ${PageInfo.pageNumber} </a>
	    		</li>
    		</c:if>
    		<!-- 当最后一页未被选中时 -->
    		<c:if test="${PageInfo.pageNumber < PageInfo.total}">
	    		<li>
	    			<a href="${pageContext.request.contextPath}/OrderServlet?flag=all&pageNumber=${PageInfo.total}" > ${PageInfo.total} </a>
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
		    			<a href="${pageContext.request.contextPath}/OrderServlet?flag=all&pageNumber=${pNumber}" > ${pNumber} </a>
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
	    		<a href="${pageContext.request.contextPath}/OrderServlet?flag=all&pageNumber=${PageInfo.pageNumber+1}">	      
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
	<script src="${pageContext.request.contextPath}/laydate/laydate.js" type="text/javascript" charset="utf-8"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			
			//执行一个laydate实例
			laydate.render({
				elem: '#order-time',
				type: 'datetime'
			});

			//设置页面大小
			$("#pSize").click(function(){
				
				var value = $("#pageSize option:selected").val();
				//alert(value);
				location.href="${pageContext.request.contextPath}/OrderServlet?flag=all&pageNumber="+${PageInfo.pageNumber}+"&pageSize="+value;
			});
			
			//点击时间搜索按钮
			$("#searchTime").click(function(){
				
				var time = $("#order-time").val();
				
				if(time == ""){
					time = 0;
				}
				//alert(time);
				location.href="${pageContext.request.contextPath}/OrderServlet?flag=time&orderTime="+time;
			});

		});
		
		function disable(){
			
			$('#myModal-5').modal("show");
		}
	</script>
</body>
</html>
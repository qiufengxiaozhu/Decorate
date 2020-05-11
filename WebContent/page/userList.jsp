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
    
	<title>用户列表</title>
	
</head>
 <body>
 
  	<!-- 头部导航栏 -->
 	<%@include file="top.jsp" %>
 	
    <!-- 正文部分 -->

    <!-- 搜索框 -->
    <span>
		<img src="${pageContext.request.contextPath}/images/account.png" style="width:25px;height:25px;margin-top:-4px;"/>
	</span>
	<label style="color:red;">用户账号：</label>
	<input type="text" id="account" style="color:green;">
	<img src="${pageContext.request.contextPath}/images/search.png" id="search" style="width:20px;height:20px; cursor: pointer;"/>	
	
	
	<hr>
	<!-- 分页循环所有用户-->

    <div class="panel panel-info">
	  <!-- Default panel contents -->
	  <div class="panel-heading">订单列表</div>
	
	  <!-- Table -->
	  <table class="table table-bordered table-striped table-hover">
	  	<thead>
		  	<tr>
			  	<th>编号</th>
			  	<th>用户头像</th>
			  	<th>账号</th>
			  	<th>姓名</th>
			  	<th>性别</th>
			  	<th>邮箱</th>
			  	<th>消费金额</th>
			  	<th>会员等级</th>
			  	<th>权限</th>
		  	</tr>
	  	</thead>
	  	<tbody>
	  		<c:forEach items="${PageInfo.list }" var="list" varStatus="id">
		  		<tr onclick="userDetails(${list.account});">
		  			<td style="width:50px;vertical-align: middle;text-align: center">${id.index + 1 }</td>
		  			<td style="width:90px;vertical-align: middle;text-align: center;">
		  				<c:if test="${fn:length(list.photo) > 40}">
		  					<img alt="" src="${fn:substring(list.photo, 40, -1)}" style="max-width:65px;max-height:40px;">
		  				</c:if>
		  				<c:if test="${fn:length(list.photo) <= 40}">
		  					<img alt="" src="${list.photo}" style="max-width:65px;max-height:40px;">
		  				</c:if>
		  				
		  			</td>
		  			<td style="vertical-align: middle;">${list.account }</td>
		  			<td style="vertical-align: middle;">${list.name }</td>
		  			<td style="vertical-align: middle;">${list.sex }</td>
		  			<td style="vertical-align: middle;">${list.mail }</td>
		  			<td style="vertical-align: middle;">${list.total } 元</td>
		  			<td style="vertical-align: middle;">${list.member }</td>
		  			<td style="vertical-align: middle;">${list.role }</td>
		  		</tr>
	  		</c:forEach>
	  	</tbody>
	  </table>
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
			    <a href="${pageContext.request.contextPath}/UserListServlet?flag=all&pageNumber=${PageInfo.pageNumber-1}">
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
	    			<a href="${pageContext.request.contextPath}/UserListServlet?flag=all&pageNumber=2" > 2 </a>
	    		</li>
	    		<li>
	    			<a href="${pageContext.request.contextPath}/UserListServlet?flag=all&pageNumber=3" > 3 </a>
	    		</li>
	    		<li>
	    			<a onclick="javascript:return false;" > &hellip; </a>
	    		</li>
    		</c:if>
    		<!-- 当第一页未被选中时 -->
    		<c:if test="${PageInfo.pageNumber > 1}">
	    		<li>
	    			<a href="${pageContext.request.contextPath}/UserListServlet?flag=all&pageNumber=1" > 1 </a>
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
		    			<a href="${pageContext.request.contextPath}/UserListServlet?flag=all&pageNumber=${PageInfo.pageNumber -1}" > ${PageInfo.pageNumber -1} </a>
		    		</li>
		    	</c:if>
    			<li class="active">
	    			<a onclick="javascript:return false;" > ${PageInfo.pageNumber} </a>
	    		</li>
	    		<c:if test="${PageInfo.pageNumber+1 < PageInfo.total}">
		    		<li>
		    			<a href="${pageContext.request.contextPath}/UserListServlet?flag=all&pageNumber=${PageInfo.pageNumber +1}" > ${PageInfo.pageNumber +1} </a>
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
	    			<a href="${pageContext.request.contextPath}/UserListServlet?flag=all&pageNumber=${PageInfo.pageNumber -2}" > ${PageInfo.pageNumber -2} </a>
	    		</li>
	    		<li>
	    			<a href="${pageContext.request.contextPath}/UserListServlet?flag=all&pageNumber=${PageInfo.pageNumber -1}" > ${PageInfo.pageNumber -1} </a>
	    		</li>
	    		<li class="active">
	    			<a onclick="javascript:return false;" > ${PageInfo.pageNumber} </a>
	    		</li>
    		</c:if>
    		<!-- 当最后一页未被选中时 -->
    		<c:if test="${PageInfo.pageNumber < PageInfo.total}">
	    		<li>
	    			<a href="${pageContext.request.contextPath}/UserListServlet?flag=all&pageNumber=${PageInfo.total}" > ${PageInfo.total} </a>
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
		    			<a href="${pageContext.request.contextPath}/UserListServlet?flag=all&pageNumber=${pNumber}" > ${pNumber} </a>
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
	    		<a href="${pageContext.request.contextPath}/UserListServlet?flag=all&pageNumber=${PageInfo.pageNumber+1}">	      
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
				location.href="${pageContext.request.contextPath}/UserListServlet?flag=all&pageNumber="+${PageInfo.pageNumber}+"&pageSize="+value;
			});
			
			//搜索按钮
			$("#search").click(function(){
				
				var value = $("#account").val();
				//alert(value);
				location.href="${pageContext.request.contextPath}/UserListServlet?flag=one&account="+value;
			});
		});
		
		//选中整行跳往用户信息详情
		function userDetails(e){
			
			//alert(e);
			location.href="${pageContext.request.contextPath}/UserListServlet?flag=one&account="+e;
		}
	</script>
</body>
</html>
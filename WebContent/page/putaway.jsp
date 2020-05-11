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
    
	<title>商品上架管理</title>
	
</head>
 <body>
 
  	<!-- 头部导航栏 -->
 	<%@include file="top.jsp" %>
 	
    <!-- 正文部分 -->	
	<a href="${pageContext.request.contextPath}/AddGoodsServlet" style="text-decoration:none">
		<img alt="" src="${pageContext.request.contextPath}/images/+.jpg" style="width:20px;height:20px;margin-top:-4px;">
		<span class="btn btn-success" style="height:25px;padding-top:3px;">新增商品</span>
	</a>
	&nbsp;&nbsp;┇&nbsp;&nbsp;
	<a href="#" style="text-decoration:none">
		<img alt="" src="${pageContext.request.contextPath}/images/x.jpg" style="width:20px;height:20px;margin-top:-4px;">
		<span id="batch" class="btn btn-danger" style="height:25px;padding-top:3px;">批量下架</span>
	</a>
	<hr>

	<!-- 分页循环所有商品 -->
	<div class="panel panel-info">
	  <!-- Default panel contents -->
	  <div class="panel-heading">商品管理</div>
	
	  <!-- Table -->
	  <table class="table table-bordered table-striped table-hover">
	  	<thead>
		  	<tr>
			  	<th>编号</th>
			  	<th>图片</th>
			  	<th>名称</th>
			  	<th>类别</th>
			  	<th>风格</th>
			  	<th>单价</th>
			  	<th>库存</th>			  	
			  	<th>操作</th>
		  	</tr>
	  	</thead>
	  	<tbody>
		  	<c:forEach items="${PageInfo.list}" var="list" varStatus="id">
		  		<tr>
		  			<td style="width:60px;vertical-align: middle;" >${id.index + 1 } <input type="checkbox" name="id" value="${list.id }"></td>
		  			<td style="width:90px;vertical-align: middle;text-align: center;">
		  				<img alt="" src="${fn:substring(list.photo, 40, -1)}" style="max-width:65px;max-height:40px;">
		  			</td>
		  			<td style="vertical-align: middle;">${list.name }</td>
		  			<td style="vertical-align: middle;">${list.category }</td>	  			
		  			<td style="vertical-align: middle;">${list.style }</td>
		  			<td style="vertical-align: middle;">${list.price }元</td>
		  			<td style="vertical-align: middle;">${list.number }件</td>
		  			<td style="vertical-align: middle;">
		  				<a href="${pageContext.request.contextPath}/EditGoodsServlet?flag=select&id=${list.id}"  style="cursor:pointer;text-decoration:none;">
							<img src="${pageContext.request.contextPath}/images/update.png" style="width:20px;height:20px;"/>
							<label style="margin-right:10px;">修改信息</label>
						</a>
						<label>┇</label>
						<a href="${pageContext.request.contextPath}/DelGoodsServlet?flag=one&id=${list.id}" style="cursor:pointer;text-decoration:none;">
							<img src="${pageContext.request.contextPath}/images/delete.png" style="width:25px;height:25px;"/>
							<label style="">下架商品</label>
						</a>
					</td>
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
			    <a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=all&pageNumber=${PageInfo.pageNumber-1}">
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
	    			<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=all&pageNumber=2" > 2 </a>
	    		</li>
	    		<li>
	    			<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=all&pageNumber=3" > 3 </a>
	    		</li>
	    		<li>
	    			<a onclick="javascript:return false;" > &hellip; </a>
	    		</li>
    		</c:if>
    		<!-- 当第一页未被选中时 -->
    		<c:if test="${PageInfo.pageNumber > 1}">
	    		<li>
	    			<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=all&pageNumber=1" > 1 </a>
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
		    			<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=all&pageNumber=${PageInfo.pageNumber -1}" > ${PageInfo.pageNumber -1} </a>
		    		</li>
		    	</c:if>
    			<li class="active">
	    			<a onclick="javascript:return false;" > ${PageInfo.pageNumber} </a>
	    		</li>
	    		<c:if test="${PageInfo.pageNumber+1 < PageInfo.total}">
		    		<li>
		    			<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=all&pageNumber=${PageInfo.pageNumber +1}" > ${PageInfo.pageNumber +1} </a>
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
	    			<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=all&pageNumber=${PageInfo.pageNumber -2}" > ${PageInfo.pageNumber -2} </a>
	    		</li>
	    		<li>
	    			<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=all&pageNumber=${PageInfo.pageNumber -1}" > ${PageInfo.pageNumber -1} </a>
	    		</li>
	    		<li class="active">
	    			<a onclick="javascript:return false;" > ${PageInfo.pageNumber} </a>
	    		</li>
    		</c:if>
    		<!-- 当最后一页未被选中时 -->
    		<c:if test="${PageInfo.pageNumber < PageInfo.total}">
	    		<li>
	    			<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=all&pageNumber=${PageInfo.total}" > ${PageInfo.total} </a>
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
		    			<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=all&pageNumber=${pNumber}" > ${pNumber} </a>
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
	    		<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=all&pageNumber=${PageInfo.pageNumber+1}">	      
	        		<span>&raquo;</span>	
	        	</a>      
	    	</li>
	    </c:if>
	  </ul>
	</nav>
	
	<!-- 批量删除时是否有勾选需要删除的商品 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="myModal-1">
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
	      
	        <p>
	        	<i style="color:red;">批量下架 </i>时，您需要勾选商品前面的<i style="color:red;"> 选择框 </i>，
	        	这样我们就能知道你要下架的商品是哪些了(๑╹◡╹)ﾉ"""
	        </p>
	       	
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>

	<script type="text/javascript">
		$(document).ready(function() {
	
			//设置页面大小
			$("#pSize").click(function(){
				
				var value = $("#pageSize option:selected").val();
				//alert(value);
				location.href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=all&pageNumber="+${PageInfo.pageNumber}+"&pageSize="+value;
			});

			//批量下架
			$("#batch").click(function(){
				
				//jquery获取复选框值    
		      	var check_value =[];//定义一个数组    
		        $('input[name="id"]:checked').each(function(){//遍历每一个名字为id的复选框，其中选中的执行函数    
		        	check_value.push($(this).val());//将选中的值添加到数组check_value中    
		        }); 
		      	
		      	//判断用户点击下架按钮前是否勾选了商品
		      	if(check_value == ""){
		      		$('#myModal-1').modal("show");
		      	}
		      	else
		        	location.href="${pageContext.request.contextPath}/DelGoodsServlet?flag=batch&id="+check_value;
			});
		});
	</script>
</body>
</html>
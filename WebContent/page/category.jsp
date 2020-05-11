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
    
	<title>装饰分类</title>
	
</head>
<body>

  	<!-- 头部导航栏 -->
 	<%@include file="top.jsp" %>    
    
    
    <!-- 正文部分 -->
    <c:forEach begin="1" end="${fn:length(CategoryList)}" step="1" varStatus="id">
    	<c:forEach items="${DecorateList }" var="list" >
 
    		<c:if test="${list.categoryId == id.index }">
			    <div class="col-sm-4 col-md-2" style="margin-left:-1px;">
					<div class="thumbnail">
						<img src="${fn:substring(list.photo, 40, -1)}" alt="..." style="width:190px;height:130px;">
						<div class="caption">
							<p style="height:30px;">名称：<i style="color:#36ADD5">${list.name }</i></p>
							<p>单价：<i style="color:red">${list.price }元 </i></p>
							<br>
							<p style="text-align: center;">
								<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=one&id=${list.id}" 
									class="alert btn-success " >
									<label style="width:80px; cursor: pointer;">查 看 详 情</label>
								</a> 
								<br><br><br>
								
								<label class="alert btn-info" style="width:115px;cursor: pointer;"onclick="jump(${list.id})">加入购物车</label>
								
							</p>
						</div>
					</div>
				</div>
			    			    
		   	</c:if>
		</c:forEach>	   
		<div class="alert alert-info" style="text-align: center;height:440px;padding-top:400px;">
			<c:forEach items="${CategoryList}" var="list">
	    		<c:if test="${list.id == id.index }">
	    			${list.category}
	    			<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=category&categoryId=${list.id}" 
	    				style="font-size: 12px;color:red;cursor: pointer;">更多&gt;&gt;</a>	    			
	    		</c:if> 
    		</c:forEach>
	    </div>
    </c:forEach>
    
	<%-- 模态框 --%>	
    <%@include file="tip.jsp" %>
    
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>

	<script type="text/javascript">
		$(document).ready(function() {
	
			
		});
	</script>
    
    
</body>
</html>
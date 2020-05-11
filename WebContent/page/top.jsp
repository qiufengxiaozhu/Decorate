<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
 <head>
    <meta charset="utf-8">  
	<title>头部导航栏</title>
	
</head>
<body>
	<!-- 头部导航栏 -->
    <nav class="navbar btn-info">
    
      <div class="container-fluid" style="background-color: #31C7F2;">
        
        <div class="navbar-header " >
        
        <!-- 当屏幕小于一定尺寸的时候，导航条会自动隐藏，变成三个“横线”的按钮显示在导航条上，点击这个导航条上的这个按钮，就可以显示出导航的菜单来。 -->
         <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" ></button>
        
          <a class="navbar-brand glyphicon glyphicon-fire" href="#" style="color: #F5634F;"> 
          	<label style="margin-left:-8px; color:#F5F14F">装饰公司</label>
          </a>
          
        </div>
    
        <!-- 收集用于切换的导航链接、表单和其他内容 -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li class="active"><a href="${pageContext.request.contextPath}/index.jsp" 
            		style="color:black" class="glyphicon glyphicon-home"> 首页  </a></li>
            <li><a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=six" 
            		style="color:black" class="glyphicon glyphicon-th-list"> 分类 </a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle glyphicon glyphicon-grain" data-toggle="dropdown" role="button" 
              	style="color:black; margin-top:1px;">
              	风格 <span class="caret"></span> <!-- 显示一个倒三角符号 -->
              </a>
              <ul class="dropdown-menu" style="color:black; overflow:visible;">
                <li><a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=style&style=1&categoryId=0" >现代简约风格</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=style&style=2&categoryId=0" >田园风格</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=style&style=3&categoryId=0" >中式风格</a></li>
                <li role="separator" class="divider"></li>

              </ul>
            </li>
          </ul>
          <form class="navbar-form navbar-left">
            <div class="form-group">
              <input type="text" class="form-control" placeholder="输 入 内 容">
            </div>
            <button type="submit" class="btn btn-default glyphicon glyphicon-search" aria-hidden="true" style="color:#11D711"></button>
          </form>
          <ul class="nav navbar-nav navbar-right">
          	<c:if test="${User != null}">
          		<img alt="用户头像" src="${userPhoto}" title="用户头像"
          			style="width:40px; height:40px; margin-top:5px;border-radius: 3px; float:left;">
          		
          		<li class="dropdown">     			
          			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color:black">
          				<label style="vertical-align: bottom; margin-top:2px;">${User.name}</label>
          				<span class="caret" style="margin-top:-10px;"></span>
          			</a>
          			<ul class="dropdown-menu">
	          			<li><a href="${pageContext.request.contextPath}/page/userInfo.jsp">个人信息</a></li>
		                <li role="separator" class="divider"></li>
		                <li><a href="${pageContext.request.contextPath}/LoginServlet?flag=exit">退出登录</a></li>
		                <li role="separator" class="divider"></li>
	          		</ul>
	          	</li>
          	</c:if>
          	
            <c:if test="${User == null}">
          		<li><a href="${pageContext.request.contextPath}/page/login.jsp?flag=login" 
          				target="_parent" style="color:black" class="glyphicon glyphicon-user"> 
          				登录
          			</a>
          		</li>
          	</c:if>
          	
            <li><a id="shopCar" style="color:black;cursor: pointer;" class="glyphicon glyphicon-shopping-cart"> 购物车 </a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" 
              	style="color:black; margin-top:1px;">
              	<img alt="" src="${pageContext.request.contextPath}/images/user.png">
              	个人中心 <span class="caret"></span>
              </a>
              <ul class="dropdown-menu" style="overflow:visible;">
                <li><a id="orderList">
                	<img alt="" src="${pageContext.request.contextPath}/images/order.png" style="width:20px;height:20px;">
                	已完成订单</a>
                </li>
                <li>
                	<a id="commentList">
	                	<img alt="" src="${pageContext.request.contextPath}/images/comment.png" style="width:20px;height:20px;">
	                	已发表评论
                	</a>
                </li>
                <li role="separator" class="divider"></li>
                <c:if test="${User.userType > 0 }">
	                <li>
	                	<a id="userList">
	                		<img alt="" src="${pageContext.request.contextPath}/images/account.png" style="width:20px;height:20px;">
	                		查看用户信息
	                	</a>
	                </li>
                </c:if>
                <c:if test="${User.userType > 1 }">
	                <li role="separator" class="divider"></li>
	                <li>
	                	<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=all">
	                		<img alt="" src="${pageContext.request.contextPath}/images/goods.png" style="width:20px;height:20px;">
	                		管理上架商品
	                	</a>
	                </li>
               </c:if>
              </ul>
            </li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav><!-- 头部导航栏结束 -->   
    
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		$(document).ready(function() {
				
			//跳转进入购物车页面
			$("#shopCar").click(function(){
				//判断用户是否登录账号
				if("${User}" == ""){
					//跳出模态框，提醒用户应该登录账号
					$('#myModal-1').modal("show");
					//alert("111");
				}
				else
					location.href="${pageContext.request.contextPath}/CarServlet?flag=select";
			});
			
			//跳转进入用户订单列表页面
			$("#orderList").click(function(){
				//判断用户是否登录账号
				if("${User}" == ""){
					//跳出模态框，提醒用户应该登录账号
					$('#myModal-1').modal("show");
					//alert("111");
				}
				else
					location.href="${pageContext.request.contextPath}/OrderServlet?flag=all";
			});
			
			//跳转进入用户评论列表页面
			$("#commentList").click(function(){
				//判断用户是否登录账号
				if("${User}" == ""){
					//跳出模态框，提醒用户应该登录账号
					$('#myModal-1').modal("show");
					//alert("111");
				}
				else
					location.href="${pageContext.request.contextPath}/CommentServlet?flag=select";
			});
			
			//跳转进入用户信息列表页面
			$("#userList").click(function(){
				//判断用户是否登录账号
				if("${User}" == ""){
					//跳出模态框，提醒用户应该登录账号
					$('#myModal-1').modal("show");
					//alert("111");
				}
				else
					location.href="${pageContext.request.contextPath}/UserListServlet?flag=all";
			});
			
		});
		
		//加入购物车
		function jump(e){
			
			//判断用户是否登录账号
			if("${User}" == ""){
				
				//跳出模态框，提醒用户应该登录账号
				$('#myModal-1').modal("show");
			}
			else{
				//判断用户是否将同一商品重复加入购物车
				$.ajax({
					url:'${pageContext.request.contextPath}/CarServlet?flag=one',
					data:{"id":e},
					dataType:'text',
					error:function(){						
						alert("请求出错.");
					},
					success:function(data){
						
						if(data > 0){
							//跳出模态框，提醒用户不要将同一商品重复加入购物车
							$('#myModal-2').modal("show");
						}
						else{
							//跳出模态框，提醒用户已成功将此商品加入购物车
							$('#myModal-3').modal("show");
						}
							
					},
					type:'POST'	
				});
			}
		}
		
		//提示是否移出购物车
		function removeCar(e,m){
			
			$("#decorateId").val(e);
			$("#pageNumber").val(m);
			$('#myModal-4').modal("show");
		}
		
		//确定移出购物车
		function removeSure(){
						
			id = $("#decorateId").val();
			pageNumber = $("#pageNumber").val();
			$('#myModal-4').modal("hide");
			location.href="${pageContext.request.contextPath}/CarServlet?flag=del&id="+id+"&pageNumber="+pageNumber;
		}
		
		
	</script>
</body>
</html>
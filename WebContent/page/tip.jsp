<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
 <head>
    <meta charset="utf-8">  
	<title>提示模态框</title>
	
</head>
<body>
<div class="main-content">
	<!-- 是否登录了账号 -->
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
	      
	        <p>您需要
	        	<i style="color:red;"> 登录账号 </i>
	        	才能将此商品放进
	        	<img alt="" src="${pageContext.request.contextPath}/images/car-tip.png" style="margin-top:-3px;"/>
	        </p>
	        
	        <a href="${pageContext.request.contextPath}/page/login.jsp" target="_parent" style="text-decoration: none;">
	        	<p>—»
	        		<img alt="" src="${pageContext.request.contextPath}/images/login.png" style="margin-top:-3px;"/>
              		点我跳转登录界面 «—
              	</p>
	        </a>
	       	
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<!-- 判断用户是否将同一商品重复加入购物车 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="myModal-2">
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
	      
	        <p style="color:red;">
	        	您不能将同一商品重复加入
	        	<img alt="" src="${pageContext.request.contextPath}/images/car-tip.png" style="margin-top:-3px;"/>
	        	！
	        </p>
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>	        
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<!-- 加入购物车成功 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="myModal-3">
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
	      
	        <p style="color:#00aaff;">
	        	加入
	        	<img alt="" src="${pageContext.request.contextPath}/images/car-tip.png" style="margin-top:-3px;"/>
	        	成功！
	        </p>	       	
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<!-- 提示是否移除购物车 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="myModal-4">
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
	      
	        <p style="color:#00aaff;">
	        	您确定要将此商品移出
	        	<img alt="" src="${pageContext.request.contextPath}/images/car-tip.png" style="margin-top:-3px;"/>
	        	吗？
	        </p>	       	
	        <input type="hidden" id="decorateId">
	        <input type="hidden" id="pageNumber">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary"  id="removeSure"  onclick="removeSure()">确定移出</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	
	<!-- 提示该商品已下架，无法查看相关信息 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="myModal-5">
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
	      
	        <p style="color:#00aaff;">
	        	
	        	<img alt="" src="${pageContext.request.contextPath}/images/del-car.png" style="margin-top:-3px;"/>
	        	您查看的该商品已经下架，暂时无法进行相关操作，敬请谅解！
	        </p>	       	

	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	
</div>	
</body>
</html>
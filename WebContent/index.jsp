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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/carousel.css">
    
	<title>系统首页</title>
	
</head>
 <body>
 
 	<!-- 头部导航栏 两种方式均可-->
	<%@include file="page/top.jsp" %>   <!-- 先包含，后编译 -->
    <%-- <jsp:include flush="true" page="/page/top.jsp"></jsp:include> --%><!-- 先编译，后包含 -->
    
    <div class="link-left" style="float: left; border:1px solid #ccc; border-top-style:none;border-left-style:none;
			width:48%; height:550px; overflow: hidden; text-align:center; margin-left:2%; border-bottom-style:none;" >
    
    	<div class="alert alert-success" style="float:none;margin-right:3%;">精品案例</div>
    	
	    <!-- 轮播图begin -->
		<div id="playimages" class="play" style="float:none; margin: 0px auto; width:90%;">
			<ul class="big_pic" style="margin: 0px auto; width:100%;height:365px;">
				<div class="prev"></div>
			    <div class="next"></div>
			    
			    <!-- <div class="text">加载图片说明......</div>
			    <div class="length">计算图片数量......</div> -->
			    
			    <a class="mark_left" href="javascript:;"></a>
			    <a class="mark_right" href="javascript:;"></a>
			    <!-- <div class="bg"></div> --> 
			    
			    <li><img src="${pageContext.request.contextPath}/images/p1.jpg" style="width:100%;height:340px;"/></li>
			    <li><img src="${pageContext.request.contextPath}/images/p2.jpg" style="width:100%;height:340px;"/></li>
			    <li><img src="${pageContext.request.contextPath}/images/p3.jpg" style="width:100%;height:340px;"/></li>
			    <li><img src="${pageContext.request.contextPath}/images/p4.jpg" style="width:100%;height:340px;"/></li>
			    <li><img src="${pageContext.request.contextPath}/images/p5.jpg" style="width:100%;height:340px;"/></li>
			    <li><img src="${pageContext.request.contextPath}/images/p6.jpg" style="width:100%;height:340px;"/></li>
			    <li><img src="${pageContext.request.contextPath}/images/p7.jpg" style="width:100%;height:340px;"/></li>
			    <li><img src="${pageContext.request.contextPath}/images/p8.jpg" style="width:100%;height:340px;"/></li>
		    </ul>
		    <div id="small_pic" class="small_pic" style="">
		    	<ul style="width:100%; margin: 0px auto;">
		        	<li style=" filter: alpha(opacity:100); opacity:1;"><img src="images/p1.jpg" /></li>
		            <li><img src="${pageContext.request.contextPath}/images/p2.jpg" /></li>
		            <li><img src="${pageContext.request.contextPath}/images/p3.jpg" /></li>
		            <li><img src="${pageContext.request.contextPath}/images/p4.jpg" /></li>
		            <li><img src="${pageContext.request.contextPath}/images/p5.jpg" /></li>
		            <li><img src="${pageContext.request.contextPath}/images/p6.jpg" /></li>
		            <li><img src="${pageContext.request.contextPath}/images/p7.jpg" /></li>
		            <li><img src="${pageContext.request.contextPath}/images/p8.jpg" /></li>
		        </ul>       
		    </div>
		</div>
	    <!-- 轮播图end -->
    
    </div><!-- link-left -->
    
    <div class="link-right"style="float: left; border:0px solid #ccc; width:48%; height:550px; margin-left:1%;" >
		
		<div class="alert alert-info" style="float:none;text-align: center;">精品推荐</div>
	   
	   	<label class="alert alert-danger" style="margin-bottom:1px;margin-left:20px;">最新上架商品</label>
	   	<div class="row" style="margin-left:5px;margin-right:5px;">
	
		<c:forEach items="${Decorate }" var="list">
			<div class="col-sm-6 col-md-4" >
				<div class="thumbnail">
					<img src="${fn:substring(list.photo, 40, -1)}" alt="..." style="width:190px;height:130px;">
					<div class="caption">
						<p>名称：<i style="color:red">${list.name }</i></p>
						<p style="height:50px;">描述：
							<i style="color:#36ADD5">
								<c:if test="${fn:length(list.descript) > 23}">  
									${ fn:substring(list.descript, 0, 23)}&hellip;
								</c:if>
								<c:if test="${fn:length(list.descript) <= 23}"> 
									${list.descript }
								</c:if>		
							</i>
						</p>
						<br>
						<p style="text-align: center;">
							<a href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=one&id=${list.id}" class="alert btn-success">
								<label style="width:80px; cursor: pointer;">查 看 详 情</label>
							</a> 
							<br><br><br>
							
							<label class="alert btn-info" style="width:115px;cursor:pointer;" onclick="jump(${list.id});">加入购物车</label>
							
						</p>
					</div>
				</div>
			</div>
		</c:forEach>	
	</div>
	
	</div><!-- link-right -->
	
    <!-- 公司简介 -->
    <div class="row" style="width:99.9%;margin: 0px auto;">
        <div class="col-sm-12 col-md-12">
            <div class="panel panel-info ">
                <div class="panel-heading no-collapse text-center " style="font-size: 20px; color:#6B7FED;">
                	公司简介
                	
                </div>
                <div class="panel-body collapse in">
                    <textarea rows="5" id="" style="color:#E16326  ;border-radius: 15px" class="form-control" placeholder="" readonly="readonly">                   
  	我们将以装饰业的永恒目标，高速、高效、高品味、低费用为宗旨；在设计工艺上均以较高的资态活跃在装饰舞台上。
        我们期望是不求最好只求更好的理念，以全新的创意和完备的专业团队，寻求独到的设计解决方案。我们的首要目标是透过设计，为每一位客户找到最恰 当的定位，并为客户创造出最高的附加价值。
                    </textarea>
                </div>
            </div>
        </div>

    </div>
	
	<%-- 模态框 --%>
	<%@include file="page/tip.jsp" %>

	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/carousel.js" type="text/javascript" charset="utf-8"></script>

	<script type="text/javascript">
		$(document).ready(function() {
	
			//获取首页需要的三条信息			
			if("${Index}" != "1"){
				location.href="${pageContext.request.contextPath}/SelectGoodsServlet?flag=three&date="+Math.random();				
			}
			
		});	
	</script>
</body>
</html>
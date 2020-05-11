<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<title>登录页面</title>
	
	<style type="text/css">
	
		/*画一条在右边的竖线*/
        .link-left {
            width: 50px;
            height: 20%;
            border-right: solid #ACC0D8 1px;
        }
	</style>
	
</head>
<body>

	<div class="container-fluid">
	
		<div class="panel panel-default ">
		
		 	<div class="panel-heading">
		    	<h3 class="panel-title btn btn-info" style="width:100%; height:90px; padding-top:25px; font-size:30px; color:#EFF46B">
		    		装 饰 公 司 信 息 管 理 系 统
		    	</h3>
		  	</div><!-- panel-heading -->
		  	
		  	<div class="panel-body">

				<!-- 在logo右边画一条横线 -->
				<div class="link-left" style="float: left; border:1px solid #ccc; border-top-style:none;border-left-style:none;
					width:48%; height:500px; overflow: hidden; text-align:center; border-bottom-style:none;" >

					<img alt="装饰公司logo" title="装饰公司logo" src="${pageContext.request.contextPath}/images/logo.jpg" 
						style="max-width: 500px; max-height: 500px; margin-right:5%; margin-top:8%; float:right;">			
				</div><!-- link-left -->

				<div class="link-right"style="float: right; border:0px solid #ccc; width:50%; height:500px; padding-left:1%;
					padding-top:2%; padding-right:0%"; >
				
					<form action="${pageContext.request.contextPath}/LoginServlet" method="post" onsubmit="return check()">
						
						<div class="btn-success" style="width:90%; text-align: center; padding-top:5px; padding-bottom:5px; margin-bottom:7%;">
							<h2>装饰公司信息管理系统欢迎您</h2>
						</div>
							
						<span id="account-password" class="alert alert-danger" style="margin-left:20%; margin-bottom:3%; display: none;">
							账号或密码输入错误，请重新输入!
						</span>
							
						<div class="form-group" style="margin-bottom:16%; ">
							<label for="account" class="col-sm-3 control-label" style="text-align: center; font-size: 18px;">
								账&nbsp;&nbsp;&nbsp;号：
							</label> 										
							<div class="col-sm-9 form-group  has-feedback " id="div-account">						  
								<input type="text" class="form-control" name="account" id="account" 
								  	autocomplete="on"  placeholder="请输入账号" style=" width:50%; ">
								<span class="glyphicon glyphicon-remove form-control-feedback"  style=" width:110%; display: none;"></span>
							  	<label class="control-label" for="account" style="display: none;">账号格式不正确，账号为您的电话号码</label>
							  	<span class="glyphicon glyphicon-remove form-control-feedback" style=" width:110%; display: none; margin-top:-5%;"></span>
							  	<label class="control-label" for="account" style="display: none;">账号不能为空</label>
							</div>
						</div>
						
						<div class="form-group" style="margin-bottom:27%; " >
							<label for="password" class="col-sm-3 control-label" style="text-align: center; font-size: 18px; ">
								密&nbsp;&nbsp;&nbsp;码：
							</label> 
							<div class="col-sm-9 form-group  has-feedback" id="div-password">					  
							  	<input type="password" class="form-control" name="password" id="password" 
							  		autocomplete="on"  placeholder="请输入密码" style=" width:50%; ">
							  	<span class="glyphicon glyphicon-remove form-control-feedback"  style=" width:110%; display: none;"></span>
							  	<label class="control-label" for="password" style="display: none;">密码格式不正确，密码只能是6-10位字符</label>
							  	<span class="glyphicon glyphicon-remove form-control-feedback" style=" width:110%; display: none; margin-top:-5%;"></span>
							  	<label class="control-label" for="password" style="display: none;">密码不能为空</label>
							</div>
						</div>

						<div class="form-group">
							<label for="loginCode" class="col-sm-3 control-label" style="text-align: center; font-size: 18px; ">
								验证码：
							</label> 
							<div class="col-sm-9 form-group  has-feedback" id="div-loginCode">	
								<div style="float:left; width:33%; ">
									<input type="text" class="form-control" name="loginCode" id="loginCode" 
										autocomplete="off" placeholder="输入验证码" >
										
									<c:if test="${ErrorCode == 'errorCode'}">
										<span class="glyphicon glyphicon-remove form-control-feedback" style=" width:140%; display: block;"></span>
										<label class="control-label" for="loginCode" style="display: block;">验证码错误</label>
									</c:if>
									<c:if test="${ErrorCode != 'errorCode'}">
										<span></span>
										<label></label>
									</c:if>
									<span class="glyphicon glyphicon-remove form-control-feedback" style=" width:140%; display: none; margin-top:-5%;"></span>
							  		<label class="control-label" for="loginCode" style="display: none;">验证码不能为空</label>
							  			
								</div>
								<div style="float:left; ">
									<img class="code-img" src="${pageContext.request.contextPath}/validcode" 
										width="74" height="32" style="margin-left:6px; border:1px solid #ccc;">
									<a class=" " style="font-size:13px; " >看不清楚？换一张</a>
								</div>
								
							</div>
						</div>
						 
						<input type="checkbox" name="autoLogin" id="auto-login" value="autoLogin" class="" style="margin-left: 20%;"> 
						<label for="auto-login" >下次自动登录</label>
						<a href="${pageContext.request.contextPath}/page/password.jsp" style="margin-left: 15%;">忘记密码？</a>
					
						<div class="btn-group btn-group-justified" role="group" style=" width:50%; margin-left:20%; margin-top:2%;">
						  	<div class="btn-group" role="group" style="">
						    	<input type="submit" class=" btn btn-info" value="登录" id="btn-login" style="background-color: #31C7F2; 
						    		data-toggle="tooltip" data-placement="bottom" title="尊敬的用户，请登录！"">
						  	</div>
						   
						  	<div class="btn-group" role="group">
						  		<input type="button" class=" btn btn-info" value="注册" id="btn-register" style="background-color: #31C7F2;"
						  			data-toggle="tooltip" data-placement="bottom" title="未拥有账户，请注册！" 
						  			onClick="window.location.href='${pageContext.request.contextPath}/page/register.jsp'">
						  			
						  	</div>
						  	
						  	<div class="btn-group" role="group">
						  		<input type="button" class=" btn btn-info" value="返回" id="btn-back" style="background-color: #31C7F2;"
						  			data-toggle="tooltip" data-placement="bottom" title="返回首页！" 
						  			onClick="window.location.href='${pageContext.request.contextPath}/index.jsp'">
						  			
						  	</div>
						</div>

			

					</form><!-- 表单end -->
				</div><!-- link-right -->
			</div> <!-- panel-body -->
			
			<div class="panel-footer" style="width:100%; height:40px;">

				<p class="copyright" style="width:100%; text-align:center">
					©&nbsp;&nbsp;2020&nbsp;&nbsp;
					xxx有限公司&nbsp;&nbsp;
					xxxx.com&nbsp;&nbsp;
					京ICP证xxxxxx号&nbsp;&nbsp;
					京ICP备xxxxxxxx号&nbsp;&nbsp;
					京公网安备xxxxxx号
				</p>	
			
			</div><!-- panel-footer -->				
		</div><!-- panel -->
	</div><!-- container-fluid -->
	
	<!-- 外部js放body底部不会产生节点丢失情况，推荐放这里 -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
	
		$(function(){
			
			$(".code-img").attr("src","${pageContext.request.contextPath}/validcode?date="+Math.random());
			
			/* 判断账户，密码是否输入正确 */
			var ErrorAccount = "${ErrorAccount}";
			if(ErrorAccount == "errorAccount")
				$("#account-password").css("display","inline").fadeOut(3000);
			
			/* 判断验证码是否正确 */
			var ErrorCode = "${ErrorCode}";
			if(ErrorCode == "errorCode")
				$("#div-loginCode").addClass("has-error");	
			
			/* 更新验证码 */
			$("a:eq(0)").click(function(){
				//浏览器带有缓存功能,不会多次请求相同数据
				$(".code-img").attr("src","${pageContext.request.contextPath}/validcode?date="+Math.random());
				return false;
			});	
			
			/* 表单验证 */
			$("#btn-login").click(function () {
				
				$("#div-account, #div-password, #div-loginCode").removeClass("has-error");	
				$("#account, #password, #loginCode").next().css("display","none");
		    	$("#account, #password, #loginCode").next().next().css("display","none");
		    	$("#account, #password, #loginCode").next().next().next().css("display","none");
		    	$("#account, #password, #loginCode").next().next().next().next().css("display","none");
				flag = true;
				
			   //判断用户名是否为空
			    if ($("#account").val()==''){
			    	$("#div-account").addClass("has-error");	
			    	$("#account").next().next().next().css("display","block");
			    	$("#account").next().next().next().next().css("display","block");	
			    	flag = false;
			    }
			    //判断密码是否为空
			    if($("#password").val()==''){
			    	$("#div-password").addClass("has-error");	
			    	$("#password").next().next().next().css("display","block");
			    	$("#password").next().next().next().next().css("display","block");	
			    	flag = false;
			    }
			    //判断验证码是否为空
			    if($("#loginCode").val()==''){
			    	$("#div-loginCode").addClass("has-error");	
			    	$("#loginCode").next().next().next().css("display","block");
			    	$("#loginCode").next().next().next().next().css("display","block");	
			    	flag = false;
			    }
			    
			    ///用户名只能是电话号码
			    var reg1=new RegExp(/^1(3|4|5|7|8)\d{9}$/);
			    if(!reg1.test($("#account").val()) && $("#account").val()!=''){
					$("#div-account").addClass("has-error");	
			    	$("#account").next().css("display","block");
			    	$("#account").next().next().css("display","block");
					flag = false;
				}
				
				//密码只能是6-10位字符
				var reg2=new RegExp(/^[a-zA-Z0-9]{6,10}$/);
				if(!reg2.test($("#password").val()) && $("#password").val()!=''){
					$("#div-password").addClass("has-error");	
			    	$("#password").next().css("display","block");
			    	$("#password").next().next().css("display","block");	
					flag = false;
				} 
			    
			});
/* 			
			$("#btn-register").click(function(){
				alert("123");
			}); */
			
		});
		
		//表单验证通过返回true
		function check(){

			return flag;
		};
		
	</script>
</body>
</html>


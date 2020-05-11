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
	<title>找回密码</title>
  </head>
  <body>
  
	<div class="container-fluid">
	
		<div class="panel panel-default ">
		
		 	<div class="panel-heading">
		    	<h3 class="panel-title btn btn-info" style="width:100%; height:90px; padding-top:25px; font-size:30px; color:#EFF46B">
		    		装 饰 公 司 信 息 管 理 系 统
		    	</h3>
		  	</div><!-- panel-heading -->
		  	
		  	<div class="panel-body" style="margin:0px auto; width:100%; height: 500px;">
		  	
		  		<span id="error" class="alert alert-danger" style="margin-bottom:3%; display: none;">
						重置密码失败！！！
				</span>
				
				<span id="success" class="alert alert-success" style=" width:100%; margin-bottom:3%; display: none;">
						重置密码成功！
				</span>
				
				
		  		<form action="${pageContext.request.contextPath}/PasswordServlet" method="post" onsubmit="return check()" >
		  			
		  			<br /><br />
		  			<div class="form-group" style=" ">
						<label for="account" class="col-sm-5 control-label" style="text-align: right; font-size: 20px;">
							原始账号&nbsp;<span style="color:red;">*</span>：
						</label> 										
						<div class="col-sm-7 form-group  has-feedback " id="div-account">						  
							<input type="text" class="form-control" name="account" id="account" 
							  	autocomplete="on"  placeholder="请输入账号" style=" width:50%; ">
							<span class="glyphicon glyphicon-remove form-control-feedback"  style=" width:110%; display: none;"></span>
						  	<label class="control-label" for="account" style="display: none;">账号为您的电话号码</label>
						  	<span class="glyphicon glyphicon-remove form-control-feedback" style=" width:110%; display: none; margin-top:-4%;"></span>
						  	<label class="control-label" for="account" style="display: none;">账号不能为空</label>
						  	<span class="glyphicon glyphicon-remove form-control-feedback" style=" width:110%; display: none; margin-top:-4%;"></span>
						  	<label class="control-label" for="account" style="display: none;">此账号不存在，请先注册！</label>
						</div>
					</div>
					
					<br /><br />
					<div class="form-group" style=" ">
						<label for="mail" class="col-sm-5 control-label" style="text-align: right; font-size: 20px;">
							原始邮箱&nbsp;<span style="color:red;">*</span>：
						</label> 										
						<div class="col-sm-7 form-group  has-feedback " id="div-mail">	
							<div class="input-group" id="group-mail">
    							<span class="input-group-addon">@</span>					  
								<input type="text" class="form-control" name="mail" id="mail" 
							  		autocomplete="on"  placeholder="请输入邮箱" style="width:46.5%; ">
							</div>
							<span class="glyphicon glyphicon-remove form-control-feedback"  style=" width:110%; display: none;"></span>
						  	<label class="control-label" for="mail" style="display: none;">邮箱格式不正确</label>
						  	<span class="glyphicon glyphicon-remove form-control-feedback" style=" width:110%; display: none; margin-top:-4%;"></span>
						  	<label class="control-label" for="mail" style="display: none;">邮箱不能为空</label>
						  	<span class="glyphicon glyphicon-remove form-control-feedback" style=" width:110%; display: none; margin-top:-4%;"></span>
						  	<label class="control-label" for="mail" style="display: none;">此邮箱与该账号不匹配，请重新输入！</label>
						</div>
					</div>
						
					<br /><br />	
					<div class="form-group" style="" >
						<label for="password" class="col-sm-5 control-label" style="text-align: right; font-size: 20px; ">
							新密码&nbsp;<span style="color:red;">*</span>：
						</label> 
						<div class="col-sm-7 form-group  has-feedback" id="div-password">					  
						  	<input type="password" class="form-control" name="password" id="password" 
						  		autocomplete="on"  placeholder="请输入密码" style=" width:50%; ">
						  	<span class="glyphicon glyphicon-remove form-control-feedback"  style=" width:110%; display: none;"></span>
						  	<label class="control-label" for="password" style="display: none;">密码格式不正确</label>
						  	<span class="glyphicon glyphicon-remove form-control-feedback" style=" width:110%; display: none; margin-top:-4%;"></span>
						  	<label class="control-label" for="password" style="display: none;">密码不能为空</label>
						</div>
					</div>
					
					<br /><br />
					<div class="form-group" style="" >
						<label for="repassword" class="col-sm-5 control-label" style="text-align: right; font-size: 20px; ">
							确认密码<span style="color:red;">*</span>：
						</label> 
						<div class="col-sm-7 form-group  has-feedback" id="div-repassword">					  
						  	<input type="password" class="form-control" name="repassword" id="repassword" 
						  		autocomplete="on"  placeholder="请确认密码" style=" width:50%; ">
						  	<span class="glyphicon glyphicon-remove form-control-feedback"  style=" width:110%; display: none;"></span>
						  	<label class="control-label" for="repassword" style="display: none;">两次密码不一致</label>	
						  	<span class="glyphicon glyphicon-remove form-control-feedback" style=" width:110%; display: none; margin-top:-4%;"></span>
						  	<label class="control-label" for="repassword" style="display: none;">请再次输入密码</label>					  	
						</div>
					</div>
					
					<br /><br />
					<div class="btn-group btn-group-justified" role="group" style=" width:30%; margin-left:36%; margin-top:2%;">
					  	<div class="btn-group" role="group" style="">
					    	<input type="submit" class=" btn btn-info" value="重置密码" id="btn-register" style="background-color: #31C7F2; 
					    		data-toggle="tooltip" data-placement="bottom" title="尊敬的用户，请选择找回密码！">
					  	</div>
					   
					  	<div class="btn-group" role="group">
					  		<input type="button" class=" btn btn-info" value="返回登录" id="btn-back" style="background-color: #31C7F2;"
					  			data-toggle="tooltip" data-placement="bottom" title="请返回！" 
					  			onClick="window.location.href='${pageContext.request.contextPath}/page/login.jsp'">					  			
					  	</div>
					</div>
					
		  		</form>
		  		
		  	</div> <!-- panel-body -->
		  	
		</div><!-- panel -->
		
	</div><!-- container-fluid -->
	
	<!-- 外部js放body底部不会产生节点丢失情况，推荐放这里 -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
	
		$(function(){
						
			/* 重置密码失败！*/	
			var Error = "${Error}";
			if(Error == "error")
				$("#error").css("display","inline").fadeOut(3000);
			
			/* 重置密码失败！*/	
			var Success = "${Success}";
			if(Success == "success")
				$("#success").css("display","inline").fadeOut(3000);
			
			/* 账户框失去焦点时检测输入账户是否已存在 */
			$("#account").blur(function(){
				
				//alert("账户输入完毕");
				var value = $("#account").val();
				$.ajax({
					url:'${pageContext.request.contextPath}/PasswordServlet?flag=account',
					data:{"newAccount":value},
					dataType:'text',
					error:function(){						
						alert("请求出错.")
					},
					success:function(data){
						//alert("data:"+data);
						if(data != 1 && $("#account").val()!=''){
							flag = false;
							$("#div-account").addClass("has-error");	
							$("#account").next().next().next().next().next().css("display","block");
					    	$("#account").next().next().next().next().next().next().css("display","block");
						}	
						if(data == 1 && $("#account").val()!=''){
							flag = true;
							$("#div-account").removeClass("has-error");	
							$("#account").next().next().next().next().next().css("display","none");
					    	$("#account").next().next().next().next().next().next().css("display","none");
						}
					},
					type:'POST'	
				});
			});
			
			/* 账户框失去焦点时检测输入账户是否已存在 */
			$("#mail").blur(function(){
				
				//alert("账户输入完毕");
				var mail = $("#mail").val();
				var account = $("#account").val();
				$.ajax({
					url:'${pageContext.request.contextPath}/PasswordServlet?flag=mail',
					data:{"newMail":mail,"newAccount":account},
					dataType:'text',
					error:function(){						
						alert("请求出错.")
					},
					success:function(data){
						
						if(data != 1 && $("#mail").val()!=''){
							flag = false;
							$("#div-mail").addClass("has-error");	
							$("#group-mail").next().next().next().next().next().css("display","block");
					    	$("#group-mail").next().next().next().next().next().next().css("display","block");
						}	
						if(data == 1 && $("#mail").val()!=''){
							flag = true;
							$("#div-mail").removeClass("has-error");	
							$("#group-mail").next().next().next().next().next().css("display","none");
					    	$("#group-mail").next().next().next().next().next().next().css("display","none");
						}
					},
					type:'POST'	
				});
			});
			
			/* 表单验证 */
			$("#btn-register").click(function () {
				
				$("#div-account, #div-password, #div-repassword, #div-mail").removeClass("has-error");	
				$("#account, #password, #repassword, #group-mail").next().css("display","none");
		    	$("#account, #password, #repassword, #group-mail").next().next().css("display","none");
		    	$("#account, #password, #repassword, #group-mail").next().next().next().css("display","none");
		    	$("#account, #password, #repassword, #group-mail").next().next().next().next().css("display","none");		    	
				flag = true;
							
			   //判断账户是否为空
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
			  	//判断确认密码是否为空
			    if($("#repassword").val()==''){
			    	$("#div-repassword").addClass("has-error");	
			    	$("#repassword").next().next().next().css("display","block");
			    	$("#repassword").next().next().next().next().css("display","block");	
			    	flag = false;
			    }				  	
			  		  	
			  	//判断邮箱是否为空
			    if($("#mail").val() == ''){			    	
			    	$("#div-mail").addClass("has-error");	
			    	$("#group-mail").next().next().next().css("display","block");
			    	$("#group-mail").next().next().next().next().css("display","block");	
			    	flag = false;
			    }		 		  
			    ///账号只能是电话号码
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
				//确认密码必须与密码相等
				if(($("#repassword").val() != $("#password").val()) && $("#repassword").val()!='' ){
					$("#div-repassword").addClass("has-error");	
			    	$("#repassword").next().css("display","block");
			    	$("#repassword").next().next().css("display","block");	
					flag = false;
				} 
				//判断邮箱格式
				var reg5=new RegExp(/^\w+@\w+(\.[a-zA-Z]{2,3}){1,2}$/);
				if(!reg5.test($("#mail").val()) && $("#mail").val()!=''){
					$("#div-mail").addClass("has-error");	
			    	$("#group-mail").next().css("display","block");
			    	$("#group-mail").next().next().css("display","block");
					flag = false;
				} 
				//alert(flag);
			});
			
		});
		
		//表单验证通过返回true
		function check(){
			//alert(flag);
			return flag;
		};
		
		
	</script>
  </body>
</html>
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
	<title>注册页面</title>
  </head>
  <body>

	<div class="container-fluid">
	
		<div class="panel panel-default ">
		
		 	<div class="panel-heading">
		    	<h3 class="panel-title btn btn-info" style="width:100%; height:90px; padding-top:25px; font-size:30px; color:#EFF46B">
		    		装 饰 公 司 信 息 管 理 系 统
		    	</h3>
		  	</div><!-- panel-heading -->
		  	
		  	<div class="panel-body" style="margin:0px auto; width:100%; height: 550px;">
		  	
		  		<span id="one" class="alert alert-danger" style="margin-bottom:3%; display: none;">
						单个文件超出最大值！！！
				</span>
				<span id="count" class="alert alert-danger" style="margin-bottom:3%; display: none;">
						上传文件的总的大小超出限制的最大值！！！
				</span>
		  		<span id="failing" class="alert alert-danger" style="margin-bottom:3%; display: none;">
						文件上传失败！
				</span>
				
		  		<form action="${pageContext.request.contextPath}/RegisterServlet" enctype="multipart/form-data" method="post" onsubmit="return check()" >
		  			
		  			<div class="form-group" style=" ">
						<label for="account" class="col-sm-5 control-label" style="text-align: right; font-size: 20px;">
							账&nbsp;&nbsp;&nbsp;号&nbsp;<span style="color:red;">*</span>：
						</label> 										
						<div class="col-sm-7 form-group  has-feedback " id="div-account">						  
							<input type="text" class="form-control" name="account" id="account" 
							  	autocomplete="on"  placeholder="请输入账号" style=" width:50%; ">
							<span class="glyphicon glyphicon-remove form-control-feedback"  style=" width:110%; display: none;"></span>
						  	<label class="control-label" for="account" style="display: none;">账号为您的电话号码</label>
						  	<span class="glyphicon glyphicon-remove form-control-feedback" style=" width:110%; display: none; margin-top:-4%;"></span>
						  	<label class="control-label" for="account" style="display: none;">账号不能为空</label>
						  	<span class="glyphicon glyphicon-remove form-control-feedback" style=" width:110%; display: none; margin-top:-4%;"></span>
						  	<label class="control-label" for="account" style="display: none;">此账号已存在，无需重复注册！</label>
						</div>
					</div>
					
					<div class="form-group" style=" ">
						<label for="account" class="col-sm-5 control-label" style="text-align: right; font-size: 20px;">
							姓&nbsp;&nbsp;&nbsp;名&nbsp;<span style="color:red;">*</span>：
						</label> 										
						<div class="col-sm-7 form-group  has-feedback " id="div-username">						  
							<input type="text" class="form-control" name="username" id="username" 
							  	autocomplete="on"  placeholder="请输入姓名" style=" width:50%; ">
							<span class="glyphicon glyphicon-remove form-control-feedback"  style=" width:110%; display: none;"></span>
						  	<label class="control-label" for="username" style="display: none;">姓名格式不正确,2-5个中文</label>
						  	<span class="glyphicon glyphicon-remove form-control-feedback" style=" width:110%; display: none; margin-top:-4%;"></span>
						  	<label class="control-label" for="username" style="display: none;">姓名不能为空</label>
						</div>
					</div>
						
					<div class="form-group" style="" >
						<label for="password" class="col-sm-5 control-label" style="text-align: right; font-size: 20px; ">
							密&nbsp;&nbsp;&nbsp;码&nbsp;<span style="color:red;">*</span>：
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
					
					<div class="form-group" style="" >
						<label for="" class="col-sm-5 control-label" style="text-align: right; font-size: 20px; ">
							性&nbsp;&nbsp;&nbsp;别&nbsp;<span style="color:red;">*</span>：
						</label> 
						<div class="col-sm-7 form-group  has-feedback" id="div-sex">	
										  
						  	<input type="radio" id="sex_radio_1" value="男" name="sex"> 
						  	<img src="${pageContext.request.contextPath}/images/Male.gif"> <label for="sex_radio_1"> 男 </label>
						  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" id="sex_radio_2" value="女" name="sex" > 
							<img src="${pageContext.request.contextPath}/images/Female.gif"> <label for="sex_radio_2"> 女 </label>
							<label class="control-label" id="label-sex" style="display: none;" >您需要选择性别！</label>
						  							  	
						</div>
					</div>

					<div class="form-group" style=" ">
						<label for="mail" class="col-sm-5 control-label" style="text-align: right; font-size: 20px;">
							邮&nbsp;&nbsp;&nbsp;箱&nbsp;<span style="color:red;">*</span>：
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
						</div>
					</div>
					
					<div class="form-group" style=" ">
						<label for="photo" class="col-sm-5 control-label" style="text-align: right; font-size: 20px;">
							上传头像：
						</label> 										
						<div class="col-sm-7 form-group  has-feedback " id="div-photo">						  
							<input type="file" class="form-control" name="photo" id="photo" style=" width:50%; "/><br/>
							<span class="glyphicon glyphicon-remove form-control-feedback" id="span-photo" style=" width:110%; display: none;"></span>
						  	<label class="control-label" for="photo" id="label-photo" style="display: none; margin-top:-3%;">上传头像非图片格式</label>
						</div>
					</div>
					
					<div class="btn-group btn-group-justified" role="group" style=" width:30%; margin-left:36%; margin-top:2%;">
					  	<div class="btn-group" role="group" style="">
					    	<input type="submit" class=" btn btn-info" value="注册账户" id="btn-register" style="background-color: #31C7F2; 
					    		data-toggle="tooltip" data-placement="bottom" title="尊敬的用户，请注册！"">
					  	</div>
					   
					  	<div class="btn-group" role="group">
					  		<input type="button" class=" btn btn-info" value="返回登录" id="btn-login" style="background-color: #31C7F2;"
					  			data-toggle="tooltip" data-placement="bottom" title="请返回登录页面！" 
					  			onClick="window.location.href='${pageContext.request.contextPath}/page/login.jsp'">					  			
					  	</div>
					  	
					  	<div class="btn-group" role="group">
					  		<input type="button" class=" btn btn-info" value="返回首页" id="btn-index" style="background-color: #31C7F2;"
					  			data-toggle="tooltip" data-placement="bottom" title="请返回首页！" 
					  			onClick="window.location.href='${pageContext.request.contextPath}/index.jsp'">					  			
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
					
			var uploadError = "${uploadError}";
			/* 单个文件超出最大值！！！ */			
			if(uploadError == "单个文件超出最大值！！！")
				$("#one").css("display","inline").fadeOut(3000);
			
			/* 上传文件的总的大小超出限制的最大值！！！ */
			if(uploadError == "上传文件的总的大小超出限制的最大值！！！")
				$("#count").css("display","inline").fadeOut(3000);
			
			/* 文件上传失败！ */
			if(uploadError == "文件上传失败！")
				$("#failing").css("display","inline").fadeOut(3000);
			
			/* 账户框失去焦点时检测输入账户是否已存在 */
			$("#account").blur(function(){
				
				//alert("账户输入完毕");
				var value = $("#account").val();
				$.ajax({
					url:'${pageContext.request.contextPath}/RegisterServlet?flag=1',
					data:{"newAccount":value},
					dataType:'text',
					error:function(){						
						alert("请求出错.")
					},
					success:function(data){
						
						if(data > 0){
							flag = false;
							$("#div-account").addClass("has-error");	
							$("#account").next().next().next().next().next().css("display","block");
					    	$("#account").next().next().next().next().next().next().css("display","block");
						}	
						else{
							flag = true;
							$("#div-account").removeClass("has-error");	
							$("#account").next().next().next().next().next().css("display","none");
					    	$("#account").next().next().next().next().next().next().css("display","none");
						}
					},
					type:'POST'	
				});
			});
			
			/* 表单验证 */
			$("#btn-register").click(function () {
				
				$("#div-account, #div-username, #div-password, #div-repassword, #div-sex, #div-mail, #div-photo").removeClass("has-error");	
				$("#account, #username, #password, #repassword, #group-mail").next().css("display","none");
		    	$("#account, #username, #password, #repassword, #group-mail").next().next().css("display","none");
		    	$("#account, #username, #password, #repassword, #group-mail").next().next().next().css("display","none");
		    	$("#account, #username, #password, #repassword, #group-mail").next().next().next().next().css("display","none");
		    	$("#label-sex").css("display","none");
		    	$("#span-photo").css("display","none");		    	
		    	$("#label-photo").css("display","none");
				flag = true;
				
				//获取上传文件的后缀名[bmp,jpg,png,tif,gif,pcx,tga,exif,fpx,svg,psd,cdr,pcd,dxf,ufo,eps,ai,raw,WMF,webp]
				var path = $("#photo").val();					
				var suffixName = path.substr(path.lastIndexOf("."));
				if(suffixName != ""){
					var arr = new Array(".bmp",".jpg",".png",".tif",".gif",".svg",".psd",".WMF",".webp");
					for(var i = 0; i < arr.length; i++){
						if(arr[i].toLowerCase() == suffixName.toLowerCase()){
							//alert("格式正确");
							flag = true;
							break;
						}
						flag = false;	
					} 
					//如果匹配失败
					if(!flag){
						//alert("格式错误");
						$("#div-photo").addClass("has-error");	
						$("#span-photo").css("display","block");
						$("#label-photo").css("display","block");
					}
				}
				//如果用户未上传头像，则自动帮其上传默认头像
				/* if(suffixName == "" && ($('input:radio[name="sex"]:checked').val() == "男")){
					$("#photo").val("/images/default-man.png");
				}
				if(suffixName == "" && ($('input:radio[name="sex"]:checked').val() == "女")){
					$("#photo").val("/images/default-woman.png");
				}	 */			
				
			   //判断账户是否为空
			    if ($("#account").val()==''){
			    	$("#div-account").addClass("has-error");	
			    	$("#account").next().next().next().css("display","block");
			    	$("#account").next().next().next().next().css("display","block");	
			    	flag = false;
			    }
			  //判断用户名是否为空
			    if ($("#username").val()==''){
			    	$("#div-username").addClass("has-error");	
			    	$("#username").next().next().next().css("display","block");
			    	$("#username").next().next().next().next().css("display","block");	
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
			  	//获取被选中单选框的值
				var list= $('input:radio[name="sex"]:checked').val(); 
				//判断性别是否为空
			    if(list == null){
			    	$("#div-sex").addClass("has-error");
			    	$("#label-sex").css("display","none");
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
			  	//判断用户名只能是中文
				var reg2=new RegExp(/^[\u4E00-\u9FA5]{2,5}$/);
				if(!reg2.test($("#username").val()) && $("#username").val()!=''){
					$("#div-username").addClass("has-error");	
			    	$("#username").next().css("display","block");
			    	$("#username").next().next().css("display","block");
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


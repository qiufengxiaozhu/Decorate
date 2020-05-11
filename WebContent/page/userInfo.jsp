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
	<title>个人信息</title>
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
		  	
		  		<div class="link-left" style="float: left; border:1px solid #ccc; border-top-style:none;border-left-style:none;
					width:28%; height:500px; overflow: hidden; text-align:center; margin-left:3%; border-bottom-style:none;" >
					
					<form action="${pageContext.request.contextPath}/UserInfoServlet?type=photo" enctype="multipart/form-data" method="post" onsubmit="return checkPhoto()" >
						<div class="form-group" style=" ">
							<label for="" class="alert alert-info" style="margin-top:7%; margin-left:3%; float:left;">
								头&nbsp;&nbsp;&nbsp;像&nbsp;：
							</label>
							<img alt="头像" title="头像" src="${userPhoto}" 
								style="max-width: 200px; max-height: 200px; vertical-align: top; margin-top:7%;">	
						</div>		
						
						<div class="form-group" style=" ">
							<label for="photo" class=" alert alert-info" id="label-photo" style="margin-top:7%; margin-left:3%; float:left;">
								更换头像:
							</label> 
							<span id="photoSuccess" class="alert alert-success" style="margin-top:7%; width:40%; float:right; margin-right:3%; display: none;">
								头像更换成功
							</span>										
							<div class="col-sm-12 form-group  has-feedback " id="div-photo">						  
								<input type="file" class="form-control" name="photo" id="photo" style=" width:100%; "/><br/>
								<span class="glyphicon glyphicon-remove form-control-feedback" id="span-photo-1" style=" width:20%; display: none;"></span>
							  	<label class="control-label" for="photo" id="label-photo-1" style="display: none;">不能上传空图片</label>
								<span class="glyphicon glyphicon-remove form-control-feedback" id="span-photo-2" style=" width:20%; display: none;margin-top:-6%;"></span>
							  	<label class="control-label" for="photo" id="label-photo-2" style="display: none;">上传头像非图片格式</label>
							</div>
							<div class="col-sm-12 form-group  has-feedback " id="btn-photo" style="">						  
								<input type="submit" class="col-sm-5 btn btn-success" value="保存" id="btn-save" />
						    	<span class="col-sm-1"> </span>
						    	<input type="button" class="col-sm-5 btn btn-danger" value="撤销" id="btn-cancel" />
							</div>
						</div>
					</form>
				</div><!-- link-left -->

				<div class="link-right"style="float: left; border:0px solid #ccc; width:60%; height:500px; padding-left:1%;
					padding-top:2%; padding-right:0%"; >
					<a href="${pageContext.request.contextPath}/index.jsp?flag=login" style="text-decoration: none">
						<span id="index" class="alert alert-success glyphicon glyphicon-home" style=" width:15%; margin-bottom:3%; ">
							返回
						</span>
					</a>
					
					<div id="alter" class="alert alert-info glyphicon glyphicon-pencil" style=" width:15%; margin-bottom:3%; cursor:pointer; ">
						修改
					</div>
					
					<div class="alert alert-warning " style=" width:30%;margin-bottom:3%; cursor:pointer; float:left;margin-right:5px;">
						会员等级：${User.member }
					</div>
					<div class="alert alert-danger " style=" width:30%;margin-bottom:3%; cursor:pointer; ">
						总消费：${User.total } 元
					</div>
									
					<form action="${pageContext.request.contextPath}/UserInfoServlet?type=info" method="post" onsubmit="return checkInfo()" >
			  			<div class="form-group" style=" ">
							<label for="account" class="col-sm-3 control-label" style="text-align: right; font-size: 20px;">
								账&nbsp;&nbsp;&nbsp;号&nbsp;<span style="color:red;">*</span>：
							</label> 										
							<div class="col-sm-9 form-group  has-feedback " id="div-account">						  
								<input type="text" class="form-control" name="account" id="account" value="${User.account }" 
								  	autocomplete="on"  placeholder="请输入账号" style=" width:50%; ">
								<span class="glyphicon glyphicon-remove form-control-feedback"  style=" width:110%; display: none;"></span>
							  	<label class="control-label" for="account" style="display: none;">账号为您的电话号码</label>
							  	<span class="glyphicon glyphicon-remove form-control-feedback" style=" width:110%; display: none; margin-top:-4%;"></span>
							  	<label class="control-label" for="account" style="display: none;">账号不能为空</label>
							  	<span class="glyphicon glyphicon-remove form-control-feedback" style=" width:110%; display: none; margin-top:-4%;"></span>
							  	<label class="control-label" for="account" style="display: none;">此账号已存在，无需重复注册！</label>
							</div>
						</div>
						<br />
						
						<div class="form-group" style=" ">
							<label for="account" class="col-sm-3 control-label" style="text-align: right; font-size: 20px;">
								姓&nbsp;&nbsp;&nbsp;名&nbsp;<span style="color:red;">*</span>：
							</label> 										
							<div class="col-sm-9 form-group  has-feedback " id="div-username">						  
								<input type="text" class="form-control" name="username" id="username" value="${User.name }" 
								  	autocomplete="on"  placeholder="请输入姓名" style=" width:50%; ">
								<span class="glyphicon glyphicon-remove form-control-feedback"  style=" width:110%; display: none;"></span>
							  	<label class="control-label" for="username" style="display: none;">姓名格式不正确,2-5个中文</label>
							  	<span class="glyphicon glyphicon-remove form-control-feedback" style=" width:110%; display: none; margin-top:-4%;"></span>
							  	<label class="control-label" for="username" style="display: none;">姓名不能为空</label>
							</div>
						</div>
						<br />
							
						<div class="form-group" style="" >
							<label for="password" class="col-sm-3 control-label" style="text-align: right; font-size: 20px; ">
								密&nbsp;&nbsp;&nbsp;码&nbsp;<span style="color:red;">*</span>：
							</label> 
							<div class="col-sm-9 form-group  has-feedback" id="div-password">					  
							  	<input type="text" class="form-control" name="password" id="password" value="${User.password }" 
							  		autocomplete="on"  placeholder="请输入密码" style=" width:50%; ">
							  	<span class="glyphicon glyphicon-remove form-control-feedback"  style=" width:110%; display: none;"></span>
							  	<label class="control-label" for="password" style="display: none;">密码只能是6-10位字符</label>
							  	<span class="glyphicon glyphicon-remove form-control-feedback" style=" width:110%; display: none; margin-top:-4%;"></span>
							  	<label class="control-label" for="password" style="display: none;">密码不能为空</label>
							</div>
						</div>
						<br />
					
						<div class="form-group" style="" >
							<label for="" class="col-sm-3 control-label" style="text-align: right; font-size: 20px; ">
								性&nbsp;&nbsp;&nbsp;别&nbsp;<span style="color:red;">*</span>：
							</label> 
							<div class="col-sm-9 form-group  has-feedback" id="div-sex">	
								<c:if test="${User.sex == '男' }">
									
							  		<img src="${pageContext.request.contextPath}/images/Male.gif" > 
							  		<label for="sex_radio_1" id="label-sex"> 男 </label>
								</c:if>			  							  	
							  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  	<c:if test="${User.sex == '女' }">
									
									<img src="${pageContext.request.contextPath}/images/Female.gif"> 
									<label for="sex_radio_2" id="label-sex"> 女 </label>
								</c:if>
								<label class="control-label" id="label-sex" style="display: none;" >您需要选择性别！</label>
							  							  	
							</div>
						</div>
						<br />
						
						<div class="form-group" style=" ">
							<label for="mail" class="col-sm-3 control-label" style="text-align: right; font-size: 20px;">
								邮&nbsp;&nbsp;&nbsp;箱&nbsp;<span style="color:red;">*</span>：
							</label> 										
							<div class="col-sm-9 form-group  has-feedback " id="div-mail">	
								<div class="input-group" id="group-mail">
	    							<span class="input-group-addon">@</span>					  
									<input type="text" class="form-control" name="mail" id="mail" value="${User.mail }" 
								  		autocomplete="on"  placeholder="请输入邮箱" style="width:46.5%; ">
								</div>
								<span class="glyphicon glyphicon-remove form-control-feedback"  style=" width:110%; display: none;"></span>
							  	<label class="control-label" for="mail" style="display: none;">邮箱格式不正确</label>
							  	<span class="glyphicon glyphicon-remove form-control-feedback" style=" width:110%; display: none; margin-top:-4%;"></span>
							  	<label class="control-label" for="mail" style="display: none;">邮箱不能为空</label>
							</div>
						</div>
						<br />
						
						<div class="form-group" style=" ">
																	
							<div class="col-sm-8 form-group  has-feedback " id="btn-info" style="display:none;">		
								<span class="col-sm-1"> </span>				  
								<input type="submit" class="col-sm-5 btn btn-success" value="保存" id="btn-save-2" />
						    	<span class="col-sm-1"> </span>
						    	<input type="button" class="col-sm-5 btn btn-danger" value="撤销" id="btn-cancel-2" />
							</div>
						</div>
					</form>
					
				</div><!-- link-right -->
		  	
		  	</div> <!-- panel-body -->
		  	
		</div><!-- panel -->
		
	</div><!-- container-fluid -->
	
	<!-- 外部js放body底部不会产生节点丢失情况，推荐放这里 -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
	
		$(function(){
			
			/* 头像上传成功！ */
			var PhotoSuccess = "${PhotoSuccess}";
			if(PhotoSuccess == "photoSuccess")
				$("#photoSuccess").css("display","inline").fadeOut(3000);
						
			//$("#username").css({"cursor":"not-allowed","readonly":"readonly"});
			/* 右侧文本框设置手型、设置禁用 */
			$("#account,#username,#password,#mail,img,#label-sex").css("cursor", "not-allowed");
			$("#account,#username,#password,#mail,img,#label-sex").attr("readonly","readonly");
			
			/* 左侧 保存 撤销按钮 隐藏*/
			$("#btn-photo").css("display","none");
			
			$("#div-photo").removeClass("has-error");	
			$("#span-photo-1,#span-photo-2,#label-photo-1,#label-photo-2").css("display","none");
			

			/* 右侧修改按钮 */
			$("#alter").click(function(){
				
				/* toggle() 的作用就是当对象是显示的就隐藏，当是隐藏的则显示。 */
				//$("#btn-info").toggle();	
				//if($("#btn-info").css("display") == "none"){
				//	$("#btn-info").css("display","block");
				//}
				
				/* 保存，撤销按钮显示 */
				$("#btn-info").css("display","block");	
				
				/* 文本框解除手型，解除禁用 */
				$("#username,#password,#mail").css("cursor", "text");
				$("#username,#password,#mail").removeAttr("readonly");
				
			});
			
			/* 右侧保存按钮 */
			$("#btn-save-2").click(function(){
				
				flag = true;
				
				$("#div-account, #div-username, #div-password, #div-mail").removeClass("has-error");	
				$("#account, #username, #password, #group-mail").next().css("display","none");
		    	$("#account, #username, #password, #group-mail").next().next().css("display","none");
		    	$("#account, #username, #password, #group-mail").next().next().next().css("display","none");
		    	$("#account, #username, #password, #group-mail").next().next().next().next().css("display","none");
				
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
			  //判断邮箱是否为空
			    if($("#mail").val() == ''){			    	
			    	$("#div-mail").addClass("has-error");	
			    	$("#group-mail").next().next().next().css("display","block");
			    	$("#group-mail").next().next().next().next().css("display","block");	
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
				//判断邮箱格式
				var reg5=new RegExp(/^\w+@\w+(\.[a-zA-Z]{2,3}){1,2}$/);
				if(!reg5.test($("#mail").val()) && $("#mail").val()!=''){
					$("#div-mail").addClass("has-error");	
			    	$("#group-mail").next().css("display","block");
			    	$("#group-mail").next().next().css("display","block");
					flag = false;
				} 
				
			}); 
			
			/* 右侧撤销按钮 */
			$("#btn-cancel-2").click(function(){
				
				$("#btn-info").css("display","none");	
				window.location.href="${pageContext.request.contextPath}/page/userInfo.jsp";
			});
			
			/*左侧 更换头像 更换头像框 的点击事件*/
			$("#label-photo,#div-photo").click(function(){
				
				$("#btn-photo").css("display","block");
			});
			
			/* 左侧保存按钮 */
			
			$("#btn-save").click(function(){
				
				flag = true;
				
				/* 输入框为空 */
				if($("#photo").val() == ""){
					//alert("11122");
					$("#div-photo").addClass("has-error");	
					$("#span-photo-1").css("display","block");
					$("#label-photo-1").css("display","block");
					flag = false;
				}
				
				//获取上传文件的后缀名[bmp,jpg,png,tif,gif,pcx,tga,exif,fpx,svg,psd,cdr,pcd,dxf,ufo,eps,ai,raw,WMF,webp]
				var path = $("#photo").val();					
				var suffixName = path.substr(path.lastIndexOf("."));
				if(suffixName != "" && $("#photo").val() != ""){
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
						$("#span-photo-2").css("display","block");
						$("#label-photo-2").css("display","block");					
					}
				}
					
			}); 
			
			/* 左侧撤销按钮 */
			$("#btn-cancel").click(function(){
				
				$("#photo").val("");	//清空文件框中的信息
				$("#btn-photo").css("display","none");	//隐藏俩按钮
				
				$("#div-photo").removeClass("has-error");	
				$("#span-photo-1,#span-photo-2,#label-photo-1,#label-photo-2").css("display","none");
			});
			
		});
			
		/* 上传头像 */
		function checkPhoto(){
			
			return flag;
		};
		
		/* 更改信息 */
		function checkInfo(){
			
			return flag;
		};

	</script>
  </body>
</html>
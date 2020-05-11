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
    
	<title>支付页面</title>
	<style type="text/css">
	
		/*去掉百度地图标志*/
       .BMap_cpyCtrl {
           display: none;
       }
        .anchorBL {
           display: none;
       }
	</style>
</head>
 <body>
 
 	<!-- 头部导航栏 两种方式均可-->
	<%@include file="top.jsp" %>   <!-- 先包含，后编译 -->
	
	<!-- 正文内容 -->

	<div class="container-fluid">
	  <div class="row-fluid">
	    <div class="col-md-6" style="padding-top:10px;width:45%;height:600px;border:solid #ccc;border-width: 0 1px 0 0;">
	      <!--Sidebar content-->
	      
	      <!-- Form -->
		  <form id="formid" action="${pageContext.request.contextPath}/PayServlet?id=${Decorate.id}" method="post" >
			
			<div class="form-group col-md-12">
				<label class="col-sm-4 control-label" style="text-align: right; font-size: 20px;">
					订&nbsp;单&nbsp;号&nbsp;<span style="color:red;">*</span>：
				</label> 										
				<div class="col-sm-8 form-group has-feedback" id="div-order" style="width:66%;">						  
					<input type="text" name="order" id="order" class="form-control" value="" readonly="readonly"/>						
				</div>
			</div>
			
			<div class="form-group col-md-12">
				<label class="col-sm-4 control-label" style="text-align: right; font-size: 20px;">
					商品名称<span style="color:red;">*</span>：
				</label> 										
				<div class="col-sm-8 form-group has-feedback" id="div-name" style="width:66%;">						  
					<input type="text" name="name" id="name" class="form-control" value="" readonly="readonly"/>						
				</div>
			</div>
			
			<div class="form-group col-md-12">
				<label class="col-sm-4 control-label" style="text-align: right; font-size: 20px;">
					收&nbsp;货&nbsp;人&nbsp;<span style="color:red;">*</span>：
				</label> 										
				<div class="col-sm-8 form-group has-feedback" id="div-username" style="width:66%;">						  
					<input type="text" name="username" id="username" class="form-control" value=""/>	
					<label id="label-username-1" class="control-label" style="display: none;">收货人姓名不能为空</label>
					<label id="label-username-2" class="control-label" style="display: none;">输入的格式不正确，2-10个字符</label>
				</div>
			</div>
			
			<div class="form-group col-md-12">
				<label class="col-sm-4 control-label" style="text-align: right; font-size: 20px;">
					手&nbsp;机&nbsp;号&nbsp;<span style="color:red;">*</span>：
				</label> 										
				<div class="col-sm-8 form-group has-feedback" id="div-tel" style="width:66%;">						  
					<input type="text" name="tel" id="tel" class="form-control" value=" "/>		
					<label id="label-tel-1" class="control-label" style="display: none;">收货人手机号不能为空</label>
					<label id="label-tel-2" class="control-label" style="display: none;">请输入正确的手机号</label>				
				</div>
			</div>
					
			<div class="form-group col-md-12">
				<label class="col-sm-4 control-label" style="text-align: right; font-size: 20px;">
					收货地址<span style="color:red;">*</span>：
				</label> 										
				<div class="col-sm-8 form-group has-feedback" id="div-address" style="width:66%;">	
				
					<!-- 地址经纬度 -->
					<!-- 经度 --><input type="hidden" name="lng" id="lng" />
					<!-- 纬度 --><input type="hidden" name="lat" id="lat" />					  
					<input type="text" name="address" id="address" class="form-control" value=""/>	
					<label id="label-address-1" class="control-label" style="display: none;">收货地址不能为空</label>			
				</div>
			</div>
			
			<div class="form-group col-md-12">
				<label class="col-sm-4 control-label" style="text-align: right; font-size: 20px;">
					购买数量<span style="color:red;">*</span>：
				</label> 										
				<div class="col-sm-8 form-group has-feedback" id="div-number" style="width:66%;">		
					<!--购买数量--> <input type="hidden" name="quantity" id="quantity" />				  
					<img id="add" src="${pageContext.request.contextPath}/images/+.jpg" style="width:20px;height:20px;cursor:pointer;">
					[ <span id="number" style="color:#318EF2;">1</span> ]
					<img id="reduce" src="${pageContext.request.contextPath}/images/-.jpg" style="width:20px;height:20px;cursor:pointer;">						
				</div>
			</div>
			
			<div class="form-group col-md-12">
				<label class="col-sm-4 control-label" style="text-align: right; font-size: 20px;">
					应付金额<span style="color:red;">*</span>：
				</label> 										
				<div class="col-sm-8 form-group has-feedback" id="div-needTotal" style="width:66%;">						  
					<input type="text" name="needTotal" id="needTotal" class="form-control" value="" readonly="readonly"/>						
				</div>
			</div>
			
			<div class="form-group col-md-12">
				<label class="col-sm-4 control-label" style="text-align: right; font-size: 20px;">
					会员折扣<span style="color:red;">*</span>：
				</label> 										
				<div class="col-sm-8 form-group has-feedback" id="div-discount" style="width:66%;">	
					<!--会员折扣--> <input type="hidden" name="rate" id="rate" />					  
					<input type="text" name="discount" id="discount" class="form-control" value="" readonly="readonly"/>											
				</div>
			</div>
			
			<div class="form-group col-md-12">
				<label class="col-sm-4 control-label" style="text-align: right; font-size: 20px;">
					实付金额<span style="color:red;">*</span>：
				</label> 										
				<div class="col-sm-8 form-group has-feedback" id="div-actuallyTotal" style="width:66%;">						  
					<input type="text" name="actuallyTotal" id="actuallyTotal" class="form-control" value="" readonly="readonly"/>						
				</div>
			</div>
			
			<div class="form-group col-md-12">
				<div class="col-md-2"></div>
				<input type="button" class="col-md-2 btn btn-info" id="pay" value="支 付" onclick="">
				<div class="col-md-1"></div>
				<input type="button" class="col-md-2 btn btn-danger" id="back" value="返 回" onclick="javascript :history.back(-1);">
			</div>
					
		  </form>
          	
	    </div>
	    <div class="col-md-6" style="padding-top:10px;width:50%;height:600px;">
	      <!--Body content-->
			
			<!-- 百度地图 -->
			
			<img alt="" src="${pageContext.request.contextPath}/images/map.png" style="margin-top:0px;"/>
			<span class="label label-success" style="font-size:15px;">收货地址</span>
		  	<div id="allmap" style="width: 100%; height: 500px; margin-top:10px;"></div>
						
		  	<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>	
			
	    </div>
	  </div>
	</div>

  	<!-- 支付密码 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" style="color:#5CB6E6;">
	        	<img alt="" src="${pageContext.request.contextPath}/images/bill-2.png" style="margin-top:-3px;"/>
	        	正在支付&hellip;
	        </h4>
	      </div>
	      <div class="modal-body" style="height:200px;">
	      			
	      	<h5>尊敬的 [<i style="color:#D1CF2D"> ${Member.name } </i>] :</h5>			        
	        <p style="font-size:18px;color:#2775DB;margin-left:35px;">
	        	您目前的应付金额为 <i id="need-total" style="color:red;"></i> 元
	        </p>				        
	        <p style="font-size:18px;color:#2775DB;margin-left:35px;">
	        	计算会员相应折扣后，您的实付金额为 <i id="actually-total" style="color:red;"></i> 元
	        </p>				        
	        <br>			        		        
	        <label for="password" class="col-sm-3 control-label" style="text-align: right; font-size: 18px;">
				支付密码：
			</label> 
	        <div id="div-password" class="col-sm-9 form-group  has-feedback ">
	       		<input name="password" id="password" type="password" class="form-control" 
	       			placeholder="请输入支付密码（登录密码）" style="width:80%;"/>
	       		<span class="glyphicon glyphicon-remove form-control-feedback"  style=" width:80%; display: none;"></span>
				<label class="control-label" for="tel" style=" display: none;">支付密码有误</label>
	     	</div>
	     	
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">退出支付</button>
	        <button type="button" class="btn btn-primary"  id="pay-success" onclick="onSubmit()">完成支付</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->


	<%-- 模态框 --%>
	<%@include file="tip.jsp" %>
	
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	<!-- 将百度地图API引入，设置好自己的key -->
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=7a6QKaIilZftIMmKGAFLG7QT1GLfIncg"></script>
	<!-- 如果需要拖拽鼠标进行操作，可引入以下js文件 -->
	<script type="text/javascript" src="http://api.map.baidu.com/library/RectangleZoom/1.2/src/RectangleZoom_min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
			//生成唯一的订单号
			var order = ""; 
			for(var i=0;i<4;i++){ 
				order += Math.floor(Math.random()*10); 
			} 
	 
		    var myDate = new Date;
		    var year = myDate.getFullYear(); //获取当前年
		    var mon = myDate.getMonth() + 1; //获取当前月
		    var date = myDate.getDate(); //获取当前日
		    var h = myDate.getHours();//获取当前小时数(0-23)
		    var m = myDate.getMinutes();//获取当前分钟数(0-59)
		    var s = myDate.getSeconds();//获取当前秒
			    
			order = order + year + mon + date + h + m + s;		    
		    
		    //给表单赋值
		    $("#order").val(order);						//订单号
		    $("#name").val("${Decorate.name}");			//商品名称
		    $("#needTotal").val(Number("${Decorate.price}").toFixed(2)+" 元");	//应付金额
		    if("${Member.discount}" == 1){
		    	$("#discount").val("您是${Member.name}，目前无折扣。");	//会员折扣
		    }
		    else{
		    	$("#discount").val("您是${Member.name}，折扣为"+Number("${Member.discount}")*100+"折");	//会员折扣
		    }
		    var number = $("#number").html();	//购买数量
		    var price = Number("${Decorate.price}") * Number("${Member.discount}");	//会员单价
		    //alert("number:"+number+"   price:"+price);
		    $("#actuallyTotal").val(Number(number * price).toFixed(2)+" 元");	//实付金额
		    
		  //增加购买数量
			$("#add").click(function(){
				//alert("111");
				if(Number($("#number").html()) < Number("${Decorate.number}")){
					
					var number = Number($("#number").html()) + 1;
					$("#number").html(number);
					$("#needTotal").val(Number("${Decorate.price}" * number).toFixed(2)+" 元");		//应付金额
					$("#actuallyTotal").val(Number(number * price).toFixed(2)+" 元");	//实付金额
				}
			});
			//减少购买数量
			$("#reduce").click(function(){
				
				if(Number($("#number").html()) > 1){
					
					var number = Number($("#number").html()) - 1;
					$("#number").html(number);
					$("#needTotal").val(Number("${Decorate.price}" * number).toFixed(2)+" 元");		//应付金额
					$("#actuallyTotal").val(Number(number * price).toFixed(2)+" 元");	//实付金额
				}
			});
			
			//点击支付按钮时，进行表单验证
			$("#pay").click(function(){
				
				flag = true;
				$("#div-username, #div-tel, #div-address").removeClass("has-error");
				$("#label-username-1, #label-username-2, #label-tel-1, #label-tel-2, #label-address-1").css("display","none");
				
				//收货人姓名的表单验证
				if($("#username").val() == ""){
					
					flag = false;
					$("#div-username").addClass("has-error");
					$("#label-username-1").css("display","block");
				}
				else{
					
					//判断收货人姓名不超过10个字符
					var reg1 = new RegExp(/^([A-Za-z0-9\u4e00-\u9fa5\w\W]{2,10})$/);
					//alert("格式错误");
					if(!reg1.test($("#username").val())){
						$("#div-username").addClass("has-error");	
						$("#label-username-2").css("display","block");
						flag = false;
					}				
				}
				
				//收货人手机号的表单验证
				if($("#tel").val() == ""){
					
					flag = false;
					$("#div-tel").addClass("has-error");
					$("#label-tel-1").css("display","block");
				}
				else{
					
					//电话号码格式
				    var reg1=new RegExp(/^1(3|4|5|7|8)\d{9}$/);
				    if(!reg1.test($("#tel").val().trim())){
						$("#div-tel").addClass("has-error");	
						$("#label-tel-2").css("display","block");
						flag = false;
					}
				}
				
				//收货地址表单验证
				if($("#address").val() == ""){
					
					flag = false;
					$("#div-address").addClass("has-error");
					$("#label-address-1").css("display","block");
				}
				
				if(flag){
					
					var number = Number($("#number").html());
					$("#need-total").html(("${Decorate.price}" * number).toFixed(2));
					$("#actually-total").html(Number(number * price).toFixed(2));
					$('#myModal').modal("show");
				}
				    
			});
			
		});
		
		//点击完成支付按钮，进行表单提交
		function onSubmit(){
			
			var password = "${User.password}";
	    	var number = $("#password").val();
	    	if(number != password){
	    		
	    		$("#div-password").addClass("has-error");
	    		$("#password").next().css("display","block");
	    		$("#password").next().next().css("display","block");
		    	
	    	}
	    	else{
	    		$('#myModal').modal("hide");
	    		
	    		//购买数量
	    		var number = $("#number").html();
	    		$("#quantity").val(number);
	    		
	    		//会员折扣
	    		$("#rate").val("${Member.discount}");
	    		
	    		document.getElementById("formid").submit();
	    	}
		}
		
		/*****************************************************************/
		//百度地图处理
		
		//将输入框设置成智能搜索
		function G(id) {
			return document.getElementById(id);
		}
	
		var map = new BMap.Map("allmap");
		map.enableScrollWheelZoom(); //启用滚轮放大缩小，默认禁用
/* 		map.enableContinuousZoom(); //启用地图惯性拖拽，默认禁用
		var myDrag = new BMapLib.RectangleZoom(map, {
			followText: "拖拽鼠标进行操作"
		});
		myDrag.open(); //开启拉框放大 */
		// myDrag.close();  //关闭拉框放大
	
		map.centerAndZoom("北京", 19); // 初始化地图,设置城市和地图级别。
	
		var ac = new BMap.Autocomplete( //建立一个自动完成的对象
			{
				"input": "address",
				"location": map
			});
	
		ac.addEventListener("onhighlight", function(e) { //鼠标放在下拉列表上的事件
			var str = "";
			var _value = e.fromitem.value;
			var value = "";
			if (e.fromitem.index > -1) {
				value = _value.province + _value.city + _value.district + _value.street + _value.business;
			}
			str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
	
			value = "";
			if (e.toitem.index > -1) {
				_value = e.toitem.value;
				value = _value.province + _value.city + _value.district + _value.street + _value.business;
			}
			str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
			G("searchResultPanel").innerHTML = str;
		});
	
		var myValue;
		ac.addEventListener("onconfirm", function(e) { //鼠标点击下拉列表后的事件
			var _value = e.item.value;
			myValue = _value.province + _value.city + _value.district + _value.street + _value.streetNumber + _value.business;
			G("searchResultPanel").innerHTML = "onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
			setPlace();
		});
	
		function setPlace() {
			map.clearOverlays(); //清除地图上所有覆盖物
			function myFun() {
				var pp = local.getResults().getPoi(0).point; //获取第一个智能搜索的结果
				console.log('经度：' + pp.lng, '纬度：' + pp.lat);
				$("#lng").val(pp.lng);
				$("#lat").val(pp.lat);
				map.centerAndZoom(pp, 18);
				map.addOverlay(new BMap.Marker(pp)); //添加标注
			}
			var local = new BMap.LocalSearch(map, { //智能搜索
				onSearchComplete: myFun
			});
			local.search(myValue);
		}
		
		
		
	
		//点击地图输入框得到地址
		var map = new BMap.Map("allmap");
		var geoc = new BMap.Geocoder(); //地址解析对象
		var markersArray = [];
		var geolocation = new BMap.Geolocation();
		var point = new BMap.Point(116.331398, 39.897445);
		map.centerAndZoom(point, 12); // 中心点
		geolocation.getCurrentPosition(function(r) {
			if (this.getStatus() == BMAP_STATUS_SUCCESS) {
				var mk = new BMap.Marker(r.point);
				map.addOverlay(mk);
				map.panTo(r.point);
				map.enableScrollWheelZoom(true);
			} else {
				alert('failed' + this.getStatus());
			}
		}, {
			enableHighAccuracy: true
		})
		map.addEventListener("click", showInfo);
		//清除标识
		function clearOverlays() {
			if (markersArray) {
				for (i in markersArray) {
					map.removeOverlay(markersArray[i])
				}
			}
		}
		//地图上标注
		function addMarker(point) {
			var marker = new BMap.Marker(point);
			markersArray.push(marker);
			clearOverlays();
			map.addOverlay(marker);
		}
		//点击地图时间处理
		function showInfo(e) {
			document.getElementById('lng').value = e.point.lng;
			document.getElementById('lat').value = e.point.lat;
			geoc.getLocation(e.point, function(rs) {
				var addComp = rs.addressComponents;
				var address = addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber;
				if (confirm("确定要地址是" + address + "?")) {
					//document.getElementById('allmap').style.display = 'none';
					document.getElementById('address').value = address;
				}
			});
			addMarker(e.point);
		}
		
	</script>
</body>
</html>
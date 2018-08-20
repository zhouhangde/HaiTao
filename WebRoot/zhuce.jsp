<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>嗨淘网</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
.top1{
width: 1200px;
height: 60px;
margin: auto;
text-align:right;
font-family:'微软雅黑';
font-size:18px;
}
.top2{
	width: 1200px;
	height: 60px;
	margin: auto;
}
.title{
	float: left;
}
.search{
	float: left;
}
.top3{
	width: 100%;
	margin: auto;
}
.top4{
	width:100%;
	height:450px;
	margin:auto;
	background:url(./img/AD0Ivvn6AhACGAAg27fnvwUowOKr6AYwgA84wgM.jpg);
}
.dh{
	width: 195px;
	height:450px;
	margin: left;
	float: left;
	background-color: white;
}
.zl{
	width: 180px;
	height: 40px;
	font-size: 20px;
	font-family: '微软雅黑';
}
.mc{
	width: 55px;
	height: 40px;
	font-size: 14px;
	font-family: '微软雅黑';
}
.top5{
	float: right;
}
.login{
	width: 800px;
	height:600px;
	margin: auto;
	text-align: center;
	font-family: '微软雅黑';
}
.d1{
	width: 800px;
	height:40px;
	margin: auto;
	text-align: left;
	padding:20px;
	font-family: '微软雅黑';
	font-size: 20px;
}
.d2{
	width: 800px;
	height:250px;
	margin: auto;
}
.d3{
	width:500px;
	height:80px;
	margin: auto;
	font-family: '微软雅黑';
	font-size: 16px;
}
</style>

<script type="text/javascript" src="js/jquery-1.6.4.js"></script>
	<script type="text/javascript" >
		$(function() {
			/*
			 * 1. 得到所有的错误信息，循环遍历之。调用一个方法来确定是否显示错误信息！
			 */
			$(".errorClass").each(function() {
				showError($(this));//遍历每个元素，使用每个元素来调用showError方法
			});
			
			
			/*
			 * 3. 输入框得到焦点隐藏错误信息
			 */
			$(".inputClass").focus(function() {
				var labelId = $(this).attr("id") + "Error";//通过输入框找到对应的label的id
				$("#" + labelId).text("");//把label的内容清空！
				showError($("#" + labelId));//隐藏没有信息的label
			});
			
			/*
			 * 4. 输入框失去焦点进行校验
			 */
			$(".inputClass").blur(function() {
				var id = $(this).attr("id");//获取当前输入框的id
				var funName = "validate" + id.substring(0,1).toUpperCase() + id.substring(1) + "()";//得到对应的校验函数名
				eval(funName);//执行函数调用
			});
			
			/*
			 * 5. 表单提交时进行校验
			 */
			$("#registForm").submit(function() {
				var bool = true;//表示校验通过
				if(!validateLoginname()) {
					bool = false;
				}
				if(!validateLoginpass()) {
					bool = false;
				}
				if(!validateReloginpass()) {
					bool = false;
				} 
				if(!validateEmail()) {
					bool = false;
				}
				 if(!validatePhone()) {
					bool = false;
				}
				if(!validateAddress()) {
					bool = false;
				}
				if(!validateCname()) {
					bool = false;
				}
				return bool;
			});
		});
		
		/*
		 * 登录名校验方法
		 */
		function validateLoginname() {
			var id = "loginname";
			var value = $("#" + id).val();//获取输入框内容
			/*
			 * 1. 非空校验
			 */
			if(!value) {
				/*
				 * 获取对应的label
				 * 添加错误信息
				 * 显示label
				 */
				$("#" + id + "Error").text("用户名不能为空！");
				showError($("#" + id + "Error"));
				return false;
			}
			/*
			 * 2. 长度校验
			 */
			if(value.length < 3 || value.length > 20) {
				/*
				 * 获取对应的label
				 * 添加错误信息
				 * 显示label
				 */
				$("#" + id + "Error").text("用户名长度必须在3 ~ 20之间！");
				showError($("#" + id + "Error"));
				false;
			}
			/*
			 * 3. 是否注册校验
			 */
			var d={};
			d[$("#loginname").attr("name")]=$("#loginname").val();
			$.ajax({
				url:"SelectCustomer",//要请求的servlet
				data:d,//给服务器的参数
				type:"POST",
				success:function(result) {
					if(result==1) {//如果校验失败
						$("#" + id + "Error").text("用户名已被注册！");
						showError($("#" + id + "Error"));
						return false;
					} 
				}
			});
			return true;
		}
		
		/*
		 * 登录密码校验方法
		 */
		function validateLoginpass() {
			var id = "loginpass";
			var value = $("#" + id).val();//获取输入框内容
			/*
			 * 1. 非空校验
			 */
			if(!value) {
				/*
				 * 获取对应的label
				 * 添加错误信息
				 * 显示label
				 */
				$("#" + id + "Error").text("密码不能为空！");
				showError($("#" + id + "Error"));
				return false;
			}
			/*
			 * 2. 长度校验
			 */
			if(value.length < 3 || value.length > 20) {
				/*
				 * 获取对应的label
				 * 添加错误信息
				 * 显示label
				 */
				$("#" + id + "Error").text("密码长度必须在3 ~ 20之间！");
				showError($("#" + id + "Error"));
				false;
			}
			return true;	
		}
		
		/*
		 * 确认密码校验方法
		 */
		function validateReloginpass() {
			var id = "reloginpass";
			var value = $("#" + id).val();//获取输入框内容
			/*
			 * 1. 非空校验
			 */
			if(!value) {
				/*
				 * 获取对应的label
				 * 添加错误信息
				 * 显示label
				 */
				$("#" + id + "Error").text("确认密码不能为空！");
				showError($("#" + id + "Error"));
				return false;
			}
			/*
			 * 2. 两次输入是否一致校验
			 */
			if(value != $("#loginpass").val()) {
				/*
				 * 获取对应的label
				 * 添加错误信息
				 * 显示label
				 */
				$("#" + id + "Error").text("两次输入不一致！");
				showError($("#" + id + "Error"));
				false;
			}
			return true;	
		}
		
		/*
		 * Email校验方法
		 */
		function validateEmail() {
			var id = "email";
			var value = $("#" + id).val();//获取输入框内容
			/*
			 * 1. 非空校验
			 */
			if(!value) {
				/*
				 * 获取对应的label
				 * 添加错误信息
				 * 显示label
				 */
				$("#" + id + "Error").text("Email不能为空！");
				showError($("#" + id + "Error"));
				return false;
			}
			/*
			 * 2. Email格式校验
			 */
			if(!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(value)) {
				/*
				 * 获取对应的label
				 * 添加错误信息
				 * 显示label
				 */
				$("#" + id + "Error").text("错误的Email格式！");
				showError($("#" + id + "Error"));
				false;
			}
			/*
			 * 3. 是否注册校验
			 */
			var d={};
			d[$("#email").attr("name")]=$("#email").val();
			$.ajax({
				url:"SelectCustomer",//要请求的servlet
				data:d,//给服务器的参数
				type:"POST",
				success:function(result) {
					if(result==1) {//如果校验失败
						$("#" + id + "Error").text("Email已被注册！");
						showError($("#" + id + "Error"));
						return false;
					}
				}
			});
			return true;		
		}
		
		/*
		 * 电话校验方法
		 */
		function validatePhone() {
			var id = "phone";
			var value = $("#" + id).val();//获取输入框内容
			/*
			 * 1. 非空校验
			 */
			if(!value) {
				/*
				 * 获取对应的label
				 * 添加错误信息
				 * 显示label
				 */
				$("#" + id + "Error").text("电话不能为空！");
				showError($("#" + id + "Error"));
				return false;
			}
			/*
			 * 2. 电话格式校验
			 */
			if(!/^1[3|4|5|7|8][0-9]\d{8}$/.test(value)) {
				/*
				 * 获取对应的label
				 * 添加错误信息
				 * 显示label
				 */
				$("#" + id + "Error").text("错误的电话格式！");
				showError($("#" + id + "Error"));
				false;
			}
			/*
			 * 3. 是否注册校验
			 */
			var d={};
			d[$("#phone").attr("name")]=$("#phone").val();
			$.ajax({
				url:"SelectCustomer",//要请求的servlet
				data:d,//给服务器的参数
				type:"POST",
				success:function(result) {
					if(result==1) {//如果校验失败
						$("#" + id + "Error").text("电话已被注册！");
						showError($("#" + id + "Error"));
						return false;
					}
				}
			});
			return true;		
		}
		/*
		 * 姓名校验方法
		 */
		function validateCname() {
			var id = "cname";
			var value = $("#" + id).val();//获取输入框内容
			/*
			 * 1. 非空校验
			 */
			if(!value) {
				/*
				 * 获取对应的label
				 * 添加错误信息
				 * 显示label
				 */
				$("#" + id + "Error").text("姓名不能为空！");
				showError($("#" + id + "Error"));
				return false;
			}
			return true;
		}
		/*
		 * 地址校验方法
		 */
		function validateAddress() {
			var id = "address";
			var value = $("#" + id).val();//获取输入框内容
			/*
			 * 1. 非空校验
			 */
			if(!value) {
				/*
				 * 获取对应的label
				 * 添加错误信息
				 * 显示label
				 */
				$("#" + id + "Error").text("地址不能为空！");
				showError($("#" + id + "Error"));
				return false;
			}
			return true;
		}

		
		/*
		 * 判断当前元素是否存在内容，如果存在显示，不页面不显示！
		 */
		function showError(ele) {
			var text = ele.text();//获取元素的内容
			if(!text) {//如果没有内容
				ele.css("display", "none");//隐藏元素
			} else {//如果有内容
				ele.css("display", "");//显示元素
			}
		}
		

	</script>
  </head>
  
  
  
  <body>
    <div>
    <div class="top1">
    </div>
    
    <div class="top2">
    <div class="title">
    <img alt="title" src="./img/title.png">
    </div>
    <div class="search">
    <form action="search" method="post">
    <input type="text" style="width:448px;height: 35px;font-size:20px;" name="proName">
    <input type="submit"  value="go" style="font-size:20px;color:white; background-color:#2571c5;border:none;width: 68px;height: 35px">
    </form>
    </div>
    </div>
    
    <div class="top3">
    <img alt="fl" src="./img/fl.png" style="width: 195px">
    </div>
    
    <div class="top4">
    <div class="top3">
  	<div class="dh">
  	<form action="search" method="post">
  	<table>
  	<tr><td colspan="3" class="zl">小家电</td></tr>
  	<tr><td class="mc"><input type="submit" value="吸尘器" style="border: none;background-color: white;" name="proName"></td><td class="mc"><input type="submit" value="电风扇"  name="proName" style="border: none;background-color: white;"></td><td class="mc"><input type="submit" value="灭蚊器" name="proName" style="border: none;background-color: white;"></td></tr>
  	<tr><td class="mc"><input type="submit" value="净水器" style="border: none;background-color: white;" name="proName"></td><td class="mc"><input type="submit" value="电饭煲" name="proName" style="border: none;background-color: white;"></td><td class="mc"><input type="submit" value="电磁炉" name="proName" style="border: none;background-color: white;"></td></tr>
  	<tr><td colspan="3" class="zl">大家电</td></tr>
  	<tr><td class="mc"><input type="submit" value="冰箱" style="border: none;background-color: white;" name="proName"></td><td class="mc"><input type="submit" value="空调" name="proName"  style="border: none;background-color: white;"></td><td class="mc"><input type="submit" value="洗衣机" name="proName" style="border: none;background-color: white;"></td></tr>
  	<tr><td class="mc"><input type="submit" value="油烟机" style="border: none;background-color: white;" name="proName"></td><td class="mc"><input type="submit" value="热水器" name="proName" style="border: none;background-color: white;"></td><td class="mc"><input type="submit" value="办公打印"name="proName" style="border: none;background-color: white;"></td></tr>
  	<tr><td colspan="3" class="zl">手机数码</td></tr>
  	<tr><td class="mc"><input type="submit" value="手机" style="border: none;background-color: white;" name="proName"></td><td class="mc"><input type="submit" value="数码相机" name="proName" style="border: none;background-color: white;"></td><td class="mc"></td></tr>
  	<tr><td colspan="3" class="zl">当季热品</td></tr>
  	<tr><td class="mc"><input type="submit" value="剃须刀" style="border: none;background-color: white;" name="proName"></td><td class="mc"><input type="submit" value="电吹风" name="proName" style="border: none;background-color: white;"></td><td class="mc"><input type="submit" value="洁面美容" name="proName" style="border: none;background-color: white;"></td></tr>
  	<tr><td class="mc"><input type="submit" value="按摩" style="border: none;background-color: white;" name="proName"></td><td class="mc"><input type="submit" value="美发神器" name="proName" style="border: none;background-color: white;"></td></tr>
  	</table>
  	</form>
    </div>
    <div class="top5">
    <img src="./img/AD0Ivvn6AhACGAAg2bfnvwUohoue6QUwsgE4wgM.jpg">
    </div>
    </div>
    </div>
    
    <div class="login">
    <div class="d1">
    	用户注册
    	<hr>
    </div>
    <div class="d2">
    <form action="zhuce" method="post" id="registForm">
		<input type="hidden" name="method" value="regist"/>  
	    <table id="tableForm" class="d3">
	      <tr style="height:50px">
	        <td class="tdText" width="80px">用户名：</td>
	        <td class="tdInput" >
	          <input class="inputClass" type="text" name="loginname" id="loginname" value="${form.loginname }" style="width:250px;height:30px"/>
	        </td>
	        <td class="tdError">
	          <label class="errorClass" id="loginnameError">${errors.loginname }</label>
	        </td>
	      </tr>
	      <tr style="height:50px">
	        <td class="tdText" width="80px">登录密码：</td>
	        <td>
	          <input class="inputClass" type="password" name="loginpass" id="loginpass" value="${form.loginpass }" style="width:250px;height:30px"/>
	        </td>
	        <td>
	          <label class="errorClass" id="loginpassError">${errors.loginpass }</label>
	        </td>
	      </tr>
	      <tr style="height:50px">
	        <td class="tdText" width="80px">确认密码：</td>
	        <td>
	          <input class="inputClass" type="password" name="reloginpass" id="reloginpass" value="${form.reloginpass }" style="width:250px;height:30px"/>
	        </td>
	        <td>
	          <label class="errorClass" id="reloginpassError">${errors.reloginpass}</label>
	        </td>
	      </tr>
	      <tr style="height:50px">
	        <td class="tdText" width="80px">Email：</td>
	        <td>
	          <input class="inputClass" type="text" name="email" id="email" value="${form.email }" style="width:250px;height:30px"/>
	        </td>
	        <td>
	          <label class="errorClass" id="emailError">${errors.email}</label>
	        </td>
	      </tr>
	      <tr style="height:50px">
	        <td class="tdText" width="80px">电话：</td>
	        <td>
	          <input class="inputClass" type="text" name="phone" id="phone" value="${form.phone }" style="width:250px;height:30px"/>
	        </td>
	        <td>
	          <label class="errorClass" id="phoneError">${errors.phone}</label>
	        </td>
	      </tr>
	      <tr style="height:50px">
	        <td class="tdText" width="80px">姓名：</td>
	        <td>
	          <input class="inputClass" type="text" name="cname" id="cname" value="${form.cname }" style="width:250px;height:30px"/>
	        </td>
	        <td>
	          <label class="errorClass" id="cnameError">${errors.cname}</label>
	        </td>
	      </tr>
	      <tr style="height:50px">
	        <td class="tdText" width="80px">性别：</td>
	        <td>
	          <input type="radio" name="sex" value="男" checked="checked"/>男<input type="radio" name="sex" value="女"/>女
	        </td>
	      </tr>
	      <tr style="height:50px">
	        <td class="tdText" width="80px">地址：</td>
	        <td>
	          <input class="inputClass" type="text" name="address" id="address" value="${form.address }" style="width:250px;height:30px"/>
	        </td>
	        <td>
	          <label class="errorClass" id="addressError">${errors.address}</label>
	        </td>
	      </tr>
	      <tr style="height:50px">
	        <td></td>
	        <td>
	          <input type="submit" value="注册" style="width:70px;height:30px;border:none;"/>
	        </td>
	        <td>
	          <label></label>
	        </td>
	      </tr>
	    </table>
	</form>
    
    </div>
    </div>
    
  </body>
</html>

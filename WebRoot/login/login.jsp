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
	text-align: center;
}
.d3{
	width:500px;
	height:80px;
	margin: auto;
	font-family: '微软雅黑';
	font-size: 16px;
}
</style>
<script type="text/javascript">
function reloadImage(){
    document.getElementById('btn').disabled=true;
    /* ts就是为了让每次的请求不一样才用的。保证图片刷新 */
    document.getElementById('identity').src='servlet/IdentityServlet?ts='+new Date().getTime();
    }
</script>
  </head>
  
  <body>
    <div class="top1">
    </div>
    <div class="top2">
    <div class="title">
    <img alt="title" src="./img/title.png">
    </div>
    <div class="search">
    <form action="search" method="post">
    <input type="text" style="width:448px;height: 35px;font-size:20px; " name="proName">
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
    	用户登录
    	<hr>
    </div>
    <div class="d2">
    <form action="CustomerLogin" method="post">
    	<table class="d3">
    	<tr style="height: 50px" >
    	<td width="80px">用户名</td>
    	<td ><input type="text" style="width: 250px;height: 30px" name="customerName"></td>
    	</tr>
    	<tr style="height: 50px" >
    	<td width="80px">密码</td>
    	<td ><input type="password" style="width: 250px;height: 30px;" name="customerPwd"></td>
    	</tr>
    	<tr>
    	<td width="80px">验证码</td>
    	<td>
    	<img  src="servlet/IdentityServlet" id="identity"  onload="btn.disabled=false;" style="float:left;"/>&nbsp;&nbsp;&nbsp;
    	<input type="text" style="width: 100px;height: 30px;" name="identity">
   	 	<input type="button" value="换一张图片" onclick="reloadImage()" id="btn" style="border: none;background-color: white;">
   	 	</td>
    	</tr>
    	<tr style="height: 50px" ><td></td>
    	<td style="font-size:12px;color:red;">上述验证码请全部输入小写</td>
    	</tr>
    	<tr style="height: 50px" ><td></td><td><input type="submit" value="登录" style="width: 70px;height: 30px;border: none;">
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<a href="zhuce.jsp" style="width: 70px;height: 30px;text-decoration:none;">立即注册</a></td>
    	</tr>
    	</table>
    </form>
    </div>
    </div>
    
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	width: 1200px;
	margin: auto;
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
	background-color: #2571c5;
}
.d2{
	width: 800px;
	height:250px;
	margin: 10px auto;
}
.d3{
	width:650px;
	height:80px;
	margin: auto;
	padding:10px;
	font-family: '微软雅黑';
	font-size: 16px;
	border:1px solid #2571c5;
}
</style>
  </head>
  
 <script type="text/javascript" src="js/jquery.js">
 </script>
 <script type="text/javascript">
 </script>
  
  <body>
    <div class="top1">
    <span name="userName" style="color: black;">${customerLogin}</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	<a href="logoff" style="text-decoration:none;color: black;">注销登录</a>
  	&nbsp;&nbsp;&nbsp;
	<a href="ShoppingCartServlet" style="text-decoration:none;color: black;">我的购物车 </a>
	 <a href="index.jsp" style="text-decoration:none;color: black;">返回首页</a>
	</div>
    <div class="top2">
    <div class="title">
    <img alt="title" src="./img/title.png">
    </div>
    <div class="search">
    <input type="text" style="width:448px;height: 35px;">
    <input type="button" value="GO" style="height: 35px;">
    </div>
    </div>
    
    <div class="login">
    <div class="d1">
    	个人资料
    	<hr>
    </div>
    <div class="d2">
    <form action="UpdateCustomer" method="post">
    	<table class="d3">
    	<tr style="height: 50px" >
    	<td width="80px">账号</td>
    	<td ><input type="text" style="width: 250px;height: 30px;border: none;" readonly="readonly" name="customerName" id="customerName" value="${customer.customerName}"></td>
    	</tr>
    	<tr style="height: 50px" >
    	<td width="80px">密码</td>
    	<td ><input type="password" style="width: 250px;height: 30px;" name="customerPwd" id="customerPwd" value="${customer.customerPwd}"></td>
    	</tr>
    	<tr style="height: 50px" >
    	<td width="80px">确认密码</td>
    	<td ><input type="password" style="width: 250px;height: 30px;" name="rcustomerPwd" id="rcustomerPwd" value="${customer.customerPwd}"></td>
    	</tr>
    	<tr style="height: 50px" >
    	<td width="80px">姓名</td>
    	<td ><input type="text" style="width: 250px;height: 30px;" name="name" id="name" value="${customer.name}"></td>
    	</tr>
    	<tr style="height: 50px" >
    	<td width="80px">邮箱</td>
    	<td ><input type="text" style="width: 250px;height: 30px;" name="customerMail" id="customerMail" value="${customer.customerMail}"></td>
    	</tr>
    	<tr style="height: 50px" >
    	<td width="80px">电话</td>
    	<td ><input type="text" style="width: 250px;height: 30px;" name="customerPhone" id="customerPhone" value="${customer.customerPhone}"></td>
    	</tr>
    	<tr style="height: 50px" >
    	<td width="80px">地址</td>
    	<td ><input type="text" style="width: 250px;height: 30px;" name="customerAddress" id="customerAddress" value="${customer.customerAddress}"></td>
    	</tr>
    	<tr style="height: 50px">
    	<td width="80px">账户余额</td>
    	<td><input type="text" style="width: 250px;height: 30px;border: none;" name="customerAddress" id="customerAddress"  readonly="readonly" value="${customer.customerMoney}"/></td>
    	</tr>
    	<tr style="height: 50px" ><td></td><td><input type="submit"  id="update" value="修改" style="width: 70px;height: 30px;border: none;">
    	</tr>
    	</table>
    	</form>
    </div>
    </div>
    
    <div class="login">
    <div class="d1">
    	购买记录:
    	<hr>
    </div>
    <div class="d2">
    
    
    <table class="d3">
    	<tr style="height: 50px" >
    	<td width="140px">订单编号</td>
    	<td width="140px">商品名称</td>
    	<td width="140px">商品原价</td>
    	<td width="140px">购买价格</td>
    	<td width="140px">商品数量</td>
    	<td width="260px">购买时间</td>
    	</tr>
    	
    	<c:forEach items="${sales}" var="s">
   			<tr style="height: 50px">
  			<td width="140px">${s.saleId}</td>
			<td width="140px">${s.productName}</td>
			<td width="140px">${s.productPrice}</td>
			<td width="140px">${s.buyPrice}</td>
			<td width="140px">${s.saleCount}</td>
			<td width="260px">${s.saleTime}</td>
			</tr>
  		</c:forEach>
    	
    	</table>
    	<input type="text" style="width: 100px;height: 30px;border:none;" value="" readonly="readonly">
    </div>
    </div>
  </body>
</html>

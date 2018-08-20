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
width: 1190px;
height: 60px;
margin: auto;
text-align:right;
font-family:'微软雅黑';
font-size:18px;
}
.top2{
	width: 1190px;
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
	width: 1190px;
	margin: auto;
}
.top4{
	width:1890px;
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
	height:340px;
	padding:15px;
	margin: left;
}
.d3{
	width: 300px;
	height:320px;
	margin: left;
	float: left;
}
.d4{
	width: 400px;
	height:320px;
	margin: left;
	float: left;
}
.s1{
	width: 420px;
	height:40px;
	margin: left;
	float: right;
}
</style>

<script type="text/javascript" src="js/jquery.js">
</script>
<script type="text/javascript">
$(document).ready(function(){
//获得文本框对象
   var t = $("#text_box");
//初始化数量为1,并失效减
$('#min').attr('disabled',true);
$('#add').attr('disabled',false);
if(parseInt($("#kc").val())>0){
//数量增加操作
    $("#add").click(function(){   
        t.val(parseInt(t.val())+1)
        if (parseInt(t.val())==parseInt($("#kc").val())){ 
        $('#add').attr('disabled',true);
        }
        if (parseInt(t.val())!=1){
            $('#min').attr('disabled',false);
        }
      
    }) 
    //数量减少操作
    $("#min").click(function(){
        t.val(parseInt(t.val())-1);
        if (parseInt(t.val())==1){
            $('#min').attr('disabled',true);
        }
      
    })
   

}else{
t.val(0);
}

/* $("#add").click(function(){
	var d={};
	d[$("#spm").attr("name")]=$("#spm").val();
	d[$("#yj").attr("name")]=$("#yj").val();
	d[$("#zhj").attr("name")]=$("#zhj").val();
	d[$("#kc").attr("name")]=$("#kc").val();
	d[$("#text_box").attr("name")]=$("text_box").val();
	$.ajax({
		type:"POST",
		url:"addToShoppingCart",
		date:d,
	})
}) */
  });  
</script>
 </head>
  
  <body>
    <div class="top1">
  	<a href="login/login.jsp" style="text-decoration:none;color: black;">登录</a> &nbsp;&nbsp;&nbsp;&nbsp;
  	<a href="memberServlet" style="text-decoration:none;color: black;">${customerLogin}</a>
	<a href="zhuce.jsp" style="text-decoration:none;color: black;"> 注册 </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="ShoppingCartServlet" style="text-decoration:none;color: black;"> 购物车 </a>
    </div>
    <div class="top2">
    <div class="title">
    <img alt="title" src="./img/title.png">
    </div>
    <div class="search">
    <form action="search" method="post">
    <input type="text" style="width:448px;height: 35px; " name="proName">
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
    	商品详情
    	<hr>
    </div>
    <form action="buyServlet" method="post">
    <c:forEach items="${search}" var="s">
    <div class="d2">
    <div class="d3">
   <img  src="${s.productImage}">
	</div>
	<div class="d4">
	<div class="s1">
	商品编号:&nbsp;<input type="text" style="border: none ;width: 50px" value="${s.productId}" readonly="readonly" name="spm" id="spbh"/>
	商品名:&nbsp;<input type="text" style="border: none ;width: 50px" value="${s.productName}" readonly="readonly" name="spm" id="spm"/>
	</div>
	<div class="s1">
	${s.productDescription}
	</div>
	<div class="s1">
	原价:&nbsp;<s>￥<input type="text" style="border: none ;width: 50px" value="${s.price}" readonly="readonly" name="yj" id="yj"/></s>
	</div>
	<div class="s1">
	折后价:&nbsp;<span style="color: red"">￥<input type="text" style="border: none ;width: 50px;color: red" readonly="readonly" value="${s.productPrice}" name="zhj" id="zhj"/></span>
	</div>
	<div class="s1">
	库存:&nbsp;<input type="text" style="border: none ;width: 40px" value="${s.productNum}" readonly="readonly" id="kc" name="kc"/>
	</div>
	<div class="s1">
	
	数量:<input id="min" name="" type="button" value="-" style="width:20px;height: 30px;border:1px solid #2571c5"/>   
	<input id="text_box" name="text_box" type="text" value="1"style="width: 40px;height: 30px;border:1px solid #2571c5"/>  
	<input id="add" name="" type="button" value="+"  style="width: 20px;height: 30px;border:1px solid #2571c5"/> 
	</div>
	<div class="s1">
	<input type="submit" value="立即购买"  name="buy" style="width: 150px;height: 40px;font-size: 18px; border:1px solid #2571c5; background-color: white;">
	&nbsp;&nbsp;<form action="buyServlet" method="post">
	<input type="submit" style="width: 150px;height: 40px;font-size: 18px; border:1px solid #2571c5; background-color: white;" name="add" value="加入购物车"></button></a>
	</div>
  		</c:forEach>
  		</form>
  </div>
    
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

.top2 {
	width: 1200px;
	height: 60px;
	margin: auto;
}

.title {
	float: left;
}

.search {
	float: left;
}

.top3 {
	width: 100%;
	margin: auto;
}

.top4 {
	width: 100%;
	height: 450px;
	margin: auto;
	background: url(./img/AD0Ivvn6AhACGAAg27fnvwUowOKr6AYwgA84wgM.jpg);
}

.dh {
	width: 195px;
	height: 450px;
	margin: left;
	float: left;
	background-color: white;
}

.zl {
	width: 180px;
	height: 40px;
	font-size: 20px;
	font-family: '微软雅黑';
}

.mc {
	width: 55px;
	height: 40px;
	font-size: 14px;
	font-family: '微软雅黑';
}

.top5 {
	float: right;
}

.login {
	width: 800px;
	height: 600px;
	margin: auto;
	text-align: center;
	font-family: '微软雅黑';
}

.d1 {
	width: 800px;
	height: 40px;
	margin: auto;
	text-align: left;
	padding: 20px;
	font-family: '微软雅黑';
	font-size: 20px;
}

.d2 {
	width: 800px;
	height: 250px;
	margin: auto;
}

.d3 {
	width: 750px;
	height: 80px;
	margin: auto;
	font-family: '微软雅黑';
	font-size: 16px;
	border: 1px solid #2571c5;
}
</style>

<script type="text/javascript" src="js/jquery.js">
	
</script>
<script type="text/javascript">
	function num1(obj) {
		var d = {};
		var td = $(obj).parent();
		var tr = td.parent();
		var input =  tr.find("input[name^='shoppingCartID']");
		d[input.attr("name")]=input.val();
		//获得文本框对象
		var t = td.children("#text_box");
		//初始化数量为1,并失效减
		$(obj).attr('disabled', false);
		if (parseInt(t.val()) == 1) {
			$(obj).attr('disabled', true);
		}
		t.val(parseInt(t.val()) - 1);
		d[t.attr("name")]=t.val();
		$.ajax({
					type : "POST",
					url : "updateShoppingCart",
					data : d,
					success : function(msg) {
					}
				})
	}

	function num2(obj) {
		var d = {};
		var td = $(obj).parent();
		var tr = td.parent();
		var input =  tr.find("input[name^='shoppingCartID']");
		d[input.attr("name")]=input.val();
		//数量增加操作
		var t = td.children("#text_box");
		$(obj).attr('disabled', false);
		t.val(parseInt(t.val()) + 1);
		if (parseInt(t.val()) == 5) {
			$(obj).attr('disabled', true);
		}
		d[t.attr("name")]=t.val();
		$.ajax({
					type : "POST",
					url : "updateShoppingCart",
					data : d,
					success : function(msg) {
					}
				})
		
	}
	function deleteS() {
		var d = {};
		var checkbox = $(":checkbox");
		checkbox.each(function(i, n) {
			if ($(n).is(':checked') == true) {
				var td = $(this).parent();
				d[td.children("#shoppingCartID").attr("name")] = td.children(
						"#shoppingCartID").val();
				$.ajax({
					type : "POST",
					url : "DeleteShoppingCart",
					data : d,
					success : function(msg) {
					}
				})
			}
		})
		window.location.reload();
	}
	function buys() {
		var d = {};
		var checkbox = $(":checkbox");
		checkbox.each(function(i, n) {
			if ($(n).is(':checked') == true) {
				var tr = $(this).parent();
				d[tr.children("#shoppingCartID").attr("name")] = tr.children(
						"#shoppingCartID").val();
				$.ajax({
					type : "POST",
					url : "ByServlet",
					data : d,
					success : function(msg) {
					}
				})
				$.ajax({
					type : "POST",
					url : "DeleteShoppingCart",
					data : d,
					success : function(msg) {
					}
				})
			}
		})
		/* window.location.reload();页面实现跳转和刷新 */
		window.location.reload();
	}
</script>

</head>

<body>
	<div class="top1">
		<a href="memberServlet" style="text-decoration:none;">${customerLogin}</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="index.jsp"
			style="text-decoration:none;">返回首页</span></a>
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

	<div class="top3">
		<img alt="fl" src="./img/fl.png " style="width: 195px">
	</div>

	<div class="top4">
		<div class="top3">
			<div class="dh">
				<form action="search" method="post">
					<table>
						<tr>
							<td colspan="3" class="zl">小家电</td>
						</tr>
						<tr>
							<td class="mc"><input type="submit" value="吸尘器"
								style="border: none;background-color: white;" name="proName"></td>
							<td class="mc"><input type="submit" value="电风扇"
								name="proName" style="border: none;background-color: white;"></td>
							<td class="mc"><input type="submit" value="灭蚊器"
								name="proName" style="border: none;background-color: white;"></td>
						</tr>
						<tr>
							<td class="mc"><input type="submit" value="净水器"
								style="border: none;background-color: white;" name="proName"></td>
							<td class="mc"><input type="submit" value="电饭煲"
								name="proName" style="border: none;background-color: white;"></td>
							<td class="mc"><input type="submit" value="电磁炉"
								name="proName" style="border: none;background-color: white;"></td>
						</tr>
						<tr>
							<td colspan="3" class="zl">大家电</td>
						</tr>
						<tr>
							<td class="mc"><input type="submit" value="冰箱"
								style="border: none;background-color: white;" name="proName"></td>
							<td class="mc"><input type="submit" value="空调"
								name="proName" style="border: none;background-color: white;"></td>
							<td class="mc"><input type="submit" value="洗衣机"
								name="proName" style="border: none;background-color: white;"></td>
						</tr>
						<tr>
							<td class="mc"><input type="submit" value="油烟机"
								style="border: none;background-color: white;" name="proName"></td>
							<td class="mc"><input type="submit" value="热水器"
								name="proName" style="border: none;background-color: white;"></td>
							<td class="mc"><input type="submit" value="办公打印"
								name="proName" style="border: none;background-color: white;"></td>
						</tr>
						<tr>
							<td colspan="3" class="zl">手机数码</td>
						</tr>
						<tr>
							<td class="mc"><input type="submit" value="手机"
								style="border: none;background-color: white;" name="proName"></td>
							<td class="mc"><input type="submit" value="数码相机"
								name="proName" style="border: none;background-color: white;"></td>
							<td class="mc"></td>
						</tr>
						<tr>
							<td colspan="3" class="zl">当季热品</td>
						</tr>
						<tr>
							<td class="mc"><input type="submit" value="剃须刀"
								style="border: none;background-color: white;" name="proName"></td>
							<td class="mc"><input type="submit" value="电吹风"
								name="proName" style="border: none;background-color: white;"></td>
							<td class="mc"><input type="submit" value="洁面美容"
								name="proName" style="border: none;background-color: white;"></td>
						</tr>
						<tr>
							<td class="mc"><input type="submit" value="按摩"
								style="border: none;background-color: white;" name="proName"></td>
							<td class="mc"><input type="submit" value="美发神器"
								name="proName" style="border: none;background-color: white;"></td>
						</tr>
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
			购物车
			<hr>
		</div>
		<div class="d2">
			<table class="d3">
				<tr style="height: 50px">
					<td width="100px">编号</td>
					<td width="100px">商品编号</td>
					<td width="100px">商品名</td>
					<td width="100px">商品原价</td>
					<td width="100px">活动价</td>
					<td width="100px">优惠价</td>
					<td width="100px">商品数量</td>
				</tr>
				<c:forEach items="${shop}" var="s">
					<tr style="height: 50px">
						<td width="100px"><input type="checkbox" id="checks"
							name="checks" style="width: 20px"> <input type="text"
							id="shoppingCartID" name="shoppingCartID"
							style="border: none;width: 60px" readonly="readonly"
							value="${s.shoppingCartID }"></td>
						<td width="100px"><input type="text" id="productId"
							name="productId" style="border: none;width: 60px"
							readonly="readonly" value="${s.productId}"></td>
						<td width="100px"><input type="text" id="productName"
							name="productName" style="border: none;width: 60px"
							readonly="readonly" value="${s.productName}"></td>
						<td width="100px"><input type="text" id="productPrice"
							name="productPrice" style="border: none;width: 60px"
							readonly="readonly" value="${s.productPrice}"></td>
						<td width="100px"><input type="text" id="buyPrice"
							name="buyPrice" style="border: none;width: 60px"
							readonly="readonly" value="${s.buyPrice}"></td>
						<td width="100px"><input type="text" id="discount"
							name="discount" style="border: none;width: 60px"
							readonly="readonly" value="${s.discount}"></td>
						<td width="100px"><input id="min" name="min" type="button"
							value="-"
							style="width:20px;height: 30px;border:1px solid #2571c5"
							onclick="num1(this)" /> <input id="text_box" name="text_box"
							type="text" value="${s.productNum}"
							style="width: 40px;height: 30px;border:1px solid #2571c5" /> <input
							id="add" name="add" type="button" value="+"
							style="width: 20px;height: 30px;border:1px solid #2571c5"
							onclick="num2(this)" /></td>
					</tr>
				</c:forEach>
				<tr style="height: 50px">
					<td colspan="6" style="text-align: center;"><input
						type="button" value="确认购买"
						style="width: 70px;height: 30px;border: none;" onclick="buys()">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
						id="deletes" name="deletes" value="删除"
						style="width: 70px;height: 30px;border: none;" onclick="deleteS()"></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>

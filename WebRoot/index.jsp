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
	width: 50px;
	height: 40px;
	font-size: 14px;
	font-family: '微软雅黑';
	}
	.top5{
	float: right;
	}
	.bar{
	width:1200px;
	margin:10px auto;
	}
	.pc{
	width:235px;
	height:300px;
	float: left;
	text-align:center;
	}
	.sc{
	float: left;
	}
	.t{
	width:235px;
	height:110px;
	margin:auto;
	float: left;
	}
	.p{
	width:235px;
	height:190px;
	text-align:center;
	float: left;
	}
	.ba{
	width:1200px;
	margin:auto;
	text-align: center;
	}
</style>
  </head>
  
  
  <body>
    <div class="top1">
  	<a href="login/login.jsp" style="text-decoration:none;color: black;">登录
  	</a> &nbsp;<a href="memberServlet" style="text-decoration:none;color: black;">${customerLogin}</a>
	&nbsp;<a href="zhuce.jsp" style="text-decoration:none;color: black;"> 注册 </a>
	&nbsp;&nbsp;<a href="ShoppingCartServlet" style="text-decoration:none;color: black;"> 购物车 </a>
	&nbsp;&nbsp;<a href="../HaiTao3/ManagerLogin.jsp" style="text-decoration:none;color: black;">管理中心</a>
    </div>
    
    <div class="top2">
    <div class="title">
    <img alt="title" src="./img/title.png">
    </div>
    <div class="search">
    <form action="search" method="post">
    <input type="text" style="width:448px;height: 35px;font-size: 20px; " name="proName">
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
    
    <div class="bar">
    <img  src="./img/AD0Ivvn6AhACGAAg2bfnvwUo9vyI3wcwogI4rAE.jpg">
    <img  src="./img/AD0Ivvn6AhACGAAg3bfnvwUomvzSnQIwogI4rAE.jpg">
    <img  src="./img/AD0Ivvn6AhACGAAg2bfnvwUopsHxlgEwogI4rAE.jpg">
    <img  src="./img/AD0Ivvn6AhACGAAg2bfnvwUoqL_x6wEwogI4rAE.jpg">
    </div>
    
    
    <div class="bar">
    <img src="./img/1F.png">
    </div>
    
    <div class="bar">
    <div class="sc"><img src="./img/AD0Ivvn6AhACGAAg3LfnvwUorPTcqAIwxAM4rAI.jpg"></div>
    <div class="pc">
    <div class="t">
    <br>
    <span style="font-size: 20px;font-family: '微软雅黑';">新品震撼首发</span><br>
    <span style="font-size: 14px;font-family: '微软雅黑';">超大吸力&nbsp强劲除灰</span>
    </div>
    <div class="p"><img src="./img/AD0Ivvn6AhAEGAAg2rfnvwUor7yalQUwYzikAQ.png"></div>
    </div>
    <div class="pc">
    <div class="t">
    <br>
    <span style="font-size: 20px;font-family: '微软雅黑';">手持式挂烫机</span><br>
    <span style="font-size: 14px;font-family: '微软雅黑';">小身材也有大性感</span>
    </div>
    <div class="p"><img src="./img/AD0Ivvn6AhAEGAAg27fnvwUo4-yxZTCPATioAQ.png"></div>
    </div>
    <div class="pc">
    <div class="t">
    <br>
    <span style="font-size: 20px;font-family: '微软雅黑';">风之化身听候差遣</span><br>
    <span style="font-size: 14px;font-family: '微软雅黑';">高贵冷艳任你调教</span>
    </div>
    <div class="p"><img src="./img/AD0Ivvn6AhAEGAAg27fnvwUokNyUTDCpATiMAQ.png"></div>
   	</div>
   	</div>
    
    <div class="bar">
    <div class="pc">
    <div class="t">
     <br>
    <span style="font-size: 20px;font-family: '微软雅黑';">静音节能</span><br>
    <span style="font-size: 14px;font-family: '微软雅黑';">均匀活力&nbsp加热不粘锅</span>
    </div>
    <div class="p"><img src="./img/AD0Ivvn6AhAEGAAg3bfnvwUonIj9_QUwZziAAQ.png"></div>
    </div>
    <div class="pc">
    <div class="t">
    <br>
    <span style="font-size: 20px;font-family: '微软雅黑';">专业除PM2.5</span><br>
    <span style="font-size: 14px;font-family: '微软雅黑';">除烟尘除雾霭</span>
    </div>
    <div class="p"><img src="./img/AD0Ivvn6AhAEGAAg3LfnvwUowNPDpgEwTjiVAQ.png"></div>
    </div>
    <div class="pc">
    <div class="t">
    <br>
    <span style="font-size: 20px;font-family: '微软雅黑';">高端智能菜单</span><br>
    <span style="font-size: 14px;font-family: '微软雅黑';">蒸煮烤炖全能</span>
    </div>
    <div class="p"><img src="./img/AD0Ivvn6AhAEGAAg2bfnvwUomZz1wQUwpwE4ag.png"></div>
    </div>
    <div class="pc">
    <div class="t">
    <br>
    <span style="font-size: 20px;font-family: '微软雅黑';">冬季养身泡脚机</span><br>
    <span style="font-size: 14px;font-family: '微软雅黑';">为天下父母洗脚</span>
    </div>
    <div class="p"><img src="./img/AD0Ivvn6AhAEGAAg3LfnvwUo7s7HuQcwfDiOAQ.png"></div>
    </div>
    <div class="pc">
    <div class="t">
    <br>
    <span style="font-size: 20px;font-family: '微软雅黑';">时尚炫酷&nbsp够型够吸引</span><br>
    <span style="font-size: 14px;font-family: '微软雅黑';">3D质感浮动剃须</span>
    </div>
    <div class="p"><img src="./img/AD0Ivvn6AhAEGAAg3bfnvwUo-JeR5wUwPziTAQ.png"></div>
    </div>
    </div>
    </div>
    
    <div class="bar"><img  src="./img/AD0Ivvn6AhACGAAg2rfnvwUostf8-AQwsAk4Ww.jpg">
    </div>
    <div class="bar">
    <img src="./img/2F.png">
    </div>
    
    <div class="bar">
    <div class="sc"><img src="./img/AD0Ivvn6AhACGAAg2rfnvwUo_NnQyQMwwwM4rAI.jpg"></div>
    <div class="pc">
    <div class="t">
    <br>
    <span style="font-size: 20px;font-family: '微软雅黑';">直降300</span><br>
    <span style="font-size: 14px;font-family: '微软雅黑';">3D质感浮动剃须</span>
    </div>
    <div class="p"><img src="./img/AD0Ivvn6AhAEGAAg2rfnvwUor7yalQUwYzikAQ.png"></div>
    </div>
    <div class="pc">
    <div class="t">
     <br>
    <span style="font-size: 20px;font-family: '微软雅黑';">180度旋转设计</span><br>
    <span style="font-size: 14px;font-family: '微软雅黑';">真彩高色域</span>
    </div>
    <div class="p"><img src="./img/AD0Ivvn6AhAEGAAg3LfnvwUosMrzwQIwuQE4cA.png"></div>
    </div>
    <div class="pc">
    <div class="t">
      <br>
    <span style="font-size: 20px;font-family: '微软雅黑';">预约洗浴</span><br>
    <span style="font-size: 14px;font-family: '微软雅黑';">节省省电&nbsp一致高效</span>
    </div>
    <div class="p"><img src="./img/AD0Ivvn6AhAEGAAg3LfnvwUot7fKgQcwuQE4ag.png"></div>
   	</div>
   	</div>
    
    <div class="bar">
    <div class="pc">
    <div class="t">
   <br>
    <span style="font-size: 20px;font-family: '微软雅黑';">康宝二星级消毒柜</span><br>
    <span style="font-size: 14px;font-family: '微软雅黑';">高温+童锁+预约</span>
    </div>
    <div class="p"><img src="./img/AD0Ivvn6AhAEGAAg2rfnvwUo1s6y2wMwbDidAQ.png"></div>
    </div>
    <div class="pc">
    <div class="t">
    <br>
    <span style="font-size: 20px;font-family: '微软雅黑';">智能点钞机</span><br>
    <span style="font-size: 14px;font-family: '微软雅黑';">一只手就能掌握</span>
    </div>
    <div class="p"><img src="./img/AD0Ivvn6AhAEGAAg2rfnvwUowM-0kQQwXjidAQ.png"></div>
    </div>
    <div class="pc">
    <div class="t">
   <br>
    <span style="font-size: 20px;font-family: '微软雅黑';">大屏风暖浴霸</span><br>
    <span style="font-size: 14px;font-family: '微软雅黑';">LED大照明</span>
    </div>
    <div class="p"><img src="./img/AD0Ivvn6AhAEGAAg3LfnvwUooeWd9QMwjAE4qQE.png"></div>
    </div>
    <div class="pc">
    <div class="t">
   <br>
    <span style="font-size: 20px;font-family: '微软雅黑';">格兰仕冰洗&nbsp强势来袭</span><br>
    <span style="font-size: 14px;font-family: '微软雅黑';">品牌力量超乎你的想象</span>
    </div>
    <div class="p"><img src="./img/AD0Ivvn6AhAEGAAg3LfnvwUo6PKzlgMwRzioAQ.png"></div>
    </div>
    <div class="pc">
    <div class="t">
    <br>
    <span style="font-size: 20px;font-family: '微软雅黑';">海尔空调&nbsp智能健康</span><br>
    <span style="font-size: 14px;font-family: '微软雅黑';">低价狂欢</span>
    </div>
    <div class="p"><img src="./img/AD0Ivvn6AhAEGAAg3bfnvwUowKKGmAMwjQE4rQE.png"></div>
    </div>
    </div>
    </div>
    
    <div class="bar">
    <img src="./img/ms.png">
    </div>
  </body>
</html>

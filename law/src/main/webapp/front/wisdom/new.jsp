<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>法律时评[详情]</title>
<meta name="keywords"
	content="法律智慧网,法律咨询,法律咨询网,法律在线,法律知识,法律援助,律师在线,中国法律,中法网">
<meta name="description"
	content="法律智慧网是一家在线法律服务门户网站平台，律师在线解答法律咨询，为您提供一站式、便捷、高效的法律服务！">
<link rel="shortcut icon" href="../images/logo_ .png">
<link rel="stylesheet" type="text/css" href="../css/CssReset.css">
<link rel="stylesheet" type="text/css" href="../css/defaultindex.css" id="devIndexCss">
<link rel="stylesheet" type="text/css" href="../css/artDefualt.css" id="devArtCss">
<link rel="stylesheet" type="text/css" href="../css/model.css">
<link rel="stylesheet" type="text/css" href="../css/wisdom.css"/>
<script src="../js/jquery-1.9.1.js" type="text/javascript"></script>
<script src="../js/time.js"></script>
<script type="text/javascript" src="../js/readDevCss.js"></script>
</head>
<body>
	<div id="top">
		<div id="top_page">
			<span>今天是<span id="nowtime"></span></span>
			<ul>
				<li>
				<c:if test="${user.usid!=null&&user.usid!=''}">
						<a>欢迎！！</a>： <a>${user.usname }</a>|
				</c:if> 
				<c:if test="${user.usid==null||user.usid==''}">
						<li><a href="../load.html">登录</a>| <a href="../submit.html">免费注册</a>|
				</c:if> 
					<a href="../UserCenter.jsp">会员中心</a>| <a href="###">收藏本站</a>| <a href="javascript:void(0)" onclick="aboutUs()">关于我们</a>
				</li>
			</ul>
		</div>
	</div>
	<!--E=页面-->
	<!--S=logo-->
	<div id="logo">
		<div class="img_logo fl">
			<img src="../images/logo.png" />
		</div>
		<div class="form fr">
			<form action="" method="get">
				<input type="text" placeholder="请输入关键字..." name="keyword" /> <input
					type="submit" value="检索" />
			</form>
		</div>
	</div>
	<!--E=logo-->
	<!--S=导航-->
	<div id="nav">
		<div class="nav_page">
			<ul>
				<li><a href="../index.jsp">首页</a></li>
				<li><a href="wave.jsp">智慧电波</a>
					<ul class="ull">
						<li><a href="wave.jsp">校园动态</a></li>
						<li><a href="wave2.jsp">社会聚焦</a></li>
						<li><a href="wave3.jsp">新闻调查</a></li>
					</ul></li>
				<li><a href="../art/art.jsp">智慧艺苑</a>
					<ul class="ull">
						<li><a href="../art/art.jsp">法治视频</a></li>
						<li><a href="../art/art2.jsp">法治动漫</a></li>
						<li><a href="../art/art3.jsp">法治摄影</a></li>
						<li><a href="../art/art4.jsp">法治书画</a></li>
						<li><a href="../art/art5.jsp">法治小说</a></li>
					</ul></li>
				<li><a href="../school/people.jsp">智慧私塾</a>
					<ul class="ull">
						<li><a href="../school/people.jsp">法治名人</a></li>
						<li><a href="../school/story.jsp">法治故事</a></li>
						<li><a href="../school/story2.jsp">法治典故</a></li>
						<li><a href="../school/saying.jsp">法治名言</a></li>
						<li><a href="../school/secret.jsp">法治灯谜</a></li>
						<li><a href="../school/words.jsp">法治楹联</a></li>
					</ul></li>
				<li><a href="../wisdom/wisdom.jsp">智慧讲堂</a>
					<ul class="ull">
						<li><a href="../wisdom/wisdom.jsp">法律时评</a></li>
						<li><a href="../wisdom/wisdom2.jsp">以案释法</a></li>
						<li><a href="../wisdom/wisdom3.jsp">名人说法</a></li>
					</ul></li>
				<li><a href="../assis/assis.jsp">智慧助手</a>
					<ul class="ull">
						<li><a href="../assis/assis.jsp">法规检索</a></li>
						<li><a href="../assis/assis2.jsp">法律e点通</a></li>
						<li><a href="../assis/assis3.jsp">法理探索</a></li>
					</ul></li>
				<li><a href="../tieba/tieba.jsp">法律智慧贴吧</a></li>
			</ul>
		</div>
	</div>
	<div class="model">
		<div class="lan">
			<p>您现在正在浏览:智慧讲堂 >> 法律时评 >> 详情</p>
		</div>
		<div class="content">
			<div class="left">
				<div class="title">
					<p>智慧讲堂</p>
				</div>
				<div class="classify">
					<ul>
						<li><a href="../wisdom/wisdom.jsp">法律时评</a></li>
						<li><a href="../wisdom/wisdom2.jsp">以案释法</a></li>
						<li><a href="../wisdom/wisdom3.jsp">名人说法</a></li>
					</ul>
					<ul class="ad">
						<li><img src="../images/ad.png"></li>
						<li><img src="../images/ad.png"></li>
						<li><img src="../images/ad.png"></li>
						<li><img src="../images/ad.png"></li>
					</ul>
				</div>
			</div>
			<div class="right">
				<div class="ppp">
					<h2 class="showWisInfoTitle">三只小猪上幼儿园</h2>
					<ul class="showWisInfoTime"><span style="margin-right:100px;">修改时间：2011/7/19 17:52:25</span> <span> 点击：1084014 次</span></ul>
				</div>
				<hr style="display:block;width:90%;margin:5px auto;"/>
				<div class="showWisCon">
					<p class="showWisConInfo">
					牧场里开满了花朵，蜜蜂嗡嗡地飞来飞去。就在这个时候，三只小猪——木木、花花和嗡嗡出生了。

				　　三只小猪每天在牧场里跑来跑去，调皮捣蛋。三只小猪也想帮忙做家务事，但是你看，就是这样子！猪妈妈和猪爸爸商量道：“送孩子们到幼儿园去吧，怎么样？”“恩——”，猪爸爸说：“那样也好！”
				
				　　第二天早上，木木、花花和嗡嗡就跟着妈妈到小猪幼儿园去了。“哇，这么多小猪呀！”三只小猪吓了一大跳。来，大家先来打个招呼。“老师早！”“小朋友早！”忽然，木木大声哭了起来：“妈妈不见啦！”于是，花花和嗡嗡也跟着哭了起来：“妈妈——”小朋友们很开心地做体操了，三只小猪却一直向着牧场那边看。
				
				　　“嘟——”老师吹起了哨子。“木木、花花、嗡嗡，来！跟大家一起来赛跑，要摸一下白杨树，才能跑回来喔！看看谁能跑第一！”“来！站在我旁边。”“排在这里。”“这儿有空位呢！”小猪们排好了队。“预备——跑！”“真快！真快！三只小猪都跑得好快。大家都休息了。看！三只小猪精神抖擞地又跑了一圈。
				
				　　放学了，妈妈来接三只小猪啦。“老师，再见！小朋友，再见！“三只小猪告诉老师和朋友们：”我们明天还来玩，我们喜欢上幼儿园了。“木木、花花和嗡嗡，三只小猪一路赛跑回牧场去了。
									
					牧场里开满了花朵，蜜蜂嗡嗡地飞来飞去。就在这个时候，三只小猪——木木、花花和嗡嗡出生了。<br/>

				　　三只小猪每天在牧场里跑来跑去，调皮捣蛋。三只小猪也想帮忙做家务事，但是你看，就是这样子！猪妈妈和猪爸爸商量道：“送孩子们到幼儿园去吧，怎么样？”“恩——”，猪爸爸说：“那样也好！”
				
				　　第二天早上，木木、花花和嗡嗡就跟着妈妈到小猪幼儿园去了。“哇，这么多小猪呀！”三只小猪吓了一大跳。来，大家先来打个招呼。“老师早！”“小朋友早！”忽然，木木大声哭了起来：“妈妈不见啦！”于是，花花和嗡嗡也跟着哭了起来：“妈妈——”小朋友们很开心地做体操了，三只小猪却一直向着牧场那边看。
				
				　　“嘟——”老师吹起了哨子。“木木、花花、嗡嗡，来！跟大家一起来赛跑，要摸一下白杨树，才能跑回来喔！看看谁能跑第一！”“来！站在我旁边。”“排在这里。”“这儿有空位呢！”小猪们排好了队。“预备——跑！”“真快！真快！三只小猪都跑得好快。大家都休息了。看！三只小猪精神抖擞地又跑了一圈。
				
				　　放学了，妈妈来接三只小猪啦。“老师，再见！小朋友，再见！“三只小猪告诉老师和朋友们：”我们明天还来玩，我们喜欢上幼儿园了。“木木、花花和嗡嗡，三只小猪一路赛跑回牧场去了。	
					</p>
				</div>
			</div>
		</div>
	</div>
	<div id="link">
		<div class="contact fl">
			<h2>联系我们</h2>
			<ul>
				<li>官方微信：<br /> <i class="wechat"></i>
				</li>
				<li>客服电话：<span><i class="phone"></i>11022020</span><br />
					官方微博：<a href="###" target="_blank"><i class="weibo"></i></a><br />
					客服在线：<a href="###" target="_blank"><i class="qq"></i></a>
				</li>
			</ul>
		</div>
		<div class="navigation fl">
			<h2>服务导航</h2>
			<ul>
				<li><span>法律在线</span> <a href="">关于我们</a> <a href="">团队管理</a> <a
					href="">板块说明</a> <a href="">加入我们</a></li>
				<li><span>新手帮助</span> <a href="">如何使用</a> <a href="">如何使用</a> <a
					href="">如何使用</a> <a href="">如何使用</a></li>
				<li><span>新手帮助</span> <a href="">如何使用</a> <a href="">如何使用</a> <a
					href="">如何使用</a> <a href="">如何使用</a></li>
				<li><span>律师加盟</span> <a href="">入住流程</a> <a href="">入住协议</a> <a
					href="">排名规则</a> <a href="">招商合作</a></li>
				<li><span>常见问题</span> <a href="">如何服务</a> <a href="">注册流程</a> <a
					href="">忘记密码</a> <a href="">服务政策</a></li>
			</ul>
		</div>
	</div>
	<!--E=友情链接-->
	<!--S=关于我们-->
	<div id="aboutMe">
		<p></p>
		<p id="footInfo"></p>
		<p>业务信箱：电话： <span id="footPho"> </span>&nbsp;&nbsp;邮箱：<span id="footMail"></span></p>
		<p>&copy;版权所有：法律智慧网 www.hnit.com 2012-2015&nbsp;&nbsp; 制作单位：源辰信息有限公司</p>
	</div>
</body>
</html>

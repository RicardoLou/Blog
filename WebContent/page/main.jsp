<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>首页 | Ricardo‘s Blog</title>
	<!-- Bootstrap core CSS -->
	<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom styles for this template -->
	<link href="/Blog/css/main.css" rel="stylesheet">
	<script src="/Blog/js/clickScranne.js"></script>
	<script src="https://sdk.jinrishici.com/v2/browser/jinrishici.js" charset="utf-8"></script>
	<script src="/Blog/js/Sakura.js"></script>
	<script src="https://fastly.jsdelivr.net/gh/stevenjoezhang/live2d-widget@latest/autoload.js"></script>
	<script src="/Blog/js/slide.js"></script>
	<script src="/Blog/js/poetr.js"></script>
	<link type="text/css" rel="stylesheet" href="/Blog/css/main.css" />
	<style>
		.headDisplay {
			background-image: url('/Blog/img/background.jpg'); /* 确保路径正确 */
			background-size: cover;
			background-position: center;
			background-repeat: no-repeat;
			height: 100vh; /* 占满整个屏幕高度 */
			width: 100%;
		}
		content {
			margin: 0;
			padding: 0;
			font-family: Arial, sans-serif;
			background-image: url('/Blog/img/background.jpg');  /*设置背景图片路径 */
			background-size: cover;
			background-position: center;
			background-repeat: no-repeat;
			background-attachment: fixed;
			display: flex;
			flex-direction: column;
			align-items: center;
			min-height: 100vh;
		}

		.container {
			background-color: rgba(255, 255, 255, 0.3);
			backdrop-filter: blur(20px) brightness(1);
			-webkit-backdrop-filter: blur(20px) brightness(1);
			padding: 20px;
			border-radius: 8px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			margin: 20px auto;
			width: 80%; /* 根据需要调整宽度 */
			max-width: 1200px; /* 限制最大宽度 */
			flex: 1;
		}

		#footer {
			background-color: rgba(255, 255, 255, 0.3);
			backdrop-filter: blur(20px) brightness(1);
			-webkit-backdrop-filter: blur(20px) brightness(1);
			text-align: center;
			width: 80%;
			max-width: 1200px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			margin: 0 auto;
		}
		.character {
			position: absolute;
			font-size: 20px;
			font-weight: bold;
			color: red;
			pointer-events: none; /* 确保不会阻止其他事件 */
			animation: fade 1s forwards; /* 动画效果 */
		}
		@keyframes fade {
			to {
				opacity: 0;
				transform: translateY(-10px);
			}
		}
		#jinrishici-sentence {
			position: absolute;
			bottom: 20px; /* 距离底部 20px */
			left: 50%;
			transform: translateX(-50%);
			color: greenyellow;
			font-size: 18px;
			font-weight: bold;
			text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5); /* 增强可读性 */
		}
		#gushici{
			position: absolute;
			bottom: 20px; /* 距离底部 20px */
			left: 50%;
			transform: translateX(-50%);
			color: greenyellow;
			font-size: 18px;
			font-weight: bold;
			text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5); /* 增强可读性 */
		}
		.navbar-fixed {
			position: fixed;
			top: 0;
			width: 100%;
			z-index: 1000;
			background-color: transparent;  /* 初始背景透明 */
			backdrop-filter: none;  /* 初始无毛玻璃效果 */
			-webkit-backdrop-filter: none;  /* 兼容 Safari */
			transition: background-color 0.3s ease, backdrop-filter 0.3s ease, box-shadow 0.3s ease;
		}

		.navbar {
			display: flex;
			justify-content: space-between;
			align-items: center;
			padding-left: 10px;
			padding-top: 20px;
		}

		.nav-left {
			flex: 1;
			padding-left: 100px;
		}

		.blog-title {
			font-size: 24px;
			font-weight: bold;
			color: white;
			text-decoration: none;
		}

		.nav-right {
			display: flex;
			gap: 20px;
			padding-right: 100px;
		}

		.nav-item a {
			text-decoration: none;
			color: #333;
			font-weight: bold;
			text-align: center;
		}
		.nav-right .nav-item a {
			text-decoration: none;
			color: #444; /* 默认字体颜色 */
			font-weight: bold;
			padding: 10px 15px; /* 增加内边距，提升点击区域 */
			border-radius: 4px; /* 圆角效果 */
			transition: background-color 0.3s ease, color 0.3s ease; /* 平滑过渡效果 */
		}
		.nav-left .blog-title {
			font-size: 24px;
			font-weight: bold;
			color: #333;
			text-decoration: none;
			transition: transform 0.3s ease, color 0.3s ease; /* 平滑变大和颜色过渡效果 */
		}

		.nav-left .blog-title:hover {
			transform: scale(1.1); /* 放大 10% */
			color: #007BFF; /* 悬停时变为蓝色 */
		}.nav-left .blog-title {
			 font-size: 24px;
			 font-weight: bold;
			 color: #333;
			 text-decoration: none;
			 transition: transform 0.3s ease, color 0.3s ease; /* 平滑变大和颜色过渡效果 */
		 }

		.nav-left .blog-title:hover {
			transform: scale(1.1); /* 放大 10% */
			color: #007BFF; /* 悬停时变为蓝色 */
		}
		.nav-right .nav-item a:hover {
			background-color: #fff; /* 悬停时背景变为白色 */
			color: #007BFF; /* 悬停时字体变为蓝色 */
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 增加阴影效果 */
		}
		#typewriting {
			position: absolute;
			top: 60%;
			left: 50%;
			width: 42ch;
			transform: translate(-50%, -50%);
			font-size: clamp(20px, 3vw, 40px); /* 动态调整字体大小 */
			font-weight: bold;
			color: greenyellow;
			text-wrap: nowrap;
			overflow: hidden;
			animation: typing 8s steps(43)
			infinite alternate-reverse;
		}

		@keyframes typing {
			from {
				width: 0ch;
			}
		}

	</style>


</head>
<body>
<div class="headDisplay">
	<div class="navbar-fixed">
		<div class="navbar">
			<div class="nav-left">
				<a href="#" class="blog-title">Ricardo's Blog</a>
			</div>
			<div class="nav-right">
				<div class="nav-item">
					<a href="#">日志 ${article_number}</a>
				</div>
				<div class="nav-item">
					<a href="/Blog/SortServlet?get=all">分类 ${sort_number}</a>
				</div>
				<div class="nav-item">
					<a href="/Blog/TagsServlet?get=all">标签 ${tags_number}</a>
				</div>
			</div>
		</div>
	</div>
	<div id="typewriting" class="typewriting-text">Fear And Dreams, Hold Onto Your Brightness.</div>
	<!-- 其他内容 -->
	<p id="gushici" style="color: greenyellow;">加载中...</p>
</div>

<div class="content">
	<div class="head_line"></div>

	<div class="container" id="main">

		<div id="header"></div>

		<div class="row c_center">
			<div class="col-md-3" id="left_content">

				<div id="title">
					<h2><a href="/Blog/login.html">Ricardo's Blog</a></h2>
					<h5 class="text-muted">stay hungry, stay foolish!</h5>
				</div>

				<div class="c_center" id="person_info">
					<img src="/Blog/img/header.jpg" height="130" width="130"
						 alt="丢失了我的头像?" class="img-circle">
					<h5 class="text-muted">欢迎您：</h5>
					<h4 class="text-muted">${sessionScope.user.user_name}</h4>
				</div>



				<div id="list">
					<table class="table table-hover c_center">
						<tr class="active">
							<td><a href="/Blog/index.jsp" style="color: black;"><span class="glyphicon glyphicon-home"></span>
								&nbsp;&nbsp;首页</a></td>
						</tr>
						<tr>
							<td><a href="/Blog/SortServlet?get=all" style="color: black;"><span class="glyphicon glyphicon-list"></span>
								&nbsp;&nbsp;分类</a></td>
						</tr>
						<tr>
							<td><a href="/Blog/TagsServlet?get=all" style="color: black;"><span class="glyphicon glyphicon-tags"></span>
								&nbsp;&nbsp;标签</a></td>
						</tr>
						<tr>
							<td><a href="/Blog/AxisServlet" style="color: black;"><span class="glyphicon glyphicon-book"></span>
								&nbsp;&nbsp;时间轴</a></td>
						</tr>
						<tr>
							<td><a href="/Blog/page/about.html" style="color: black;"><span class="glyphicon glyphicon-user"></span>
								&nbsp;&nbsp;关于</a></td>
						</tr>
					</table>
				</div>
				<!-- list -->
				<br/>

				<div class="sort">
					<div class="list-group">
						<span class="list-group-item active">分类</span>
						<!-- 这里初始化分类 -->
						<c:forEach var="entity"  items="${sort_count_map}">
							<a href="/Blog/SortServlet?get=${entity.key}" class="list-group-item">${entity.key}&nbsp;&nbsp;&nbsp;&nbsp; (${entity.value})</a>
						</c:forEach>
						<!-- 初始化结束 -->
					</div>
				</div><!-- sort -->


				<div class="visit">
					<div class="list-group">
						<span class="list-group-item active">阅读排行</span>
						<!-- 这里初始化阅读排行 -->
						<c:forEach var="a"  items="${visit_rank}">
							<a href="/Blog/ArticleServlet?id=${a.id}" class="list-group-item">${a.title}&nbsp;&nbsp; <span class="c_right">(${a.visit})</span></a>
						</c:forEach>
						<!-- 初始化结束 -->
					</div>
				</div><!-- visit-->


				<div id="tag">
					<div class="list-group">
						<span class="list-group-item active">标签</span>
						<br/>

						<!-- 这里初始化标签 -->
						<c:forEach var="t"  varStatus="status" items="${tag_list}" >
							<c:choose>
								<c:when test="${status.count%2==1}">
							<span class="label label-info"><a href="/Blog/TagsServlet?get=${t.tag}">
							&nbsp;${t.tag}&nbsp;</a></span>
								</c:when>
								<c:otherwise>
								<span class="label label-success"><a href="/Blog/TagsServlet?get=${t.tag}">
								&nbsp;${t.tag}&nbsp;</a></span>
								</c:otherwise>
							</c:choose>

						</c:forEach>
						<!-- 初始化标签完成 -->
					</div>
				</div><!-- tag -->


				<!-- admin here -->
				<c:if test="${sessionScope.user!=null}">
					<a href="/Blog/AddServlet">
						<span class="glyphicon glyphicon-plus">&nbsp;&nbsp;写新文章&nbsp;&nbsp;</span>
					</a>
					<a href="/Blog/AdminServlet">
						<span class="glyphicon glyphicon glyphicon-user">&nbsp;&nbsp;管理更多&nbsp;&nbsp;</span>
					</a>
				</c:if>
				<!--  -->

			</div>
			<div class="col-md-2" id="center_content">
			</div>


			<div  class="col-md-7 " id="right_Content">
				<br />
				<br />
				<div class="list-group">
					<a href="#" class="list-group-item active">文章</a>
					<!-- 这里初始化文章列表 -->
					<c:forEach var="article"   items="${article_list}" >
						<div  class="list-group-item">
							<h4><a href="/Blog/ArticleServlet?id=${article.id}">${article.title}</a></h4>
							<br/>
							<span>${article.time}&nbsp;&nbsp;|</span>
							<a href="/Blog/SortServlet?get=${article.sort}">${article.sort}</a>&nbsp;&nbsp;|
							<span>阅读次数: ${article.visit}</span>
							<br/><br/>
							<span>${article.content}</span>
							<br/><br/><br/>
							<a href="/Blog/ArticleServlet?id=${article.id}">阅读全文</a>
							<br/>
						</div>
					</c:forEach>
					<!-- 初始化文章列表完成 -->
				</div>
			</div>
		</div>
		<div class="foot_line"></div>
	</div><!-- container -->
	<div id="footer">
		<div>
			<a href="https://github.com/RicardoLou"><img src="/Blog/img/github.png" width="20px" height="20px" class="img-circle" style="align-items: center;">&nbsp;&nbsp;GitHub</a>
			&nbsp;|
			<a href="#">&nbsp;&nbsp;Ricardo‘s Blog</a>
			<br/>
			copyright © 2024
		</div>

		<div class="r_div">
			<input type="button" id="backToTop" class="btn btn-default"   value="返回顶部"  style="width:50%;"/>
			<h6> 被访问了 ${visited} 次</h6>
			<h6> 你是第 ${member} 个访问者</h6>
		</div>
		<script src="/Blog/js/main.js"></script>
	</div><!-- footer -->
</div>
</body>
</html>
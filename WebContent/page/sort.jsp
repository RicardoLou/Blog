<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分类 | Ricardo‘s Blog</title>
<link	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../css/main.css" rel="stylesheet">
<script src="/Blog/js/clickScranne.js"></script>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-image: url('/Blog/img/background2.jpeg'); /* 设置背景图片路径 */
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
</style>
</head>
<body>
	<div class="head_line"></div>

	<div class="container" id="main">

		<div id="header"></div>

		<div class="row c_center">
			<div class="col-md-3" id="left_content">

				<div id="title">
					<h2>
						<a href="/Blog/loadingServlet">Ricardo‘s Blog</a>
					</h2>
					<h5 class="text-muted">Winner Winner Chicken Dinner!</h5>
				</div>

				<div class="c_center" id="person_info">
					<img src="/Blog/img/header.jpg" height="130" width="130"
						alt="what?" class="img-circle">
					<h5 class="text-muted">Chicken Dinner Again!</h5>
				</div>


				<div id="list">
					<table class="table table-hover c_center">
						<tr>
							<td><a href="/Blog/loadingServlet"><span class="glyphicon glyphicon-home"></span>
								&nbsp;&nbsp;首页</a></td>
						</tr>
						<tr>	
							<td class="active"><a href="/Blog/SortServlet?get=all"><span class="glyphicon glyphicon-list"></span>
								&nbsp;&nbsp;分类</a></td>
						</tr>
						<tr>
							<td><a href="/Blog/TagsServlet?get=all"><span class="glyphicon glyphicon-tags"></span>
								&nbsp;&nbsp;标签</a></td>
						</tr>						
						<tr>
							<td><a href="/Blog/AxisServlet"><span class="glyphicon glyphicon-book"></span>
								&nbsp;&nbsp;时间轴</a></td>
						</tr>
						<tr>
							<td><a href="/Blog/page/about.html"><span class="glyphicon glyphicon-user"></span>
								&nbsp;&nbsp;关于</a></td>
						</tr>
					</table>
				</div>
				<!-- list -->
				<br />
			</div>
			<div class="col-md-2" id="center_content"></div>
			<div class="col-md-7 " id="right_Content">
				<br /> <br />
				<div class="list-group">
					<a href="#" class="list-group-item active">分类</a>
					<!-- 这里初始化列表 -->					
					<c:forEach var="map" items="${sort_article_map}">					
					<div class="sort_name">
					<!-- 分类名字 -->
					<span class="glyphicon glyphicon-triangle-bottom"></span>	&nbsp;	&nbsp;${map.key}					
					</div>
					<div>
					<!-- 分类信息 -->
					<ul class="list-group">
					
					<c:forEach var="list" items="${map.value}">
					<li class="list-group-item">
								<div>
									<div>
										<a href="/Blog/ArticleServlet?id=${list.id}">${list.title}</a>
									</div>
									<div class="c_right">
									<img src="/Blog/img/time.png">
									${list.time}&nbsp;&nbsp; 
									<span class="visit"><img src="/Blog/img/visit.png">
									${list.visit}	</span>
									</div>
								</div>
					</li>
					</c:forEach>					
					</ul>
					</div>								
					</c:forEach>					
					<!-- 初始化列表完成 -->
				</div>
			</div>
		</div>

		<div class="foot_line"></div>
	</div>
	<!-- container -->


	<div id="footer">
		<div>
			<a href="https://github.com/RicardoLou"><img src="/Blog/img/github.png" width="20px" height="20px" class="img-circle" style="align-items: center;">&nbsp;&nbsp;GitHub</a>
			&nbsp;|
			<a href="#">&nbsp;&nbsp;Ricardo‘s Blog</a>
			<br/>
			copyright © 2024
		</div>
		
		<div class="r_div">
		<a href="#"><input type="button" class="btn btn-default"   value="返回顶部"  style="width:50%;"/></a>
		<h6> 被访问了 ${visited} 次</h6>
		<h6> 你是第 ${member} 个访问者</h6>
		</div>
		
	</div>
	<!-- footer -->

</body>
</html>
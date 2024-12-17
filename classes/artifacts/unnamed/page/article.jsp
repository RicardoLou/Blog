<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/highlight.js/styles/default.min.css">
    <script src="https://cdn.jsdelivr.net/npm/highlight.js/lib/core.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/highlight.js/lib/languages/html.min.js"></script>
    <script>
        hljs.highlightAll();
    </script>
    <title>文章 | Ricardo‘s Blog</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('../img/background4.jpeg'); /* 设置背景图片路径 */
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
		.a_content {

		}
    </style>

    <!-- Bootstrap core CSS -->
    <link
            href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
            rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
    <script src="/Blog/js/article.js"></script>

    <link type="text/css" rel="stylesheet" href="/css/public.css"/>
    <link type="text/css" rel="stylesheet" href="/css/article.css"/>
</head>
<body>
<div class="head_line"></div>
<div class="container" id="main">

    <div class="head">
        <div id="title">
            <h2>
                <a href="/Blog/index.jsp">MyBlog</a>
            </h2>
        </div>
    </div>

    <div id="article">

        <div id="a_head ">
            <h3>${article.title}</h3>
            <br/>
            <div>
                <h5>
                    <span>${article.time}</span> <a href="/Blog/SortServlet?get=${article.sort}">${article.sort}</a>
                    ${article.author}
                </h5>
            </div>
            <div class="r_div">
                <h5>
                    <span class="glyphicon glyphicon-eye-open">&nbsp;${article.visit}&nbsp;</span>
                    <span class="glyphicon glyphicon-heart" id="love">&nbsp;${article.star}&nbsp;</span>
                    <span class="glyphicon glyphicon-comment">&nbsp;${article.comment}&nbsp;</span>
                </h5>
            </div>
            <div id="tag">
                <c:forEach var="t" items="${article_tags}">
                    <a href="/Blog/TagsServlet?get=${t.tag}">${t.tag}&nbsp;</a>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="line"></div>


    <div>
        <div class="f_div">
            <span class="glyphicon glyphicon-chevron-left"></span>


            <c:choose>
                <c:when test="${article_pre!=null}">
                    <a href="/Blog/ArticleServlet?id=${article_pre.id}">&nbsp;上一篇:${article_pre.title}</a>
                </c:when>
                <c:otherwise>
                    &nbsp;没有更早的文章了
                </c:otherwise>
            </c:choose>

        </div>
        <div class="r_div">

            <c:choose>
                <c:when test="${article_next!=null}">
                    <a href="/Blog/ArticleServlet?id=${article_next.id}">下一篇:&nbsp;${article_next.title}</a>
                </c:when>
                <c:otherwise>
                    &nbsp;没有更多的文章了
                </c:otherwise>
            </c:choose>

            <span class="glyphicon glyphicon-chevron-right"></span>
        </div>

        <div>
            <span class="btn btn-default" style="color:#d9534f;" onclick="love_article(${article.id})">点赞</span>
        </div>
        <br/>
    </div>


    <div id="a_content">
		<div id="content">
			<c:if test="${not empty article.content}">
				<div id="markdown-content"></div>
				<script>
					// 使用 marked.js 渲染 Markdown 并启用代码高亮
					marked.setOptions({
						highlight: function (code, lang) {
							return hljs.highlight(lang || 'plaintext', code).value;
						}
					});
					// 渲染 Markdown 内容
					const markdownContent = ` ${article.content} `;
					document.getElementById('markdown-content').innerHTML = marked.parse(markdownContent);
				</script>
			</c:if>
		</div>
    </div>

    <div class="line"></div>

    <!-- 评论 -->
    <div class="comment">

        <div class="r_div">
            <a href="#comment"><span class="glyphicon glyphicon-pencil">&nbsp;写评论....</span></a>
        </div>

        <!-- 加载文章评论 -->
        <c:if test="${comment!=null}">
            <c:forEach var="comm" varStatus="status" items="${comment}">

                <div class="row">
                    <div class="f_div">
                        <img src="/Blog/img/comment.jpg" height="50" width="50" class="img-circle"/>
                        &nbsp;&nbsp;
                        <span style="color: #428bca"> ${comm.nickname}</span>
                        <span>&nbsp;&nbsp;${comm.time}</span>
                    </div>
                    <div id="c_content" class="c_left">
                        <pre>${comm.content }</pre>
                    </div>
                    <div class="r_div">
                        <a><span class="glyphicon glyphicon-thumbs-up"
                                 onclick="star(this,${comm.id})">${comm.star}</span></a>
                        &nbsp;
                        <a><span class="glyphicon glyphicon-thumbs-down"
                                 onclick="diss(this,${comm.id})">${comm.diss}</span></a>
                        &nbsp;
                        <!-- admin here -->
                        <c:if test="${sessionScope.user!=null}">
                            <span class="btn btn-default" style="color:red;"
                                  onclick="deletecm(this,${comm.id})">删除</span>
                            &nbsp;
                        </c:if>
                    </div>
                    <div class="line"></div>
                </div>

            </c:forEach>

        </c:if>
    </div>
    <!-- 这里可以扩展子评论 -->


    <!-- 写评论 -->
    <div id="comment">

        <form action="/Blog/NewCommentServlet?id=${article.id}" method="post">
            <input style="width:30%" class="form-control" type="text" name="w_nickname" value="热心网友">
            <br/>
            <textarea style="resize:none; width:100%; height:180px;" name="w_content"></textarea>
            <br/>
            <br/>
            <input class="btn btn-default" type="submit" value="评论" onclick="onclick"/>
            <br/>
        </form>
    </div>
    <!--  -->
    <div class="line"></div>
</div>
<!-- container -->


<div id="footer">
    <div>
        <a href="https://github.com/RicardoLou"><img src="/Blog/img/github.png" width="20px" height="20px"
                                                     class="img-circle" style="align-items: center;">&nbsp;&nbsp;GitHub</a>
        &nbsp;|
        <a href="#">&nbsp;&nbsp;Ricardo‘s Blog</a>
        <br/>
        copyright © 2024
    </div>

    <div class="r_div">
        <a href="#"><input type="button" class="btn btn-default" value="返回顶部" style="width:50%;"/></a>
        <h6> 被访问了 ${visited} 次</h6>
        <h6> 你是第 ${member} 个访问者</h6>
    </div>
</div>
<!-- footer -->
</body>
</html>
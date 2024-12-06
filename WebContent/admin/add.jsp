<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新的文章 | Ricardo's Blog</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/Blog/signin.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="/Blog/css/add.css" />
    <link rel="stylesheet" href="/Blog/editormd/css/style.css" />
    <link rel="stylesheet" href="/Blog/editormd/css/editormd.css" />

    <script src="/Blog/editormd/js/zepto.min.js"></script>
    <script src="/Blog/editormd/js/editormd.js"></script>
    <script src="/Blog/js/add.js"></script>
</head>
<body>

<div class="container" id="main">
    <!-- Header Section -->
    <div id="title" class="text-center">
        <h2><a href="/Blog/index.jsp">Ricardo's Blog</a></h2>
    </div>

    <form action="/Blog/NewArticleServlet" method="post" class="form-horizontal">
        <!-- Title Section -->
        <div class="form-group">
            <label for="title" class="col-sm-2 control-label">标题</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="title" id="title" placeholder="输入文章标题">
            </div>
        </div>

        <!-- Time Section -->
        <div class="form-group">
            <label for="time" class="col-sm-2 control-label">时间</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="time" id="time" value="${time}" readonly>
            </div>
        </div>

        <!-- Author Section -->
        <div class="form-group">
            <label for="author" class="col-sm-2 control-label">作者</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="author" id="author" placeholder="输入作者名称">
            </div>
        </div>

        <!-- Sort Section -->
        <div class="form-group">
            <label for="sort" class="col-sm-2 control-label">分类</label>
            <div class="col-sm-10">
                <div>
                    <c:forEach var="s" items="${sort_count}">
                        <input class="btn btn-default" type="button" value="${s.key}" onclick="sort_click(this)">
                    </c:forEach>
                </div>
                <input type="text" class="form-control" id="sort" name="sort" placeholder="选择分类">
            </div>
        </div>

        <!-- Tags Section -->
        <div class="form-group">
            <label for="tags" class="col-sm-2 control-label">标签</label>
            <div class="col-sm-10">
                <div>
                    <c:forEach var="tag" items="${all_tag}">
                        <input class="btn btn-default" type="button" value="${tag.tag}" onclick="tags_click(this)">
                    </c:forEach>
                </div>
                <input type="text" class="form-control" id="tags" name="tags" placeholder="输入标签">
            </div>
        </div>

        <!-- Content Section -->
        <div class="form-group">
            <label for="content" class="col-sm-2 control-label">内容</label>
            <div class="col-sm-10">
                <div class="editormd" id="mdView">
                    <textarea name="content" id="content" placeholder="写下你的文章内容..."></textarea>
                </div>
            </div>
        </div>

        <!-- Submit Button -->
        <div class="form-group text-center">
            <div class="col-sm-12">
                <input class="btn btn-primary" type="submit" value="提交">
            </div>
        </div>
    </form>

    <!-- Footer -->
    <div id="footer" class="text-center">
        <a href="#">Ricardo's Blog</a>
    </div>

</div> <!-- End of Container -->

<script type="text/javascript">
    var testEditor;
    var jQuery = Zepto;
    $(function() {
        testEditor = editormd("mdView", {
            width: "90%",
            height: 720,
            path: './editormd/lib/',
            codeFold: true,
            searchReplace: true,
            saveHTMLToTextarea: true,
            htmlDecode: "style,script,iframe|on*",
            emoji: true,
            taskList: true,
            tocm: true,
            tex: true,
            flowChart: true,
            sequenceDiagram: true,
            imageUpload: true,
            imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL: "/Blog/UploadPic",
            onload: function() {}
        });
        editor.setToolbarAutoFixed(false);
    });
</script>

</body>
</html>
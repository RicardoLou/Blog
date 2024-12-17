<%--
  Created by IntelliJ IDEA.
  User: ricardo
  Date: 2024/12/16
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Real-time Markdown Render</title>
  <style>
    /* 布局容器 */
    .container {
      display: flex;
      justify-content: space-between;
      height: 500px;
    }
    /* 输入区域 */
    #input {
      width: 48%;
      height: 100%;
      padding: 10px;
      font-size: 16px;
      resize: none; /* 禁止调整大小 */
    }
    /* 渲染内容区域 */
    #content {
      width: 48%;
      height: 100%;
      padding: 10px;
      overflow-y: auto;
      background-color: #f4f4f4;
      border: 1px solid #ccc;
      white-space: pre-wrap; /* 保留换行符 */
    }
    /* 按钮样式 */
    button {
      margin: 5px;
    }
    /* 表单区域样式 */
    .form-container {
      margin-bottom: 20px;
    }
    .form-container input {
      width: 100%;
      padding: 8px;
      margin: 5px 0;
      box-sizing: border-box;
    }
    /* 按钮容器样式 */
    .button-container {
      margin-bottom: 10px;
    }
    .button-container button {
      margin: 5px;
    }
    a {
      color: black;
      text-decoration: none;
    }
    a:hover {
      font-size: 24px;
      color: #007BFF;
      transform: scale(1.1); /* 放大 10% */
      transition: transform 0.3s ease, color 0.3s ease; /* 平滑变大和颜色过渡效果 */
    }
    /* 提交按钮样式 */
    .submit-button {
      padding: 30px;
      display: flex;
      justify-content: center;
    }
    .submit-button button {
      width: 150px; /* 按钮宽度调整为100px */
      padding: 10px;
      background-color: #28a745;
      color: white;
      border: none;
      cursor: pointer;
      transition: background 0.3s ease, transform 0.3s ease; /* 平滑背景色和缩放过渡效果 */
    }
    .submit-button button:hover {
      background: linear-gradient(to right, #007BFF, #00c6ff); /* 鼠标悬停时背景渐变为蓝色 */
      transform: scale(1.1); /* 放大按钮 */
    }
  </style>
</head>
<body>
<!-- 表单区域 -->
<div id="title"><h2><a href="/Blog/index.jsp">Ricardo's Blog</a></h2></div>
<form action="/Blog/SubmitArticleServlet" method="post">
  <div class="form-container">
    <label for="title">Title：</label>
    <input type="text" id="title" name="title" placeholder="请输入标题" required>

    <label for="time">Time：</label>
    <input type="date" id="time" name="time" required>

    <label for="author">Author：</label>
    <input type="text" id="author" name="author" placeholder="请输入作者名" required>

    <label for="category">category：</label>
    <input type="text" id="category" name="category" placeholder="请输入分类" required>

  </div>

  <!-- 按钮区域 -->
  <div class="button-container">
    <button type="button" onclick="formatText('h1')">H1</button>
    <button type="button" onclick="formatText('h2')">H2</button>
    <button type="button" onclick="formatText('h3')">H3</button>
    <button type="button" onclick="formatText('code')">代码块</button>
    <button type="button" onclick="formatText('bold')">粗体</button>
    <button type="button" onclick="formatText('italic')">斜体</button>
    <button type="button" onclick="formatText('strikethrough')">删除线</button>
    <button type="button" onclick="addLink()">超链接</button>
    <button type="button" onclick="addComment()">注释</button>
    <button type="button" onclick="addList()">列表</button>
    <button type="button" onclick="addTable()">表格</button>
  </div>

  <div class="container">
    <textarea id="input" name="content" placeholder="Type your markdown here..." required></textarea>
    <div id="content"></div>
  </div>

  <!-- 提交按钮 -->
  <div class="submit-button">
    <button type="submit">提交文章</button>
  </div>
</form>

<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<script>
  var input = document.getElementById("input");
  var content = document.getElementById("content");

  // 设置marked选项，启用换行符转化为<br>
  marked.setOptions({
    breaks: true
  });

  // 实时渲染Markdown
  input.addEventListener("input", function() {
    content.innerHTML = marked.parse(input.value);
  });

  // 格式化选中的文本
  function formatText(style) {
    var selection = window.getSelection();
    var selectedText = selection.toString();

    if (selectedText) {
      var formattedText = "";
      var startPos = input.selectionStart;
      var endPos = input.selectionEnd;
      var textBefore = input.value.substring(0, startPos);
      var textAfter = input.value.substring(endPos);

      // 根据选择的样式进行格式化
      if (style === 'h1') {
        formattedText = "### " + selectedText;
      } else if (style === 'h2') {
        formattedText = "## " + selectedText;
      } else if (style === 'h3') {
        formattedText = "# " + selectedText;
      } else if (style === 'code') {
        formattedText = "`" + selectedText + "`";
      } else if (style === 'bold') {
        formattedText = "**" + selectedText + "**"; // 粗体
      } else if (style === 'italic') {
        formattedText = "*" + selectedText + "*"; // 斜体
      } else if (style === 'strikethrough') {
        formattedText = "~~" + selectedText + "~~"; // 删除线
      }

      // 更新文本框内容
      input.value = textBefore + formattedText + textAfter;
      input.focus();
      input.setSelectionRange(startPos + formattedText.length, startPos + formattedText.length);

      // 更新实时渲染
      content.innerHTML = marked.parse(input.value);
    }
  }

  // 添加超链接
  function addLink() {
    var url = prompt("请输入链接地址:");
    var text = window.getSelection().toString() || "点击这里";
    var link = `[${text}](${url})`;
    insertTextAtCursor(link);
  }

  // 添加注释
  function addComment() {
    var text = window.getSelection().toString();
    var comment = `<!-- ${text} -->`;
    insertTextAtCursor(comment);
  }

  // 添加列表
  function addList() {
    var text = window.getSelection().toString() || "列表项";
    var list = `- ${text}`;
    insertTextAtCursor(list);
  }

  // 添加表格
  function addTable() {
    var table = "| 表头 | 表头 | \n| --- | --- | \n| 内容 | 内容 |";
    insertTextAtCursor(table);
  }

  // 插入文本到光标位置
  function insertTextAtCursor(insertText) {
    var startPos = input.selectionStart;
    var endPos = input.selectionEnd;
    var textBefore = input.value.substring(0, startPos);
    var textAfter = input.value.substring(endPos);

    input.value = textBefore + insertText + textAfter;
    input.focus();
    input.setSelectionRange(startPos + insertText.length, startPos + insertText.length);

    // 更新实时渲染
    content.innerHTML = marked.parse(input.value);
  }
</script>
</body>
</html>
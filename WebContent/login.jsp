<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('/Blog/img/background.jpg'); /* 设置背景图片路径 */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: rgba(255, 255, 255, 0.8); /* 设置背景透明度 */
        }

        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-row {
            margin-bottom: 15px;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }

        #footer {
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
            padding: 10px 0;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form-container">
        <form action="/Blog/LoginServlet" method="post">
            <label class="form-row">
                <input autocomplete="one-time-code" type="text" id="name" name="username" placeholder="name" required>
            </label>
            <label class="form-row">
                <input autocomplete="one-time-code" type="password" id="password" name="password" placeholder="password" required>
            </label><br>
            <label class="form-row">
                <input type="checkbox" id="subscribe" name="subscribe"> 我已同意此协议
            </label>
            <div class="form-row">
                <input type="submit" value="登录">
            </div>
        </form>
        <!-- 显示错误信息 -->
        <c:if test="${not empty errorMessage}">
            <div class="error-message">${errorMessage}</div>
        </c:if>
    </div>
</div>
<div id="footer">
    <p>版权所有 © 2024 Ricardo‘s Blog</p>
</div>
</body>
</html> 
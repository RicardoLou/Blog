<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>别慌，等一小会嘛～</title>
    <style>
        body {
            background-image: url(/Blog/img/loadingBg.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
            height: 100vh; /* 视口高度 */
            display: flex;
            flex-direction: column; /* 让loadingGIF独立处理 */
            justify-content: center; /* 让loadingGIF垂直居中 */
            align-items: center; /* 让loadingGIF水平居中 */
        }

        .loadingGIF {
            width: 150px;
            height: 150px;
        }

        .bottom-section {
            position: absolute;
            bottom: 20px; /* 整个底部内容距离页面底部 */
            width: 100%; /* 占满宽度，方便定位内部元素 */
            display: flex;
            flex-direction: column; /* 垂直排列loadingBar和loadingbottom */
            align-items: center; /* 水平居中内容 */
        }

        .loadingBar-box {
            position: relative;
            width: auto; /* 保持图片的本身大小 */
            display: flex;
            justify-content: center;
        }

        .loadingBar {
            padding-bottom: 25px;
            width: 300px; /* 自定义宽度 */
            height: auto;
        }

        .loading-progress {
            position: absolute;
            top: 10%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 24px;
            font-weight: bold;
            color: black;
        }

        .loadingbottom {
            width: auto; /* 保持图片的本身大小 */
        }
    </style>
</head>
<body>
<!-- 中心的GIF -->
<div>
    <img src="/Blog/img/loadingImg.gif" alt="loading resource wrong" class="loadingGIF">
</div>

<!-- 底部的内容 -->
<div class="bottom-section">
    <div class="loadingBar-box">
        <img src="/Blog/img/loadingBar.png" alt="loading resource wrong" class="loadingBar">
        <!-- 动态进度文本 -->
        <span class="loading-progress" id="progress-text">0%</span>
    </div>
    <div class="loadingbottom-box">
        <img src="/Blog/img/loadingbottom.png" alt="loading resource wrong" class="loadingbottom">
    </div>
</div>

<script>
    // 获取进度文本元素
    const progressText = document.getElementById('progress-text');

    // 定义递归更新进度的函数
    let progress = 0;

    function updateProgress() {
        // 更新进度文本
        progressText.textContent = `${progress}%`;

        if (progress === 37) {
            // 在37%时延迟1秒
            setTimeout(() => {
                progress += 1;
                updateProgress(); // 递归调用继续更新进度
            }, 1000); // 延迟1秒
        } else if (progress === 80) {
            // 在80%时延迟2秒
            setTimeout(() => {
                progress += 1;
                updateProgress(); // 递归调用继续更新进度
            }, 2000); // 延迟2秒
        } else if (progress < 100) {
            // 如果进度小于100，继续增加进度
            progress += 1;
            setTimeout(updateProgress, 50); // 递归调用继续更新进度，每次延迟50ms
        } else if (progress === 100) {
            // 当进度达到100时，跳转到新的页面
            setTimeout(() => {
                window.location.href = '/Blog/index.jsp'; // 跳转到目标页面
            }, 500); // 等待500ms再跳转，给最后的更新效果一些时间
        }
    }

    // 启动进度更新
    updateProgress();
</script>
</body>
</html>
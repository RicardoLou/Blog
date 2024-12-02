    // 字符数组
    var infor = ["富强", "民主", "文明", "和谐", "自由", "平等", "公正", "法治", "爱国", "敬业", "诚信", "友善"];
    
    // 随机生成颜色
    function getRandomColor() {
        var letters = '0123456789ABCDEF';
        var color = '#';
        for (var i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }

    // 监听点击事件
    document.addEventListener('click', function(event) {
        // 获取点击位置
        var x = event.pageX;
        var y = event.pageY;

        // 随机选择一个字符
        var randomChar = infor[Math.floor(Math.random() * infor.length)];

        // 创建一个新的字符元素
        var charElement = document.createElement('span');
        charElement.classList.add('character');
        charElement.textContent = randomChar;

        // 设置字符颜色
        charElement.style.color = getRandomColor();

        // 设置字符的位置
        charElement.style.left = x + 'px';
        charElement.style.top = y + 'px';

        // 将字符元素添加到页面中
        document.body.appendChild(charElement);

        // 一段时间后移除字符元素
        setTimeout(function() {
            charElement.remove();
        }, 1000); // 1秒后移除
    });
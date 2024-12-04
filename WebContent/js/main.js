// 获取返回顶部按钮的元素
const backToTopButton = document.getElementById('backToTop');
// 添加点击事件监听器
backToTopButton.addEventListener('click', function(event) {
    event.preventDefault(); // 阻止默认的跳转行为

    // 使用 window.scrollTo 方法实现平滑滚动
    window.scrollTo({
        top: 0,
        behavior: 'smooth' // 平滑滚动
    });
});
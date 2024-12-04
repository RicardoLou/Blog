window.addEventListener('scroll', function() {
    const navbar = document.querySelector('.navbar-fixed');
    if (window.scrollY >= 600) {
        navbar.style.backgroundColor = 'rgba(255, 255, 255, 0.3)';  // 半透明背景
        navbar.style.backdropFilter = 'blur(10px) brightness(0.9)';  // 毛玻璃效果
        navbar.style.webkitBackdropFilter = 'blur(10px) brightness(0.9)';  // 兼容 Safari
        navbar.style.boxShadow = '0 4px 10px rgba(0, 0, 0, 0.1)';  // 添加阴影
    } else {
        navbar.style.backgroundColor = 'transparent';  // 背景透明
        navbar.style.backdropFilter = 'none';  // 移除毛玻璃效果
        navbar.style.webkitBackdropFilter = 'none';  // 兼容 Safari
        navbar.style.boxShadow = 'none';  // 移除阴影
    }
});
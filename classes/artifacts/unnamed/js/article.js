/* 
* 获取ajax处理对象		
 * @returns {xmlhttp}
 */
function getXHR(){	
	var xmlhttp;
	if (window.XMLHttpRequest) {
		 xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	return xmlhttp;	
}
/**
 * 点赞这个ariticle
 * @param article_id
 */
function love_article(article_id){
	var url = "/Blog/AriStarServlet?id="+article_id ;		
	// 获取ajax
	var xmlhttp = getXHR();	
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			// 处理服务器收到的请求响应
			var res = xmlhttp.responseText;			
			// 解析json对象
			var res = eval('(' + res + ')');			
			if (res.msg == "success") {
				//返回 ”success“
				document.getElementById("love").innerHTML= "&nbsp;"+ res.new_star+"&nbsp;";				
			}else{
				alert("不要狂点呀...");
			}
		}
	}
	xmlhttp.open("POST", url, true);
	xmlhttp.send();		
}


/*
 *删除评论
 */
function deletecm(component,comm_id){
	var container = component.parentNode.parentNode;
	var url = "/Blog/CMDeleServlet?id="+comm_id ;		
	// 获取ajax
	var xmlhttp = getXHR();	
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			// 处理服务器收到的请求响应
			var res = xmlhttp.responseText;			
			// 解析json对象
			var res = eval('(' + res + ')');			
			//alert( res.msg );
			if(res.msg == "success"){
				//删除评论的视图
				var p = container.parentNode;
				p.removeChild(container);
			}			
		}	
	}
	xmlhttp.open("POST", url, true);
	xmlhttp.send();	
}

/**
 * 点击了star
 */
function star(component , comm_id) {
	
	var url = "/Blog/CMStarServlet?id="+comm_id ;		
	// 获取ajax
	var xmlhttp = getXHR();	
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			// 处理服务器收到的请求响应
			var res = xmlhttp.responseText;			
			// 解析json对象
			var res = eval('(' + res + ')');			
			if (res.msg == "success") {
				//返回 ”success“
				component.innerHTML = res.new_star;				
			}else{
				alert("不要狂点呀...");
			}
		}
	}
	xmlhttp.open("POST", url, true);
	xmlhttp.send();	
}

/**
 * 点击了diss
 */
function diss(component , comm_id) {
	
	var url = "/Blog/CMDissServlet?id="+comm_id;		
	// 获取ajax
	var xmlhttp = getXHR();	
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			// 处理服务器收到的请求响应
			var res = xmlhttp.responseText;			
			// 解析json对象
			var res = eval('(' + res + ')');			
			if (res.msg == "success") {
				//返回 ”success“
				component.innerHTML = res.new_diss;				
			}else{
				alert("不要狂点呀...");
			}
		}
	}
	xmlhttp.open("POST", url, true);
	xmlhttp.send();	
}

document.addEventListener('DOMContentLoaded', function() {
    // 获取返回顶部按钮的元素
    const backToTopButton = document.getElementById('backToTop');

    // 检查按钮是否存在
    if (backToTopButton) {
        // 添加点击事件监听器
        backToTopButton.addEventListener('click', function(event) {
            event.preventDefault(); // 阻止默认的跳转行为

            // 使用 window.scrollTo 方法实现平滑滚动
            window.scrollTo({
                top: 0,
                behavior: 'smooth' // 平滑滚动
            });
        });
    } else {
        console.error('返回顶部按钮未找到');
    }
});

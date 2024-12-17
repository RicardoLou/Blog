<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Markdown Editor</title>
  <link rel="stylesheet" href="/Blog/bytemd/dist/index.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/5.2.0/github-markdown.min.css">
</head>
<body>
<div id="app"></div>

<!-- Vue -->
<script src="js/vue.global.js"></script>
<script type="module">
  import { Editor } from './js/bytemd.js';
  import gfm from './js/plugin-gfm.js';

  // 初始化 ByteMD 编辑器
  const app = Vue.createApp({
    data() {
      return {
        value: 'Hello, Markdown!', // 默认内容
        plugins: [gfm()] // 启用插件
      };
    },
    methods: {
      handleChange(e) {
        this.value = e.detail.value;
      }
    },
    mounted() {
      // 创建 Editor 实例
      new Editor({
        target: this.$el, // Vue 挂载 DOM
        props: {
          value: this.value,
          plugins: this.plugins
        },
        on: {
          change: this.handleChange
        }
      });
    }
  });

  app.mount('#app');
</script>
</body>
</html>
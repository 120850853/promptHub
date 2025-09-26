关于调试

Vibe Coding提出了一套高效的Debug模式，核心是为AI提供足够精确的“案发现场”信息。

Web Debug技巧 (全栈):

## 前端调试

- 使用浏览器开发者工具（F12），将Console中的错误日志完整复制给Cursor。
- 工具：
  - stagewise插件
  - playwright
  - Browser Tools

## 后端接口问题

- 切换到Network标签页，找到出错的API请求，将Headers、Payload和Response三份信息完整地复制给Cursor，这是让AI精准定位后端问题的关键。

## 远程服务器问题

- 利用Cursor强大的SSH连接能力，直接在编辑器中连接到服务器，将服务器日志和文件内容提供给AI，实现远程Debug。

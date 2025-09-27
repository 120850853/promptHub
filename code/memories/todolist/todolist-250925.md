# 可维护性提升执行计划

## 第一阶段：解耦核心状态管理
- [x] 拆分 `src/stores/gitStore.ts`，将仓库连接、API 调用、文件加载、历史持久化等职责迁出，保留 store 专注状态管理。
- [x] 为拆分后服务补充基础单元测试或最小验证脚本，确保连接与文件加载流程稳定。

## 第二阶段：重构仓库连接组件
- [x] 新建 composable（示例名：`useRepositoryConnect`），承接 `RepositoryConnect` 组件中的业务逻辑与外部依赖。
- [x] 精简 `src/components/common/RepositoryConnect.vue`，只保留 UI 与交互绑定。

## 第三阶段：划分设置视图
- [x] 依据功能 tab（编辑器、快捷键、仓库、AI、其他）拆分 `src/views/SettingsView.vue` 为多个子组件。
- [x] 抽离主题配色展示与存储位置面板为共享子组件或局部组件。

## 第四阶段：统一文案与样式
- [x] 将硬编码中文、提示语迁入 `src/i18n` 字典或公共常量。
- [x] 规范 Tailwind 组合/颜色配置，复用统一样式或组件，减少重复。

## 第五阶段：补齐类型与运行说明
- [x] 为图标渲染函数、Electron 交互方法等补充明确 TypeScript 类型定义。
- [x] 在文档（README 或 `docs/setup.md`）中记录推荐 Node/pnpm 版本及本地运行注意事项。

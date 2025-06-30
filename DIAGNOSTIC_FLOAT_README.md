# 诊断浮动窗口美化配置

## 概述

这个配置为 Neovim 的 `vim.diagnostic.open_float` 提供了美观的样式优化，包括：

- 🎨 圆角边框和现代化设计
- 🌈 基于 Tokyo Night 主题的配色方案
- 📱 响应式布局和智能定位
- ⚡ 流畅的动画和交互效果
- 🔧 丰富的自定义选项

## 功能特性

### 1. 视觉优化
- **圆角边框**: 使用 `rounded` 边框样式
- **主题配色**: 与 Tokyo Night 主题完美融合
- **图标支持**: 为不同严重级别提供彩色图标
- **背景高亮**: 诊断行带有轻微的背景高亮

### 2. 交互体验
- **自动关闭**: 当光标移动或进入插入模式时自动关闭
- **智能定位**: 根据内容长度自动调整窗口大小
- **焦点管理**: 浮动窗口不会抢夺焦点

### 3. 键盘映射
- `<leader>d` - 打开诊断浮动窗口
- `[d` - 跳转到上一个诊断
- `]d` - 跳转到下一个诊断
- `<leader>dl` - 显示诊断位置列表
- `<leader>df` - 快速修复

## 配置说明

### 诊断配置 (`lua/core/diagnostic.lua`)

```lua
-- 浮动窗口样式
float = {
    border = "rounded",           -- 圆角边框
    source = "always",           -- 显示来源
    header = "",                 -- 移除头部
    max_width = 80,              -- 最大宽度
    max_height = 20,             -- 最大高度
    focusable = false,           -- 不可聚焦
    close_events = {             -- 自动关闭事件
        "BufLeave", 
        "CursorMoved", 
        "InsertEnter", 
        "FocusLost"
    },
}
```

### 高亮配置

- **FloatBorder**: 浮动窗口边框颜色
- **NormalFloat**: 浮动窗口背景和文字颜色
- **DiagnosticError/Warn/Info/Hint**: 不同级别的诊断颜色
- **DiagnosticLineError/Warn/Info/Hint**: 诊断行背景高亮

## 插件依赖

### 必需插件
- `folke/noice.nvim` - 提供现代化的 UI 组件
- `MunifTanjim/nui.nvim` - UI 库支持
- `rcarriga/nvim-notify` - 通知系统

### 可选插件
- `s1n7ax/nvim-window-picker` - 窗口选择器

## 使用方法

1. **基本使用**:
   ```lua
   -- 在代码中调用
   vim.diagnostic.open_float()
   ```

2. **自定义调用**:
   ```lua
   -- 使用自定义选项
   vim.diagnostic.open_float(0, {
       border = "rounded",
       source = "always",
       max_width = 80,
   })
   ```

3. **键盘快捷键**:
   - 按 `<leader>d` 打开当前行的诊断信息
   - 使用 `[d` 和 `]d` 在诊断间导航

## 自定义配置

### 修改颜色主题

在 `lua/core/diagnostic.lua` 中修改高亮组：

```lua
vim.api.nvim_set_hl(0, "FloatBorder", {
    fg = "#your_color",  -- 修改边框颜色
    bg = "NONE",
    bold = true,
})
```

### 调整窗口大小

```lua
float = {
    max_width = 100,   -- 修改最大宽度
    max_height = 30,   -- 修改最大高度
}
```

### 更改图标

```lua
prefix = function(diagnostic)
    local icons = {
        Error = " ",  -- 修改错误图标
        Warn = " ",   -- 修改警告图标
        Hint = " ",   -- 修改提示图标
        Info = " ",   -- 修改信息图标
    }
    return icons[diagnostic.severity] or " "
end,
```

## 故障排除

### 常见问题

1. **浮动窗口不显示**:
   - 检查 LSP 是否正确配置
   - 确认诊断信息存在

2. **样式不正确**:
   - 重新加载 Neovim: `:source ~/.config/nvim/init.lua`
   - 检查颜色主题是否正确加载

3. **性能问题**:
   - 减少 `close_events` 中的事件数量
   - 调整 `max_width` 和 `max_height`

### 调试命令

```vim
:lua print(vim.inspect(vim.diagnostic.get(0)))  -- 查看当前缓冲区的诊断
:lua vim.diagnostic.open_float()                -- 手动打开浮动窗口
:checkhealth                                     -- 检查插件健康状态
```

## 更新日志

- **v1.0.0**: 初始版本，基础美化功能
- **v1.1.0**: 添加自动关闭和智能定位
- **v1.2.0**: 集成 noice.nvim，增强视觉效果

## 贡献

欢迎提交 Issue 和 Pull Request 来改进这个配置！

## 许可证

MIT License 
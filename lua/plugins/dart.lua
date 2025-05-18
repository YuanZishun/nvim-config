return {
    {
        "dart-lang/dart-vim-plugin",
        ft = "dart", -- 仅在 Dart 文件中启用
        config = function()
            -- 这里可以添加 Dart 插件的其他配置
            vim.g.dart_style_guide = 2 -- 使用 Dart 的官方风格指南
        end,
    },
}

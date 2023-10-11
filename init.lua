require("options")
require("keymaps")
require("plugins")

--nvim 主题
require("colorschema")
-- nvim文件管理器
require("plugin-config.nvim-tree")
-- 通过 bufferline.nvim 和 lualine.nvim 插件给 Neovim 增加 顶部标签页 与 底部信息显示 栏。
--把 Neovim 的 buffer 图形化显示成类似 VSCode 中 标签页的形式
require("plugin-config.bufferline")
require("plugin-config.lualine")

-- nvim快捷搜索插件
require("plugin-config.telescope")
-- nvim开启页面面板
require("plugin-config.dashboard")

-- 代码高亮
require("plugin-config.nvim-treesitter")

-- lsp配置
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
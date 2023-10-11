-- define common options
local map = vim.api.nvim_set_keymap
local opts = {
    noremap = true, -- non-recursive
    silent = true -- do not show message
}
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
-- delta: 2 lines
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize +2<CR>", opts)
map("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- 取消 s 默认功能
map("n", "s", "", opts)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opts)
map("n", "sh", ":sp<CR>", opts)

-- 关闭分屏
map("n", "<leader>q", ":q<CR>", opts)

-- 保存文件
map("n", "<leader>s", ":w<CR>", opts)

-- Terminal 相关
map("n", "<leader>t", ":sp | terminal<CR>", opts)
map("n", "<leader>vt", ":vsp | terminal<CR>", opts)
map("t", "<Esc>", "<C-\\><C-n>", opts) --退出
-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-----------------
-- Insert Mode --
-----------------
-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opts)
map("i", "<C-l>", "<ESC>A", opts)

-- 插件快捷键

-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opts)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opts)

-- bufferline
-- 左右Tab切换
map("n", "<A-h>", ":BufferLineCyclePrev<CR>", opts)
map("n", "<A-l>", ":BufferLineCycleNext<CR>", opts)
-- 关闭
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opts)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opts)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opts)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opts)

-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opts)
local pluginKeys = {
    telescopeList = {
        i = {
            -- 上下移动
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<Down>"] = "move_selection_next",
            ["<Up>"] = "move_selection_previous",
            -- 历史记录
            ["<C-n>"] = "cycle_history_next",
            ["<C-p>"] = "cycle_history_prev",
            -- 关闭窗口
            ["<C-c>"] = "close",
            -- 预览窗口上下滚动
            ["<C-u>"] = "preview_scrolling_up",
            ["<C-d>"] = "preview_scrolling_down"
        }
    },
    cmp = function(cmp)
        return {
            -- 出现补全
            ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
            -- 取消
            ["<A-,>"] = cmp.mapping(
                {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close()
                }
            ),
            -- 上一个
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            -- 下一个
            ["<C-j>"] = cmp.mapping.select_next_item(),
            -- 确认
            ["<CR>"] = cmp.mapping.confirm(
                {
                    select = true,
                    behavior = cmp.ConfirmBehavior.Replace
                }
            ),
            -- 如果窗口内容太多，可以滚动
            ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
            ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"})
        }
    end
}

return pluginKeys

-- bufferline
-- 左右Tab切换

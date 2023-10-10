-- define common options
local map = vim.api.nvim_set_keymap
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
map('n', '<C-Up>', ':resize -2<CR>', opts)
map('n', '<C-Down>', ':resize +2<CR>', opts)
map('n', '<C-Left>', ':vertical resize +2<CR>', opts)
map('n', '<C-Right>', ':vertical resize -2<CR>', opts)

-- 取消 s 默认功能
map("n", "s", "", opts)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opts)
map("n", "sh", ":sp<CR>", opts)

-- 关闭分屏
map('n','<leader>q',':q<CR>',opts)

-- 保存文件
map('n','<leader>s',':w<CR>',opts)

-- Terminal 相关
map("n", "<leader>t", ":sp | terminal<CR>", opts)
map("n", "<leader>vt", ":vsp | terminal<CR>", opts)
map("t", "<Esc>", "<C-\\><C-n>", opts) --退出
-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)



-----------------
-- Insert Mode --
-----------------
-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opts)
map("i", "<C-l>", "<ESC>A", opts)




-- 插件快捷键
local pluginKeys = {}


-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opts)

-- bufferline
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opts)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opts)
-- 关闭
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opts)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opts)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opts)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opts)



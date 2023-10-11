-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()

-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd(
    [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
    ]]
)

-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies".
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require("packer").startup(
    {
        function(use)
            -- Packer can manage itself
            use "wbthomason/packer.nvim"

            -- download theme
            use {"catppuccin/nvim", as = "catppuccin"}
            use "tanvirtin/monokai.nvim"
            ---------------------------------------
            -- NOTE: PUT YOUR THIRD PLUGIN HERE --
            ---------------------------------------

            -- nvim-tree (新增)
            use({"kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons"})

            -- 安装markdown-preview 插件
            use(
                {
                    "iamcco/markdown-preview.nvim",
                    run = function()
                        vim.fn["mkdp#util#install"]()
                    end
                }
            )

            -- wild 弹出式窗口插件
            use {
                "gelguy/wilder.nvim",
                config = function()
                    -- config goes here
                end
            }

            -- 安装括号范围表示插件 nvim-hlchunk
            use "yaocccc/nvim-hlchunk"

            -- bufferline (新增)
            use({"akinsho/bufferline.nvim", requires = {"kyazdani42/nvim-web-devicons", "moll/vim-bbye"}})

            -- lualine (新增)
            use({"nvim-lualine/lualine.nvim", requires = {"kyazdani42/nvim-web-devicons"}})
            use("arkav/lualine-lsp-progress")

            -- telescope （新增）
            use {"nvim-telescope/telescope.nvim", requires = {"nvim-lua/plenary.nvim"}}
            -- telescope extensions
            use "LinArcX/telescope-env.nvim"

            -- dashboard
            use("glepnir/dashboard-nvim")

            -- treesitter （新增）
            use {
                "nvim-treesitter/nvim-treesitter",
                run = function()
                    local ts_update = require("nvim-treesitter.install").update({with_sync = true})
                    ts_update()
                end
            }

            --------------------- LSP --------------------
            use {
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "neovim/nvim-lspconfig"
            }

            -- 补全引擎
            use("hrsh7th/nvim-cmp")
            -- snippet 引擎
            use("hrsh7th/vim-vsnip")
            -- 补全源
            use("hrsh7th/cmp-vsnip")
            use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
            use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
            use("hrsh7th/cmp-path") -- { name = 'path' }
            use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

            -- 常见编程语言代码段
            use("rafamadriz/friendly-snippets")

            
            -- Automatically set up your configuration after cloning packer.nvim
            -- Put this at the end after all plugins
            if packer_bootstrap then
                require("packer").sync()
            end
        end,
        config = {
            display = {
                open_fn = function()
                    return require("packer.util").float({border = "single"})
                end
            }
        }
    }
)

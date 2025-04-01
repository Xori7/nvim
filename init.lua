local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.cmd("colorscheme sorbet")

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.smartindent = true

vim.cmd("let c_syntax_for_h = 1")
--vim.cmd("filetype plugin on")

vim.g.mapleader = " "

vim.keymap.set({ "n" }, "-", ":Oil<CR>")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["+d]])
vim.keymap.set("n", "<leader>D", [["+D]])

vim.keymap.set("n", "<leader>F", "Telescope find_files")

vim.keymap.set('t', '<Leader><ESC>', '<C-\\><C-n>', {noremap = true})


    require("lazy").setup({
    {'VonHeikemen/lsp-zero.nvim', 
    branch = 'v3.x', 
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()
            local lsp = lsp_zero.preset({})
            local lspconfig = require("lspconfig")

            lspconfig.clangd.setup({
                cmd = {
                     "clangd",
                     "--background-index",
                     "-j=12",
                     "--clang-tidy",
                     --"--clang-tidy-checks=*",
                     "--all-scopes-completion",
                     "--cross-file-rename",
                     "--completion-style=detailed",
                     "--header-insertion-decorators",
                     "--header-insertion=iwyu",
                     "--pch-storage=memory",
                }
            })
            lspconfig.rust_analyzer.setup({})
            lspconfig.zls.setup({})
            lspconfig.pylsp.setup({})

            lsp.setup()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "gh", vim.diagnostic.open_float, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
                    vim.keymap.set({ "n", "v" }, "<leader><CR>", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)
                end,
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { "j-hui/fidget.nvim", opts = {} },
        },
    },
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function() 
    	    require("catppuccin").setup({
    		    no_italic = true
    	    }) 
    	    vim.cmd("colorscheme catppuccin-mocha")
    	end
    },
    {
    	"nvim-treesitter/nvim-treesitter",
    	name = "treesitter",
    	config = function() 
    		require("nvim-treesitter.configs").setup({
    			autoinstall = true,
    			highlight = {
    				enable = true,
    			}
    		})
    	end
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end
    }
  })


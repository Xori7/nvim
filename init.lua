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

vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["+d]])
vim.keymap.set("n", "<leader>D", [["+D]])

require("lazy").setup({
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x', config = function()
        require("lsp-zero").setup({})
        require("lspconfig").zls.setup({})
        end
    },
    {'neovim/nvim-lspconfig'},
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
})

--local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
--if not vim.uv.fs_stat(lazypath) then
--    vim.fn.system({
--	"git",
--	"clone",
--	"--filter=blob:none",
--	"https://github.com/folke/lazy.nvim.git",
--	"--branch=stable", -- latest stable release
--	lazypath,
--    })
--end
--vim.opt.rtp:prepend(lazypath)
--
--require("lazy").setup({
--	{
--		"catppuccin/nvim",
--		name = "catppuccin",
--		config = function() 
--			require("catppuccin").setup({
--				no_italic = true
--			}) 
--			vim.cmd("colorscheme catppuccin-mocha")
--		end
--	},
--	{
--		"nvim-treesitter/nvim-treesitter",
--		name = "treesitter",
--		config = function() 
--			require("nvim-treesitter.configs").setup({
--				autoinstall = true,
--				highlight = {
--					enable = true,
--				}
--			})
--		end
--        },
--})
--
--
---------------------------Useful Options-----------------------------
--vim.opt.nu = true
--vim.opt.relativenumber = true

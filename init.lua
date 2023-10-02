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

require("lazy").setup({
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


-------------------------Useful Options-----------------------------
vim.opt.nu = true
vim.opt.relativenumber = true

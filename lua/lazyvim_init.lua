local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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


require('lazy').setup({
	require("plugins.vimtex"),
	require("plugins.basic"),
	require("plugins.markdown"),
	require("plugins.lsp.cmp"),
	require("plugins.lsp.mason"),
	require("plugins.lsp.lspconfig"),
})

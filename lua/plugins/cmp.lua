local M = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies =
	{
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	}
}

M.config = function()
	local cmp = require("cmp")
--	local capabilities = require('cmp_nvim_lsp').default_capabilities()
--	local lspconfig = require('lspconfig')
--
--	-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
--	local servers = {  'pyright', 'texlab', 'lua_ls' }
--	for _, lsp in ipairs(servers) do
--		lspconfig[lsp].setup {
--			-- on_attach = my_custom_on_attach,
--			capabilities = capabilities,
--		}
--	end


	--local keymap = vim.api.nvim_set_keymap
	--local opts = { noremap = true, silent = true }
	--keymap("i", "<C-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
	--keymap("s", "<C-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
	--keymap("i", "<C-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
	--keymap("s", "<C-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
	---- Set up nvim-cmp.
	--local has_words_before = function()
	--	unpack = unpack or table.unpack
	--	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	--	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	--end
	--local luasnip = require 'luasnip'

	cmp.setup({

		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			end,
		},

		window = {
			--completion = cmp.config.window.bordered(),
			-- documentation = cmp.config.window.bordered(),
		},

		mapping = cmp.mapping.preset.insert({
			['<C-b>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.abort(),
			['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),

		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "luasnip" }, -- For luasnip users.
		}, {
			{ name = "buffer" },
			{ name = "path" },
		}),

	})

	--cmp.setup.cmdline(":", {
	--	mapping = cmp.mapping.preset.cmdline(),
	--	sources = cmp.config.sources({
	--		{ name = "path" },
	--	}, {
	--		{ name = "cmdline" },
	--	}),
	--})
end

return M

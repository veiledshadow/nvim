local M = {

	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies =
	{
		--{ "folke/neoconf.nvim",               cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
		{ "folke/neodev.nvim",                opts = {} },
		{ "mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
	},
}

M.config = function()
	local lspconfig = require("lspconfig")
	-- Set up language service

	lspconfig.lua_ls.setup({
		--capabilities = capabilities,
		on_attach = function()
		end,
		settings = {
			Lua = {
				diagnostics = {
					globals = {
						'vim',
						'require'
					},
				},
				workspace = {
					checkThirdParty = false,
				},
				completion = {
					callSnippet = "Replace"
				}
			}
		}
	})

	-- Key bingings
	vim.api.nvim_create_autocmd('LspAttach', {
		group = vim.api.nvim_create_augroup('UserLspConfig', {}),
		callback = function(ev)
			-- Enable completion triggered by <c-x><c-o>
			vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { buffer = ev.buf }
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, opts)
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
			vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
			vim.keymap.set('n', '<Leader>lwa', vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set('n', '<Leader>lwr', vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set('n', '<Leader>lwl', function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts)
			vim.keymap.set('n', '<Leader>ld', vim.lsp.buf.type_definition, opts)
			vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, opts)
			vim.keymap.set({ 'n', 'v' }, '<Leader>lc', vim.lsp.buf.code_action, opts)
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
			vim.keymap.set('n', '<Leader>lf', function()
				vim.lsp.buf.format { async = true }
			end, opts)
		end,
	})
end



return M
--return {
--	"neovim/nvim-lspconfig",
--	dependencies = {
--		{ "folke/neoconf.nvim",               cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
--		{ "folke/neodev.nvim",                opts = {} },
--		{ "mason.nvim" },
--		{ "williamboman/mason-lspconfig.nvim" },
--	},
--
--	config = function()
--		local lspconfig = require('lspconfig')
--		local capabilities = require('cmp_nvim_lsp').default_capabilities()
--
--		--lspconfig.texlab.setup {
--		--	capabilities = capabilities,
--		--}
--
--		---- Language servers
--		--lspconfig.pyright.setup {}
--		lspconfig.lua_ls.setup({
--			capabilities = capabilities,
--			on_attach = function()
--			end,
--			settings = {
--				Lua = {
--					diagnostics = {
--						globals = {
--							'vim',
--							'require'
--						},
--					},
--					workspace = {
--						checkThirdParty = false,
--					},
--					completion = {
--						callSnippet = "Replace"
--					}
--				}
--			}
--		})
--		--lspconfig.texlab.setup {}
--
--		-- Key bingings
--		vim.api.nvim_create_autocmd('LspAttach', {
--			group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--			callback = function(ev)
--				-- Enable completion triggered by <c-x><c-o>
--				vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
--
--				-- Buffer local mappings.
--				-- See `:help vim.lsp.*` for documentation on any of the below functions
--				local opts = { buffer = ev.buf }
--				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--				vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, opts)
--				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--				vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--				vim.keymap.set('n', '<Leader>lwa', vim.lsp.buf.add_workspace_folder, opts)
--				vim.keymap.set('n', '<Leader>lwr', vim.lsp.buf.remove_workspace_folder, opts)
--				vim.keymap.set('n', '<Leader>lwl', function()
--					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--				end, opts)
--				vim.keymap.set('n', '<Leader>ld', vim.lsp.buf.type_definition, opts)
--				vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, opts)
--				vim.keymap.set({ 'n', 'v' }, '<Leader>lc', vim.lsp.buf.code_action, opts)
--				vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--				vim.keymap.set('n', '<Leader>lf', function()
--					vim.lsp.buf.format { async = true }
--				end, opts)
--			end,
--		})
--	end
--}

local M = {

	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		config = function()
			require("mason").setup({})
		end
		--build = ":MasonUpdate",
		--opts = {
		--  ensure_installed = {
		--    "lua_ls",
		--    "texlab",
		--		"pyright"
		--    -- "flake8",
		--  },
		--},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
		opts = {
			ensure_installed = {
				"lua_ls",
				"texlab",
				"pyright"
			}
		},
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
		end
	}

}

return M

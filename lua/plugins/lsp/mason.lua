local M = {

	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		config = function()
			require("mason").setup({})
		end
	},

	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
		opts = {
			ensure_installed = {
				"lua_ls",
				"texlab",
				"pyright",
				"remark_ls"
			}
		},
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
		end
	}
}

return M

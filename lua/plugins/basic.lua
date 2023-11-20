local M = {

	--colorscheme
	{
		'Mofiqul/vscode.nvim',
		lazy = false,
		name = "vscode",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme vscode]])
		end
	},

	--------
	-- Coding helper
	--------

	-- code_runner
	{
		"CRAG666/code_runner.nvim",
		lazy = true,
		keys = {
			{ "<leader>cr", "<Cmd>RunCode<CR>", desc = "run code" },
		},
		config = function()
			require('code_runner').setup({
				filetype = {
					python = "python -u",
				},
			})
		end
	},

	-- terminal
	{
		"norcalli/nvim-terminal.lua",
		lazy = true,
		keys = {
			{ "<leader>t", "<Cmd>split<CR><Cmd>terminal<CR>", desc = "terminal below" },
		},
		config = function()
			require 'terminal'.setup({})
		end
	},

	-- comment
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			options = {
				custom_commentstring = function()
					return vim.bo.commentstring
				end,
			},
		},
	},

	-- null-ls
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = { "black", "prettier" }
			})
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.prettier,
				}
			})
		end,
	},


	--------
	-- Edit
	--------

	-- surround
	{
		"echasnovski/mini.surround",
		opts = {
			mappings = {
				add = "gsa",
				delete = "gsd",
				find = "gsf",
				find_left = "gsF",
				highlight = "gsh",
				replace = "gsr",
				update_n_lines = "gsn",
			},
		},
	},

	-- which-key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,

		opts = {
			plugins = { spelling = true },
			defaults = {
				mode = { "n", "v" },
				["g"] = { name = "+goto" },
				--["gs"] = { name = "+surround" },
				["]"] = { name = "+next" },
				["["] = { name = "+prev" },
				--["<leader><tab>"] = { name = "+tabs" },
				["<leader>b"] = { name = "+buffer" },
				["<leader>c"] = { name = "+code" },
				["<leader>f"] = { name = "+file/find" },
				["<leader>g"] = { name = "+git" },
				["<leader>l"] = { name = "+lsp" },
				--["<leader>gh"] = { name = "+hunks" },
				--["<leader>q"] = { name = "+quit/session" },
				--["<leader>s"] = { name = "+search" },
				--["<leader>u"] = { name = "+ui" },
				--["<leader>w"] = { name = "+windows" },
				--["<leader>x"] = { name = "+diagnostics/quickfix" },
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register(opts.defaults)
		end,
	},

	-- telescope
	{
		'nvim-telescope/telescope.nvim',
		cmd = "Telescope",
		lazy = true,
		version = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
			"gbrlsnchs/telescope-lsp-handlers.nvim",
		},
		keys = {
			{ "<leader>ff", "<Cmd>Telescope find_files<CR>", desc = "find files" },
			{ "<leader>fg", "<Cmd>Telescope live_grep<CR>",  desc = "live grep" },
			{ "<leader>fb", "<Cmd>Telescope buffers<CR>",    desc = "find buffers" },
			{ "<leader>fh", "<Cmd>Telescope help_tags<CR>",  desc = "help tags" },
			{ "<leader>fr", "<Cmd>Telescope oldfiles<CR>",   desc = "find recently opened files" }
		},
		config = function()
			require("telescope").setup {
				pickers = {
					buffers = {
						sort_lastused = true,
						theme = "ivy",
						previewer = false,
					},
					find_files = {
						theme = "ivy"
					},
					live_grep = {
						theme = "ivy"
					}
				},
			}
		end
	},

	-- autopairs
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},

	-- split VeryLongWords for easier w nav
	{
		'chaoren/vim-wordmotion',
		event = "InsertEnter"
	},

	-- flash
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			--{ "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
			--{ "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
			--{ "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			--{ "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
		},
	},
	------
	-- Gui
	------

	-- Neotree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		lazy = true,
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
		},
		config = function()
			require("neo-tree").setup()
		end,
	},

	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
		event = "VeryLazy",
		config = function()
			require('lualine').setup {
				options = {
					icons_enabled = true,
					theme = 'auto',
					component_separators = { left = '', right = '' },
					section_separators = { left = '', right = '' },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					}
				},
				sections = {
					lualine_a = { 'mode' },
					lualine_b = { 'branch', 'diff', 'diagnostics' },
					lualine_c = { 'filename' },
					lualine_x = { 'encoding', 'fileformat', 'filetype' },
					lualine_y = { 'progress' },
					lualine_z = { 'location' }
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { 'filename' },
					lualine_x = { 'location' },
					lualine_y = {},
					lualine_z = {}
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {}
			}
		end
	},

	-- bufferline
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = 'nvim-tree/nvim-web-devicons',
		opts = {
			options = {
				always_show_bufferline = false,

				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					}
				}
			}
		}
	},

	-- dropbar
	{
		"Bekaboo/dropbar.nvim",
		event = "UIEnter",
		opts = {}
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		priority = 1000,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"cpp",
					"lua",
					"vim",
					"python",
					"latex",
				},
				highlight = {
					enable = true,
					disable = {}, -- list of language that will be disabled
				},
				indent = {
					enable = false
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection    = "<C-n>",
						node_incremental  = "<C-n>",
						node_decremental  = "<C-h>",
						scope_incremental = "<C-l>",
					},
				}
			})
		end
	},

	----------
	-- Other
	----------
	-- displays color for HEX color code
	{
		'NvChad/nvim-colorizer.lua',
		config = function()
			require 'colorizer'.setup({})
		end
	},


}


return M


--return {
--	-- show lsp server status on lualine
--	--{ 'arkav/lualine-lsp-progress', dependencies = { 'nvim-lualine/lualine.nvim' } },
--
--	-- git
--	--{
--	--	'lewis6991/gitsigns.nvim',
--	--	config = function()
--	--		require('gitsigns').setup()
--	--	end
--	--},
--
--	{
--		'sindrets/diffview.nvim',
--		event = "VeryLazy",
--	},
--}

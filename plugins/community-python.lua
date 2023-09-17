local utils = require "astronvim.utils"
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "python", "toml" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "pyright", "ruff_lsp" })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "black", "isort" })
    end,
  },
  {
    "mfussenegger/nvim-dap", 
    enabled = true,
    dependencies = {
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {"nvim-dap"}
      },
    },
  }

  -- {
  --   "linux-cultist/venv-selector.nvim",
  --   opts = {},
  --   keys = { { "<leader>lv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
  -- },

  -- {
  --   "mfussenegger/nvim-dap-python",
  --   enabled = true,
  --   dependencies = "mfussenegger/nvim-dap",
  --   ft = "python", -- NOTE: ft: lazy-load on filetype
  --   config = function(_, opts)
  --     local path = require("mason-registry").get_package("debugpy"):get_install_path() .. "/venv/bin/python"
  --     require("dap-python").setup(path, opts)
  --   end,
  -- },
}

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  opts = {
    sort_by = "case_sensitive",

    view = {
      adaptive_size = true,
      side = "left",
    },

    renderer = {
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },

          git = {
            enable = "true",
            --unstaged = "",
            --staged = "S",
            --unmerged = "",
            --renamed = "➜",
            --untracked = "U",
            --deleted = "",
            --ignored = "◌",
          },
        },
      },
    },

    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },

    filters = {
      dotfiles = true,
    },
  },
  config = function()
    require("nvim-tree").setup {}
  end,
}



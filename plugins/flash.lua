return {
  "folke/flash.nvim",
  event = "VeryLazy",
  vscode = true,
  opts = {},
  keys = {
    {
      "<Leader><Leader>s",
      mode = { "n", "x", "o" },
      function() require("flash").jump() end,
      desc = "Flash",
    },
    {
      "<Leader><Leader>S",
      mode = { "n", "o", "x" },
      function() require("flash").treesitter() end,
      desc = "Flash Treesitter",
    },
    {
      "<Leader><Leader>r",
      mode = "o",
      function() require("flash").remote() end,
      desc = "Remote Flash",
    },
    {
      "<Leader><Leader>R",
      mode = { "o", "x" },
      function() require("flash").treesitter_search() end,
      desc = "Treesitter Search",
    },
  },
}

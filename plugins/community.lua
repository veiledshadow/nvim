return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  {import = "astrocommunity.markdown-and-latex.vimtex"},
  {import = "astrocommunity.markdown-and-latex.markdown-preview-nvim"},

  -- bars 
  {import = "astrocommunity.bars-and-lines.bufferline-nvim"},
  {import = "astrocommunity.bars-and-lines.lualine-nvim"},
--{import = "astrocommunity.bars-and-lines.dropbar-nvim"},

  -- lsp
  {import = "astrocommunity.pack.cpp"},
  {import = "astrocommunity.pack.markdown"},
  {import = "astrocommunity.lsp.inc-rename-nvim"},
  --{import = "astrocommunity.pack.python"},

  {import = "astrocommunity.motion.mini-surround"},

  -- multicursor 
  --
  {import = "astrocommunity.editing-support.multicursors-nvim"}
}

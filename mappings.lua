-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {

    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<leader>b"] = { name = "Buffers" },
    ["H"] = "5h",
    ["J"] = "5j",
    ["K"] = "5k",
    ["L"] = "5l",
    --["<leader>e"] = "<cmd>NvimTreeToggle<cr>",
    ["\\"] = false,
    ["|"] = false,
  },

  v = {
    ["H"] = "5h",
    ["J"] = "5j",
    ["K"] = "5k",
    ["L"] = "5l",
  },

  t = {
    -- setting a mapping to false will disable it
     ["<esc>"] = false,
  },
}

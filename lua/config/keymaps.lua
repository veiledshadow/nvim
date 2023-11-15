local map = vim.keymap.set

map("n", "<Leader>h", ":set hlsearch!<CR>", { noremap = true, silent = true })

-- moving
map({ "n", "v" }, "H", "5h")
map({ "n", "v" }, "J", "5j")
map({ "n", "v" }, "K", "5k")
map({ "n", "v" }, "L", "5l")
map("", "W", "5w", { noremap = true, silent = true })
map("", "B", "5b", { noremap = true, silent = true })
map("n", "<LocalLeader>k", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("n", "<LocalLeader>j", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("v", "<LocalLeader>j", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<LocalLeader>k", ":m '<-2<cr>gv=gv", { desc = "Move up" })

--windows moving
map("n", "<S-Up>", "<C-w>k", { noremap = true, silent = true })
map("n", "<S-Down>", "<C-w>j", { noremap = true, silent = true })
map("n", "<S-Left>", "<C-w>h", { noremap = true, silent = true })
map("n", "<S-Right>", "<C-w>l", { noremap = true, silent = true })

-- buffers
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

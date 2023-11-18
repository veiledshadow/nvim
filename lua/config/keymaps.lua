local map = vim.keymap.set

map("n", "<Leader>h", ":set hlsearch!<CR>", { noremap = true, silent = true })

-- moving
map({ "n", "v" }, "H", "5h")
map({ "n", "v" }, "J", "5j")
map({ "n", "v" }, "K", "5k")
map({ "n", "v" }, "L", "5l")
map({ "n", "v" }, "W", "5w")
map({ "n", "v" }, "B", "5b")

map("n", "<LocalLeader>j", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<LocalLeader>k", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("v", "<LocalLeader>j", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<LocalLeader>k", ":m '<-2<cr>gv=gv", { desc = "Move up" })

--windows moving
map("n", "<S-Up>", "<C-w>k")
map("n", "<S-Down>", "<C-w>j")
map("n", "<S-Left>", "<C-w>h")
map("n", "<S-Right>", "<C-w>l")

-- split
map('n', 'sr', ':set splitright<cr>:vsplit<cr>')
map('n', 'sl', ':set nosplitright<cr>:vsplit<cr>')
map('n', 'su', ':set nosplitbelow<cr>:split<cr>')
map('n', 'sb', ':set splitbelow<cr>:split<cr>')

-- buffers
map("n", "[b", "<cmd>bprevious<cr>", { desc = "prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "next buffer" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Removing some default keymaps we'll be using.
vim.keymap.del("n", ",")

----------------------------------------
-- Buffers.
----------------------------------------

-- Navigation.
map("n", ",s", "]b", { desc = "Next Buffer", remap = true })
map("n", ",a", "[b", { desc = "Prev Buffer", remap = true })
map("n", ",x", "<Leader>bd", { desc = "Del Buffer", remap = true })
map("n", "`1", "<Leader>bb", { desc = "Other Buffer", remap = true })

----------------------------------------
-- Find, Search, Replace, etc.
----------------------------------------

-- Visual find.
map("v", "/", 'y/<C-R>"<CR>', { desc = "Find Selection" })

-- Substitute.
map("n", ",,", ":%s:::gcI<Left><Left><Left><Left><Left>", { desc = "Substitute Global" })
map("n", ",.", ":,$s:::gcI<Left><Left><Left><Left><Left>", { desc = "Substitute Forward" })

-- Find in files using `ag`.
map(
  "n",
  "`s",
  ':cexpr system("ag --vimgrep -i \\"\\"") | copen<C-Left><C-Left><C-Left><Right><Right>',
  { desc = "Ag Search" }
)
map(
  "n",
  "``s",
  ':cexpr system("ag --vimgrep -ws \\"\\"") | copen<C-Left><C-Left><C-Left><Right><Right><C-R><C-W><CR>',
  { desc = "Ag Search (Whole Word)" }
)

-- Pickers for buffers, files, Symbols, etc.
-- map("n", ",b", "<Leader>,", { desc = "Buffers", remap = true })
-- map("n", ",f", "<Leader><Space>", { desc = "Files", remap = true })
map("n", "<Leader>k", "<Leader>sS", { desc = "LSP Symbols (Global)", remap = true })
map("n", "<Leader>j", "<Leader>ss", { desc = "LSP Symbols (Buffer)", remap = true })

-- Tag stack navigation.
map("n", "<C-p>", "<C-t>", { desc = "Tag Up", remap = true })

----------------------------------------
-- Fuzzy stuff.
----------------------------------------

-- For `fzf-lua`.
map("n", ",b", function()
  require("fzf-lua").buffers()
end, { desc = "Fzf Buffers" })
map("n", ",f", function()
  require("fzf-lua").files()
end, { desc = "Fzf Files" })
map("n", ",t", function()
  require("fzf-lua").lsp_workspace_symbols()
end, { desc = "Fzf Symbols" })
map("n", ",ds", function()
  require("fzf-lua").treesitter()
end, { desc = "Fzf Treesitter" })
map("n", ",df", function()
  require("fzf-lua").live_grep()
end, { desc = "Fzf Live Grep" })
map("n", ",dr", function()
  require("fzf-lua").resume()
end, { desc = "Fzf Resume" })
map("n", ",dd", function()
  require("fzf-lua").builtin()
end, { desc = "Fzf Builtin" })

----------------------------------------
-- AI.
----------------------------------------

-- Opencode.
map({ "n", "x" }, ",oa", function()
  require("opencode").ask("@this: ", { submit = true })
end, { desc = "Ask opencode" })
map({ "n", "x" }, ",os", function()
  require("opencode").select()
end, { desc = "Execute opencode action" })
map({ "n", "t" }, ",ot", function()
  require("opencode").toggle()
end, { desc = "Toggle opencode" })

----------------------------------------
-- Git.
----------------------------------------

-- For `vim-fugitive`.
map("n", "`gs", ":Git<CR>:resize 10<CR>]]", { desc = "Git Status" })
map("n", "`gd", ":Gvdiffsplit<CR>", { desc = "Git Diff" })
map("n", "`gr", ":Gread<CR>", { desc = "Git Read" })
map("n", "`gw", ":Gwrite<CR>", { desc = "Git Write" })
map("n", "`gb", ":Git blame<CR>", { desc = "Git Blame" })
map("n", "`gcc", ":Git commit<CR>", { desc = "Git Commit" })
map("n", "`gca", ":Git commit --amend<CR>", { desc = "Git Amend" })
map("n", "`gcs", ":Git commit -s<CR>", { desc = "Git Commit (Sign-Off)" })
map("n", "`gcr", ":Git commit -s --amend<CR>", { desc = "Git Amend (Sign-Off)" })
map("n", "`ge", ":Gedit <CR>", { desc = "Git Edit (Return)" })

----------------------------------------
-- Quickfix and related.
----------------------------------------

-- Move around Quickfix.
map("n", "`q", ":copen<CR>", { desc = "Open Quickfix" })
map("n", "`w", ":cclose<CR>", { desc = "Close Quickfix" })
map("n", "`2", "[q", { desc = "Prev in Quickfix", remap = true })
map("n", "`3", "]q", { desc = "Next in Quickfix", remap = true })
map("n", "`p", ":copen<CR>:cnewer<CR>", { desc = "Next Quickfix" })
map("n", "`o", ":copen<CR>:colder<CR>", { desc = "Next Quickfix" })

-- Open picker results in Quickfix.
map("n", "`t", function()
  vim.cmd("cclose")
  vim.cmd("Trouble qflist open")
end, { desc = "Quickfix -> Trouble" })

-- File explorers.
map("n", "<F2>", "<Leader>e", { desc = "Open Explorer", remap = true })
map("n", "<F3>", "<Leader>fM", { desc = "Open Mini Explorer", remap = true })

----------------------------------------
-- Copy, paste, clipboard, etc.
----------------------------------------

-- Copy / Paste.
map("v", "`c", '"py:let @+=@"<CR>', { desc = "Copy", remap = true })
map("n", ",l", 'viw"py:let @+=@"<CR>', { desc = "Copy", remap = true })
map("n", "`v", '"pgP', { desc = "Paste", remap = true })
map("i", "`v", "<C-R>p", { desc = "Paste", remap = true })
map("n", ",;", 'viw"pgP', { desc = "Paste", remap = true })
map("v", "`x", '"px:let @+=@"<CR>', { desc = "Cut", remap = true })

-- Clipboard.
map("n", "<F4>", ':let @*=@"<CR>', { desc = "Clipboard", remap = true })
map("v", "<F5>", 'y:let @*=@"<CR>', { desc = "Clipboard", remap = true })
map("n", ",p", ",l<F4>", { desc = "Copy & Clipboard", remap = true })

----------------------------------------
-- Code features.
----------------------------------------

-- Add new Snacks Spaces vs Tabs toggle.
Snacks.toggle.option("expandtab", { name = "Spaces not Tabs" }):map("``t")

----------------------------------------
-- Spell checking.
----------------------------------------

-- Add new mapping to existing Snacks spell toggle.
Snacks.toggle.option("spell"):map("``p")

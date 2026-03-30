-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local g = vim.g
local opt = vim.opt

----------------------------------------
-- Look & Feel.
----------------------------------------

-- Prefer performance!
g.snacks_animate = false

-- Colorscheme.
g.sonokai_style = "atlantis"

-- Misc.
opt.winborder = "rounded"

----------------------------------------
-- Formatting.
----------------------------------------

-- Tabs.
local indent_size = 4
opt.expandtab = true
opt.tabstop = indent_size
opt.softtabstop = indent_size
opt.shiftwidth = indent_size

-- Indentation.
opt.autoindent = true
opt.smartindent = true
opt.cindent = false
opt.cinoptions = "(0,:0,l1,N-s"

-- File type quirks.
vim.cmd("filetype on")
vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")

-- Wrapping.
opt.wrap = true
opt.linebreak = true
opt.textwidth = 100
opt.colorcolumn = "+1"
opt.wrapscan = false

-- Diffs, splits, etc.
opt.diffopt:append("vertical")
opt.splitbelow = false

----------------------------------------
-- Spell checking.
----------------------------------------

-- Languages.
opt.spelllang = { "en", "pt_pt" }

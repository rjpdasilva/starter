-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Cscope update database on buffer save.
local group = vim.api.nvim_create_augroup("CscopeBuild", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.c", "*.h", "*.cpp", "*.hpp", "*.cc", "*.hh" },
  callback = function()
    vim.cmd("Cscope db build")
  end,
  group = group,
})

-- For updating status in `vim-fugitive`.
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  command = "call fugitive#ReloadStatus()",
})

-- For making sure `textwidth` works even for code files.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "h", "hpp" },
  callback = function()
    vim.opt_local.formatoptions:append("t")
  end,
})

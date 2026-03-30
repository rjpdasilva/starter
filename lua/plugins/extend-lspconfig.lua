return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = {
        -- Disable formatting, done by `conform`.
        capabilities = {
          documentFormattingProvider = false,
          documentRangeFormattingProvider = false,
        },
        handlers = {
          -- Disable invalid URI errors (`-32602`) that come e.g. from `vim-fugitive` buffers.
          ["textDocument/documentHighlight"] = function(err, result, ctx, config)
            if err and err.code == -32602 then
              return
            end
            vim.lsp.handlers["textDocument/documentHighlight"](err, result, ctx, config)
          end,
        },
      },
    },
  },
}

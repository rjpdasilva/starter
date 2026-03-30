return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      c = { "clang-format" },
      cpp = { "clang-format" },
    },
    formatters = {
      -- C & C++
      ["clang-format"] = {
        prepend_args = {
          "-style=file",
        },
      },
    },
  },
}

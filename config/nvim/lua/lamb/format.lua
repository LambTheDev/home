-- One formatter entry point for every buffer: prettier for Markdown, the
-- attached LSP (e.g. nixd) for everything else. `<leader>f` formats the
-- buffer or the visual selection, `gq{motion}` a range.
local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    markdown = { "prettier" },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
  formatters = {
    prettier = {
      -- No ignore files: prettier would pass a gitignored file through unformatted.
      prepend_args = { "--ignore-path=/dev/null" },
    },
  },
})

vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"
vim.keymap.set({ "n", "x" }, "<leader>f", function()
  conform.format({ async = true })
end, { desc = "Format buffer or selection" })

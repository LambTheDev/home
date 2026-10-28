-- The default colorscheme barely styles Markdown; give headings, emphasis,
-- code and links Monokai colours like bat's default theme.
local function markdown_hl()
  local hl = function(name, opts) vim.api.nvim_set_hl(0, name, opts) end
  hl("@markup.heading.1", { fg = "#F92672", bold = true })
  hl("@markup.heading.2", { fg = "#FD971F", bold = true })
  hl("@markup.heading.3", { fg = "#E6DB74", bold = true })
  hl("@markup.heading.4", { fg = "#A6E22E", bold = true })
  hl("@markup.heading.5", { fg = "#66D9EF", bold = true })
  hl("@markup.heading.6", { fg = "#AE81FF", bold = true })
  hl("@markup.strong", { fg = "#FD971F", bold = true })
  hl("@markup.italic", { fg = "#E6DB74", italic = true })
  hl("@markup.raw", { fg = "#A6E22E" })
  hl("@markup.link.label", { fg = "#66D9EF", underline = true })
  hl("@markup.link.url", { fg = "#75715E", underline = true })
  hl("@markup.list", { fg = "#F92672" })
  hl("@markup.quote", { fg = "#75715E", italic = true })
end
markdown_hl()
vim.api.nvim_create_autocmd("ColorScheme", { callback = markdown_hl })

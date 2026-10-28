vim.lsp.enable("nixd")

-- See `:help vim.diagnostic.*`.
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics to location list" })

-- Buffer-local maps once a language server attaches. See `:help vim.lsp.*`.
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LambLsp", {}),
  callback = function(ev)
    local map = function(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc })
    end
    map("gD", vim.lsp.buf.declaration, "Go to declaration")
    map("gd", vim.lsp.buf.definition, "Go to definition")
    map("K", vim.lsp.buf.hover, "Hover")
    map("gi", vim.lsp.buf.implementation, "Go to implementation")
    map("<C-k>", vim.lsp.buf.signature_help, "Signature help")
    map("<leader>D", vim.lsp.buf.type_definition, "Go to type definition")
    map("<leader>rn", vim.lsp.buf.rename, "Rename")
    map("gr", vim.lsp.buf.references, "References")
    vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code action" })
  end,
})

local map = vim.keymap.set

vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

-- LSP mappings
map("n", "gd",  vim.lsp.buf.definition)
map("n", "gD",  vim.lsp.buf.definition)
map("n", "gh",  vim.lsp.buf.hover)
map("n", "gi", vim.lsp.buf.implementation)
-- Deligated to Telesope
--map("n", "gr", vim.lsp.buf.references)
--map("n", "gds", vim.lsp.buf.document_symbol)
--map("n", "gws", vim.lsp.buf.workspace_symbol)
--map("n", "<leader>cl", vim.lsp.codelens.run)
map("n", "gs", vim.lsp.buf.signature_help)
map("n", "<leader>r", vim.lsp.buf.rename)
map("n", "<leader>f", vim.lsp.buf.format)
map("n", "<leader>ca", vim.lsp.buf.code_action)

map("n", "<leader>ws", function()
  require("metals").hover_worksheet()
end)

-- all workspace diagnostics
map("n", "<leader>aa", vim.diagnostic.setqflist)

-- all workspace errors
map("n", "<leader>ae", function()
  vim.diagnostic.setqflist({ severity = "E" })
end)

-- all workspace warnings
map("n", "<leader>aw", function()
  vim.diagnostic.setqflist({ severity = "W" })
end)

-- buffer diagnostics only
map("n", "<leader>d", vim.diagnostic.setloclist)

map("n", "[i", function()
  vim.diagnostic.goto_prev({ wrap = false })
end)

map("n", "]i", function()
  vim.diagnostic.goto_next({ wrap = false })
end)

vim.api.nvim_create_user_command("Format", vim.lsp.buf.format, {})

require('plugins')
require('cmp-conf')
require('metals-config')
require('spell-conf')
require('treesitter-conf')
require('lsp-keys-config')
require('mason').setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "rust_analyzer", "jsonls" },
}
require("lspconfig").lua_ls.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").jsonls.setup {}
require('rust-tools').setup {}

-- ~/.config/nvim/lua/plugins/lsp.lua (or similar)
return {
  -- 'neovim/nvim-lspconfig',
  -- config = function()
  -- Bash LSP
  -- vim.lsp.config('bashls', {})
  -- require('lspconfig').bashls.setup {}
  vim.lsp.enable 'bashls',

  -- Rust LSP (requires rust-analyzer)
  -- require('lspconfig').rust_analyzer.setup {}

  -- Set up Lua LSP
  -- vim.lsp.config('lua_ls', {})
  -- require('lspconfig').lua_ls.setup {}
  vim.lsp.enable 'lua_ls',

  -- HTML LSP
  -- vim.lsp.config('html', {})
  -- require('lspconfig').html.setup {}
  vim.lsp.enable 'html',

  -- CSS LSP
  -- vim.lsp.config('cssls', {})
  -- require('lspconfig').cssls.setup {}
  vim.lsp.enable 'cssls',

  -- Python LSP
  -- vim.lsp.config('pyright', {})
  -- require('lspconfig').pyright.setup {}
  vim.lsp.enable 'pyright',
  -- end,
  vim.lsp.enable 'zls',

  vim.lsp.enable 'rust_analyzer',
}

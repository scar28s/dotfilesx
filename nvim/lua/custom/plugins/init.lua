-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'rust-lang/rust.vim',
    ft = 'rust',
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    'saecki/crates.nvim',
    ft = { 'toml' },
    config = function()
      require('crates').setup {
        -- ✅ Proper LSP attachment
        on_attach = function(bufnr)
          -- Enable LSP-based completions
          vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        end,
      }
    end,
  },
  -- {
  --   'saecki/crates.nvim',
  --   ft = { 'toml' },
  --   config = function()
  --     require('crates').setup {
  --       completion = {
  --         cmp = {
  --           enabled = true,
  --         },
  --       },
  --     }
  --     require('cmp').setup.buffer {
  --       sources = { { name = 'crates' } },
  --     }
  --   end,
  -- },
  -- {
  --   'simrat39/rust-tools.nvim',
  --   config = function()
  --     require('rust-tools').setup {
  --       dap = {
  --         adapter = require('rust-tools.dap').get_codelldb_adapter(vim.fn.stdpath 'data' .. '/mason/bin/codelldb', '--port ${port}'),
  --       },
  --     }
  --   end,
  -- },
  {
    'ThePrimeagen/vim-be-good',
    cmd = 'VimBeGood',
  },
  -- lazy.nvim example
  {
    'linux-cultist/venv-selector.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } }, -- optional: you can also use fzf-lua, snacks, mini-pick instead.
    },
    ft = 'python',
    opts = {},
    keys = { { '<leader>vv', '<cmd>VenvSelect<cr>', desc = 'Select VirtualEnv' } },
  },
  {
    'bfredl/nvim-luadev',
  },
  {
    'milisims/nvim-luaref',
  },
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp', -- Optional for regex support
    dependencies = { 'rafamadriz/friendly-snippets' },
  },
}

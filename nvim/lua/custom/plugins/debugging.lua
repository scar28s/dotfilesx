return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'simrat39/rust-tools.nvim',
      'rcarriga/nvim-dap-ui', -- Optional UI
      'theHamsta/nvim-dap-virtual-text', -- Inline variable values
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'
      -- Configure codelldb
      dap.adapters.codelldb = {
        type = 'server',
        port = '${port}',
        executable = {
          -- Update this path to where Mason installed codelldb
          command = vim.fn.stdpath 'data' .. '/mason/bin/codelldb',
          args = { '--port', '${port}' },
        },
      }

      -- Configuration for Rust
      dap.configurations.rust = {
        {
          name = 'Launch file',
          type = 'codelldb',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        },
      }
      -- Optional: Better integration with rust-tools.nvim
      local rust_tools = require 'rust-tools'
      rust_tools.setup {
        dap = {
          adapter = {
            type = 'server',
            port = '${port}',
            executable = {
              command = vim.fn.stdpath 'data' .. '/mason/bin/codelldb',
              args = { '--port', '${port}' },
            },
          },
        },
      }

      require('dapui').setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      vim.keymap.set('n', '<leader>dq', function()
        require('dap').terminate() -- End debug session
        require('dapui').close() -- Close debug UI (if using nvim-dap-ui)
      end, { desc = 'Quit debugging' })
      vim.keymap.set('n', '<F5>', function()
        require('dap').continue()
      end)
      vim.keymap.set('n', '<F10>', function()
        require('dap').step_over()
      end)
      vim.keymap.set('n', '<F11>', function()
        require('dap').step_into()
      end)
      vim.keymap.set('n', '<F12>', function()
        require('dap').step_out()
      end)
      vim.keymap.set('n', '<leader>b', function()
        require('dap').toggle_breakpoint()
      end)
      vim.keymap.set('n', '<leader>B', function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end)
      -- vim.keymap.set('n', '<Leader>dt', function()
      --   dap.toggle_breakpoint()
      -- end)
      -- vim.keymap.set('n', '<Leader>dc', function()
      --   dap.continue()
      -- end)
    end,
  },
}

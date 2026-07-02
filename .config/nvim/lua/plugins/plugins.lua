return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula", -- Configure LazyVim to use "dracula" colorscheme.
    },
  },
  {
    "Mofiqul/dracula.nvim",
    opts = {
      colors = {
        comment = "lightgray", -- Use lighter color for comments for better readability.
      },
      overrides = {
        WinSeparator = { fg = "lightgray" }, -- Use lighter color for windows separator for better visibility.
      },
    },
  },
  {
    "folke/trouble.nvim",
    opts = {
      win = {
        size = 0.3, -- Use 50 for fixed width, or 0.3 for 30%.
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      "copilotlsp-nvim/copilot-lsp", -- Required for Next Edit Suggestion (NES).
    },
    cond = function()
      return os.getenv("COPILOT_LUA_ENABLED") == "true" -- Enable Copilot only when ENV var set.
    end,
    opts = {
      nes = {
        enabled = true,
        keymap = {
          accept_and_goto = "<S-CR>",
          accept = false,
          dismiss = "<Esc>",
        },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-golang"] = {
          warn_test_name_dupes = false,
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          border = "rounded", -- Add a border around suggestion popup.
        },
        documentation = {
          window = {
            border = "rounded", -- Add a border around documentation popup.
          },
        },
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true, -- Add a border around LSP popup.
      },
    },
  },
}

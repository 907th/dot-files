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
      "copilotlsp-nvim/copilot-lsp", -- For NES functionality.
    },
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
}

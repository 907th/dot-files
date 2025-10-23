return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula", -- Configure LazyVim to use dracula colorscheme.
    },
  },
  {
    "Mofiqul/dracula.nvim",
    config = function()
      local dracula = require("dracula")
      dracula.setup({
        colors = {
          comment = "#bcc3d8", -- Use lighter color for comments for better readability.
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false }, -- Do not show code hints (like func argument names in Go lang).
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline", -- Set command line to be at the bottom.
      },
    },
  },
  {
    "nvim-mini/mini.pairs",
    enabled = false,
  },
}

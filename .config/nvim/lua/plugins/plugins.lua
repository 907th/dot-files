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
        comment = "#bcc3d8", -- Use lighter color for comments for better readability.
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false }, -- Do not show code hints (e.g. func argument names in Go lang).
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline", -- Use classic cmdline at bottom of editor.
        format = {
          input = { view = "cmdline" }, -- Use classic cmdline input too.
        },
      },
    },
  },
  {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
      notifier = {
        timeout = 8000, -- Show notifications a little longer.
        top_down = false, -- Show notifications at bottom of screen.
        margin = { bottom = 1, right = 1, top = 1 }, -- Bottom margin keeps cmdline notifications visible.
      },
    },
  },
  {
    "nvim-mini/mini.pairs",
    enabled = false,
  },
}

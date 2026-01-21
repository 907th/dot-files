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
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false }, -- Do not show code hints (e.g. func argument names in Go lang).
    },
  },
  {
    "nvim-mini/mini.pairs",
    enabled = false, -- Do not autocomplete brackets, etc.
  },
}
